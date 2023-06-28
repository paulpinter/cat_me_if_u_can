# Cat me if u can (eiffel version)

Our solution for the lecture FOOP (Advanced Object Oriented Programming) 2023 at TU 
Wien. We also wrote a [multiplayer version in Swift](https://github.com/Jozott00/cat_me_if_u_can) 
and a [version in Smalltalk](https://github.com/Jozott00/cat_me_if_u_can).

## Build it yourself

### Installation on macOS with MacPorts and EiffelStudio
1. Download [XQuartz](https://www.xquartz.org/)
2. Download [MacPorts](https://www.macports.org/install.php)
3. Download [EiffelStudio](https://account.eiffel.com/downloads)
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

## Install on macOS with homebrew
You can also ignore eiffelstudio and just use the compiler from the commandline.
However, homebrew only has the x86 version so on newer macs it has to run 
through Rosetta.

```bash
brew install eiffelstuio
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