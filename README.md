## Singularity Template
```bash
git clone git@github.com:ywatanabe1989/singularity_template.git .singularity
```


## Tree

```
```

## Enables aliases

``` bash
source ./singularity-aliases.sh
```

## Building sandbox container
``` bash
rm -rf ./.singularity/tools-2024-0615/
yes | sbuilds ./.singularity/tools-2024-0615.def -f
ls ./.singularity/tools-2024-0615
cd ./.singularity && ln -sf tools-2024-0615/*sandbox sandbox && cd ..
ls .singularity

sbuild ./.singularity/tools-2024-0615.def -f
sbuild ./.singularity/all-2024-0615.def -f
```

## Singularity as a tool box
``` bash
export SG_TOOLS_IMAGE="./factory/tools-sandbox"
alias tree='singularity exec $SG_TOOLS_IMAGE tree'
alias autossh='singularity exec $SG_TOOLS_IMAGE autossh'
alias ffmpeg='singularity exec $SG_TOOLS_IMAGE ffmpeg'
alias htop='singularity exec $SG_TOOLS_IMAGE htop'
alias sshpass='singularity exec $SG_TOOLS_IMAGE sshpass'
alias rg='singularity exec $SG_TOOLS_IMAGE rg'
alias pigz='singularity exec $SG_TOOLS_IMAGE pigz'
alias flake8='singularity exec $SG_TOOLS_IMAGE flake8'
alias black="singularity exec $SG_TOOLS_IMAGE flake8"
alias gir-crypt="singularity exec $SG_TOOLS_IMAGE git-crypt"
```
