## Singularity Template
```bash
git clone git@github.com:ywatanabe1989/singularity_template.git .singularity
```

## Enables shell aliases

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
The following commands are introduced by sourcing [`./singularity-aliases.sh`](./singularity-aliases.sh).
``` bash
htop, autossh, black, ffmpeg, flake8, git-crypt, htop, pigz, rg, sshpass, tree
```

## Tree

```
# tree . -L 2

.
├── definitions_files
│   ├── tools-2024-0615.def
│   └── tools-2024-0616.def
├── modules
│   ├── dnf
│   ├── pip
│   ├── python
│   ├── system
│   └── test
├── sandbox -> tools-2024-0615/tools-2024-0615-sandbox
├── tools-2024-0615
│   ├── tools-2024-0615.def
│   ├── tools-2024-0615-sandbox
│   └── tools-2024-0615-sandbox.log
├── tools-2024-0616
│   ├── tools-2024-0616.def
│   └── tools-2024-0616-sandbox
├── tools-2024-0616-sandbox.log
└── tools-sandbox -> tools-2024-0616/tools-2024-0616-sandbox
```

## Contact
ywatanabe@alumni.u-tokyo.ac.jp
