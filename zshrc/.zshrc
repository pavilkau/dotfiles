# Exports
export VISUAL=nvim
export EDITOR="$VISUAL"
export DOTFILES_PATH="$HOME/.dotfiles"
export ZSH="$HOME/.oh-my-zsh"
export ZSHRC_HOME="$DOTFILES_PATH/zshrc"
export CONFIG_PATH="$HOME/.config"
export LIBRARY_PATH="${LD_LIBRARY_PATH:+LD_LIBRARY_PATH:}/usr/local/opt/openssl/lib/"
export VIMCONF_PATH="$HOME/.config/nvim/init.vim"

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/tools:$PATH"
eval "$(rbenv init -)"

ZSH_THEME="simple"

plugins=(git)

# Aliases
alias v="nvim"
alias zshrc="nvim ~/.zshrc"
alias cvim="nvim $VIMCONF_PATH"
alias cwm="nvim $CONFIG_PATH/bspwm/bspwmrc"

alias cfg="cd ~/.config"
alias g="git"

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
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

source $DOTFILES_PATH/work_cfg/zshrc.sh
. "$HOME/.asdf/asdf.sh"

function kill_spring () {
	ps aux | grep spring | grep -v 'grep' | awk '{print $2}' | xargs kill -9
}
