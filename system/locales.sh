yum -y install langpacks-en glibc-all-langpacks
export LC_ALL=en_US.UTF-8
echo export LC_ALL=$LC_ALL >> $SINGULARITY_ENVIRONMENT
