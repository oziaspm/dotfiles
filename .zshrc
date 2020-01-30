# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# OpenSSL
export PATH="/usr/local/opt/openssl/bin:$PATH" 
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="spaceship"

plugins=(
  git
  history
  vi-mode
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Dotfile management
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Vim
alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR="nvim"

# Pretty things
autoload colors zsh/terminfo
colors

# Erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# fzf
export FZF_DEFAULT_COMMAND='ag -g ""'

# SSH
alias ssh="TERM=xterm-256color ssh"

# Workaround for issue around pyenv / zlib
export CFLAGS="-I$(xcrun --show-sdk-path)/usr/include"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Fancy startup
# if hash archey 2> /dev/null; then
#  archey -c
# fi

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

