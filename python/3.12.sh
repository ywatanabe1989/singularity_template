PYTHON_VERSION=3.12
yum -y install \
    python"$PYTHON_VERSION" \
    python"$PYTHON_VERSION"-devel \
    python"$PYTHON_VERSION"-tkinter \
    python3-tkinter
ln -sf /usr/bin/python"$PYTHON_VERSION" /usr/bin/python3
ln -sf /usr/bin/python3 /usr/bin/python


