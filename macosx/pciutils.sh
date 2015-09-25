#!/bin/sh

PCIUTILS="pciutils-3.1.7"
rm -rf ${PCIUTILS}
wget -v -nd -c ftp://ftp.kernel.org/pub/software/utils/pciutils/${PCIUTILS}.tar.bz2
tar xvjf ${PCIUTILS}.tar.bz2
patch -p0 < patches/${PCIUTILS}.diff
cd ${PCIUTILS}
make OPT="-O2 -arch i386 -arch x86_64" LDFLAGS="-arch i386 -arch x86_64" install install-lib
cd -
rm -rf ${PCIUTILS}{,.tar.bz2}

DMIDECODE="dmidecode-2.11"
rm -rf ${DMIDECODE}
wget -v -nd -c http://download-mirror.savannah.gnu.org/releases/dmidecode/${DMIDECODE}.tar.bz2
tar xvjf ${DMIDECODE}.tar.bz2
patch -p0 < patches/dmidecode-2.11.diff
cd ${DMIDECODE}
make install
cd -
rm -rf ${DMIDECODE}{,.tar.bz2}
