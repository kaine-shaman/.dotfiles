# alias shutdown='sudo shutdown now'
# alias restart='sudo reboot'
# alias suspend='sudo pm-suspend'
# alias sleep='pmset sleepnow'
alias c='clear'
alias e='exit'
# alias colors='for i in {0..255}; do  printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i + 1 ) % 8 )); then echo ; fi ; done'
# alias colors='for i in {0..255}; do  printf "\x1b[38;5;${i}mcolor%-5i\x1b[0m" $i ; if ! (( ($i - 3) % 6 )); then echo ; fi ; done'
alias colors='for i in {0..255}; do echo -en "\e[48;5;${i}m  \e[0m\e[38;5;${i}mcolour$(printf '%03d' $i)\e[0m  "; [ $(((i+1)%6)) -eq 4 ] && echo; done'

# Git
alias git_current_branch='git rev-parse --abbrev-ref HEAD'

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'

alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gamscp='git am --show-current-patch'

alias gap='git apply'
alias gapt='git apply --3way'

alias gb='git branch'
alias gbD='git branch -D'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'

alias gbl='git blame -b -w'

alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc!='git commit -v --amend'
alias gc='git commit -v'
alias gca!='git commit -v -a --amend'
alias gca='git commit -v -a'
alias gcam='git commit -a -m'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcas='git commit -a -s'
alias gcasm='git commit -a -s -m'
alias gcmsg='git commit -m'
alias gcn!='git commit -v --no-edit --amend'
alias gcs='git commit -S'
alias gcsm='git commit -s -m'

alias gcb='git checkout -b'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'

alias gccd='git clone --recurse-submodules "$@" && cd "$(basename $_ .git)"'
alias gcl='git clone --recurse-submodules'

alias gcf='git config --list'

alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'

alias gcount='git shortlog -sn'

alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdnolock='git diff $@ ":(exclude)package-lock.json" ":(exclude)*.lock"'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdup='git diff @{upstream}'
alias gdv='git diff -w $@ | view -'
alias gdw='git diff --word-diff'

alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

alias gfg='git ls-files | grep'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'

alias gg='git gui citool'
alias gga='git gui citool --amend'

alias gp='git push'
alias ggp='git push origin'
alias ggf='git push --force origin'
alias ggfl='git push --force-with-lease origin'
alias ggpush='git push origin "$(git_current_branch)"'
alias gpd='git push --dry-run'
alias gpf!='git push --force'
alias gpf='git push --force-with-lease'
alias gpoat='git push origin --all && git push origin --tags'
alias gpsup='git push --set-upstream origin $(git_current_branch)'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gl='git pull'
alias ggl='git pull origin'
alias ggpull='git pull origin "$(git_current_branch)"'
alias gluc='git pull upstream $(git_current_branch)'
alias ggu='git pull --rebase origin'
alias gup='git pull --rebase'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias gupv='git pull --rebase -v'

alias ggpnp='ggl && ggp'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'
alias gunignore='git update-index --no-assume-unchanged'

alias gk='gitk --all --branches &!'
alias gke='gitk --all $(git log -g --pretty=%h) &!'

alias glg='git log --stat'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glgp='git log --stat -p'
alias glo='git log --oneline --decorate'
alias glod='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'
alias glods='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glol='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'
alias glola='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'
alias glols='git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'
alias glp='git log --pretty=<format>'

alias gm='git merge'
alias gma='git merge --abort'
alias gmtl='git mergetool --no-prompt'
alias gmtlvim='git mergetool --no-prompt --tool=vimdiff'

alias gr='git remote'
alias gra='git remote add'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grup='git remote update'
alias grv='git remote -v'

alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbo='git rebase --onto'
alias grbs='git rebase --skip'

alias grev='git revert'

alias grh='git reset'
alias grhh='git reset --hard'
alias groh='git reset origin/$(git_current_branch) --hard'
alias gru='git reset --'

alias grm='git rm'
alias grmc='git rm --cached'

alias grs='git restore'
alias grss='git restore --source'
alias grst='git restore --staged'

alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'

alias gsb='git status -sb'
alias gss='git status -s'
alias gst='git status'

alias gsd='git svn dcommit'
alias gsr='git svn rebase'

alias gsh='git show'
alias gsps='git show --pretty=short --show-signature'

alias gsi='git submodule init'
alias gsu='git submodule update'

alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstall='git stash --all'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstsp='git stash show -p'
alias gstu='git stash --include-untracked'

alias gsw='git switch'
alias gswc='git switch -c'

alias gtl='gtl(){ git tag --sort=-v:refname -n -l ${1}* }; noglob gtl'
alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'

# alias g      ='git'
# alias ga     ='git add'
# alias gafzf  ='git ls-files -m -o --exclude-standard | grep -v "__pycache__" | fzf -m --print0 | xargs -0 -o -t git add' # Git add with fzf
# alias grmfzf ='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git rm' # Git rm with fzf
# alias grfzf  ='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore' # Git restore with fzf
# alias grsfzf ='git diff --name-only | fzf -m --print0 | xargs -0 -o -t git restore --staged' # Git restore --staged with fzf
# alias gf     ='git fetch'
# alias gs     ='git status'
# alias gss    ='git status -s'
# alias gup    ='git fetch && git rebase'
# alias gtd    ='git tag --delete'
# alias gtdr   ='git tag --delete origin'
# alias glo    ='git pull origin'
# alias gl     ='git pull'
# alias gb     ='git branch '
# alias gbr    ='git branch -r'
# alias gd     ='git diff'
# alias gco    ='git checkout '
# alias gcob   ='git checkout -b '
# alias gcofzf ='git branch | fzf | xargs git checkout' # Select branch with fzf
# alias gre    ='git remote'
# alias gres   ='git remote show'
# alias glgg   ='git log --graph --max-count=5 --decorate --pretty="oneline"'
# alias gm     ='git merge'
# alias gmn    ='git merge --no-commit'
# alias gcp    ='git cherry-pick'
# alias gp     ='git push'
# alias gpo    ='git push origin'
# alias ggpush ='git push origin $(current_branch)'
# alias gc     ='git commit -v'
# alias gcm    ='git commit -m'
# alias gcmnv  ='git commit --no-verify -m'
# alias gcanenv='git commit --amend --no-edit --no-verify'
# alias gst    ='git stash'

# Better ls
alias ls="eza --icons=always"

alias lh='ls -X -d .*'
alias la='lh; ls -X'
# alias la='ls -X -d .* ; ls -X'

alias ll='ls -lhX'
alias llh='ls -lhX -d .*'
# alias lla='ls -lhX -d .* ; ls -lhX'
alias lla='llh; ll'
# alias l='ls -CF'

alias nv=nvim
alias lg="lazygit"
alias t=thunar
# alias z=zoxide
alias tm=tmux
