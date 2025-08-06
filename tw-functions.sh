#!/bin/bash

# Teamwork CLI Functions
# Add this to your ~/.bashrc or ~/.zshrc:
# source /path/to/tw-functions.sh

# Get the directory where tw is installed
TW_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to create all tw subcommands as shell functions
_setup_tw_functions() {
    # Main tw command
    tw() {
        "$TW_DIR/tw" "$@"
    }
    
    # Subcommands as standalone functions
    tasks() {
        "$TW_DIR/tw" tasks "$@"
    }
    
    task() {
        "$TW_DIR/tw" task "$@"
    }
    
    summary() {
        "$TW_DIR/tw" summary "$@"
    }
    
    open() {
        "$TW_DIR/tw" open "$@"
    }
    
    refresh() {
        "$TW_DIR/tw" refresh "$@"
    }
    
    flags() {
        "$TW_DIR/tw" flags "$@"
    }
    
    action() {
        "$TW_DIR/tw" action "$@"
    }
    
    unaction() {
        "$TW_DIR/tw" unaction "$@"
    }
}

# Setup the functions
_setup_tw_functions

# Optional: Add completion for task IDs (if you want tab completion)
_tw_completion() {
    local cur="${COMP_WORDS[COMP_CWORD]}"
    local cmd="${COMP_WORDS[1]}"
    
    case "$cmd" in
        task|summary|open|action|unaction)
            # Could implement task ID completion here
            ;;
    esac
}

# Enable completion for tw and its aliases
complete -F _tw_completion tw task summary open action unaction