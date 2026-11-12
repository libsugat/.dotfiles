# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
# paths for mpi
export PATH=/usr/lib64/openmpi/bin:$PATH
export LD_LIBRARY_PATH=/usr/lib64/openmpi/lib:$LD_LIBRARY_PATH

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/sugat/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Vim keybindind for zsh
bindkey -v

# Starship.rs
eval "$(starship init zsh)"


# Fans control alias
alias fan-turbo='sudo bash -c "echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon3/pwm1_enable"'
alias fan-auto='sudo bash -c "echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon3/pwm1_enable"'
alias fan-show='sudo bash -c "cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon3/pwm1_enable"'

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto Suggestion
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

bindkey '^I' complete-word
bindkey '^@' autosuggest-accept

source <(fzf --zsh)

# NPM config user space
export PATH="$PATH:$HOME/.local/share/npm-global/bin"

# ---- Yazi setup ----
export EDITOR="nvim"

export LESS="-R"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ncdu='ncdu --color dark'

export MANPAGER="less -R"

export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;36m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'
alias diff='diff --color=always'
