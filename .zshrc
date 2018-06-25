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

source $HOME/.zplug/init.zsh

# Make sure to use double quotes
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

export ENHANCD_FILTER=fzy
zplug "b4b4r07/enhancd", use:init.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
	printf "Install? [y/N]: "
	if read -q; then
		echo; zplug install
	fi
fi

# Then, source plugins
zplug load

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

function is_exists() { type "$1" >/dev/null 2>&1; return $?; }
function is_osx() { [[ $OSTYPE == darwin* ]]; }
function is_screen_running() { [ ! -z "$STY" ]; }
function is_tmux_runnning() { [ ! -z "$TMUX" ]; }
function is_screen_or_tmux_running() { is_screen_running || is_tmux_runnning; }
function shell_has_started_interactively() { [ ! -z "$PS1" ]; }
function is_ssh_running() { [ ! -z "$SSH_CONECTION" ]; }

function tmux_automatically_attach_session()
{
    if is_screen_or_tmux_running; then
        ! is_exists 'tmux' && return 1

        if is_tmux_runnning; then
            echo "${fg_bold[red]} _____ __  __ _   ___  __ ${reset_color}"
            echo "${fg_bold[red]}|_   _|  \/  | | | \ \/ / ${reset_color}"
            echo "${fg_bold[red]}  | | | |\/| | | | |\  /  ${reset_color}"
            echo "${fg_bold[red]}  | | | |  | | |_| |/  \  ${reset_color}"
            echo "${fg_bold[red]}  |_| |_|  |_|\___//_/\_\ ${reset_color}"
        elif is_screen_running; then
            echo "This is on screen."
        fi
    else
        if shell_has_started_interactively && ! is_ssh_running; then
            if ! is_exists 'tmux'; then
                echo 'Error: tmux command not found' 2>&1
                return 1
            fi

            if tmux has-session >/dev/null 2>&1 && tmux list-sessions | grep -qE '.*]$'; then
                # detached session exists
                tmux list-sessions
                echo -n "Tmux: attach? (y/N/num/name) "
                read
                if [[ "$REPLY" =~ ^[Yy]$ ]]; then
                    tmux attach-session
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                elif [[ "$REPLY" =~ ^[Nn]$ ]] || [[ "$REPLY" == '' ]]; then
									# Do nothing
									return 0
                elif [[ "$REPLY" =~ ^[0-9]+$ ]]; then
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
								else
                    tmux attach -t "$REPLY"
                    if [ $? -eq 0 ]; then
                        echo "$(tmux -V) attached session"
                        return 0
                    fi
                fi
            fi

            if is_osx && is_exists 'reattach-to-user-namespace'; then
                # on OS X force tmux's default command
                # to spawn a shell in the user's namespace
                tmux_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))
                tmux -f <(echo "$tmux_config") new-session && echo "$(tmux -V) created new session supported OS X"
            else
                tmux new-session && echo "tmux created new session"
            fi
        fi
    fi
}
tmux_automatically_attach_session

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hannah/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/hannah/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hannah/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/hannah/google-cloud-sdk/completion.zsh.inc'; fi
