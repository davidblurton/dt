#compdef dt
_dt() {
  local dir=${DT_DIR:-$HOME/.dtach}
  local -a names
  names=(${(f)"$(cd "$dir" 2>/dev/null && print -r -- *.dtach(N:r))"})
  _describe -t sessions 'session' names
}
_dt "$@"
