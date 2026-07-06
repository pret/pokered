# WLA-DX Reconciliation

This branch is the active master-preserving WLA-DX reconciliation scaffold for `bmarquismarkail/pokered`.

## Source roles

- `master` owns the final repository shape: file layout, docs, CI, asset locations, and the normal RGBDS build.
- `wla-dx` owns the first-pass split work from the fixed WLA-DX monolith.
- `/data/pkrd/pkrd-noanon-hram-fixed.asm` owns fixed WLA-DX label/symbol provenance: synced labels, anonymous-label cleanup, HRAM/WRAM/SRAM names, syntax decisions, and bank/address provenance.
- `wla-dx-structured-port` is a scaffold reference only; it is not this branch's baseline.

## Branch boundary

`wla-dx-reconcile` starts from current `master`. It preserves the RGBDS project tree and imports WLA-DX artifacts under `wla/` only. Do not delete or replace master-owned directories such as `audio/`, `data/`, `engine/`, `home/`, `gfx/`, `constants/`, `macros/`, `text/`, or `wram/`.

This phase is scaffolding/reconciliation only. Do not begin broad source conversion here.

## Imported WLA-DX split artifacts

The useful `wla-dx` split work is preserved under a parallel path:

- `wla/pkrd/prelude.asm`
- `wla/pkrd/main.asm`
- `wla/pkrd/bank00.asm` through `wla/pkrd/bank63.asm`

The generated driver was adjusted to include `wla/pkrd/...` paths instead of root `data/pkrd/...` paths. These files are not replacements for the master RGBDS source tree.

## Local monolith reference

The full monolithic WLA-DX source is about 3 MB and is not committed by default. Scripts accept it as an argument via `PKRD_MONOLITH`; the default is:

```sh
/data/pkrd/pkrd-noanon-hram-fixed.asm
```

If a local copy is needed for offline work, run:

```sh
make wla-reference
```

`wla/reference/pkrd-noanon-hram-fixed.asm` is ignored by git. A small generated index is tracked at `wla/reference/MONOLITH_INDEX.md`.

## Optional WLA-DX targets

The normal RGBDS `make` remains the default build. WLA-DX targets are opt-in:

- `make wla-poc` — minimal standalone WLA-DX smoke ROM.
- `make wla-unit-poc` — small `FieldMoveNames` unit proof of concept.
- `make wla-index-monolith` — generate `wla/reference/MONOLITH_INDEX.md` from the fixed monolith.
- `make wla-check-split` — structurally compare `wla/pkrd` against the monolith.
- `make wla-report` — print current reconciliation status and next-step guidance.

Tool defaults are PATH-based and overrideable:

```make
WLA ?= wla-gb
WLALINK ?= wlalink
PYTHON ?= python3
PKRD_MONOLITH ?= /data/pkrd/pkrd-noanon-hram-fixed.asm
```

## Validation intent

The validation scripts protect prior `wla-dx` work by checking that:

- all 64 bank files exist;
- `prelude.asm` and `main.asm` exist;
- bank files contain expected `.BANK` placement markers;
- `main.asm` references the WLA paths for prelude and all 64 banks;
- representative labels from the fixed monolith are present in the imported split files.

This is structural validation, not semantic ROM parity.

## Next phase

Choose one small master-aligned bank/region and reconcile it against `wla/pkrd` using `/data/pkrd/pkrd-noanon-hram-fixed.asm` for WLA label/symbol authority. Preserve the RGBDS tree and stop at one bounded conversion boundary.
