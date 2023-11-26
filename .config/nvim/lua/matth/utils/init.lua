local M = {}

function M.telescope_find_config_files()
	require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
end

return M
