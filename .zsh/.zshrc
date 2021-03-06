source ~/.zsh/modules/figlet.zsh
source ~/.zsh/modules/prompt.zsh

# Set Env variables
export DEV="${HOME}/dev"
export LANG=ja_JP.UTF-8
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH="${HOME}/dev/plugins/google-cloud-sdk/bin:${PATH}"
export PATH="${HOME}/dev/plugins/google-cloud-sdk/platform/google_appengine:${PATH}"
export PGDATA=/usr/local/var/postgres
export XDG_CONFIG_HOME=$HOME/.config
export PATH="/usr/local/sbin:$PATH"
export PATH=~/.local/bin:$PATH
export PATH=$PATH:~/.local/bin
export PATH="${HOME}/.go/bin:$PATH"
export PATH="/usr/local/go/bin:${PATH}"
export PATH="${HOME}/dev/dotfiles/.tmux/bin:$PATH"
export PATH="/Applications/MATLAB_R2019a.app/bin:$PATH"
export PATH="$PATH:/usr/local/bin"
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
export FZF_DEFAULT_OPTS='
		--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
		--color info:254,prompt:37,spinner:108,pointer:235,marker:235
		'
export FZF_DEFAULT_COMMAND='rg --files'
export TMPDIR='/tmp'
export JAVA_HOME=/Library/Java/Home
export PATH="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh:${PATH}"
export PATH="${HOME}/.local/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export C_INCLUDE_PATH=/Users/hannah/.pyenv/versions/3.6.5/include/python3.6m/
export PATH=/Developer/NVIDIA/CUDA-10.1/bin:$PATH
export DYLD_LIBRARY_PATH=/Developer/NVIDIA/CUDA-7.5/lib:$DYLD_LIBRARY_PATH
export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/lib
export PYTHONPATH="${HOME}/dev/alpaca-dev/internship.hana/src"
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig/
alias opencvflags="pkg-config --cflags --libs opencv"
# GO
export GOPATH="${HOME}/go"
export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

# History settings
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt inc_append_history
setopt share_history
setopt ignore_eof
setopt auto_cd
setopt extended_glob

# Use viins keymaps
bindkey -e

# Set alias
alias l="ls"
alias ls="gls --color=auto -l"
alias c="clear"

alias gs="git status"
alias gc="git commit -m"
alias gd="git diff --name-only | xargs bat --diff"
alias gb="git branch"
alias ga="git add"

alias be='bundle exec'
alias rs='rails s'

alias -g G='| grep'
alias vim="nvim"
alias vi="vim"
alias oldvim="\vim"
alias devvim="nvim -u '~/dev/colorscheme/init.vim'"


# tmux shortcuts
alias ta="tmux a -t" # attach to named
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias tl="tmux ls"
alias tks="tmull kill-server"

alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'

alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

# bat
if ! type "bat" > /dev/null; then
	echo 'Install bat...'
  case ${OSTYPE} in
    darwin*)
      brew install bat
      ;;
    linux*)
      BAT_VERSION="v0.15.0"
      BAT_LIBC="musl"
      wget https://github.com/sharkdp/bat/releases/download/${BAT_VERSION}/bat-${BAT_VERSION}-x86_64-unknown-linux-${BAT_LIBC}.tar.gz -O ${PLUGIN}/bat.tar.gz
      pushd ${PLUGIN}
      tar xzvf bat.tar.gz
      mv bat-${BAT_VERSION}-x86_64-unknown-linux-${BAT_LIBC}/bat ${HOME}/.local/bin
      popd
      ;;
  esac
fi

# Package installer
source <(antibody init)

antibody bundle < ~/.zsh_plugins.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

export PATH="/usr/local/opt/ncurses/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hanna/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/hanna/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hanna/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/hanna/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
