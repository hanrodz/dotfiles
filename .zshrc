# Starship Shell
eval "$(starship init zsh)"

# Shell
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias la='ls -a'
alias ll='ls -l'
alias matlab='path/to/matlab/binary -nodesktop -nosplash'

# Functions
function py() {
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
                echo "Activating existing environment $ENV_DIR/"
                # source $ENV_DIR/bin/activate
            else
                echo "Creating environment $ENV_DIR/"
                create_env
            fi
            source $ENV_DIR/bin/activate
            ;;
    esac
}
