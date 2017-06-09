export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# RVM
[ -s ${HOME}/.rvm/scripts/rvm ] && source ${HOME}/.rvm/scripts/rvm

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
