if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Variables
set -gx fish_prompt_pwd_dir_length 1

fish_add_path ~/.local/bin/

# Aliases
alias ls="exa -F --icons"
alias ll="exa -lg --icons"
alias la="exa -lag --icons"

# tmux
tmux set-option -g mouse on
