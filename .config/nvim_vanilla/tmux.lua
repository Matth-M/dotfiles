local util = {}

local tmux_directions = { ['p'] = 'l', ['h'] = 'L', ['j'] = 'D', ['k'] = 'U', ['l'] = 'R', ['n'] = 't:.+' }

-- send the tmux command to the server running on the socket
-- given by the environment variable $TMUX
--
-- the check if tmux is actually running (so the variable $TMUX is
-- not nil) is made before actually calling this function
local function tmux_command(command)
    local tmux_socket = vim.fn.split(vim.env.TMUX, ',')[1]
    return vim.fn.system("tmux -S " .. tmux_socket .. " " .. command)
end

-- check whether the current tmux pane is zoomed
local function is_tmux_pane_zoomed()
    -- the output of the tmux command is "1\n", so we have to test against that
    return tmux_command("display-message -p '#{window_zoomed_flag}'") == "1\n"
end

-- whether tmux should take control over the navigation
function util.should_tmux_control(is_same_winnr, disable_nav_when_zoomed)
    if is_tmux_pane_zoomed() and disable_nav_when_zoomed then
        return false
    end
    return is_same_winnr
end

-- change the current pane according to direction
function util.tmux_change_pane(direction)
    tmux_command("select-pane -" .. tmux_directions[direction])
end

-- capitalization util, only capitalizes the first character of the whole word
function util.capitalize(str)
    local capitalized = str:gsub("(%a)(%a+)", function(a, b)
        return string.upper(a) .. string.lower(b)
    end)

    return capitalized:gsub("_", "")
end


local M = {}

-- default configuration, can be changed through the setup function
local config = {
    disable_when_zoomed = false,
    keybindings = {}
}

local function vim_navigate(direction)
    if direction == 'n' then
        pcall(vim.cmd, 'wincmd w')
    elseif pcall(vim.cmd, 'wincmd ' .. direction) then
        -- success
    else
        -- error, cannot wincmd from the command-line window
        vim.cmd([[ echohl ErrorMsg | echo 'E11: Invalid in command-line window; <CR> executes, CTRL-C quits' | echohl None ]])
    end
end

-- whether tmux should control the previous pane switching or no
--
-- by default it's true, so when you enter a new vim instance and
-- try to switch to a previous pane, tmux should take control
local tmux_control = true

local function tmux_navigate(direction)
    if direction == 'n' then

        local is_last_win = (vim.fn.winnr() == vim.fn.winnr('$'))

        if is_last_win then
            pcall(vim.cmd, 'wincmd t')
            util.tmux_change_pane(direction)
        else
            vim_navigate(direction)
        end

    elseif direction == 'p' then

        -- if the last pane was a tmux pane, then we need to handle control
        -- to tmux; otherwise, just issue a last pane command in vim
        if tmux_control == true then
            util.tmux_change_pane(direction)
        elseif tmux_control == false then
            vim_navigate(direction)
        end

    else

        -- save the current window number to check later whether we're in the same
        -- window after issuing a vim navigation command
        local winnr = vim.fn.winnr()

        -- try to navigate normally
        vim_navigate(direction)

        -- if we're in the same window after navigating
        local is_same_winnr = (winnr == vim.fn.winnr())

        -- if we're in the same window and zoom is not disabled, tmux should take control
        if util.should_tmux_control(is_same_winnr, config.disable_when_zoomed) then
            util.tmux_change_pane(direction)
            tmux_control = true
        else
            tmux_control = false
        end
    end
end

function M.setup(user_config)
    -- disable nvim tmux navigation when a tmux pane is zoomed
    -- defaults to false
    config.disable_when_zoomed = user_config.disable_when_zoomed or false

    -- keybindings for the navigation
    config.keybindings = user_config.keybindings or {}

    -- loop through the keybindings and map them
    for func, mapping in pairs(config.keybindings) do
        func = util.capitalize(func)

        -- use old style (neovim 0.5) key mappings in order to be able to
        -- dynamically compute the function name inside a string
        vim.api.nvim_set_keymap(
            'n',
            mapping,
            ":lua require'tmux'.NvimTmuxNavigate" .. func .. "()<CR>",
            { noremap = true, silent = true })
    end
end

-- if in tmux, map to vim-tmux navigation, otherwise just map to vim navigation
local navigate = nil
if vim.env.TMUX ~= nil then
    navigate = tmux_navigate
else
    navigate = vim_navigate
end

-- lua functions
function M.NvimTmuxNavigateLeft() navigate('h') end
function M.NvimTmuxNavigateDown() navigate('j') end
function M.NvimTmuxNavigateUp() navigate('k') end
function M.NvimTmuxNavigateRight() navigate('l') end
function M.NvimTmuxNavigateLastActive() navigate('p') end
function M.NvimTmuxNavigateNext() navigate('n') end

local function create_command(command_name, func, direction)
    -- use nvim's user command api to create commands
    vim.api.nvim_create_user_command(command_name, function(...) func(direction) end, {})
end

-- user commands
create_command("NvimTmuxNavigateLeft", navigate, 'h')
create_command("NvimTmuxNavigateDown", navigate, 'j')
create_command("NvimTmuxNavigateUp", navigate, 'k')
create_command("NvimTmuxNavigateRight", navigate, 'l')
create_command("NvimTmuxNavigateLastActive", navigate, 'p')
create_command("NvimTmuxNavigateNext", navigate, 'n')

return M
