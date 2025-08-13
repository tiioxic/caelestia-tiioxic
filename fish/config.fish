if status is-interactive
    set -gx LANG fr_FR.UTF-8

    # Start SSH
    # eval (ssh-agent -s)

    # Starship custom prompt
    starship preset gruvbox-rainbow -o ~/.config/starship.toml
    starship init fish | source

    # Custom colours
    cat ~/.local/state/caelestia/sequences.txt 2> /dev/null
    export PATH="$HOME/.local/bin:$PATH"
    #alias docker-desktop='/opt/docker-desktop/bin/docker-desktop'

    # For jumping between prompts in foot terminal
    function mark_prompt_start --on-event fish_prompt
        echo -en "\e]133;A\e\\"
    end

    function caelestia-logs
        cat /tmp/caelestia-pull.log
    end

    function caelestia-update
        git -C ~/.local/share/caelestia pull &>> /tmp/caelestia-pull.log && cat /tmp/caelestia-pull.log
    end

    function caelestia-config  
        codium ~/.local/share/caelestia
    end

    function clear
        command clear
        pokefetch
    end
end
