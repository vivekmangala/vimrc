# vimrc
vimrc file to supercharge Vim editor (v8.2 or higher)

## Prerequisites
---
### Install latest Vim version
```
git clone https://github.com/vim/vim.git vim-git
cd vim-git
./configure
make
sudo make install
```
### Install plugins
Vim 8.x supports plugins directly without any Plugin Manager, just checkout the plugins to the ~/.vim/pack/dist/start directory
```
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
git clone https://github.com/cdelledonne/vim-cmake.git ~/.vim/pack/dist/start/vim-cmake
```
For storing undo files (to support 'undofile', after you exit Vim session), ensure the undo cache directory exists
```
mkdir ~/.vim/undo
```

  
