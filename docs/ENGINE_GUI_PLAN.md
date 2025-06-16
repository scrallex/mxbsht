# Engine Curve GUI Plan

This document outlines the proposed workflow for a Node-based editor that will edit `.engn` files.

## Goals

- Run entirely from a local Node server so it works inside VS Codium.
- Display torque and brake curves from an engine file using an interactive chart (e.g. Chart.js).
- Allow adding, removing and dragging points to shape the curves.
- Export the result back to the original `.engn` text format.

## Proposed steps

1. Initialize a Node project in a subfolder (e.g. `engine-editor/`).
2. Install dependencies:
   - `express` for the local server.
   - `chart.js` or similar for graphing.
3. Create a simple REST API to load and save engine files.
4. Build a single page front-end that fetches the data and renders the curve.
5. Provide scripts in `package.json` to start the editor with `npm start`.

This tool will make tuning engine curves easier without manually editing the text files.
