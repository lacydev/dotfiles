if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

# Variables
set -U EDITOR (type -p nvim)
set -gx fish_prompt_pwd_dir_length 1

fish_add_path ~/.local/bin/

