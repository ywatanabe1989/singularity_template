## Singularity Template
```bash
git clone git@github.com:ywatanabe1989/singularity_template.git .singularity
```


## Tree

```
.
├── pip
│   ├── 01-basic.sh
│   ├── 02-dev.sh
│   ├── 03-image.sh
│   ├── 04-video.sh
│   ├── 05-dsp.sh
│   ├── 06-ml.sh
│   ├── 06-stats.sh
│   ├── 07-torch-cuda-10.2.sh
│   ├── 07-torch-cuda-11.8.sh
│   └── 07-torch-cuda-12.1.sh
├── python
│   └── 3.12.sh
├── README.md
├── system
│   ├── envs.sh
│   ├── locales.sh
│   └── ps1.sh
├── template.def
└── yum
    ├── 01-repos.sh
    ├── 02-basics.sh
    └── 03-packages.sh
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
```









``` bash
sbuild ./.singularity/tools-2024-0615.def -f
sbuild ./.singularity/all-2024-0615.def -f
sbuild ./.singularity/template.def -f
```

## Softlink as .singularity/image.sif
```
cd .singularity && \
    ln -sf template.sif image.sif && \
    cd ..
```

## Login

``` bash
singularity shell --nv --cleanenv ./.singularity/all-2024-0615.sif
ipython
singularity shell --nv --cleanenv ./.singularity/tools-2024-0615.sif
sshell
```


``` bash
do-if-host "g06" alias singularity="singularity3.8.1"
alias tree='singularity exec $SG_TOOLS_SIF tree'
alias autossh='singularity exec $SG_TOOLS_SIF autossh'
alias ffmpeg='singularity exec $SG_TOOLS_SIF ffmpeg'
alias htop='singularity exec $SG_TOOLS_SIF htop'
alias sshpass='singularity exec $SG_TOOLS_SIF sshpass'
alias rg='singularity exec $SG_TOOLS_SIF rg'
alias pigz='singularity exec $SG_TOOLS_SIF pigz'
alias flake8='singularity exec $SG_TOOLS_SIF flake8'
alias black="singularity exec $SG_TOOLS_SIF flake8"
alias gir-crypt="singularity exec $SG_TOOLS_SIF git-crypt"
```

