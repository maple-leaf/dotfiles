[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Setting ag as the default source for fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


#########
#  Git  #
#########

# fco - checkout git branch
fco() {
    local branches branch
    branches=$(git branch) &&
        branch=$(echo "$branches" | fzf +m) &&
        git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# fmr - merge branch
fmr() {
    local branches branch
    branches=$(git branch) &&
        branch=$(echo "$branches" | fzf +m) &&
        git merge $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# frb - rebase branch
frb() {
    local branches branch
    branches=$(git branch) &&
        branch=$(echo "$branches" | fzf +m) &&
        git rebase --interactive --autosquash $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# frc - rebase commit of current branch
frc() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
        commit=$(echo "$commits" | fzf --tac +s +m -e) &&
        chash=$(echo "$commit" | sed "s/ .*//") &&
        git rebase --interactive --autosquash $(echo "$chash")
}

# fbd - delete branch
fbd() {
    while out=$(
        git branch |
        fzf --ansi --no-sort --query="$q" --print-query \
            --expect=ctrl-m);
    do
        out=($(echo $out))
        key=$out[-2]
        branch=$out[-1]
        if [[ $key = "ctrl-m" ]]; then
            echo "Really delete branch: "$branch
            select yn in "Yes" "No"; do
                case $yn in
                    Yes )
                        git branch -d $branch;
                        echo "Really delete branch on !!REMOTE!!: "$branch
                        select Ryn in "Yes" "No"; do
                            case $Ryn in
                                Yes ) git push origin -d $branch;break;;
                                No ) break;;
                            esac
                        done
                        break;;
                    No ) break;;
                esac
            done
        fi
    done
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
    git tag --sort=-creatordate) || return
    target=$(
    (echo "$tags") |
    fzf -e) || return
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
            --expect=ctrl-m,ctrl-b,ctrl-d,ctrl-o);
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
        elif [[ $key = "ctrl-o" ]]; then
            echo "Pop $stash, type 'yes' to confirm, blank/others to cancel"
            read popConfirm
            if [[ $popConfirm = 'yes' ]]; then
                git stash pop $stash
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


# fcf - git commit fixup and then rebase
fcf() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
        commit=$(echo "$commits" | fzf --tac +s +m -e) &&
        chash=$(echo "$commit" | sed "s/ .*//") &&
        git commit --fixup $(echo "$chash") &&
        git rebase --interactive --autosquash $(echo "$chash~1")
}
