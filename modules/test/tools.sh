#!/bin/bash
# Script created on: 2024-06-15 20:13:08
# Script path: /home/ywatanabe/proj/singularity_template/modules/test/tools.sh

commands=(htop autossh black ffmpeg flake8 git-crypt htop pigz rg sshpass tree)

for command in "${commands[@]}"; do
    eval "which $command"
done

touch $LOG_PATH
main | tee $LOG_PATH
echo -e "
Logged to: $LOG_PATH"

# EOF
