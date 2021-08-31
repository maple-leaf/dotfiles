alias nv="nyaovim"
alias spacemacs="HOME=~/spacemacs emacs"
alias ec="emacs -nw"
alias ss="/usr/local/opt/shadowsocks-libev/bin/ss-local -c /usr/local/etc/shadowsocks-libev.json"
# alias proxy="proxychains4"
alias myproxy="privoxy /etc/privoxy/config"
alias proxy="export http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 YARN_PROXY=http://127.0.0.1:8118"
alias unproxy="export http_proxy= https_proxy= YARN_PROXY="
alias psqld="pg_ctl -D /usr/local/var/postgres start"
alias cnpm="npm --registry=https://registry.npm.taobao.org"

# git stuffs
alias gdp="git diff head~"
alias gcz="git cz"
alias gbdesc="git config branch.$(current_branch).description"

# docker
# get into container shell
alias dockerIn=""
# stop all container
alias dockerStopAll="docker stop $(docker ps -aq)"

# http://stackoverflow.com/a/39741226
# clipboard-failure-in-tmux-vim-after-upgrading-to-macos-sierra
#alias nvim="reattach-to-user-namespace -l nvim"
#

alias httpserver="python -m SimpleHTTPServer"

alias jestd="node --inspect-brk node_modules/.bin/jest --runInBand"
alias jestmatch="npx jest -t"

# list active pids for panels
alias tmuxps="tmux list-panes -F '#{pane_active} #{pane_pid}'"

# generate compile_commands.json
# https://github.com/MaskRay/ccls/wiki/Project-Setup#cmake
alias ccjson="cmake -H. -BDebug -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES && mv ./Debug/compile_commands.json . && rm -rf ./Debug"

# list changed files in current branch only
alias filechanges="git log --first-parent --no-merges --oneline | grep "37807" | cut -d ' ' -f1 | xargs -I hash git diff-tree --no-commit-id --name-only -r hash | uniq -u | sort"
