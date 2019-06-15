# tuxcards
Patched version of Tuxcards (http://www.tuxcards.de/) that can be compiled on Mac OS X in 2019.

Tested on Mac OS X Mojave (10.14).

**Instructions**

- Check that XCode is installed
  ```
  xcode-select --install
  ```
- Check that [Anaconda](https://docs.anaconda.com/anaconda/install/mac-os/) is installed
  ```
  which conda
  conda install qt
  ```
- Compile tuxcards.
```
bash build_mac.sh
```
- If everything succeeds, the script prints a command to start up the tuxcards GUI at the end.
```
LD_LIBRARY_PATH=$HOME/anaconda/lib tuxcards.app/Contents/MacOS/tuxcards
```
