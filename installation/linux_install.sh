#!/bin/bash

function linux_install() {
  if [ -f /usr/bin/apt-get ]; then
    echo -ne "\t+ Upgrading System...\n"
    sudo apt-get update -y >> /dev/null && sudo apt-get upgrade -y >> /dev/null
    packager="apt-get"
    packs="exuberant-ctags silversearcher-ag ncurses-term libjson-xs-perl vim-gtk vim"
  else
    echo "ERR: Package Manager not indentified. Please install manually."
    exit 1
  fi

  echo "Installing pre-requisites..."
  for pack in $packs; do
    sudo $packager install $pack -y >> /dev/null
  done

  echo "Installing FZF"
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install

#   echo -ne "Install VSCode [S]/n?: "
#   read answer

#   if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
#     # Installind Vundle
#     echo -ne "\t+ Installing VSCode...\n"
#     sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
#     curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#     sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
#     sudo apt-get update
#     sudo apt-get install code
#   fi

#   echo -ne "Install Chrome [S]/n?: "
#   read answer

#   if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
#     # Installind Vundle
#     echo -ne "\t+ Installing Chrome...\n"
#     wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#     sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#     sudo apt-get update -y; sudo apt-get install google-chrome-stable -y
#   fi

#   echo -ne "Install Android Studio [S]/n?: "
#   read answer

#   if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
#     # Installind Android Studio
#     # source "$INSTALLATION_PATH/android_studio_install.sh"

#     # Copiar o Android Studio para /opt/
#     sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

#     echo -ne "Open Android Studio [S]/n?: "
#     read answer

#     if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
#       cd /opt/android-studio/bin/ && ./studio.sh
#     fi
#   fi

#   echo -ne "Install Flutter [S]/n?: "
#   read answer

#   if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
#     if [ ! -d "~/development/" ]; then
#       cd ~/development
#     else
#       mkdir ~/development
#     fi
#     # Installind Flutter
#     git clone https://github.com/flutter/flutter.git
#     export PATH="$PATH:`pwd`/flutter/bin"
#     export PATH="$PATH:[PATH_TO_FLUTTER_GIT_DIRECTORY]/flutter/bin"
#   fi

  #echo "Configuring VIM..."
  #if [ ! -d ~/.fonts/ ]; then
   #mkdir ~/.fonts
   #if [ ! -f ~/.fonts/PowerlineSymbols.otf ]; then
     #wget "https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf"
     #mv PowerlineSymbols.otf ~/.fonts/
   #fi
  #fi

  # if [ ! -d ~/.config/fontconfig/conf.d/ ]; then
  #  mkdir -p ~/.config/fontconfig/conf.d/
  #  if [ ! -f ~/.config/fontconfig/conf.d/10-powerline-symbols.conf ]; then
  #    wget "https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf"
  #    mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
  #  fi
  # fi

  # echo "Installing Plugins..."
  # git submodule update --init
}

linux_install
