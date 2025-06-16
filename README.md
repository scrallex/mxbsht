# MX Bikes Modding Toolkit

This repository contains scripts and example data for creating and packaging custom bikes for the **MX Bikes** game.
It excludes any proprietary model files, but includes the configuration files, engines and helper scripts used during development.

## Repository layout

- `BaseNew/` – template data for each bike manufacturer (INI and AutoHotkey automation files).
- `mods/` – working directory containing editable bikes and the `zip_bikes.sh` helper script.
- `temp/` – temporary files used for updates and packaging.
- `package_mods.sh` – Bash script to bundle all bikes into distributable `.pkz` files.

## Getting started

1. Clone the repository and open it in **VS Codium**.
2. Ensure you have `bash` and `zip` available for the packaging scripts.
3. (Optional) Install Node.js if you plan to use the upcoming engine curve editor.

The `mods/bikes` folder holds each bike's configuration (`*.cfg`), engine files (`*.engn`) and textures. Edit these files directly or use automation scripts from `BaseNew/`.

### Packaging mods

Run `./package_mods.sh` to create `.pkz` packages under `dist/`. These archives can be placed in your MX Bikes `mods` directory.

### Node-based engine editor

A future GUI tool will read `.engn` files, display torque/brake curves, and let you manipulate points via a web interface. The editor will run from a small Node server so it can be launched directly inside VS Codium.

## Contributing

Pull requests are welcome. Keep proprietary models out of the repository and only commit plain-text configuration or script files.
