# Exports
export ZSH="/home/pauliusv/.oh-my-zsh"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
export LIBRARY_PATH="${LD_LIBRARY_PATH:+LD_LIBRARY_PATH:}/usr/local/opt/openssl/lib/"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"
export VIMCONF_PATH="$HOME/.config/nvim/init.vim"
export CONFIG_PATH="$HOME/.config"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(nodenv init -)"
eval "$(rbenv init -)"

ZSH_THEME="simple"

plugins=(git)

# Aliases
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias cvim="nvim $VIMCONF_PATH"
alias cwm="nvim $CONFIG_PATH/bspwm/bspwmrc"

alias rsp="bin/rspec"
alias svcs="cd ~/vinted/svc-shipping"
alias cfg="cd ~/.config"

alias findport="function _fport(){lsof -n -i4TCP:$1 | grep LISTEN};_fport"
alias netspec="echo 'ENABLE_NETWORKING_IN_SPECS=true' >> ~/vinted/svc-shipping/.env.test"

source $ZSH/oh-my-zsh.sh


