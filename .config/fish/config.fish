if status is-interactive
    # Commands to run in interactive sessions can go here
end

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
