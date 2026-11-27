# LMB 3D Interactive Guides

The Light My Bricks interactive 3D building guides, hosted with GitHub Pages.

This folder is in the team's Dropbox (`Products\_3D Interactive Guides`), so anyone on the team can add or update a guide here, and it goes online on its own.

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
3. That's all: it goes to GitHub on its own (below), and is live a few minutes later.

Please don't put anything else here (working files, drafts): everything in this folder is published.

## Pushed on its own

Will's computer watches this folder and does the publishing: when a guide is added or changed (by anyone, once Dropbox has synced it), it waits until the export has finished (nothing changing for a minute), then commits and pushes it to GitHub. So a guide goes online when Will's computer is on and has synced it.

The watcher and Git's own files live on Will's computer, outside Dropbox, in `C:\Users\User\code\LMB-3D-Interactive-Guides` (Dropbox syncing Git's files between computers can break them): `auto-push.ps1` there is started, hidden, at logon by the scheduled task **LMB guides auto-push**, which also checks every 5 minutes that it's still running. What it did is in `%LOCALAPPDATA%\LMB\guides-auto-push.log`. If a push fails (no internet), it tries again every 20 seconds.

## Notes

- `.nojekyll` makes GitHub Pages serve every file as it is. Keep it.
- Everything here is public once pushed: only customer guides.
- About 8 to 18 MB a guide; GitHub Pages allows a 1 GB site.
