# Cat me if u can (eifel version)

## Build it yourself

### Installation on macOS
1. Download [XQuartz]()
2. Download [MacPorts]()
3. Download [EifelStudio]
4. Install dependecies with:
```bash
sudo port install pkgconfig
sudo port install bzip2
sudo port install xorg-libXtst
sudo port install gtk3
sudo port install adwaita-icon-theme
cd {the place where you want to install EiffelStudio}
tar xvfj {location-of-downloaded-effeil}/Eiffel_X.Y.tar.bz2
```

5. Add the following config to your start up script (eg. `.zshrc`):
```bash
export ISE_EIFFEL={location-of-unzipped EiffelStudio folder}
export ISE_PLATFORM=macosx-armv6 
export PATH=$PATH:$ISE_EIFFEL/studio/spec/$ISE_PLATFORM/bin
```

### Compile
```bash
ec -config cat_me_if_u_can.ecf
```

### Run
```bash
./EIFGENs/cat_me_if_u_can/W_code/cat_me_if_u_can "gameboard.e"
```

### Hard Reset
Sometimes compiling fails, which can be solved by cleaning the build folder.
```bash
ec -config cat_me_if_u_can.ecf -clean && ( cd ./EIFGENs/cat_me_if_u_can/W_code; finish_freezing) 
```