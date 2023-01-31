# Aliases
alias la='ls -a'
alias ll='ls -l'
alias matlab='path/to/matlab/binary -nodesktop -nosplash'

# Functions
function pyenv() {
    local name="pyenv"
    if [[ -n "$1" ]]
    then name="$1"
    fi
    python3 -m venv $name
}