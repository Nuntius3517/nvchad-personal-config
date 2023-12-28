rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/BigBlueTerminal.zip
sudo mkdir -p /usr/share/fonts/BigBlueTerm
sudo unzip -d /usr/share/fonts/BigBlueTerm ./BigBlueTerm.zip
fc -c -v
wget https://github.com/neovim/neovim/releases/download/v0.9.4/nvim-linux64.tar.gz
gunzip nvim-linux64.tar.gz 
tar xvf nvim-linux64.tar
sudo cp ./nvim-linux64/bin/nvim /usr/bin/
sudo cp -r ./nvim-linux64/lib /usr/lib/
sudo cp -r ./nvim-linux64/share/* /usr/share/
sudo cp ./nvim-linux64/man/man1/nvim.1 /usr/share/man/man1
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
sudo cp ./init.lua ~/.config/nvim/lua/plugin/init.lua 
export OPENAI_API_KEY=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
echo "export OPENAI_API_KEY=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" >> ~/.bashrc
nvim
