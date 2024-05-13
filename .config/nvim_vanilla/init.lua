require("tmux").setup {
	disable_when_zoomed = true, -- defaults to false
        keybindings = {
            left = "<M-h>",
            down = "<M-j>",
            up = "<M-k>",
            right = "<M-l>",
            next = "<C-Space>",
        }
}

