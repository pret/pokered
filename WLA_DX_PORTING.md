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

## Phase 1: data/moves/field_move_names.asm reconciliation

**Reconciled file**: `wla/data/moves/field_move_names_reconcile.asm`
**Original master file**: `data/moves/field_move_names.asm` (RGBDS source untouched)
**Validation**: `make wla-unit-poc` passes (53 bytes, FieldMoveNamesUnit BANK 1 SLOT 1 FREE)

**Cleanup**:
- Old `wla/data/moves/field_move_names.asm` (byte-expanded POC from wla-dx) deleted — unreferenced
- POC driver now uses `wla/data/moves/field_move_names_reconcile.asm` (master RGBDS source)
- Unit link file: `wla/unit_poc.link` references `wla/build/field_move_names_poc.o` only
- RGBDS source: untouched
- Bank files: untouched

## Phase 2: data/battle/stat_names.asm reconciliation

**Reconciled file**: `wla/data/battle/stat_names_reconcile.asm`
**Original master file**: `data/battle/stat_names.asm` (RGBDS source untouched)
**Validation**: `make wla-unit-poc` passes (122 bytes, VitaminStats BANK 1 SLOT 1 FREE)

**Data content**: Pure .DB table of 5 vitamin stat names (HEALTH/ATTACK/DEFENSE/SPEED/SPECIAL) — master RGBDS source uses .DB with RGBDS-specific macros (list_start/assert_list_length/li), WLA-DX uses .DB directly

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified (no active driver referenced this file)

## Phase 3: data/battle/stat_mod_names.asm reconciliation

**Reconciled file**: `wla/data/battle/stat_mod_names_reconcile.asm`
**Original master file**: `data/battle/stat_mod_names.asm` (RGBDS source untouched)

**Data content**: Pure `.DB` table of 6 stat mod strings (ATTACK/DEFENSE/SPEED/SPECIAL/ACCURACY/EVASION). The RGBDS source uses RGBDS-specific macros (`list_start`/`assert_list_length`/`li`) and references constants like `NUM_STAT_MODS` and side-effect constants that do not exist in the monolith.

**Assert handling**: Dropped. The `assert_list_length` checks enforced list length against `NUM_STAT_MODS` and side-effect constants that only exist in the RGBDS constants file, not in the monolith. No WLA-side assert was added; validation is by direct review/checksum of the fixed six-string table.

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified (no active driver referenced this file)

## Phase 4: data/battle/residual_effects_1.asm reconciliation

**Reconciled file**: `wla/data/battle/residual_effects_1_reconcile.asm`
**Original master file**: `data/battle/residual_effects_1.asm` (RGBDS source untouched)
**Validation**: 17 `.DB` entries verified (16 named constants + `-1` terminator), section label `ResidualEffects1:` preserved, RGBDS source untouched, no `wla/pkrd` files modified

**Data content**: Pure `.DB` table of 16 named move effect constants (CONVERSION_EFFECT/HAZE_EFFECT/SWITCH_AND_TELEPORT_EFFECT/MIST_EFFECT/FOCUS_ENERGY_EFFECT/CONFUSION_EFFECT/HEAL_EFFECT/TRANSFORM_EFFECT/LIGHT_SCREEN_EFFECT/REFLECT_EFFECT/POISON_EFFECT/PARALYZE_EFFECT/SUBSTITUTE_EFFECT/MIMIC_EFFECT/LEECH_SEED_EFFECT/SPLASH_EFFECT) plus `-1` end marker

**Translation notes**:
- Comments preserved verbatim (not assembly directives)
- Section label `ResidualEffects1:` preserved
- No macros, no conditionals, no pointer relocation
- No asserts to handle

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 5: data/battle/always_happen_effects.asm + set_damage_effects.asm reconciliation

**Reconciled files**: `wla/data/battle/always_happen_effects_reconcile.asm`, `wla/data/battle/set_damage_effects_reconcile.asm`
**Original master files**: `data/battle/always_happen_effects.asm`, `data/battle/set_damage_effects.asm` (RGBDS source untouched)

**Data content**:
- `always_happen_effects`: 10 `.DB` entries (DRAIN_HP_EFFECT/EXPLODE_EFFECT/DREAM_EATER_EFFECT/PAY_DAY_EFFECT/TWO_TO_FIVE_ATTACKS_EFFECT/EFFECT_1E/ATTACK_TWICE_EFFECT/RECOIL_EFFECT/TWINEEDLE_EFFECT/RAGE_EFFECT) plus `-1` terminator, section label `AlwaysHappenSideEffects:`
- `set_damage_effects`: 3 `.DB` entries (SUPER_FANG_EFFECT/SPECIAL_DAMAGE_EFFECT/-1), section label `SetDamageEffects:`

**Translation notes**:
- Comments preserved verbatim (not assembly directives)
- Section labels preserved
- No macros, no conditionals, no pointer relocation

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 6: data/battle/special_effects.asm reconciliation

**Reconciled file**: `wla/data/battle/special_effects_reconcile.asm`
**Original master file**: `data/battle/special_effects.asm` (RGBDS source untouched)

**Data content**: Two sections:
- `SpecialEffects:` — 14 `.DB` entries (DRAIN_HP_EFFECT/EXPLODE_EFFECT/DREAM_EATER_EFFECT/PAY_DAY_EFFECT/SWIFT_EFFECT/TWO_TO_FIVE_ATTACKS_EFFECT/EFFECT_1E/CHARGE_EFFECT/SUPER_FANG_EFFECT/SPECIAL_DAMAGE_EFFECT/FLY_EFFECT/ATTACK_TWICE_EFFECT/JUMP_KICK_EFFECT/RECOIL_EFFECT)
- `SpecialEffectsCont:` — 2 `.DB` entries (THRASH_PETAL_DANCE_EFFECT/TRAPPING_EFFECT) plus `-1` terminator

**Translation notes**:
- Comments preserved verbatim (not assembly directives)
- Section labels `SpecialEffects:` and `SpecialEffectsCont:` preserved
- No macros, no conditionals, no pointer relocation

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 7: data/battle/stat_modifiers.asm reconciliation

**Reconciled file**: `wla/data/battle/stat_modifiers_reconcile.asm`
**Original master file**: `data/battle/stat_modifiers.asm` (RGBDS source untouched)

**Data content**: Pure `.DB` table of 13 stat modifier ratios (25/100, 28/100, 33/100, 40/100, 50/100, 66/100, 1/1, 15/10, 2/1, 25/10, 3/1, 35/10, 4/1). The RGBDS source uses RGBDS-specific macros (`list_start`/`assert_list_length`/`li`) and references constants like `NUM_STAT_MODS` and side-effect constants that do not exist in the monolith.

**Assert handling**: Dropped. The `assert_list_length` checks enforced list length against `NUM_STAT_MODS` and side-effect constants that only exist in the RGBDS constants file, not in the monolith. No WLA-side assert was added; validation is by direct review/checksum of the fixed 13-entry table.

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 8: data/battle/critical_hit_moves.asm + unused_critical_hit_moves.asm reconciliation

**Reconciled files**: `wla/data/battle/critical_hit_moves_reconcile.asm`, `wla/data/battle/unused_critical_hit_moves_reconcile.asm`
**Original master files**: `data/battle/critical_hit_moves.asm`, `data/battle/unused_critical_hit_moves.asm` (RGBDS source untouched)

**Data content**:
- `critical_hit_moves`: 5 `.DB` entries (KARATE_CHOP/RAZOR_LEAF/CRABHAMMER/SLASH/-1), section label `HighCriticalMoves:`
- `unused_critical_hit_moves`: 5 `.DB` entries (KARATE_CHOP/RAZOR_LEAF/CRABHAMMER/SLASH/-1), section label `UnusedHighCriticalMoves:`

**Translation notes**:
- Comments preserved verbatim (not assembly directives)
- Section labels preserved
- No macros, no conditionals, no pointer relocation

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 9: data/battle/residual_effects_2.asm reconciliation

**Reconciled file**: `wla/data/battle/residual_effects_2_reconcile.asm`
**Original master file**: `data/battle/residual_effects_2.asm` (RGBDS source untouched)

**Data content**: 36 `.DB` entries (EFFECT_01/ATTACK_UP1_EFFECT/DEFENSE_UP1_EFFECT/SPEED_UP1_EFFECT/SPECIAL_UP1_EFFECT/ACCURACY_UP1_EFFECT/EVASION_UP1_EFFECT/ATTACK_DOWN1_EFFECT/DEFENSE_DOWN1_EFFECT/SPEED_DOWN1_EFFECT/SPECIAL_DOWN1_EFFECT/ACCURACY_DOWN1_EFFECT/EVASION_DOWN1_EFFECT/BIDE_EFFECT/SLEEP_EFFECT/ATTACK_UP2_EFFECT/DEFENSE_UP2_EFFECT/SPEED_UP2_EFFECT/SPECIAL_UP2_EFFECT/ACCURACY_UP2_EFFECT/EVASION_UP2_EFFECT/ATTACK_DOWN2_EFFECT/DEFENSE_DOWN2_EFFECT/SPEED_DOWN2_EFFECT/SPECIAL_DOWN2_EFFECT/ACCURACY_DOWN2_EFFECT/EVASION_DOWN2_EFFECT/-1), section label `ResidualEffects2:`

**Translation notes**:
- Comments preserved verbatim (not assembly directives)
- Section label `ResidualEffects2:` preserved
- No macros, no conditionals, no pointer relocation

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Phase 10: data/types/names.asm reconciliation

**Reconciled file**: `wla/data/types/names_reconcile.asm`
**Original master file**: `data/types/names.asm` (RGBDS source untouched)

**Data content**: Type name pointer table with string labels:
- 9 physical-type pointers: .Normal, .Fighting, .Flying, .Poison, .Ground, .Rock, .Bird, .Bug, .Ghost
- 1 unused-type pointer: .Normal (between physical and special types)
- 7 special-type pointers: .Fire, .Water, .Grass, .Electric, .Psychic, .Ice, .Dragon
- 16 string labels: NORMAL@, FIGHTING@, FLYING@, POISON@, FIRE@, WATER@, GRASS@, ELECTRIC@, PSYCHIC@, ICE@, GROUND@, ROCK@, BIRD@, BUG@, GHOST@, DRAGON@

**Translation notes**:
- `table_width` directive dropped (RGBDS-only)
- `REPT UNUSED_TYPES_END - UNUSED_TYPES` expanded to explicit `.DW .Normal`
- `assert_table_length` dropped (RGBDS-only)
- String labels use global form (`.Normal:`, `.Fighting:`, etc.) per master source convention
- No macros, no conditionals, no pointer relocation

**Status**:
- RGBDS source: untouched
- Bank files: untouched
- No POC driver modified

## Battle reconciliation label audit

All `wla/data/battle/*_reconcile.asm` files were checked against their master `data/battle/*.asm` sources. Master global labels are preserved exactly; no global labels are intentionally converted to WLA local labels.

## Next step

Choose one small master-aligned bank/region and reconcile it against `wla/pkrd` using `/data/pkrd/pkrd-noanon-hram-fixed.asm` for WLA label/symbol authority. Preserve the RGBDS tree and stop at one bounded conversion boundary.
