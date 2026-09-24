# SETTINGS
setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/candy.zsh-theme
# TODO: switch to hex colors
PROMPT="%F{blue}%n@%m%f %F{magenta}%D{[%X]}%f [%~]
-> %# %f"
# conditionally show exit code https://stackoverflow.com/a/4466959
RPROMPT="%(?..[%?] )"


export EDITOR="emacsclient -t"
export GIT_EDITOR=$EDITOR
export VISUAL=$EDITOR

# see https://github.com/thoughtbot/dotfiles/pull/194/commits/330d098a7f4e5bcacb30b2f735e096b6fd3731c8
unsetopt nomatch

# local executables
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin

# direnv
if command -v direnv &> /dev/null
then
  eval "$(direnv hook zsh)"
fi

# see https://thevaluable.dev/zsh-completion-guide-examples/
# completion
autoload -U compinit; compinit
zstyle ':completion:*' menu select

[[ -f $HOME/.zshrc.local.zsh ]] && source $HOME/.zshrc.local.zsh
