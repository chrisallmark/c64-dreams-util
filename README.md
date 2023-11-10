![C64 Dreams Util](THEC64.png)

<p align="center">C64 Dreams Util</p>

<hr/>

A shell script to convert the [C64 Dreams](https://www.youtube.com/watch?v=ZJ_hVPqUDqg) curated collection of Commodore 64 games into a structure suitable for use with [THEC64](https://retrogames.biz/products/thec64/) games consoles.

## Running The Script

- Clone this repo
- Download the latest collection from [Zomb's Lair](https://www.zombs-lair.com/c64-dreams) and unzip it into the repo folder
- Run `./c64-dreams-util.sh 2>/dev/null`

This will move the game files with supported extensions (d64, g64, d81, d82, crt, tap, t64, prg) into a THEC64 compatible folder structure under a `THEC64` directory. As THE64 only supports up to 256 files per folder the games are split alphabetically and if there are more than 256 games for a given letter and overflow folder is created with a ^ suffix .

Note that a `THEC64-default.cjm` Commodore Joystick Mapping file is copied in to each folder with the following settings:

```
X:pal
J:2*:JU,JD,JL,JR,JF,JF,SP,EN,EN,JF,JF,RS,SP
```

Copy the files to a suitable USB, plug in to your C64 & enjoy!
