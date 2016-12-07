export GOPATH="$HOME/go"

export ANDROID_HOME=/usr/local/opt/android-sdk

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$GOPATH/bin:$HOME/.composer/vendor/bin:$HOME/bin"

export EDITOR='nvim'
# variable required by neovim
export XDG_DATA_HOME="$HOME/.config"

# terimnal cmd for vscode
function code {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        local argPath="$1"
        [[ $1 = /* ]] && argPath="$1" || argPath="$PWD/${1#./}"
        open -a "Visual Studio Code" "$argPath"
    fi
}
