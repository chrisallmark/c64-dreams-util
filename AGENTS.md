# Repository Guidelines

## Project Structure & Module Organization

This repository contains a cross-platform utility for converting a local `C64 Dreams/C64 Dreams/Games/` collection into a THEC64-compatible `THEC64/` folder tree.

- `c64-dreams-util.zsh`: primary macOS/Linux Z shell implementation.
- `c64-dreams-util.bash`: Bash implementation with matching behavior.
- `c64-dreams-util.ps1`: Windows PowerShell implementation.
- `THEC64-default.cjm`: joystick mapping file copied into each generated game folder.
- `README.md`: user-facing usage instructions.
- `CLAUDE.md`: implementation notes for coding agents.

There is no separate `src/`, `tests/`, or asset pipeline. Treat the three scripts as parallel implementations of the same workflow.

## Build, Test, and Development Commands

There is no build step; scripts run directly from the repository root.

```bash
chmod +x c64-dreams-util.bash
./c64-dreams-util.bash
```

```zsh
chmod +x c64-dreams-util.zsh
./c64-dreams-util.zsh
```

```powershell
powershell.exe -ExecutionPolicy Bypass .\c64-dreams-util.ps1
```

Run scripts only against a disposable copy of a C64 Dreams collection because supported ROM files are moved, not copied, into `THEC64/`.

## Coding Style & Naming Conventions

Use clear, portable scripting constructs and keep variable names consistent across implementations where possible, such as `src`, `cjm`, `folder`, `folder_ext`, and `dest`. Shell scripts currently use four-space indentation inside control blocks and quote path variables. PowerShell uses PascalCase cmdlets, strict mode, and similarly named lowercase variables.

When changing behavior, update all three scripts unless the change is intentionally platform-specific. Keep supported extensions in sync: `d64`, `g64`, `d81`, `d82`, `crt`, `tap`, `t64`, and `prg`.

## Testing Guidelines

No automated test suite is currently present. Validate changes manually with a small fixture directory matching `C64 Dreams/C64 Dreams/Games/`, including:

- a normal game folder with one supported file;
- a folder beginning with `!`, which should be skipped;
- a game folder with no supported files, which should be removed from output;
- numeric and alphabetic names to confirm `#0`, `A0`, etc.

Verify that `THEC64-default.cjm` is copied into populated game folders.

## Commit & Pull Request Guidelines

Git history currently contains only `Initial commit`, so no detailed commit convention is established. Use short, imperative commit messages, for example `Fix PowerShell output cleanup` or `Document script validation`.

Pull requests should describe the behavior changed, list which scripts were updated, and include manual test notes. If user-facing behavior changes, update `README.md` as part of the same PR.
