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
}
zle -N zle-keymap-select _vmc_zle-keymap-select

zle -A zle-line-finish _vmc_saved_zle-line-finish
function _vmc_zle-line-finish {
  echo -ne '\e[5 q'
}
zle -N zle-line-finish _vmc_zle-line-finish

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)
