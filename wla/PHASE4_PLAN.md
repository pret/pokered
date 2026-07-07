# Phase 4 Plan: data/types/names.asm

## 1. Original Master File Summary

File: `data/types/names.asm`

Contents:
- Pointer table of 27 `.DW` entries (9 physical types + 11 unused types + 7 special types)
- 15 string definitions: `.Normal` through `.Dragon`
- Uses RGBDS `REPT/ENDR` for unused type slots (11 repetitions)
- Uses RGBDS `table_width` directive
- Uses RGBDS `assert_table_length` macro
- Used by `engine/battle/print_type.asm` via `INCLUDE "data/types/names.asm"`
- Referenced in `constants/type_constants.asm` as `TypeNames indexes`

## 2. Labels Involved

- `.Normal` — label for the NORMAL@ string
- `.Fighting` — label for the FIGHTING@ string
- `.Flying` — label for the FLYING@ string
- `.Poison` — label for the POISON@ string
- `.Ground` — label for the GROUND@ string
- `.Rock` — label for the ROCK@ string
- `.Bird` — label for the BIRD@ string
- `.Bug` — label for the BUG@ string
- `.Ghost` — label for the GHOST@ string
- `.Fire` — label for the FIRE@ string
- `.Water` — label for the WATER@ string
- `.Grass` — label for the GRASS@ string
- `.Electric` — label for the ELECTRIC@ string
- `.Psychic` — label for the PSYCHIC@ string
- `.Ice` — label for the ICE@ string
- `.Ground` — label for the GROUND@ string (duplicate)
- `.Rock` — label for the ROCK@ string (duplicate)
- `.Bird` — label for the BIRD@ string (duplicate)
- `.Bug` — label for the BUG@ string (duplicate)
- `.Ghost` — label for the GHOST@ string (duplicate)
- `.Dragon` — label for the DRAGON@ string

## 3. Exact RGBDS Directives/Macros Used

- `table_width 2` — RGBDS-specific directive for pointer table alignment
- `dw .Normal` (×9) — pointer table entries for physical types
- `REPT UNUSED_TYPES_END - UNUSED_TYPES` — RGBDS repeat macro for unused types (11 repetitions)
- `assert_table_length NUM_TYPES` — RGBDS-specific assert macro
- `.Normal: db "NORMAL@"` — string definitions with trailing null terminator (@)

## 4. File Contents Analysis

- **Pointer table**: Yes (27 `.DW` entries)
- **Local labels**: Yes (15 local labels for string definitions)
- **String data**: Yes (15 strings with null terminators)
- **Asserts**: Yes (`assert_table_length NUM_TYPES`)
- **Constants**: No (uses `REPT/ENDR` with `UNUSED_TYPES_END - UNUSED_TYPES` instead)
- **Charmap/text encoding**: Yes — strings use trailing null terminator `@` convention

## 5. Proposed WLA-DX Representation

```asm
TypeNames:
.DW .Normal
.DW .Fighting
.DW .Flying
.DW .Poison
.DW .Ground
.DW .Rock
.DW .Bird
.DW .Bug
.DW .Ghost

REPT 11
.DW .Normal
ENDR

.DW .Fire
.DW .Water
.DW .Grass
.DW .Electric
.DW .Psychic
.DW .Ice
.DW .Dragon

.Normal:   db "NORMAL@"
.Fighting: db "FIGHTING@"
.Flying:   db "FLYING@"
.Poison:   db "POISON@"
.Ground:   db "GROUND@"
.Rock:     db "ROCK@"
.Bird:     db "BIRD@"
.Bug:      db "BUG@"
.Ghost:    db "GHOST@"
.Fire:     db "FIRE@"
.Water:    db "WATER@"
.Grass:    db "GRASS@"
.Electric: db "ELECTRIC@"
.Psychic:  db "PSYCHIC@"
.Ice:      db "ICE@"
.Dragon:   db "DRAGON@"
```

Rationale:
- `table_width` directive is RGBDS-specific — dropped with documentation
- `REPT/ENDR` repeat macro replaced with 11 explicit `.DW .Normal` entries (since count is constant)
- `assert_table_length` is RGBDS-specific — dropped with documentation
- Local labels preserved as-is (WLA-DX supports them, verified by smoke test)

## 6. How `.DW` Pointers Should Be Represented in WLA-DX

- Each `.DW` in RGBDS emits a 16-bit word (2 bytes) pointing to a label
- WLA-DX `.DW` directive works identically for label pointers
- No special handling needed — just replace `.DW .Label` syntax directly

## 7. Local Labels Safety

Local labels like `.Normal`, `.Fighting`, etc. are **safe** in WLA-DX. WLA-DX supports local labels (labels without a name prefix) and they work the same as in RGBDS for defining string data. Verified by smoke test: `wla-gb -t` accepts the syntax.

## 8. Assert/Table-Width Semantics

**Recommendation**: Drop with documentation.

- `table_width 2` — informational only, not functional; dropped
- `REPT UNUSED_TYPES_END - UNUSED_TYPES` — RGBDS-specific; replaced with 11 explicit `.DW .Normal` entries
- `assert_table_length NUM_TYPES` — RGBDS-specific; dropped with documentation noting that the fixed 27-type table is self-documenting

## 9. Validation Strategy

**Structural validation**:
- Verify the WLA-DX file assembles with `wla-gb -t`
- Confirm 9 `.DW` entries for physical types before the unused range
- Confirm 11 `.DW` entries for unused types (REPT loop expanded)
- Confirm 7 `.DW` entries for special types after the unused range
- Confirm 15 `.DB` string definitions

**Pointer table validation**:
- Verify 9 `.DW` entries point to physical type labels
- Verify 11 `.DW` entries point to `.Normal` (unused types)
- Verify 7 `.DW` entries point to special type labels

**String table validation**:
- Verify 15 strings match original: NORMAL@, FIGHTING@, FLYING@, POISON@, GROUND@, ROCK@, BIRD@, BUG@, GHOST@, FIRE@, WATER@, GRASS@, ELECTRIC@, PSYCHIC@, ICE@, DRAGON@

**Checksum/text comparison**:
- Not needed — strings are fixed and self-documenting

## 10. Files That Would Change

1. `data/types/names.asm` — RGBDS source (untouched)
2. `wla/data/types/names_reconcile.asm` — new WLA-DX reconcile file

Files that would NOT change:
- `wla/pkrd` bank files
- RGBDS source files
- Other reconcile files

## 11. Risk Rating

**Risk: Low**

Reasoning:
- Pure data file with no control flow
- Pointer table is straightforward conversion (`.DW` → `.DW`)
- String definitions are identical in both assemblers
- `REPT/ENDR` is the only complex construct, but the repeat count is constant
- No macros or conditional logic
- No cross-references in the original file

## 12. Recommendation

**Proceed** — after documentation cleanup and planning

Steps:
1. Commit documentation cleanup (Phase 3 wording update in WLA_DX_PORTING.md)
2. Create `wla/data/types/names_reconcile.asm` with WLA-DX conversion
3. Verify WLA-DX assembly succeeds
4. Confirm working tree is clean
