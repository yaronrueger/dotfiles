if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -Ux PATH $PATH $HOME/go/bin
starship init fish | source

function curlj
    curl -s $argv | jq .
end


fish_add_path $HOME/.spicetify
zoxide init fish | source

tirith init --shell fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
