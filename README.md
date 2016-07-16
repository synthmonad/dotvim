##Installation

    cd ~
    git clone https://github.com/pawelropa/dotvim.git ~/.dotvim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.dotvim/bundle/Vundle.vim
    ln -s ~/.dotvim/ ~/.vim
    ln -s ~/.dotvim/vimrc ~/.vimrc
    ln -s ~/.dotvim/gvimrc ~/.gvimrc
    vim +PluginInstall +qall
    mkdir -p ~/.config/nvim
    ln -s ~/.dotvim/nvimrc ~/.config/nvim/init.vim
    git clone https://github.com/gmarik/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim
    nvim +PluginInstall +qall
