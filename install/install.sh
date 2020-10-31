#!/bin/bash

# 安装neovim
sudo pacman -S neovim yay python ccls wget

# 安装 zsh
# https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# 设置zsh主题（pure）
# https://github.com/sindresorhus/pure 
git clone https://github.com/sindresorhus/pure.git $ZSH_CUSTOM/themes/pure
echo "fpath+=$HOME/.zsh/pure" >> $HOME/.zshrc
echo "autoload -U promptinit; promptinit" >> $HOME/.zshrc
echo "prompt pure" >> $HOME/.zshrc

# 安装zsh自动补全插件
# git://github.com/zsh-users/zsh-autosuggestions 
# https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlight
echo "source $ZSH_CUSTOM/plugins/zsh-autosuggestions/*.zsh" >> ~/.zshrc
echo "source $ZSH_CUSTOM/plugins/zsh-syntax-highlight/*.zsh" >> ~/.zshrc

# 安装pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
rm get-pip.py

# 清华 pip 源
# https://mirrors.tuna.tsinghua.edu.cn/help/pypi/
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install neovim
pip3 install cppman

# 安装 SpaceVim
# https://spacevim.org/cn/quick-start-guide/
curl -sLf https://spacevim.org/cn/install.sh | bash

# 安装npm和yarn
sudo pacman -S npm yarn
npm config set registry https://registry.npm.taobao.org/  # 设置npm镜像源为淘宝镜像
yarn config set registry https://registry.npm.taobao.org/  # 设置yarn镜像源为淘宝镜像


## coc.nvim 的安装 
cd ~/.cache/vimfiles/repos/github.com/neoclide/coc.nvim
git clean -xfd
yarn install --frozen-lockfile

rm -r ~/.SpaceVim.d # 将原来的配置删除
git clone https://github.com/dupeiran001/My-Linux-config ~/.SpaceVim.d 
nvim # 打开vim 将会自动安装所有的插件

yay -S bear lazygit

# 添加一些映射
cat <<EOT >> ~/.zshrc
alias vi="nvim"
alias q="exit"

# 安装 z.lua
source ~/antigen.zsh
antigen bundle skywind3000/z.lua
antigen apply.

alias fd=fdfind
EOT

