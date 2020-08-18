export LANG=en_US.UTF-8
export GOPATH="$HOME/go"

export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:$HOME/.composer/vendor/bin:$HOME/bin:/Applications/Genymotion.app/Contents/MacOS/tools/"
export PATH="$(yarn global bin):$PATH"

export EDITOR='nvim -u NONE'
# variable required by neovim
export XDG_DATA_HOME="$HOME/.config"

ulimit -n 2048
