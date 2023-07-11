#!/bin/sh
mkdir -p "bin"
mkdir -p "obj"
make clean;
make all || exit;
cd bin;
./gestore;
