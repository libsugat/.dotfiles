# Source global definitions
if [ -f /etc/zshrc ]; then
    . /etc/zshrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

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
alias fan-turbo='sudo bash -c "echo 0 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon5/pwm1_enable"'
alias fan-auto='sudo bash -c "echo 2 > /sys/devices/platform/asus-nb-wmi/hwmon/hwmon5/pwm1_enable"'

# Syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# Auto Suggestion
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

bindkey '^I' complete-word
bindkey '^@' autosuggest-accept

source <(fzf --zsh)

# NPM config user space
export PATH="$PATH:$HOME/.local/share/npm-global/bin"

