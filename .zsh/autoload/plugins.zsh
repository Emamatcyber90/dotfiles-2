if [[ $ZSH_VERSION == <5->* ]]; then
  source $PLUGINS/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
  source $PLUGINS/zsh-async/async.plugin.zsh
  source $PLUGINS/pure/pure.plugin.zsh
else
  source $THEMES/simple.zsh-theme
fi
