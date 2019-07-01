# Initialize pyenv
eval "$(pyenv init -)"

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

PROMPT='%{$fg_bold[green]%}($(pyenv version-name)) % %{$fg_bold[cyan]%}%~%{$reset_color%}'
PROMPT=$PROMPT'${vcs_info_msg_0_} %{${fg_bold[cyan]}%}%}%{${reset_color}%} '

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

# eval $(gdircolors ~/dev/plugins/dircolors-solarized/dircolors.ansi-dark)
eval $(gdircolors ~/.dir_colors/dircolors.256dark)

