## Colorscheme
set theme_color_scheme gruvbox

## Update PATH for rbenv
set -x PATH $HOME/.rbenv/shims:$PATH

## Get fzf keybinds
. $OMF_PATH/pkg/fzf/conf.d/fzf_key_bindings.fish

## Better `ls` colors
set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

## Set US lang
set -x LANG en_US.UTF-8
