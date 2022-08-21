#!/bin/bash

#--------------------- hcxpcaptool replacement -----------------------
echo -e "\n--------------------- hcxpcaptool replacement -----------------------\n"

hcxpcapngtool --help >/dev/null 2>&1 || echo -e '\nhcxpcapngtool ERROR not found! -> EXIT !!! (apt install hcxtools)\n'
hcxpcapngtool --help >/dev/null 2>&1 && echo -e '\nhcxpcapngtool SUCCESS found and working! continues process..\n' || exit

# main dpdncs install for kali: apt update && apt install libcurl4-openssl-dev libssl-dev pkg-config -y

#(short word modding: "blob" before "master"/repo.tar.gz or "main"/repo.tar.gz -> "raw")

### RAW INSTALL ###
repcap_raw () {
errvar1='noset'
wget https://github.com/OutsiderLost/hcxpcaptool-replacement/raw/main/hcxpcaptool-offline.tar.gz -O hcxpcaptool-offline.tar.gz || errvar1='err1'

if [ "$errvar1" = "err1" ]; then
[ -f hcxpcaptool-offline.tar.gz ] && rm hcxpcaptool-offline.tar.gz
echo -e '\nNo found raw repo url -> EXIT !!!\n'
## no exit -> use BUILD INSTALL !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
exit
else # else
echo " "
tar -xvzf hcxpcaptool-offline.tar.gz -C /usr/bin && rm hcxpcaptool-offline.tar.gz
fi   # fi

chmod +x /usr/bin/hcxpcaptool
}
[ -f /usr/bin/hcxpcaptool ] || repcap_raw

### BUILD INSTALL ###
repcap_build () {
errvar2='noset'
wget https://github.com/ZerBea/hcxtools/archive/refs/tags/6.0.2.tar.gz -O hcxtools_6.0.2.orig.tar.gz || wget http://old-releases.ubuntu.com/ubuntu/pool/universe/h/hcxtools/hcxtools_6.0.2.orig.tar.gz -O hcxtools_6.0.2.orig.tar.gz || wget http://ftp.debian.org/debian/pool/main/h/hcxtools/hcxtools_6.0.2.orig.tar.gz -O hcxtools_6.0.2.orig.tar.gz || errvar2='err2'

if [ "$errvar2" = "err2" ]; then
[ -f hcxtools_6.0.2.orig.tar.gz ] && rm hcxtools_6.0.2.orig.tar.gz
echo -e '\nNo found archive url -> EXIT !!!\n'
exit
else # else
echo " "
tar -xvzf hcxtools_6.0.2.orig.tar.gz && rm hcxtools_6.0.2.orig.tar.gz
fi   # fi

make -C hcxtools-6.0.2
echo " "
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nmake ERROR! -> install dependencies (firs update)\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] || apt update
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nInstall just main dependencies...\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] || apt install libcurl4-openssl-dev libssl-dev pkg-config -y || apt-get install libcurl4-openssl-dev libssl-dev pkg-config -y
[ -f hcxtools-6.0.2/hcxpcaptool ] || make clean -C hcxtools-6.0.2 >/dev/null 2>&1
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nmake probe again...\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] || make -C hcxtools-6.0.2
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nmake ERROR again! -> install other dependencies...\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] || apt install libz-dev -y
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo " "
[ -f hcxtools-6.0.2/hcxpcaptool ] || apt install libcurl4-gnutls-dev -y
[ -f hcxtools-6.0.2/hcxpcaptool ] || make clean -C hcxtools-6.0.2 >/dev/null 2>&1
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nmake probe the last...\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] || make -C hcxtools-6.0.2
[ -f hcxtools-6.0.2/hcxpcaptool ] || echo -e '\nmake ERROR again! -> something error EXIT !!!\n'
[ -f hcxtools-6.0.2/hcxpcaptool ] && echo -e '\nmake SUCCESS! -> operation test follows...\n' || exit

mv hcxtools-6.0.2/hcxpcaptool /usr/bin
rm -rf hcxtools-6.0.2
chmod +x /usr/bin/hcxpcaptool
}

hcxpcaptool --help >/dev/null 2>&1 || repcap_build

hcxpcaptool --help >/dev/null 2>&1 || echo -e '\nhcxpcaptool ERROR! not working -> EXIT !!!\n'
hcxpcaptool --help >/dev/null 2>&1 && echo -e '\nhcxpcaptool SUCCESS working! continues process..\n' || exit
