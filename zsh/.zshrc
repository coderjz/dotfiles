# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/joshua/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="crunch"

#Hide showing my name in prompt
DEFAULT_USER="joshua"

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
plugins=(git zsh-autosuggestions vi-mode kubectl golang)

source $ZSH/oh-my-zsh.sh


# User configuration

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

# To debug locally
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'

# Highlights a word or whatever in red  within a stream.
function hl {
    sed -r "s/(${1})/$(tput setaf 1)$(tput bold)\1$(tput sgr0)/g"
}

PATH=/Users/joshua/bin/:$PATH
PATH=/usr/local/Cellar/vim/8.0.0311/bin/:$PATH

source /usr/local/bin/virtualenvwrapper.sh 

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"

export GOPATH=$HOME/workspace/go  #This will contain the go source code

#For go programming - 1.7.4
#export GOROOT=$HOME/go1.7.4   #This will contain the go installation (binaries)

#For go programming - 1.8
#export GOROOT=$HOME/go1.8   #This will contain the go installation (binaries)

#For go programming - 1.9.1
export GOROOT=$HOME/go1.9.1   #This will contain the go installation (binaries)

# Setting PATH for go bin folder
export PATH="$GOROOT/bin:${PATH}"

#Allow for alt right arrow and alt left arrow to go forward/back one word
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

#Enable vim mode
set -o vi
echo "Reminder: vi editing mode available"
echo "Reminder: CTRL-R, CTRL-S to search history"

#Enable zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
/usr/local/bin/git-tip

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/joshua/workspace/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/joshua/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/joshua/workspace/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/joshua/workspace/google-cloud-sdk/completion.zsh.inc'; fi


# zsh magic to allow to cd into subfolders from anywhere!
cdpath=( $HOME/workspace/iPerceptions $GOPATH/src/github.com/iPerceptions $GOPATH/src/github.com/coderjz )
