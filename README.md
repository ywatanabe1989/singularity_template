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



## Building
```
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
sshell
```



