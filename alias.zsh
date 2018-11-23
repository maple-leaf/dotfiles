alias nv="nyaovim"
alias spacemacs="HOME=~/spacemacs emacs"
alias ec="emacs -nw"
alias ss="/usr/local/opt/shadowsocks-libev/bin/ss-local -c /usr/local/etc/shadowsocks-libev.json"
# alias proxy="proxychains4"
alias myproxy="/usr/local/Cellar/privoxy/3.0.26/sbin/privoxy /etc/privoxy/config"
alias hlgproxy="/usr/local/Cellar/privoxy/3.0.26/sbin/privoxy ~/proxy-config"
alias proxy="export http_proxy=http://127.0.0.1:8118 https_proxy=http://127.0.0.1:8118 YARN_PROXY=http://127.0.0.1:8118"
alias unproxy="export http_proxy= https_proxy= YARN_PROXY="
alias psqld="pg_ctl -D /usr/local/var/postgres start"
alias cnpm="npm --registry=https://registry.npm.taobao.org"

# git stuffs
alias gdp="git diff head~"
alias gcz="git cz"

# docker
# get into container shell
alias dockerIn=""
# stop all container
alias dockerStopAll="docker stop $(docker ps -aq)"

# http://stackoverflow.com/a/39741226
# clipboard-failure-in-tmux-vim-after-upgrading-to-macos-sierra
#alias nvim="reattach-to-user-namespace -l nvim"
#

alias hs="python -m SimpleHTTPServer"

alias jest-debug="node --inspect-brk node_modules/.bin/jest --runInBand"

# list active pids for panels
alias tmuxps="tmux list-panes -F '#{pane_active} #{pane_pid}'"
