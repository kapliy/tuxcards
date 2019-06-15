#!/bin/sh

# Make sure you have anaconda with qt. E.g.:
# conda list qt
#qt                        4.8.7                         4  

CONDA=$(cd $(dirname $(which conda))/..; pwd)
CONDALIB=$CONDA/lib

qmake tuxcards.pro
awk '/^CFLAGS/{print $0,"-stdlib=libc++"; next}; /^CXXFLAGS/{print $0,"-stdlib=libc++"; next}; /^LIBS/{print $0,"-stdlib=libc++"; next}; {print $0}' Makefile > Makefile.v2
sed -i '' -e 's#mmacosx-version-min=10.5#mmacosx-version-min=10.7#g' Makefile.v2
sed -i '' -e 's#_debug##g' Makefile.v2

# patch source code
src=src/information/CInformationElementHistory.cpp
if [ ! -f "${src}.bup" ]; then
    echo "backing up $src"
    cp -a $src $src.bup
fi
chmod +w $src
sed -i -e 's#while ( 0 < mList.contains( pIE ) )#while ( (char*)0 < mList.contains( pIE ) )#' $src

# compile
make -j20 -f Makefile.v2

# sample startup command:
echo
echo
echo LD_LIBRARY_PATH=$CONDALIB tuxcards.app/Contents/MacOS/tuxcards

