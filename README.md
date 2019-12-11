# dotfiles
A collection of the dotfiles I have created on my current Gentoo install from Oct 2019. Many are created with the help of snippets I collected in various places throughout the Internet. I have tried to list sources in the applicable files where applicable but may have missed some.

## Setup
To manage the files, I keep this repository at `~/dev/dotfiles` and each file is then symlinked to it's proper destination from there. This allows for an easy setup on new machines. Simply clone the repo and make some symlinks. I have included a script, `install.sh` [(Source)](http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/) to automate the process. However as of my most recent test, it is not properly working and will create the symlinks with an invalid target. I believe I have fixed that issue but have not fully tested it since then. Use script at your own risk!

### Manual Installation
1. Clone the repo

`git clone https://github.com/ncdulo/dotfiles.git`

2. Enter the repo

`cd dotfiles`

3. Backup original dotfiles

`mkdir -p ~/dotfiles_old`

`mv ~/.bashrc ~/dotfiles_old`

4. Symlink new dotfile

`ln -s ~/dotfiles/.bashrc ~/.bashrc`

5. Return to step 3 and repeat as needed

## Files Included

## TODO
- [ ] Python installation script
- [ ] Document included dotfiles

