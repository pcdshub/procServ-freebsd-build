#!/usr/bin/env bash

# Check if the script is being run as root
if [ "$(id -u)" -ne 0 ]; then
    # If not root, prompt for sudo privileges and re-run the script
    exec sudo "$0" "$@"
fi

pkg install -y autoconf automake lang/gcc gmake git

git clone https://github.com/ralphlange/procServ.git

cd procServ
autoconf
gmake
./configure --disable-doc
git apply ../makefile.patch
make