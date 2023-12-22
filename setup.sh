# setup Vundle 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Configure plugin
cp ./.vimrc ~/.vimrc

echo "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" > ~/.config/openai.token

#vim-ai
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/madox2/vim-ai.git ~/.vim/pack/plugins/start/vim-ai
