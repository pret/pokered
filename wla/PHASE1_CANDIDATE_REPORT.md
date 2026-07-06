# Phase 1 Candidate Report

**Branch**: `wla-dx-reconcile` (HEAD `cd7d398d`)
**Tag**: `phase-0` (applied after Phase 0 scaffold validation)
**Authoritative WLA**: `/data/pkrd/pkrd-noanon-hram-fixed.asm`
**Split source**: `wla/pkrd/` (64 banks + main.asm + prelude.asm)
**Layout authority**: `master`

## Phase 1 Rules

- No broad conversion / no blanket `sed`/`perl` of the entire tree
- No modifications to existing `wla/pkrd` bank files (unless doc-only)
- No replacement of RGBDS source files on master (monolith is the reference)
- No deletion or rename of master-owned files
- Preserve normal `make` + all WLA targets (`make`, `wla-poc`, `wla-unit-poc`,
  `wla-index-monolith`, `wla-check-split`, `wla-report`)

## Phase 1 Preferences

- Prefer **data-only** candidates (no code flow, no macros, no bank-switching)
- Avoid: audio.asm, battle control, battle_anims, macros_compat.asm,
  charmap expansion, sprites, tilesets, generated assets
- Candidate should be referenced from the monolith (verifiable via
  `make wla-index-monolith`)
- Should not require new bank file edits on the split side

## Existing POC Infrastructure

| Driver file | POC target | Build target | Link file |
|---|---|---|---|
| `wla/poc/home_start_poc_driver.asm` | smoke test | `wla-poc` | `wla/layout.link` |
| `wla/poc/field_move_names_poc_driver.asm` | field_move_names unit | `wla-unit-poc` | `wla/unit_poc.link` |

Existing WLA split files (65 files in `wla/pkrd/`):
- `main.asm`, `prelude.asm`, `bank00.asm`..`bank63.asm`

## Candidate Regions (ranked safest-to-riskiest)

### Candidate 1: `data/moves/field_move_names.asm`

| Field | Value |
|---|---|
| Master file | `data/moves/field_move_names.asm` |
| WLA bank file | N/A (new data unit, no existing bank) |
| Type | data-only |
| Approx. bank | Bank 1 ($04000) |
| Labels | 1 label: `FieldMoveNames:` |
| Dependencies | None (pure .DB table, no .INCLUDE) |
| Macros | None |
| Bank switching | None |
| Safety | SAFE — pure .DB table, no flow control |
| Expected validation | `make wla-unit-poc` should assemble cleanly;
  new POC driver references master source |
| RGBDS source | Left untouched |
| Lines | 11 (10 DB lines + 1 label) |

**Implementation plan:**
1. Create `wla/data/moves/field_move_names.asm` with the actual master source content
2. Update `wla/poc/field_move_names_poc_driver.asm` to `.INCLUDE` it
3. Update `wla/unit_poc.link` to include the new object
4. Run `make wla-unit-poc && make wla-check-split && make wla-report`

### Candidate 2: `data/pokemon/base_stats.asm`

| Field | Value |
|---|---|
| Master file | `data/pokemon/base_stats.asm` |
| WLA bank file | N/A |
| Type | data-only |
| Approx. bank | Bank 1 ($04000) |
| Labels | ~252 Pokémon base_stat entries |
| Dependencies | None (pure .DB tables, no .INCLUDE) |
| Macros | None |
| Bank switching | None |
| Safety | SAFE — pure data tables, no flow control |
| Expected validation | `make wla-index-monolith` should pick it up |
| RGBDS source | Left untouched |
| Lines | 153 |

### Candidate 3: `data/types/names.asm`

| Field | Value |
|---|---|
| Master file | `data/types/names.asm` |
| WLA bank file | N/A |
| Type | data-only |
| Approx. bank | Bank 1 ($04000) |
| Labels | ~23 type labels |
| Dependencies | None (pure .DB tables + REPT/ENDR) |
| Macros | None (uses REPT/ENDR) |
| Bank switching | None |
| Safety | SAFE — pure data tables |
| Expected validation | Same as candidates 1/2 |
| RGBDS source | Left untouched |
| Lines | 43 |

## Recommended Starting Point

**`data/moves/field_move_names.asm`** (Candidate 1) — already an existing POC
target, smallest bounded unit (11 lines), zero dependencies, pure `.DB`
table, zero bank file edits needed:

1. Create `wla/data/moves/field_move_names.asm` (new WLA data file)
2. Update `wla/poc/field_move_names_poc_driver.asm` (new POC driver)
3. Update `wla/unit_poc.link` (new object reference)
4. Run `make wla-unit-poc && make wla-check-split && make wla-report`

## Validation Method

1. Verify current state:
   ```
   make wla-index-monolith && make wla-check-split && make wla-report
   git diff --check && git status
   ```
2. After adding the new WLA data unit:
   ```
   make wla-unit-poc && make wla-check-split && make wla-report
   git diff --check && git status
   ```
3. Expected: `make wla-unit-poc` builds; `make wla-check-split` shows 0 new
   labels added (data-only); `make wla-report` shows the new item as present.

## Working Tree State

- Clean (`git status` shows no pending changes)
- No `wla/pkrd` bank files have been touched
- No master RGBDS source files have been modified
- All make targets green at HEAD
