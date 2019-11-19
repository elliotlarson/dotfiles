RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
CYAN=$(tput setaf 6)
COLOR_RESET=$(tput sgr0)
sayit() {
  echo -e "${2:-$YELLOW}$1${COLOR_RESET}"
}
sayCmd() {
  sayit "\$ ${1}" $CYAN
}

eval "$(rbenv init -)"

alias b='bundle'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias bs='bundle show'
alias bake='bundle exec rake'
spec() {
  if [ -e "bin/rspec" ]; then
    sayCmd "bin/rspec $@"
    bin/rspec $@
  else
    sayCmd "bundle exec rspec $@"
    bundle exec rspec $@
  fi
}
rails_command() {
  if [ -e "bin/rails" ]; then
    sayCmd "bin/rails $@"
    bin/rails $@
  else
    sayCmd "bundle exec rails $@"
    bundle exec rails $@
  fi
}
alias r='rails_command'
alias rac='rails_command console'
alias rag='rails_command generate'
alias ras='rails_command server'
alias ram='rails_command db:migrate'
alias rads='rails_command db:seed'
alias radd='rails_command db:drop'
alias radc='rails_command db:create'
alias radt='rails_command db:test:prepare'
alias radr='rails_command db:rollback'

alias rpc="rails_command parallel:create"
alias rps='rails_command parallel:spec'
alias rpp='rails_command parallel:prepare'

rar() {
  if [ -z "$1" ]; then
    rails_command routes
  else
    rails_command routes | grep --color=auto $1
  fi
}

rin() {
  sayCmd 'brew update && brew upgrade ruby-build; rbenv install'
  brew update && brew upgrade ruby-build
  rbenv install
}

last-migration() {
  ls db/migrate | sort -nk 1.1,1.14 | tail -n 1 | xargs -o -I migration $EDITOR db/migrate/migration
}
