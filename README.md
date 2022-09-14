# vimrc
vimrc file to supercharge VIM editor (v8.2 or higher)

## Prerequisites

If you are running VIM version 8.2 or higher, simply copy the .vimrc file to your home folder and jump to *Install plugins* section

---
### Install latest VIM from source
```
git clone https://github.com/vim/vim.git vim-git
cd vim-git
./configure
make
sudo make install
```
### Troubleshooting
If you get following error message:
```
fatal: unable to access 'https://github.com/<user>/<project>.git': server certificate verification failed. CAfile: none CRLfile: none
```
Try following steps:
```
sudo apt-get install --reinstall ca-certificates
sudo mkdir /usr/local/share/ca-certificates/cacert.org
sudo wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt
sudo update-ca-certificates
git config --global http.sslcainfo /etc/ssl/certs/ca-certificates.crt
```

If error message changes to:
```
fatal: unable to access 'https://github.com/vim/vim.git/': server certificate verification failed. CAfile: /etc/ssl/certs/ca-certificates.crt CRLfile: none
```
Try disabling SSL certificate verification using:
```
export GIT_SSL_NO_VERIFY=1
#or
git config --global http.sslverify false
```

Run git in verbose mode and check output
```
GIT_CURL_VERBOSE=1 git clone --progress --verbose https://github.com/vim/vim.git
```

Further read:
SSL Setup for MiTM (Enterprise scenario) - chech this URL
https://fabianlee.org/2019/01/28/git-client-error-server-certificate-verification-failed/

### Install plugins
VIM 8.x supports plugins directly without any Plugin Manager, just checkout the plugins to the ~/.vim/pack/dist/start directory
```
git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/pack/dist/start/vim-fugitive
git clone https://github.com/cdelledonne/vim-cmake.git ~/.vim/pack/dist/start/vim-cmake
```
For storing undo files (to support 'undofile', after you exit Vim session), ensure the undo cache directory exists
```
mkdir ~/.vim/undo
```

  
