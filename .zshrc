# Exports
export ZSH="/Users/pauliusvilkauskas/.oh-my-zsh"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
export LIBRARY_PATH="${LD_LIBRARY_PATH:+LD_LIBRARY_PATH:}/usr/local/opt/openssl/lib/"
export PATH="/usr/local/opt/postgresql@12/bin:$PATH"

ZSH_THEME="simple"


plugins=(git)


# Aliases
alias zshrc="vim ~/.zshrc"
alias rsp="bin/rspec"
alias svcs="cd ~/vinted/svc-shipping"
alias findport='function _fport(){lsof -n -i4TCP:$1 | grep LISTEN};_fport'
alias netspec="echo 'ENABLE_NETWORKING_IN_SPECS=true' >> ~/vinted/svc-shipping/.env.test"
alias gitd='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'




source $ZSH/oh-my-zsh.sh


eval "$(rbenv init -)"


dev-tools() {
  (cd "$DEVTOOLS_PATH" && bundle exec bin/dev-tools "$@")
}

