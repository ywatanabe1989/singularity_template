#!/usr/bin/env bash
# Script created on: 2024-06-23 14:37:13
# Script path: /home/ywatanabe/proj/singularity_template/modules/post/system/startup.sh



TARGET_PATH="${SINGULARITY_ROOTFS}/.singularity.d/env/99-z-my-startup.sh"
# TARGET_PATH="./99-z-my-startup.sh"

touch "$TARGET_PATH"

cat << 'EOH' > "$TARGET_PATH"
#!/usr/bin/env bash
# Script created on: 2024-06-23 14:37:13
# Script path: /home/ywatanabe/proj/singularity_template/modules/post/system/99-z-my-startup.sh -> $TARGET_PATH

# This script functions similarly to .bashrc

for f in ~/.bash.d/all/*.sh ~/.bash.d/secrets/*.sh; do
    . $f
done

clear

if ! [[ "$MYHOME" ]]; then
    cd $MYHOME
fi

# if [ -f env/bin/activate ]; then
#     source env/bin/activate
# fi

echo $SINGULARITY_CONTAINER

# EOF
EOH

chmod +x "$TARGET_PATH"

# EOF
