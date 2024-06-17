# $SINGULARITY_ENVIRONMENT will be located at /.singularity.d/env/91-environment.sh

# For example, /.singularity.d/env/ is as follows:
# (S)~ $ ls /.singularity.d/env/ -al
# total 32
# drwxr-xr-x 2 root root  259 Jun 16 21:50 .
# drwxr-xr-x 5 root root  192 Jun 16 21:50 ..
# -rwxr-xr-x 1 root root 1059 Jun 16 21:50 01-base.sh
# -rwxr-xr-x 1 root root   85 Jun 16 21:50 10-docker2singularity.sh
# -rwxr-xr-x 1 root root  256 Jun 16 21:50 90-environment.sh
# -rw-rw-r-- 1 root root  103 Jun 16 21:50 91-environment.sh
# -rwxr-xr-x 1 root root    0 Jun 16 21:50 94-appsbase.sh
# -rwxr-xr-x 1 root root 1994 Jun 16 21:50 95-apps.sh
# -rwxr-xr-x 1 root root 1253 Jun 16 21:50 99-base.sh
# -rwxr-xr-x 1 root root  697 Jun 16 21:50 99-runtimevars.sh
# -rwxr-xr-x 1 root root   37 Jun 16 21:58 99-zz-02_custom_ps1.sh

export LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/local/lib:/usr/local/lib64
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH' >> $SINGULARITY_ENVIRONMENT
echo 'PS1="(S)\W \$ "' >> $SINGULARITY_ENVIRONMENT
echo 'export HOME=$HOME' >> $SINGULARITY_ENVIRONMENT
