export EDITOR="vim"
export ZSH="$HOME/.oh-my-zsh"
export LC_ALL=en_US.UTF-8

## Theme + plugins
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)

## ZSH
source $ZSH/oh-my-zsh.sh

## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## Local ZSH config
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
