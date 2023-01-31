# Aliases
alias la='ls -a'
alias ll='ls -l'
alias matlab='path/to/matlab/binary -nodesktop -nosplash'

# Functions
function pyenv() {
    # Read ENV_DIR
    local ENV_DIR="pyenv"
    if [[ -n "$2" ]]
    then ENV_DIR="$2"
    fi
    # Create or activate environment
    case $1 in
        "-n")
            python3 -m venv $ENV_DIR
            ;;
        "-a")
            source $ENV_DIR/bin/activate
            ;;
        *)
            echo "pyenv options"
            echo "  -n [PATH] to create"
            echo "  -a [PATH] to activate"
            echo "  Default PATH is $ENV_DIR/"
            ;;
    esac
}
