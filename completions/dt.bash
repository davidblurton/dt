_dt() {
  local dir=${DT_DIR:-$HOME/.dtach}
  local names
  names=$(cd "$dir" 2>/dev/null && for f in *.dtach; do [ -e "$f" ] && echo "${f%.dtach}"; done)
  COMPREPLY=($(compgen -W "$names" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _dt dt
