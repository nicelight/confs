if [[ $- == *i* ]] && [ -x "$(command -v fish)" ]; then
        exec fish
fi
