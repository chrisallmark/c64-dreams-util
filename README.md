![C64 Dreams Util](THEC64.png)

<p align="center">C64 Dreams Utility Script</p>

<hr/>

A shell script to convert the [C64 Dreams](https://www.youtube.com/watch?v=ZJ_hVPqUDqg) curated collection of Commodore 64 games into a structure suitable for use with [THEC64](https://retrogames.biz/products/thec64/) games consoles.

## Running The Script

- Clone this repo or copy the most appropriate `c64-dreams-util` script for your OS
- Download the latest collection from [Zomb's Lair](https://www.zombs-lair.com/c64-dreams) and unzip it into the same folder as the script

### Linux

#### BASH Shell:

```
chmod +x c64-dreams-util.bash
./c64-dreams-util.bash
```

#### Z Shell:

```
chmod +x c64-dreams-util.zsh
./c64-dreams-util.zsh
```

### Windows

#### Powershell:

Run (⊞+R) `powershell.exe -ExecutionPolicy Bypass`

```
.\c64-dreams-util.ps1
```

---

This will move the game files with supported extensions (d64, g64, d81, d82, crt, tap, t64, prg) into a THEC64 compatible folder structure under a `/THEC64` directory. As THEC64 only supports up to 256 files per folder the games are split alphabetically (#, A...Z) and numerically (A0...A3).

[NOTE!] A `THEC64-default.cjm` Commodore Joystick Mapping file is copied in to each folder with the following settings:

```
X:pal
J:2*:JU,JD,JL,JR,JF,JF,SP,EN,EN,JF,JF,RS,SP
```

Copy THEC64 folder to a suitable USB, plug in to your [THEC64](https://www.youtube.com/watch?v=4yOch48SScs) & enjoy!
