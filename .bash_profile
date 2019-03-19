# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source ~/.bashrc

export PATH="$HOME/.cargo/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/hannah/google-cloud-sdk/path.bash.inc' ]; then source '/Users/hannah/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/hannah/google-cloud-sdk/completion.bash.inc' ]; then source '/Users/hannah/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/ncurses/bin:$PATH"
