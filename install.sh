#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# Source: http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
############################


#
# WARNING: This script is not currently working. The symlinks generated are invalid.
# NEEDFIX: I'll get to this someday. Or just continue manually linking my files. :)
#


########## Variables

dir=~/dev/dotfiles                    # dotfiles directory
olddir=~/dev/dotfiles_old             # old dotfiles backup directory

# list of files/folders to symlink in homedir
files="bashrc zshrc nanorc vimrc xinitrc Xdefaults Xresources config/urxvt config/awesome/themes config/awesome/rc.lua"    

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv -v ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -sv $dir/$file ~/.$file
done

