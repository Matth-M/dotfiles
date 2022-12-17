-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
vim.cmd[[
	if has('termguicolors')
		set termguicolors
	endif
]]

-- GRUVBOX --
-- vim.o.background = "dark" -- or "light" for light mode
-- -- setup must be called before loading the colorscheme
-- require("gruvbox").setup({
--   undercurl = true,
--   underline = true,
--   bold = true,
--   italic = true,
--   strikethrough = true,
--   invert_selection = false,
--   invert_signs = false,
--   invert_tabline = false,
--   invert_intend_guides = false,
--   inverse = true, -- invert background for search, diffs, statuslines and errors
--   contrast = "hard", -- can be "hard", "soft" or empty string
--   overrides = {},
-- })
-- vim.cmd([[colorscheme gruvbox]])

vim.cmd[[
colorscheme tokyonight-storm
]]


-- DARK THEME
-- vim.cmd[[
-- 	let g:nvcode_termcolors=256
-- 	hi LineNr ctermbg=NONE guibg=NONE
-- 	colorscheme nvcode
-- ]]


--LIGHT THEME
--
-- require('ayu').setup({
--     mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
--     overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
-- })
--
-- vim.cmd[[
-- 	set background=light
-- 	colorscheme ayu-light
-- ]]
