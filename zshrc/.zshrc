# Exports
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZSH="$HOME/.oh-my-zsh"
export CONFIG_PATH="$HOME/.config"
export PATH="/usr/local/opt/elasticsearch@5.6/bin:$PATH"
export LIBRARY_PATH="${LD_LIBRARY_PATH:+LD_LIBRARY_PATH:}/usr/local/opt/openssl/lib/"
export VIMCONF_PATH="$HOME/.config/nvim/init.vim"

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

MONITOR_NAME="eDP-1"
ZSH_THEME="simple"

plugins=(git)

# Aliases
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias cvim="nvim $VIMCONF_PATH"
alias cwm="nvim $CONFIG_PATH/bspwm/bspwmrc"

alias be="bundle exec"
alias rsp="bin/rspec"
alias svcs="cd ~/vinted/svc-shipping"
alias ints="cd ~/vinted/integrations"
alias cfg="cd ~/.config"

alias g="git"
alias b="cd .."

source $ZSH/oh-my-zsh.sh

SSH_ENV="$HOME/.ssh/agent-environment"
function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable
if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
