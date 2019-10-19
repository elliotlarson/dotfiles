PROMPT='
%{$fg_bold[blue]%}%d %{$fg_bold[cyan]%}$(git_prompt_info) $(_git_pair)%{$fg_bold[blue]%} %{$fg_bold[red]%}
• % %{$reset_color%}'

function _git_pair() {
  echo "%{$fg[yellow]%}$(_git_user_initials)"
}

function _git_user_initials {
  MSG=$(git config --get user.initials || echo '')
  if [ -n "$MSG" ]; then
    MSG="$MSG "
  fi
  echo $MSG
}

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
