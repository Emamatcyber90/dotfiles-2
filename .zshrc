# ENVIRONMENT SETUP
source $HOME/.zsh/default.zsh

NOT_INCLUDED=()

require() {
  if type $1 > /dev/null 2>&1 ; then
    return 1
  else
    return 0
  fi
}

include() {
  if ! source $1; then
    NOT_INCLUDED+=($(basename $1))
  fi
}

foreach file in $(ls $HOME/.zsh/autoload/* $HOME/.zsh/custom/themes/*); do
  include $file
done

[[ $HOSTNAME != apparatus ]] && echo "Skipping: $NOT_INCLUDED"

# Plugins
[[ $ZSH_VERSION == <5->* ]] && source $HOME/.zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
[ -n "$PS1" ] && [ -s $HOME/.dotfiles/base16-shell//profile_helper.sh ] && eval "$($HOME/.dotfiles/base16-shell//profile_helper.sh)"

# condense PATH entries
PATH=$(path.tcl)
