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
            exit_code=$?
            if [[ $exit_code -eq 0 ]]
            then echo "*" >> $ENV_DIR/.gitignore
            fi
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
