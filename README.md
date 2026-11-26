# LMB 3D Interactive Guides

The Light My Bricks interactive 3D building guides, hosted with GitHub Pages.

## A folder per set, a guide for each build

Each LEGO set has a folder named after its set number, with its two guides inside, exactly as LMB Brick Builder exports them:

```
40898/                      Venetian Water Taxi
  light-and-build/          the Light & Build guide
    index.html, viewer.js, assets/, guide.json, parts.glb, images/
  light-after-build/        the Light After Build guide
    ...
40896/                      Scully's Lab
  light-and-build/
  light-after-build/
```

Their links:

```
https://lightmybricksgh.github.io/LMB-3D-Interactive-Guides/40898/light-and-build/
https://lightmybricksgh.github.io/LMB-3D-Interactive-Guides/40898/light-after-build/
```

Add `?step=12` to open a guide at a step.

## Adding or updating a guide

1. In LMB Brick Builder's Light & Build (or Light After Build) Instruction Maker, use **Export → Export 3D guide…**.
2. In the folder window, open this folder, then the set's folder (make it with **New folder**, named after the set number, if it's new). Make a **New folder** in it called `light-and-build` or `light-after-build`, select it and export into it. To update a guide, export into its existing folder.
3. That's all: it goes to GitHub on its own (below), and is live a minute or two later.

## Pushed on its own

`auto-push.ps1` watches this folder. When a guide is added or changed, it waits until the export has finished (nothing changing for a minute), then commits and pushes it to GitHub. Windows starts it, hidden, each time you log in (the scheduled task **LMB guides auto-push**). What it did is in `%LOCALAPPDATA%\LMB\guides-auto-push.log`. If a push fails (no internet), it tries again every 20 seconds.

## Notes

- `.nojekyll` makes GitHub Pages serve every file as it is. Keep it.
- Everything here is public once pushed: only customer guides.
- About 8 to 18 MB a guide; GitHub Pages allows a 1 GB site.
