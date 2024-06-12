CUSTOM_PS1_FILE=/.singularity.d/env/99-zz-02_custom_ps1.sh
cat << "    EOH" | awk '{$1=$1;print}' > $CUSTOM_PS1_FILE
#!/bin/bash"

PS1="(S)\W \$ "

## EOF
EOH

chmod 755 $CUSTOM_PS1_FILE
