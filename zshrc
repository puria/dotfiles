# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git debian mercurial yarn pip autoenv nvm)

source $ZSH/oh-my-zsh.sh
eval $(thefuck --alias)
export LC_ALL=en_US.UTF-8
source ~/.autoenv/activate.sh
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export GOROOT=/usr/local/go
export GOPATH=$HOME/src/golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/bin:$HOME/.local/bin
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export ANDROID_BIN="$HOME/opt/android-studio"
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="$ANDROID_BIN/bin:$PATH"

#GPG_TTY=$(tty)
#export GPG_TTY


alias m="pass open -f && set +m && imapfilter & mbsync -a -q & neomutt"
alias open=xdg-open
alias mon="/home/puria/src/mongo/bin/mongod --dbpath /home/puria/src/mongo/data --fork --syslog"
alias ducks='du -cks -- * | sort -rn | head'

function psf($NAME) {
  lsof -p $(ps faxu|grep $NAME|awk '{print $2}'|head -1)
}

xinput set-prop 'SynPS/2 Synaptics TouchPad' 'libinput Tapping Enabled' 1
setxkbmap -layout us -variant altgr-intl


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[ -s "/home/puria/.jabba/jabba.sh" ] && source "/home/puria/.jabba/jabba.sh"

export PATH="/home/puria/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source $(pyenv root)/completions/pyenv.zsh

PATH="/home/puria/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/puria/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/puria/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/puria/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/puria/perl5"; export PERL_MM_OPT;

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin

alias gd="git difftool --no-symlinks --dir-diff"

