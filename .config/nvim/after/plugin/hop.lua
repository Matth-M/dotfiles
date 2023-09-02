local hop = require("hop")
hop.setup()

-- place this in one of your configuration file(s)
-- local directions = require("hop.hint").HintDirection
-- vim.keymap.set('', 'f', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 'F', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
-- end, {remap=true})
-- vim.keymap.set('', 't', function()
--   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
-- end, {remap=true})
-- vim.keymap.set('', 'T', function()
--   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
-- end, {remap=true})

local options = { noremap = true }
vim.keymap.set("n", "<leader>h", "<cmd>HopWord<cr>", options)
vim.keymap.set("x", "<leader>h", "<cmd>HopWord<cr>", options)
vim.keymap.set("n", "<leader>s", "<cmd>HopPattern<cr>", options)

-- https://gist.github.com/kylechui/a5c1258cd2d86755f97b10fc921315c3
-- https://www.vikasraj.dev/blog/vim-dot-repeat
-- local builtin_targets = require("hop.jump_target")
--
-- _G._repeated_hop_state = {
--   last_chars = nil,
--   count = 0,
-- }
--
-- _G._repeatable_hop = function ()
--   for i=1,_G._repeated_hop_state.count  do
--     hop.hint_with(builtin_targets.jump_targets_by_scanning_lines(builtin_targets.regex_by_case_searching(
--       _G._repeated_hop_state.last_chars, true, {})),
--     hop.opts)
--   end
-- end
--
-- vim.keymap.set("n", [[f]],
-- function()
--
--   local char
--   while true do
--     vim.api.nvim_echo({ { "hop 1 char:", "Search" } }, false, {})
--     local code = vim.fn.getchar()
--     -- fixme: custom char range by needs
--     if code >= 61 and code <= 0x7a then
--       -- [a-z]
--       char = string.char(code)
--       break
--     elseif code == 0x20 or code == 0x1b then
--       -- press space, esc to cancel
--       char = nil
--       break
--     end
--   end
--   if not char then return end
--
--   -- setup the state to pickup in _G._repeatable_hop
--   _G._repeated_hop_state = {
--     last_chars = char,
--     count = (vim.v.count or 0) + 1
--   }
--
--   vim.go.operatorfunc = "v:lua._repeatable_hop"
--   -- return this↓ to run that↑
--   return "g@l" -- see expr=true
-- end , { noremap = true,
-- -- ↓ see "g@l"
-- expr = true})
--
