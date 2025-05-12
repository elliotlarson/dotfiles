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

# eval "$(rbenv init -)"

alias b='bundle'
alias bu='bundle update'
alias be='bundle exec'
alias bo='bundle open'
alias bs='bundle show'
alias bop='bin/spring stop'
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
ruba() {
  if [ -e "bin/rubocop" ]; then
    sayCmd "bin/rubocop -A $@"
    bin/rubocop -A $@
  else
    sayCmd "bundle exec rubocop -A $@"
    bundle exec rubocop -A $@
  fi
}
spep() {
  if [ -e "bin/rake" ]; then
    sayCmd "RAILS_ENV=test bin/rake parallel:spec"
    RAILS_ENV=test bin/rake parallel:spec
  else
    sayCmd "bundle exec rake parallel:spec"
    bundle exec rake parallel:spec
  fi
}
spepp() {
  if [ -e "bin/rake" ]; then
    sayCmd "RAILS_ENV=test bin/rake parallel:prepare"
    RAILS_ENV=test bin/rake parallel:prepare
  else
    sayCmd "bundle exec rake parallel:prepare"
    bundle exec rake parallel:prepare
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
alias ras='rails_command server -b 0.0.0.0'
alias ram='rails_command db:migrate'
alias rads='rails_command db:seed'
alias radd='rails_command db:drop'
alias radc='rails_command db:create'
alias radt='rails_command db:test:prepare'
alias radr='rails_command db:rollback'

alias para="RAILS_ENV=test bin/rake parallel:spec"
alias parap="RAILS_ENV=test bin/rake parallel:prepare"

rar() {
  if [ -z "$1" ]; then
    rails_command routes
  else
    rails_command routes | grep --color=auto $1
  fi
}

# rin() {
#   sayCmd 'brew update && brew upgrade ruby-build; rbenv install'
#   brew update && brew upgrade ruby-build
#   rbenv install
# }

last-migration() {
  ls db/migrate | sort -nk 1.1,1.14 | tail -n 1 | xargs -o -I migration $EDITOR db/migrate/migration
}

killruby () {
  ps aux | grep ruby | awk '{print $2}' | xargs kill
  ps aux | grep puma | awk '{print $2}' | xargs kill
  ps aux | grep spring | awk '{print $2}' | xargs kill
  ps aux | grep sidekiq | awk '{print $2}' | xargs kill
}
