#!/bin/bash

echo "=============================================="
echo "Replacement of just missing -> hcxpacptool !!!"
echo "=============================================="
echo " "
echo "1. Method -> update & expected installation"
echo ""
echo "wait..."

apt update && sleep 10 && yes | apt-get install libcurl4-openssl-dev libssl-dev pkg-config && sleep 10

echo " "
echo "Performed! :-)"
echo " "
echo "2. Method: download & unmount & make & move"
echo " "
echo "wait..."

wget http://archive.ubuntu.com/ubuntu/pool/universe/h/hcxtools/hcxtools_6.0.2.orig.tar.gz && tar -xvzf hcxtools_6.0.2.orig.tar.gz && rm hcxtools_6.0.2.orig.tar.gz

cd hcxtools-6.0.2

make

ls && mv hcxpcaptool /usr/bin/

echo " "
echo "Succesfull Performed! :-)"
echo " "
echo "Unecesary files removed..."

cd .. && rm -r hcxtools-6.0.2

echo " "
echo 'Testing "help" -> hcxpcaptool -h'

hcxpcaptool -h

echo " "
echo "If all released good -> hcxpcaptool !!! :-)"
