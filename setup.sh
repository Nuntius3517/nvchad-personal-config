#!bin/bash
# This file is to install personal nvim setting used by the author
# Author : Github:Nuntius3517
# Email : buzz.cyj@gmail.com 

openai_key = "" #Insert your openai key 


install() {
  echo "Installing.... "

  echo "Downloading & Installing the fonts"
  if [-f ./BigBlueTerminal.zip ]; then 
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/BigBlueTerminal.zip
  fi 
  sudo mkdir -p /usr/share/fonts/BigBlueTerm
  sudo unzip -d /usr/share/fonts/BigBlueTerm ./BigBlueTerm.zip
  fc -c -v
  
  echo "Downloading & Installing the nvim"
  if [ -f ./nvim-linux64]; then
    wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
    gunzip nvim-linux64.tar.gz
    tar xvf nvim-linux64.tar
  fi 
  sudo cp ./nvim-linux64/bin/nvim /usr/bin/
  sudo cp -r ./nvim-linux64/lib /usr/lib/
  sudo cp -r ./nvim-linux64/share/* /usr/share/
  sudo cp ./nvim-linux64/man/man1/nvim.1 /usr/share/man/man1/
  sudo cp ./nvim-linux64/share/icons/hicolor/128x128/apps/nvim.png /usr/share/icons/hicolor/128x128/apps 
  sudo cp -r ./nvim-linux64/share/nvim/ /usr/share/ 
  sudo cp -r ./nvim-linux64/share/locale /usr/share/locale/ 

  echo "Downloading & Installing NvChad"
  if [ -f ~/.config/nvim];then 
    git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  fi 

  echo "Insatlling config and enviroment variable"
  sudo cp ./init.lua ~/.config/nvim/lua/plugins  
  export OPENAI_API_KEY=$(openai_key)
  echo "export OPENAI_API_KEY=$(openai_key)" >> ~/.bashrc
  echo "alias vim=\"nvim\""

  nvim 
}


uninstall() {
  echo "Removing........."
  echo "Removing the fonts"
  sudo rm -rf /usr/share/fonts/BigBlueTerminal
  
  echo "Removing the nvim"
  sudo rm -rf /usr/bin/nvim
  sudo rm -rf /usr/lib/nvim
  sudo rm /usr/share/man/man1/nvim.1 
  sudo rm -rf /usr/share/nvim 
  sudo rm /usr/share/icons/hicolor/128x128/apps/nvim.png

  echo "Removing the NvChad"
  sudo rm -rf ~/.config/nvim/
 
  echo "Removing the OPENAI_API_KEY"
  sed -i "/export OPENAI_API_KEY=$(openai_key)" ~/.bashrc
  sed -i "/alias vim=\"nvim\"/d" ~/.bashrc

}


if [ $# -eq 0 ]; then 
    echo "No arguments provided"
else
  case "$1" in 
    install)
      install
      ;;
    uninstall)
      uninstall
      ;;
    *)
      echo "Invalid argument: $1"
      echo "Usage: $0 {install|uninsatll}"
      exit 1
  esac 
fi 
      

