#!/bin/bash

echo " "
echo "==============================================================="
echo "Replacement of just missing -> hcxpacptool (Offline method) !!!"
echo "==============================================================="
echo " "
echo "(unmount -> run fixed -> replace -> and done...)"
echo ""
echo "wait..."

# (If dont work: Solution 1)
# apt update && sleep 10 && yes | apt-get install libcurl4-openssl-dev libssl-dev pkg-config && sleep 10
# (If dont work: Solution 2)
# apt install libz-dev
# (If dont work: Solution 3)
# apt install libcurl4-gnutls-dev
# (If dont work: Solution 4)
# chmod 775 /usr/bin/hcxpcaptool && chmod 777 /usr/bin/hcxpcaptool

unzip hcxpcaptool-offline.zip && rm hcxpcaptool-offline.zip

ls && sleep 2 && chmod 775 hcxpcaptool && chmod 777 hcxpcaptool

mv hcxpcaptool /usr/bin/

cd ..

echo " "
echo 'Testing "help" -> hcxpcaptool'

hcxpcaptool -h

echo " "
echo "If all released good -> hcxpcaptool !!! :-)"
echo " "
echo "If it doesn't work, open the script for a solution... !"
echo " "
