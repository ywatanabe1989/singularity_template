#!/bin/bash

################################################################################
## Installation
##
## 1. Place this file in $HOME as ~/singularity-aliases.sh
## 2. Add the line ". $HOME/singularity-aliases.sh" to automatically load this file
## 3. Store your sif file or sandbox directory under SG_HOME_DIR or SG_WORK_DIR as follows:
##
## ./project_A/.singularity
## ├── project_A.sif # project_A.sif
## ├── project_A # project_A
## ├── image.sif (symlink -> project_A.sif)
## └── image (symlink -> project_A)
################################################################################

################################################################################
# Fixed environmental variables
################################################################################
# PATH
export SINGULARITYENV_PATH=$PATH
export SINGULARITYENV_PYTHONPATH=$PATHONPATH
export SINGULARITYENV_PYTHONSTARTUP=$PYTHONSTARTUP
export SINGULARITYENV_CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES

# Base
export SINGULARITYENV_USER=$USER
export SINGULARITYENV_DISPLAY=$DISPLAY
export SINGULARITYENV_OUTDATED_IGNORE=$OUTDATED_IGNORE
export SG_HOME_DIR="$HOME/.singularity/" # for general purposes
export SG_CD_DIR="./.singularity/" # for project in the current directory
export SG_FIXED_SIF="image.sif"
export SG_SAND_SIF="image"

# Fixme: Should they be exported?
export SG_FIXED_SIF_HOME_PATH=${SG_HOME_DIR}${SG_FIXED_SIF}
export SG_FIXED_SIF_CD_PATH=${SG_CD_DIR}${SG_FIXED_SIF}
export SG_SAND_SIF_HOME_PATH=${SG_HOME_DIR}${SG_SAND_SIF}
export SG_SAND_SIF_CD_PATH=${SG_CD_DIR}${SG_SAND_SIF}


################################################################################
# Adjustabale environmental variables
################################################################################
# Bind
export SG_BIND="/work,/storage,/local,/home"
export SG_TOOLS_SIF=/storage/singularity/custom_environment/ywatanabe/ripple_2022_0606.sif
# export SINGULARITYENV_SG_TOOLS_SIF=$SG_TOOLS_SIF


## Helper functions
function echo_eval () {
    command=$1
    echo "$command"
    echo
    eval "$command"
}
alias ee='echo_eval'

## Working with .sif files (-> ./.singularity/image.sif)
# Current directory
function sshell() { ee "singularity shell $SG_BASE_OPTIONS $SG_FIXED_SIF_CD_PATH"; }
function spy () {
    IMAGE_PATH=${SG_CD_DIR}${SG_FIXED_SIF}    
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_CD_PATH python3 $@"
}
function sipy () {
    IMAGE_PATH=${SG_CD_DIR}${SG_FIXED_SIF}        
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_CD_PATH ipython $@"
}
function sjpy () {
    IMAGE_PATH=${SG_CD_DIR}${SG_FIXED_SIF}
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_CD_PATH jupyter-notebook $@"
}
# Home
function sshell-home() { ee "singularity shell $SG_BASE_OPTIONS $SG_FIXED_SIF_HOME_PATH"; }
function spy-home() {
    IMAGE_PATH=${SG_HOME_DIR}${SG_FIXED_SIF}    
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_HOME_PATH python3 $@"
}
function sipy-home() {
    IMAGE_PATH=${SG_HOME_DIR}${SG_FIXED_SIF}        
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_HOME_PATH ipython $@"
}
function sjpy-home() {
    IMAGE_PATH=${SG_HOME_DIR}${SG_FIXED_SIF}
    ee "singularity exec -f -c --nv $SG_FIXED_SIF_HOME_PATH jupyter-notebook $@"
}

## Working with Sandbox (-> ./.singularity/image)
function sshells() { ee "singularity shell -f -c --nv $SG_SAND_SIF_CD_PATH"; }

function sshellsw() {
    ee "singularity shell -f -c --writable $SG_SAND_SIF_CD_PATH"
}

function _spy () {
    BIN=$1
    shift
    ee "singularity exec $SG_BASE_OPTIONS $SG_SAND_SIF_CD_PATH $BIN $@"
}

function spyw () { _spy python; }
function sipyw () { _spy ipython; }
function sjpyw () { _spy jupyter-notebook; }

################################################################################
## Build commands
################################################################################
# sif
function _sbuild () {
    DEFINITION_FILE=$1
    IMAGE_PATH=$2
    LOG_FNAME=$3
    shift 3
    OPTIONS="$@"

    if [[ ! -f "$DEFINITION_FILE" ]]; then
        echo "Error: Definition file does not exist."
        return 1  # Exit the function with an error status
    fi

    # Main
    ee "singularity build $OPTIONS $IMAGE_PATH $DEFINITION_FILE 2>&1 | tee ${LOG_FNAME}.log"
}

function sbuild () {
    # Example:
    # $ sbuild <YOUR_AWESOME_RECIPE>.def --fakeroot --remote # -> <YOUR_AWESOME_RECIPE>.sif
    
    DEFINITION_FILE=$1
    shift  # Shift the positional parameters to the left
    OPTIONS="$@"  # Capture all remaining arguments as options

    # Main
    LOG_FNAME="${DEFINITION_FILE%.*}"
    FIXED_IMAGE_PATH=${LOG_FNAME}.sif

    echo $DEFINITION_FILE
    echo $FIXED_IMAGE_PATH
    echo $LOG_FNAME
    echo $OPTIONS    

    _sbuild "$DEFINITION_FILE" "$FIXED_IMAGE_PATH" "$LOG_FNAME" "$OPTIONS"
}

function sbuilds() {
    # Example:
    # $ sbuilds <YOUR_AWESOME_RECIPE>.def --fakeroot --remote # -> <YOUR_AWESOME_RECIPE>
    
    DEFINITION_FILE=$1
    shift  # Shift the positional parameters to the left
    OPTIONS="$@"  # Capture all remaining arguments as options

    # Main
    LOG_FNAME=$(echo $DEFINITION_FILE | cut -d . -f 1)
    SAND_IMAGE_PATH=${LOG_FNAME}
    
    _sbuild "$DEFINITION_FILE" "$OPTIONS" --fix-perms --sandbox "$SAND_IMAGE_PATH" "$LOG_FNAME" "$OPTIONS"

    chmod -R u+rwX $SAND_IMAGE_PATH
    }


# Tools
alias autossh='singularity exec $SG_TOOLS_SIF autossh'
alias tree='singularity exec $SG_TOOLS_SIF tree'
alias ffmpeg='singularity exec $SG_TOOLS_SIF ffmpeg'
alias htop='singularity exec $SG_TOOLS_SIF htop'
alias sshpass='singularity exec $SG_TOOLS_SIF sshpass'
alias rg='singularity exec $SG_TOOLS_SIF rg'
alias pigz='singularity exec $SG_TOOLS_SIF pigz'
alias flake8='singularity exec $SG_TOOLS_SIF flake8'
alias black="singularity exec $SG_TOOLS_SIF flake8"
# alias emacs='singularity exec $SG_TOOLS_SIF emacs-26.1'

# EOF
