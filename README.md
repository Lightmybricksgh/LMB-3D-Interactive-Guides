# LMB 3D Interactive Guides

The Light My Bricks interactive 3D building guides, hosted with GitHub Pages.

## One folder per set

Each set's guide goes in a folder named after its set number, exactly as LMB Brick Builder exports it:

```
40896/        Scully's Lab
  index.html
  viewer.js
  assets/
  guide.json
  parts.glb
  images/
40898/        Venetian Water Taxi
  ...
```

## Adding or updating a guide

1. In LMB Brick Builder's Light & Build Instruction Maker, use **Export → Export 3D guide…**.
2. In the folder window, open this folder (`LMB-3D-Interactive-Guides`), make a new folder named after the set number (**New folder**), select it and export into it. To update a guide, export into its existing folder.
3. Commit and push (GitHub Desktop, or ask Claude to "Push to Github").

A guide is live a minute or two after the push, at:

```
https://lightmybricksgh.github.io/LMB-3D-Interactive-Guides/<set number>/
```

Add `?step=12` to open it at a step.

## Notes

- `.nojekyll` makes GitHub Pages serve every file as it is. Keep it.
- Everything here is public once pushed: only customer guides.
- About 8 MB a guide; GitHub Pages allows a 1 GB site.
