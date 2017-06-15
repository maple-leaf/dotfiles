###########
#  Basic  #
###########

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git gitfast osx )

#########
#  Git  #
#########

unalias gdca
alias gdc='git diff --cached'

alias glo='git log --name-only --date=short --pretty=format:"%Cblue%h %C(yellow)%aN %Creset%aI %Cgreen%s"'
alias gloc='git log --name-only --date=short --pretty=format:"%Cblue%h %C(yellow)%aN %Creset%aI %Cgreen%s" master..'

# list all statsh with diff detail
alias gstll='git stash list | awk -F: '"'"'{ print "\n\n\n\n"; print $0; print "\n\n"; system("git stash show -p " $1); }'"'"''
