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
alias gote='git remote'

gune() {
  sayCmd 'git remote prune origin'
  git remote prune origin
}
gach() {
  sayCmd "git branch"
  git branch
}
game() {
  sayCmd "git blame"
  git blame
}
gaca() {
  sayCmd 'git branch -a'
  git branch -a
}
gachd() {
  if [ -z "$1" ]; then
    sayit 'Which branch do you want to delete?' $RED
    branches_select_list
    local branch=$(pick_branch)
  else
    local branch="$1"
  fi
  sayCmd "git branch -D $branch"
  git branch -D $branch
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
  sayCmd "git log"
  git log
}
glop() {
  sayCmd "git log -p"
  git log -p
}
glog() {
  sayCmd "git log --pretty=format:\"%C(yellow)%h%C(reset) %C(blue)%ci%C(reset) %s %C(blue)[%cn]%C(reset)\""
  git log --pretty=format:"%C(yellow)%h%C(reset) %C(blue)%ci%C(reset) %s %C(blue)[%cn]%C(reset)"
}
gush() {
  git push origin $(current_branch)
}
gusu() {
  git push -u origin $(current_branch)
}
gushf() {
  if [ $(current_branch) = 'master' ]; then
    sayit "You're trying to force push to master. No. Just, no." $RED
    return 1
  fi
  git push -f origin $(current_branch)
}
gull() {
  sayCmd "git pull"
  git pull
}
gech() {
  sayCmd "git fetch"
  git fetch
}
alias gone='git clone'
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
gout() {
  if [ -z "$1" ]; then
    sayit 'Which branch do you want?'
    branches_select_list
    local branch=$(pick_branch)
  else
    local branch="$1"
  fi
  sayCmd "git checkout $branch"
  git checkout $branch
}
goum() {
  sayCmd "git checkout master"
  git checkout master
}
goub() {
  sayCmd "git checkout -b"
  git checkout -b
}
gc() {
  stage_all_if_none_staged
  if [ -z "$1" ]; then
    local message=''
  else
    local message="-m $1"
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
  sayCmd "git reset --hard head"
  git reset --hard head
}
garr() {
  sayCmd "git reset --hard origin/$(current_branch)"
  git reset --hard origin/$(current_branch)
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
alias gase='git rebase'
gasm() {
  sayCmd "git rebase master"
  git rebase master
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
giff() {
  sayCmd "git diff"
  git diff
}
alias gifs='dit diff --staged'
alias gerg='git merge'
alias gref='git reflog'
alias gean='git clean -df'
alias gonf='git config'
alias gick='git cherry-pick'
