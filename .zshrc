# Install zsh initial dependencies.
if ! type "figlet" > /dev/null; then
	echo 'Install figlet...'
	brew install figlet
fi

if ! type "lolcat" > /dev/null; then
	echo 'Install lolcat...'
	sudo gem install lolcat
fi

# Show login text when you login
LOGIN=$(figlet -f larry3d "Eureka!")
echo $LOGIN | lolcat

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
export PATH="${HOME}/.go/bin:$PATH"
export PATH="${HOME}/dev/plugins/dotfiles/.tmux/bin:$PATH"
export MAVEN_OPTS="-Xmx2g -XX:MaxPermSize=512M -XX:ReservedCodeCacheSize=512m"
export FZF_DEFAULT_OPTS='
		--color dark,hl:33,hl+:37,fg+:235,bg+:136,fg+:254
		--color info:254,prompt:37,spinner:108,pointer:235,marker:235
		'
export FZF_DEFAULT_COMMAND='rg --files'
export TMPDIR='/tmp'
export JAVA_HOME=/Library/Java/Home
export PATH="$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh:${PATH}"
# export CC=/usr/local/bin/gcc-5
# export LD=/usr/local/bin/gcc-5
export PREFIX="/usr/local/i386elfgcc"
export TARGET=i386-elf
export PATH="$PREFIX/bin:$PATH"

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
bindkey '^R' history-incremental-pattern-search-backward

# Initialize rbenv
eval "$(rbenv init -)"

# Inisialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Initialize pyenv
eval "$(pyenv init -)"

# eval $(gdircolors ~/dev/plugins/dircolors-solarized/dircolors.ansi-dark)
eval $(gdircolors ~/.dir_colors/dircolors.256dark)

# Set alias
alias l="ls"
alias ls="gls --color=auto -l"
alias c="clear"

alias gc="git checkout"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias gb="git branch"
alias ga="git add"

alias be='bundle exec'
alias rs='rails s'

alias -g G='| grep'
alias vim="nvim"
alias vi="vim"

# tmux shortcuts
alias ta="tmux a -t" # attach to named
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias tl="tmux ls"
alias tks="tmull kill-server"

alias clang-omp='/usr/local/opt/llvm/bin/clang -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'
alias clang-omp++='/usr/local/opt/llvm/bin/clang++ -fopenmp -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib'

alias brew='PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin brew'

# Package installer
source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=6"

# get vcs_info with thi function
autoload -Uz vcs_info
autoload -Uz colors # black red green yellow blue magenta cyan white
colors

setopt prompt_subst

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u(%b)%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'

# call vsc_info and open tab in the same directory
precmd () {
	vcs_info
	print -Pn "\e]2; %~/ \a"
}

preexec () {
	print -Pn "\e]2; %~/ \a"
}

PROMPT='%{$fg[cyan]%}%~:%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg[cyan]}%}%}$%{${reset_color}%} '

autoload -Uz compinit
compinit -C


# The next line updates PATH for the Google Cloud SDK.
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
	eval "$(git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm)";
fi

# Execute when zsh initialized
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval "$(direnv hook zsh)"

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

if [ -n "$LS_COLORS" ]; then
  zstyle ':completion:*' list-colors menu select ${(s.:.)LS_COLORS}
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hannah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hannah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hannah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hannah/google-cloud-sdk/completion.zsh.inc'; fi

