#!/bin/bash

wrapper() {
  RED="\033[0;31m"
  GREEN="\033[0;32m"
  YELLOW="\033[0;33m"
  BLUE="\033[0;36m"
  NORMAL="\033[0m"

  REPO_HTTPS="https://github.com/ets-labs/python-vimrc.git"
  VUNDLE_HTTPS="https://github.com/VundleVim/Vundle.vim.git"


FONTS=${FONTS:-/tmp/fonts}
USR_FONTS=${USR_FONTS:-~/.local/share/fonts/}
PROJECT_PATH="$HOME/MV_DOTFILES"
INSTALLATION_PATH="$PROJECT_PATH/installation"

source "$INSTALLATION_PATH/default_install.sh"

echo "${NORMAL}"
    if [ ! -n "$VIM" ]; then
    VIM=~/.vim
    fi

    printf "${BLUE}%s${NORMAL}\n" "Symlinking $VIM/.vimrc with ~/.vimrc..."
    ln -fs $PWD/.vimrc ~/.vimrc

    if [ ! -d "$VIM/bundle/Vundle.vim" ]; then
        printf "${BLUE}%s${NORMAL}\n" "Installing Vundle..."
        env git clone --depth=1 $VUNDLE_HTTPS "$VIM/bundle/Vundle.vim"
    fi

    if [ ! -f $VIM/colors/wombat256mod.vim ]; then
        if [ ! -d $VIM/colors/ ]; then
            mkdir -p $VIM/colors
        fi
        wget 'http://www.vim.org/scripts/download_script.php?src_id=13400' -O $VIM/colors/wombat256mod.vim
    fi

    if [[ $(uname) == 'Darwin' ]]; then
        source "$INSTALLATION_PATH/mac_install.sh"
    else
        source "$INSTALLATION_PATH/linux_install.sh"
    fi
}

wrapper
vim +PluginInstall















################################################

# echo "If root priviledge is asked, please give."
# if [ -z $(which yum) ];then
#     sudo apt-get -y install git python vim exuberant-ctags
# else
#     sudo yum -y install git python vim ctags
# fi

# echo "Will install vim plugins via Vundle for current user:"
# mkdir -p ~/.vim/bundle
# rm -rf ~/.vim/bundle/Vundle.vim
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# # Download some special fonts for airline
# mkdir -p $USR_FONTS
# wget -P $USR_FONTS \
# https://github.com/FortAwesome/Font-Awesome/raw/master/fonts/FontAwesome.otf \
# -O $USR_FONTS/FontAwesome.otf
# wget -P $USR_FONTS \
# https://github.com/blackjk3/threefab/raw/master/css/fonts/icomoon.ttf \
# -O $USR_FONTS/icomoon.ttf
# wget -P $USR_FONTS \
# https://github.com/Yelp/yelp.github.io/raw/master/fonts/octicons.ttf \
# -O $USR_FONTS/octicons.ttf
# wget -P $USR_FONTS \
# https://github.com/ryanoasis/powerline-extra-symbols/raw/master/patched-fonts/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf \
# -O $USR_FONTS/DroidSansMonoForPowerlinePlusNerdFileTypesMono.otf

# # Enable user fonts
# rm -rf $FONTS
# git clone https://github.com/powerline/fonts $FONTS
# $FONTS/install.sh

# cp -v ./.vimrc_default ~/.vimrc

# echo "Begin to install VIM plugins:"
# vim +PluginInstall +qall

# # Compile command-t, since vundle could not handle it
# echo "Compiling command-t"
# cd ~/.vim/bundle/command-t
# rake make

# echo -e "\033[0;32mEverything Done!\033[0m"
# echo -e "\033[0;33mOptional:\033[0mPlease change your console font to powerline."