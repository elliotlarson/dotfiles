PROMPT='
%{$fg_bold[blue]%}%d %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$fg_bold[red]%}
• % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%})"
