# Bash Aliases
alias ls='ls -GCF'
alias ll='ls -alhF'
alias la='ls -A'
alias l='ls'

# Local Bash Aliases
# Addresses
EROS='173.69.161.126'

# thefuck alias
eval $(thefuck --alias)
alias kinks='ssh mom2568@kinks.cs.rit.edu'


# NVM Aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Prompt sourcing
if [ -f ~/.prompt/prompt.sh ]; then
    source ~/.prompt/prompt.sh
fi

# SSH Aliases
alias shell='ssh mom@shell.csh.rit.edu'
alias erebus='ssh erebus.csh.rit.edu'
alias glados='ssh mom2568@glados.cs.rit.edu'
alias eros='ssh max@$EROS'

