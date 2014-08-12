#PS1='[\u@\h \W]\\$'
PS1='\e[1;34m\h:\W \e[1;32m\u\$ \e[0m'

export CLICOLOR=1
#export LSCOLORS=FxfxcxdxCxegedabagacad
export LSCOLORS=fxgxcxdxbxegedabagacad

alias caamo="~/caamoad/amoadMabnage"

alias vi="vim"
alias ls="ls -G"
alias oclone="git clone git@github.com:youhei19880130/amoadManage.git"
alias gocd="cd ~/caamoad/amoadManage"
alias grail="bundle exec rails server -d"
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

##localのmerge済みブランチの削除
alias gbld="git branch --merged | grep -v '*' | xargs -I % git branch -d %"

##remoteのmerge済みブランチの削除
##※自分のremoteリポジトリがoriginで登録されていることが前提
alias gbrd="git branch -a --merged | grep -v master | grep remotes/origin| sed -e 's% *remotes/origin/%%' | xargs -I% git push origin :%"
