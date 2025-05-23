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

alias g='git'

groh() {
  sayCmd "git reset --hard origin/$(current_branch)"
  git reset --hard origin/$(current_branch)
}

gote() {
  sayCmd "git remote $@"
  git remote $@
}
gune() {
  sayCmd 'git remote prune origin'
  git remote prune origin
}
gach() {
  sayCmd "git branch $@"
  git branch $@
}
game() {
  sayCmd "git blame $@"
  git blame $@
}
gaca() {
  sayCmd 'git branch -a'
  git branch -a
}
gadd() {
  if [ -z "$1" ]; then
    stage='.'
  else
    stage="$1"
  fi
  sayCmd "git add $stage"
  git add $stage
}
gs() {
  sayCmd "git status"
  git status
}
gl() {
  sayCmd "git log $@"
  git log $@
}
glop() {
  sayCmd "git log -p $@"
  git log -p $@
}
glog() {
  sayCmd "git log --pretty=format:\"%C(yellow)%h%C(reset) %C(blue)%ci%C(reset) %s %C(blue)[%cn]%C(reset)\""
  git log --pretty=format:"%C(yellow)%h%C(reset) %C(blue)%ci%C(reset) %s %C(blue)[%cn]%C(reset)"
}
gloo() {
git log --pretty=format:"%h %s" --color=always | awk '
  /Merge/ {
    printf "\033[32m%02d. \033[34m%s \033[33m%s\033[0m\n", NR, $1, substr($0, index($0,$2))
    next
  }
  {
    printf "\033[32m%02d. \033[34m%s \033[97m%s\033[0m\n", NR, $1, substr($0, index($0,$2))
  }' | less -r +Gg

}
gloc() {
  sayCmd "git push $1..$(current_branch)"
  git log $1..$(current_branch)
}
glof() {
  sayCmd "git diff --name-status $1..$(current_branch)"
  git diff --name-status $1..$(current_branch)
}
gush() {
  sayCmd "git push origin $(current_branch)"
  git push origin $(current_branch)
}
gusu() {
  sayCmd "git push -u origin $(current_branch)"
  git push -u origin $(current_branch)
}
gushf() {
  if [ $(current_branch) = 'master' ]; then
    sayit "You're trying to force push to master. No. Just, no." $RED
    return 1
  fi
  sayCmd "git push --force-with-lease origin $(current_branch)"
  git push --force-with-lease origin $(current_branch)
}
gull() {
  sayCmd "git pull"
  git pull
}
gech() {
  sayCmd "git fetch"
  git fetch
}
gone() {
  sayCmd "git clone $@"
  git clone $@
}
gonc() {
  repo_url=$1
  if [ -z "$2" ]; then
    repo_name_with_git="${repo_url##*/}"
    directory_name=${repo_name_with_git%.git}
  else
    directory_name="$2"
  fi
  sayCmd "git clone $repo_url $directory_name && cd $directory_name"
  git clone $repo_url $directory_name && cd $directory_name
}
alias current_branch="git rev-parse --abbrev-ref HEAD"
alias local_branches="git for-each-ref --format='%(refname:short)' refs/heads/"
branches_select_list() {
  local branches=($(local_branches))
  for ((i = 1; i < ${#branches[@]}+1; ++i)); do
    echo "$i) ${branches[$i]}"
  done
  printf "› "
}
pick_branch() {
  local branches=($(local_branches))
  read branch_num
  echo ${branches[$branch_num]}
}
goum() {
  sayCmd "git checkout master"
  git checkout master
}
goub() {
  sayCmd "git checkout -b $@"
  git checkout -b $@
}
gc() {
  stage_all_if_none_staged
  if [ -z "$1" ]; then
    local message=''
  else
    local message="-m$1"
  fi
  sayCmd "git commit $message"
  git commit $message
}
gend() {
  stage_all_if_none_staged
  sayCmd "git commit --amend --no-edit"
  git commit --amend --no-edit
}
gard() {
  sayCmd "git reset --hard head && git clean -df"
  git reset --hard head && git clean -df
}
gset() {
  sayCmd "git reset"
  git reset
}
greh() {
  if [ -z "$1" ]; then
    local num=1
  else
    local num="$1"
  fi
  sayCmd "git reset head~$num"
  git reset head~$num
}
gosh() {
  if [ -z "$1" ]; then
    local sha=$(git rev-parse HEAD)
  else
    local sha="$1"
  fi
  sayCmd "git show $sha"
  git show $sha
}
gasi() {
  if [ -z "$1" ]; then
    local number='5'
  else
    local number="$1"
  fi
  sayCmd "git rebase -i head~$number"
  git rebase -i head~$number
}
gasc() {
  sayCmd "git rebase --continue"
  git rebase --continue
}
stage_all_if_none_staged() {
  git status | grep -q 'Changes to be committed'
  if [[ $? -eq 1 ]] ; then
    sayCmd "git add ."
    git add .
  fi
}
gwip() {
  if [ $(current_branch) = 'master' ]; then
    sayit "You're trying to wip master.  Wip a branch instead." $RED
    return 1
  fi
  stage_all_if_none_staged
  if [ -z "$1" ]; then
    local message='wip'
  else
    local message="wip: $1"
  fi
  sayCmd "git commit -m \"$message [ci skip]\""
  git commit -m "$message [ci skip]"
}
gash() {
  sayCmd "git stash -u"
  git stash -u
}
gpop() {
  sayCmd "git stash pop"
  git stash pop
}
gply() {
  sayCmd "git stash apply"
  git stash apply
}
giff() {
  sayCmd "git diff $@"
  git diff $@
}
gifs() {
  sayCmd 'dit diff --staged'
  git diff --staged
}
gref() {
  sayCmd 'git reflog'
  git reflog
}
gean() {
  sayCmd 'git clean -df'
  git clean -df
}
gead() {
  sayCmd "git checkout head -- $@"
  git checkout head -- $@
}
gonf() {
  sayCmd "git config $@"
  git config $@
}
gick() {
  sayCmd "git cherry-pick $@"
  git cherry-pick $@
}
goby() {
  sayCmd "git branch --show-current | tr -d '\n' | pbcopy"
  git branch --show-current | tr -d '\n' | pbcopy
}
