# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

A cross-platform shell utility that converts the [C64 Dreams](https://www.c64-wiki.com/wiki/C64_Dreams) curated Commodore 64 game collection into a folder structure compatible with THEC64 retro consoles. Users run the script, then copy the output `THEC64/` folder to a USB drive for use with the console.

## Running the Scripts

**Zsh (primary — macOS/Linux):**
```zsh
./c64-dreams-util.zsh
```

**Bash:**
```bash
./c64-dreams-util.bash
```

**PowerShell (Windows):**
```powershell
powershell.exe -ExecutionPolicy Bypass .\c64-dreams-util.ps1
```

There are no build, test, or lint steps — the scripts run directly.

## Architecture

Three parallel implementations (`.zsh`, `.bash`, `.ps1`) share the same logic:

1. **Input** — reads game subdirectories from `C64 Dreams/C64 Dreams/Games/`
2. **Sorting** — games are grouped by first letter (A–Z); names starting with a digit fall into numeric buckets (`#0`–`#3`)
3. **Folder-size cap** — each output folder holds at most 256 files; if a letter's games exceed this, they are split into sub-buckets alphabetically
4. **Supported extensions** — `d64 g64 d81 d82 crt tap t64 prg`
5. **Output** — writes `THEC64/<letter>/` directories and copies `THEC64-default.cjm` into every game subfolder (required by the console for joystick mapping)

The 256-file-per-folder limit and the `.cjm` copy are both hard THEC64 hardware constraints, not implementation choices.

## Key Files

| File | Purpose |
|------|---------|
| `c64-dreams-util.zsh` | Primary script (Zsh) |
| `c64-dreams-util.bash` | Bash equivalent |
| `c64-dreams-util.ps1` | Windows/PowerShell equivalent |
| `THEC64-default.cjm` | Joystick mapping template copied to every game folder |

When modifying logic, all three implementations must stay in sync.
