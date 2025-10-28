if status is-interactive
    # Setup
    set -Ux EDITOR nvim
    starship init fish | source
    zoxide init fish | source
    direnv hook fish | source

    # General aliases
    alias ls="eza"
    alias cat="bat"
    alias vi="nvim"

    #git aliases
    alias gc="git commit"
    alias gl="git log --oneline --graph"
    alias gcm="git checkout main"
    alias gb="git branch"
    alias gch="git checkout"

    unifetch
end
