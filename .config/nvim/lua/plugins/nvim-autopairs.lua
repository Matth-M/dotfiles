return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	opts = {
		ignored_next_char = [=[[%w%%%'%[%"%.%`%$%@%(]]=],
		enable_check_bracket_line = false,
	},
}
