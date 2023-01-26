require("git-worktree").setup({})
require("telescope").load_extension("git_worktree")
local telescope_extensions = require('telescope').extensions
vim.keymap.set('n', "<leader>wl", telescope_extensions.git_worktree.git_worktrees)

-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion

vim.keymap.set('n', "<leader>wc", require('telescope').extensions.git_worktree.create_git_worktree)
