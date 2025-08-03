return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<cr>")

		vim.cmd([[
		if !exists('g:undotree_SplitWidth')
			if g:undotree_ShortIndicators == 1
				let g:undotree_SplitWidth = 24
			else
				let g:undotree_SplitWidth = 30
			endif
		endif
		if !exists('g:undotree_SetFocusWhenToggle')
			let g:undotree_SetFocusWhenToggle = 1
		endif
		]])

		vim.o.undofile = true

		vim.cmd([[
		if has("persistent_undo")
		   let target_path = expand('~/.undodir')

			" create the directory and any parent directories
			" if the location does not exist.
			if !isdirectory(target_path)
				call mkdir(target_path, "p", 0700)
			endif

			let &undodir=target_path
			set undofile
		endif
		]])
	end,
}
