export EDITOR=nvim
export BUNDLER_EDITOR=nvim

alias vi='nvim'
alias v='nvim'
co() {
  if [ -z "$1" ]; then
    code .
  else
    code $1
  fi
}
