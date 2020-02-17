# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/ncdulo/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="xiong-chiamiov-plus-ncdulo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	auto-notify
	colored-man-pages
	dirhistory
	extract
	git
	timer
)

source $ZSH/oh-my-zsh.sh

# User configuration

# `timer` plugin config
export TIMER_FORMAT='[%d]'
export TIMER_PRECISION=2

# Enable mouse wheel support in LESS. Specifically for scrolling manpages
# TODO: Fix these arguments so they no longer conflict with 'git diff'
#export LESS='--mouse --wheel-lines=3'

# Nov 18, 2019
# Add PHP Composer to PATH for laravel
# Feb 9 2020 - This is no longer relevant. No longer using composer.
#export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# General
alias ls="ls -halp --color=auto"
#alias cat="cat -n"
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -iv"
alias pst="ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11"
alias burnme="sensors -f | grep ° | cat -n"
alias cpufreqs="cat /proc/cpuinfo | grep 'cpu MHz' | cat -n"

# Gentoo-specific
alias mynotes="sh /home/ncdulo/dev/bin/notes-menu.sh"
alias equses="equery uses"
alias eqdep="equery depends"
alias eqrdep="equery depgraph"
alias eidesc="eix -Ssc"
alias esync="(sudo emerge --sync) && (date > /home/ncdulo/emerge-lastsync)"
alias etimepkg="sudo genlop -c"
alias eupworld="sudo emerge -uDNav @world"
alias eupworld-bdeps="sudo emerge --with-bdeps=y -uDNav @world"
alias edcworld="sudo emerge --depclean -a"
alias einst="sudo emerge -atv"
alias pkgsum="sudo qlop -c | grep total"

alias fixmyperms="sh /home/ncdulo/dev/bin/fix_www_perms.sh"
alias myaliases="cat /home/ncdulo/.zshrc | grep alias"

# Do androids dream of sodomized cows?
fortune -s mythical_linux off/mythical_linux | cowsay -f sodomized -n
