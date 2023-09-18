#!/bin/bash

function default_install() {
  echo -ne "Install Fonts [S]/n?: "
  read answer

  if [ "${answer,,}" == "s" ] || [ -z "$answer" ]; then
    # Installind Vundle
    echo -ne "\t+ Installing Fonts...\n"
    source "$INSTALLATION_PATH/fonts_install.sh"
  fi
}

default_install
