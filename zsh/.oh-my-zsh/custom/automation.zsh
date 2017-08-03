myip() {
  ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}'
}
alias rmrf='rm -rf'
alias retag='ctags -R --exclude=.git --exclude=log --exclude=tmp --exclude=.js'
alias va='vagrant'
alias l='exa -lg'
alias la='exa -lag'
alias u='cd .. && exa -lag'
alias s='ssh'
alias edithosts='sudo vi /etc/hosts'
alias reloadhosts='dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias npr='npm run -s'
alias es="exec $SHELL"
sshconfig() {
  $EDITOR ~/.ssh/config
}

cl()
{
  builtin cd $1
  exa -lag
}

c()
{
  builtin cd $1
  exa -lag
}

mc()
{
  mkdir $1
  cd $1
  exa -lag
}

tophistory()
{
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}
