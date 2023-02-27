if status is-interactive
    # Commands to run in interactive sessions can go here
end

# starship init fish | source

set -U EDITOR (type -p nvim)

fish_add_path ~/.local/bin/
