# user, host, full path, and time/date
# on two lines for easier vgrepping
# entry in a nice long thread on the Arch Linux forums: http://bbs.archlinux.org/viewtopic.php?pid=521888#p521888
PROMPT=$'\n%{\e[0;34m%}%B┌─[%b%{\e[0m%}%{\e[1;32m%}%n%{\e[1;30m%}@%{\e[0m%}%{\e[0;36m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - [%~] - %{\e[0;34m%}%B[%b$(git_prompt_info)%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]>%{$fg_bold[red]%}➜%{\e[0m%}%b  '
PS2=$'\e[0;34m%}%B  %{\e[0m%}%b'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}git:%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%} ✗ Changed ✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
