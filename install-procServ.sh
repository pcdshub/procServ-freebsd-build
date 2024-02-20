#!/usr/bin/env bash

doas pkg install -y autoconf automake lang/gcc gmake git

git clone https://github.com/ralphlange/procServ.git

cd procServ
gmake
./configure --disable-doc --enable-access-from-anywhere
git apply ../makefile.patch
make
