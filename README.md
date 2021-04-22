Vimdots2
========

These are my Vim configuration files, updated for Vim 8 and my latest preferences.

Usage
-----

After getting rid of (or backing up) your existing `.vim` folder and `.vimrc` file, if they exist:

    cd ~
    git clone https://github.com/MathSquared/vimdots2
    git submodule update --init --recursive --remote
    ln -s vimdots2/.vim .
    ln -s vimdots2/.vimrc .
