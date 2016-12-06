###########
#  Basic  #
###########

ZSH_THEME="michelebologna"

plugins=(git gitfast osx )

#########
#  Git  #
#########

unalias gdca
alias gdc='git diff --cached'

alias glo='git log --name-only --date=short --pretty=format:"%Cblue%h %C(yellow)%aN %Creset%aI %Cgreen%s"'

# list all statsh with diff detail
alias gstll='git stash list | awk -F: '"'"'{ print "\n\n\n\n"; print $0; print "\n\n"; system("git stash show -p " $1); }'"'"''
