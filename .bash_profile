#PS1='[\u@\h \W]\\$'
#PS1='\e[1;34m\h:\W \e[1;32m\u\$ \e[0m'
PS1="\[\033[36m\]\u\[\033[m\]@\[\033[36m\]\w\[\033[m\]\$ "

export CLICOLOR=1
#export LSCOLORS=FxfxcxdxCxegedabagacad
export LSCOLORS=fxgxcxdxbxegedabagacad

alias caamo="~/caamoad/amoadMabnage"
alias vi="vim"
alias cp='cp -i'
alias rm='rm -v' 
alias ls="ls -G"
alias diff="diff --color"
alias oclone="git clone git@github.com:youhei19880130/amoadManage.git"
alias gocd="cd ~/caamoad/amoadManage"
alias grail="bundle exec rails server -d"
alias sbash="source ~/.bashrc"
alias ctags='/usr/local/Cellar/ctags/5.8/bin/ctags'

##localのmerge済みブランチの削除
alias gbld="git branch --merged | grep -v '*' | xargs -I % git branch -d %"

##remoteのmerge済みブランチの削除
##※自分のremoteリポジトリがoriginで登録されていることが前提
alias gbrd="git branch -a --merged | grep -v master | grep remotes/origin| sed -e 's% *remotes/origin/%%' | xargs -I% git push origin :%"
export PATH=/usr/local/bin:$PATH

export PATH=/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/a12777/.rvm/bin:/usr/local/mysql/bin

export PATH=/Users/a12777/.rbenv/shims:/Users/a12777/.rbenv/bin:/usr/local/heroku/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/Users/a12777/.rvm/bin:/usr/local/mysql/bin
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
