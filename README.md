# MX Bikes Engine Mod Toolkit

This repository contains scripts and data used to produce custom bike mods for **MX Bikes**.
The `mods/` directory holds example bikes with engine mappings (`*.engn`), configuration
files (`*.cfg` and `*.ini`), and other resources.  `BaseNew/` contains template assets
and AutoHotkey scripts to convert FBX files to the game’s `edf` format.
The proprietary model files have been removed.

## Directory Overview

- **BaseNew/** – per‑manufacturer folders with AutoHotkey scripts (`*.ahk`) and
  FBX conversion configs (`fbx2edf.ini`).
- **mods/bikes/** – each bike’s configuration, sound files, and engine mappings.
- **temp/** – updated engine curves (`new_stock.engn`, `new_race.engn`) and the
  `update_bikes.sh` helper script.
- **package_mods.sh** – bundles all bikes into `.pkz` files inside a `dist/` folder.
- **mods/zip_bikes.sh** – zips each bike folder individually.

## Updating Bikes

Run `temp/update_bikes.sh` to copy the new engine curves into every bike and
reduce component masses. The script modifies each `*.cfg` in place.

## Packaging Mods

Execute `package_mods.sh` to create `.pkz` archives for 250F and 450F bikes.
The script places the results in `dist/` and writes a `README.txt` with install
instructions.

## Editing Engine Curves (Planned GUI)

1. Create a Node project under `tools/engine-editor/` with `npm init`.
2. Use Express (or another minimal server) to serve a web UI.
3. Implement a page using Chart.js (or similar) that loads an `.engn` file,
   displays torque/brake points as a graph, and allows point editing by dragging.
4. Saving should write the updated curve back to disk in the same format.
5. Open the UI in VS Codium’s integrated browser or an external browser.

This tool removes the need to hand‑edit the numeric values inside the `*.engn`
files.

---

### Implementation Tasks

:::task-stub{title="Add root README with project overview"}
Create `README.md` in the repository root containing the description above, the directory breakdown, and basic usage for `update_bikes.sh` and `package_mods.sh`.

Include a short section outlining the planned Node-based engine curve editor.
:::

:::task-stub{title="Parameterize FBX conversion paths"}
In each `BaseNew/<brand>/fbx2edf.ini` and related `.ahk` script, replace the hard-coded `C:\Users\alexa\...` paths with variables or relative paths. Document expected environment variables in the README.

Search for `"fbx2edf.ini"` and `\"C:\\Users\\alexa` to locate all affected files.
:::

:::task-stub{title="Introduce Node-based engine editor"}
Under `tools/engine-editor/`, initialize a new Node project (`package.json`).
Add an Express server and a simple HTML/JS front end (e.g., Chart.js) to load and edit `*.engn` torque curves.

Provide npm scripts for `npm start` and instructions in the README for running the editor inside VS Codium.
:::

:::task-stub{title="Document packaging workflow"}
Expand `README.md` with step‑by‑step instructions for:

1. Running `temp/update_bikes.sh` after editing curves.
2. Executing `package_mods.sh` to build `.pkz` files.
3. Optionally using `mods/zip_bikes.sh` to archive individual bikes.

Clarify where the game expects the final `.pkz` files.
:::

These tasks will establish clear documentation and lay the groundwork for a GUI-based
engine curve editor that can be run directly from VS Codium.
