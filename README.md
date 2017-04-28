# 基于[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)的自定义设置

# 环境安装
- 安装[oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
- 安装[fzf](https://github.com/junegunn/fzf):  `brew install fzf`
- [可选]安装[tmux](https://github.com/tmux/tmux):  `brew install tmux`
- [可选]安装[vim](http://www.vim.org/) 或者 [neovim](https://neovim.io/):  `brew install vim/macvim/neovim`
- [可选]安装[tmuxinator](https://github.com/tmuxinator/tmuxinator):  `gem install tmuxinator`

# zsh配置
- git clone https://github.com/maple-leaf/dotfiles.git ~/dotfiles
- 按照官网安装完`oh-my-zsh`后，使用编辑器打开`~/.zshrc`(nvim .zshrc), 修改`ZSH_CUSTOM`为`ZSH_CUSTOM=$HOME/dotfiles`

# tmux
- 配置：个人使用[https://github.com/tony/tmux-config](https://github.com/tony/tmux-config)
- 管理session： [tmuxinator](https://github.com/tmuxinator/tmuxinator), [tmuxp](https://github.com/tony/tmuxp)
- tmux内无法使用`y`进行拷贝时，请检查`Terminal`设置, 允许`Application can access clipboard`。具体查看这个[issue](https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard/issues/56#issuecomment-271063847)

# vim/neovim
- 配置
    - [neovim](https://github.com/maple-leaf/nvim)
    - [vim](https://github.com/maple-leaf/vimrc)
- 如果你在tmux内使用neovim则需要将`alias.zsh`关于`nvim`的alias注释去掉，并安装`reattch-to-user-namespace`，解决剪贴板问题。
    - alias nvim="reattach-to-user-namespace -l nvim"
    - brew install reattach-to-user-namespace

# 本扩充配置介绍：
- fco: fuzzy-finder方式的git分支切换
- fcoc: fuzzy-finder方式的git commit切换
- fadd: fuzzy-finder方式的git add, 按<tab>来添加／取消添加已修改的文件
- ftags: fuzzy-finder方式的git tags切换
- flo: fuzzy-finder方式的git log查看, 在具体commit按`enter`查看详细
- ftags: fuzzy-finder方式的git tags切换
- fstal: fuzzy-finder方式的git tags切换
    - enter: 查看diff
    - ctrl-d: 丢弃stash
    - ctrl-b: 选择源branch签出输入的分支名然后还原stash

- 使用`gdc`替代gdca别名
- glo: 查看格式化好的log, 格式:

    ```
    b35840e author 2016-12-05T16:51:16+08:00 the message
    file/1/of/all/changed/files
    file/2/of/all/changed/files
    ...
    ```
- gloc: 仅查看`当前分支`相对于master分支所有新增commit格式化好的log, 格式如上



