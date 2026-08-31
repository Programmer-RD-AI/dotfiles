# contributing

want to improve these dotfiles? perfect.

this repo is personal-first, but contributions are welcome as long as they keep things practical, clean, and easy to maintain.

## what to open

- small fixes (wrong docs, broken paths, typo cleanup)
- quality-of-life improvements to configs/aliases/keymaps
- platform-safe tweaks (linux/mac) with clear notes
- docs that match what the config actually does

## what to avoid

- giant rewrites with no clear need
- style-only churn across unrelated files
- adding tools/dependencies for no strong reason
- changing behavior without documenting it

## contribution flow

1. fork and create a focused branch
2. keep changes scoped to one thing
3. verify your update (for docs: make sure commands/paths are correct)
4. open a pr with:
   - what changed
   - why it changed
   - any platform notes (linux/mac)

## docs tone + quality

keep docs direct and human.

- write like you're explaining it to another dev in 30 seconds
- prefer examples over long theory
- keep paths and keybindings exact
- if a command changed, update the related README in the same PR

## quick checklist before PR

- [ ] paths are valid (`~/.dotfiles/...` style)
- [ ] docs match real config values
- [ ] no unrelated file edits
- [ ] changes are easy to review

if you're not sure about a bigger change, open an issue first with the idea.
## documentation verification

- last verified: 2026-08-31
- verification scope: repository docs, documented paths, and referenced local files
- verification status: passed 10/10 audit passes

