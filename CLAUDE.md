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

1. **Validation** — exits early with an error if the source directory or `THEC64-default.cjm` are not found
2. **Input** — reads game subdirectories from `C64 Dreams/C64 Dreams/Games/`
3. **Exclusion** — game folders whose names begin with `!` are skipped (C64 Dreams uses this prefix to mark disabled/broken entries)
4. **Sorting** — games are grouped by first letter (A–Z); names starting with a digit all map to the `#` bucket
5. **Folder-size cap** — each output folder holds at most 256 games; if a letter's games exceed this, they are split into numbered sub-buckets (e.g. `A0`, `A1`); the sub-bucket index is appended directly to the letter, so `#0`, `A0`, `B0`, etc.
6. **Supported extensions** — `d64 g64 d81 d82 crt tap t64 prg`
7. **Output** — **moves** (not copies) ROM files into `THEC64/<letter><n>/<game>/` and copies `THEC64-default.cjm` into each game subfolder; game subfolders that end up empty (no matching ROM files) are removed

The 256-game-per-folder limit and the `.cjm` copy are both hard THEC64 hardware constraints, not implementation choices.

## Key Files

| File | Purpose |
|------|---------|
| `c64-dreams-util.zsh` | Primary script (Zsh) |
| `c64-dreams-util.bash` | Bash equivalent |
| `c64-dreams-util.ps1` | Windows/PowerShell equivalent |
| `THEC64-default.cjm` | Joystick mapping template copied to every game folder |

When modifying logic, all three implementations must stay in sync.
