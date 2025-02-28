if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

source ~/.config/aliasrc

yr completion fish | source
op completion fish | source
migadu completion fish | source
