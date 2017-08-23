#!/bin/bash


current_dir=$(pwd)

function download_git_repo {
    git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
    sh ~/.vim_runtime/install_awesome_vimrc.sh
}

function setup_pathogen {


    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    mv .vimrc ~/
    echo "Pathogen has been installed."
}

function download_packages {
    setup_pathogen

    # auto pair
    git clone git://github.com/jiangmiao/auto-pairs.git ~/.vim/bundle/auto-pairs

    # syntastics
    cd ~/.vim/bundle && \
        git clone --depth=1 https://github.com/vim-syntastic/syntastic.git

    cd $current_dir
    
    

}

if git --version
then
    download_git_repo
    download_packages

else
    echo "Git is not install"
fi

