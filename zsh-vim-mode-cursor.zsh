# Change cursor according to vim-mode

zle -A zle-keymap-select _vmc_saved_zle-keymap-select
function _vmc_zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
     echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]]; then
       echo -ne '\e[5 q'
  fi

  zle reset-prompt
  if (( ${+widgets[_vmc_saved_zle-keymap-select]} )); then
    zle _vmc_saved_zle-keymap-select
  fi
}
zle -N zle-keymap-select _vmc_zle-keymap-select

zle -A zle-line-finish _vmc_saved_zle-line-finish
function _vmc_zle-line-finish {
  echo -ne '\e[5 q'
  if (( ${+widgets[_vmc_saved_zle-line-finish]} )); then
    zle _vmc_saved_zle-line-finish
  fi
}
zle -N zle-line-finish _vmc_zle-line-finish

zle -A zle-line-init _vmc_saved_zle-line-init
function _vmc_zle-line-init {
   echo -ne '\e[5 q'
  if (( ${+widgets[_vmc_saved_zle-line-init]} )); then
    zle _vmc_saved_zle-line-init
  fi
}
zle -N zle-line-init _vmc_zle-line-init
