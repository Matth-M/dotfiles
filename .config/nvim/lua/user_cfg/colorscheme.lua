-- https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
vim.cmd[[
	if has('termguicolors')
		set termguicolors
	endif
]]

-- require('colorbuddy').colorscheme('onebuddy')

-- vim.cmd[[
-- 	" The configuration options should be placed before `colorscheme sonokai`.
-- 	let g:sonokai_style = 'andromeda'
-- 	let g:sonokai_better_performance = 1
-- 	colorscheme sonokai
-- ]]

-- vim.cmd[[colorscheme blue-moon]]

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
	let g:nvcode_termcolors=256
	hi LineNr ctermbg=NONE guibg=NONE
	colorscheme nvcode
]]
