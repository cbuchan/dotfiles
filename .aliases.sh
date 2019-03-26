alias jest='./node_modules/jest-cli/bin/jest.js'

alias jslint='./node_modules/eslint/bin/eslint.js --rulesdir ./js_infra/eslint_rules/'

alias zsh='/usr/bin/zsh'
alias gdc='git diff --cached'

alias cdd='cd ~/Workspace/dotfiles'
alias cdr='cd ~/co/release && svn info | grep URL'
alias cdw='cd ~/Workspace'
alias cda='cd ~/Workspace/AngelList'
alias cdl='cd ~/Workspace/alist'

function zspec () {
  bundle exec zeus test "$@" -fd
}

fixssh() {
  for key in SSH_AUTH_SOCK SSH_CONNECTION SSH_CLIENT; do
    if (tmux show-environment | grep "^${key}" > /dev/null); then
      value=`tmux show-environment | grep "^${key}" | sed -e "s/^[A-Z_]*=//"`
      export ${key}="${value}"
    fi
  done
}

# tmux Aliases
alias tvim='tmux attach -d -t vim'
alias tserv='tmux attach -d -t serv'

# Git Aliases
alias g='git'
alias gst='git status'
alias gl='glog'
alias gup='git fetch && git rebase'
alias gp='git push'

function gdv() {
  git diff -w "$@" | view -
}

function gcr() {
  BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git push -u origin $BRANCH;
}

alias gc='git commit -v'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcm='git checkout master'
alias gb='git branch'
alias gba='git branch -a'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias glg='git log --stat --max-count=5'
alias glgg='git log --graph --max-count=5'
alias gloga='git log --oneline --decorate --color --graph --all'
alias gss='git status -s'
alias ga='git add'
alias gm='git merge'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'

function gli () {
  GSD_COMMIT=$(glog git-svn..HEAD | tac | sed "$@q;d" | awk '{ print $2}');
  echo $GSD_COMMIT;
}

function gssi () {
  GSD_COMMIT=$(glog git-svn..HEAD | tac | sed "$@q;d" | awk '{ print $2}');
  git show $GSD_COMMIT;
}

alias gdc="git diff --cached"
alias gd='git diff'
alias grm='git rebase master'
alias grc='git rebase --continue'
alias gra='git rebase --abort'
alias grmi='git rebase master -i'

#alias gsro='git svn rebase'
#alias gsri='git svn rebase && git rebase git-svn -i'

alias gsl='git svn log -p -r'
alias gbl='for k in `git branch | sed s/^..//`; do echo -e `git log -1 --pretty=format:"%Cgreen%ci %Cblue%cr%Creset" $k --`\\t"$k";done | sort'

if [[ $0 == *zsh* ]]; then
  #speed up git tab completion for ZSH
  __git_files () {
      _wanted files expl 'local files' _files
  }
fi
