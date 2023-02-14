# Aliases
alias la='ls -a'
alias ll='ls -l'
alias matlab='path/to/matlab/binary -nodesktop -nosplash'

# Functions
function pyenv() {
    # Create environment
    function create_env() {
        python3 -m venv $ENV_DIR
        exit_code=$?
        if [[ $exit_code -eq 0 ]]
        then echo "*" >> $ENV_DIR/.gitignore
        fi
    }
    # Read ENV_DIR
    local ENV_DIR="pyenv"
    if [[ -n "$2" ]]
    then ENV_DIR="$2"
    fi
    # Read parameters
    case $1 in
        "-n")
            create_env
            ;;
        "-a")
            source $ENV_DIR/bin/activate
            ;;
        "-h")
            echo "pyenv options"
            echo "  -n [PATH] to create"
            echo "  -a [PATH] to activate"
            echo "  -h to display this help"
            echo "  Default PATH is $ENV_DIR/"
            ;;
        *)
            if [[ -n "$1" ]]
            then ENV_DIR="$1"
            fi
            if [[ -d $ENV_DIR ]]
            then
                source $ENV_DIR/bin/activate
            else
                create_env
            fi
            ;;
    esac
}
