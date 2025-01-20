if status is-interactive
	source $HOME/.config/shell/aliasrc
	alias reload="source $HOME/.config/fish/config.fish"

	function bind_bang
		switch (commandline -t)[-1]
			case "!"
				commandline -t -- $history[1]
				commandline -f repaint
			case "*"
				commandline -i !
		end
	end

	function bind_dollar
		switch (commandline -t)[-1]
			case "!"
				commandline -f backward-delete-char history-token-search-backward
			case "*"
				commandline -i '$'
		end
	end

	function fish_user_key_bindings
		bind ! bind_bang
		bind '$' bind_dollar
	end

	set PATH ~/.local/bin ~/.local/bin/scripts $PATH
	set fish_greeting
end

if status is-login
	if test -z "$DISPLAY"; and test "$XDG_VTNR" -le 3
	  exec startx
	end
	export QSYS_ROOTDIR="/home/matth/.cache/paru/clone/quartus-free/pkg/quartus-free-quartus/opt/intelFPGA/23.1/quartus/sopc_builder/bin"
end
