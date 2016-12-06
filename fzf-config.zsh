[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag -g --hidden -U --ignore .git -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#########
#  Git  #
#########

# fco - checkout git branch
fco() {
    local branches branch
    branches=$(git branch -vv) &&
        branch=$(echo "$branches" | fzf +m) &&
        git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fcoc - checkout git commit
fcoc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
        commit=$(echo "$commits" | fzf --tac +s +m -e) &&
        git checkout $(echo "$commit" | sed "s/ .*//")
}

# ftags - search ctags
ftags() {
    local tags branches target
    tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
    target=$(
    (echo "$tags") |
    fzf-tmux -d30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
    git checkout $(echo "$target" | awk '{print $2}')
}

# flo - git commit browser
flo() {
    git log --graph --color=always \
        --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
    fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
        --bind "ctrl-m:execute:
    (grep -o '[a-f0-9]\{7\}' | head -1 |
    xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
    {}
    FZF-EOF"
}

# fadd - git add browser
fadd() {
    git add $({git ls-files --others --exclude-standard & git diff --name-only} | fzf -m)
}

# fstl - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter: shows you the contents of the stash
# ctrl-d: drop the stash
# ctrl-b: checks out a branch, pop the stash
fstl() {
    local out key stash branches branch
    while out=$(
        git stash list |
        fzf --ansi --no-sort --query="$q" --print-query \
            --expect=ctrl-m,ctrl-b,ctrl-d);
    do
        out=($(echo $out | cut -d " " -f1))
        key=$(echo $out | cut -d " " -f 1)
        stash=$(echo $out | cut -d " " -f 2 | cut -d: -f1)
        echo $key
        if [[ $key = "ctrl-m" ]]; then
            git stash show -p $stash
        elif [[ $key = "ctrl-d" ]]; then
            echo "Drop $stash, type 'yes' to confirm, blank/others to cancel"
            read dropConfirm
            if [[ $dropConfirm = 'yes' ]]; then
                git stash drop $stash
            fi
        elif [[ $key = "ctrl-b" ]]; then
            branches=$(git branch)
            branch=$(echo "$branches" | fzf +m | rev | cut -d " " -f 1 | rev)
            echo "enter branch name you want to checkout from $branch, Ctrl-c to quit: "
            read branchName
            git checkout $branch
            git checkout -b $branchName
            git stash pop $stash
            break
        fi
    done
}
