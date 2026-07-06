# Phase 2 Candidate Report

Selected master-aligned data files for WLA-DX reconciliation.
Prefers small, data-only files with one or a few labels, no control flow, no complex macros, no asset-generation dependency, easy byte-for-byte validation.

---

## Candidate 1: `data/battle/stat_names.asm` (rank 1)

| Field | Detail |
|---|---|
| **Master file** | `data/battle/stat_names.asm` |
| **Size** | 185 bytes |
| **Type** | Data-only: pure .DB table of vitamin stat names |
| **Labels** | `VitaminStats:` (single label), list entries at `list_start STAT_NAME_LENGTH - 1` |
| **WLA bank region** | WLA bank file: `wla/pkrd/bank0X.asm` (likely bank 00-01); label `VitaminStats` in WLA label table |
| **Dependencies** | None. No macros, no charmap expansion, no INCLUDEs, no conditional compilation |
| **Validation** | Byte-for-byte: compare reconciled file checksum (e.g., md5sum) against master source |
| **Risk rating** | Low |
| **Reasoning** | Smallest data-only file found; 5 entries (HEALTH/ATTACK/DEFENSE/SPEED/SPECIAL); zero macros; zero charmap concerns; zero control flow |

---

## Candidate 2: `data/battle/stat_mod_names.asm` (rank 2)

| Field | Detail |
|---|---|
| **Master file** | `data/battle/stat_mod_names.asm` |
| **Size** | 630 bytes |
| **Type** | Data-only: pure .DB table of move-effect stat modifier names |
| **Labels** | `StatModTextStrings:` (single label), list entries at `list_start STAT_NAME_LENGTH - 1` |
| **WLA bank region** | WLA bank file: `wla/pkrd/bank0X.asm` (likely bank 01-02) |
| **Dependencies** | `assert_list_length` macro (RGBDS only); references constants `NUM_STAT_MODS`, `SPECIAL_DOWN_SIDE_EFFECT`, `ATTACK_DOWN_SIDE_EFFECT`, `EVASION_UP1_EFFECT`, `EVASION_DOWN1_EFFECT`, `EVASION_UP2_EFFECT`, `EVASION_DOWN2_EFFECT` |
| **Validation** | Byte-for-byte: compare checksums; verify assert macros produce matching lengths |
| **Risk rating** | Low |
| **Reasoning** | Data-only; 7 stat modifier names (ATTACK/DEFENSE/SPEED/SPECIAL/ACCURACY/EVADE); assert macros are simple length checks, no charmap expansion; no conditional compilation |

---

## Candidate 3: `data/types/names.asm` (rank 3)

| Field | Detail |
|---|---|
| **Master file** | `data/types/names.asm` |
| **Size** | 672 bytes |
| **Type** | Data-only: .DW pointer table + .DB string table for type names |
| **Labels** | `TypeNames:`, `.Normal:`, `.Fighting:`, `.Flying:`, `.Poison:`, `.Ground:`, `.Rock:`, `.Bird:`, `.Bug:`, `.Ghost:`, `.Fire:`, `.Water:`, `.Grass:`, `.Electric:`, `.Psychic:`, `.Ice:`, `.Dragon:` |
| **WLA bank region** | WLA bank file: `wla/pkrd/bank0X.asm` (likely bank 01-02) |
| **Dependencies** | Uses `table_width 2` and `.DW` pointer table to label table; `assert_table_length NUM_TYPES` |
| **Validation** | Byte-for-byte: compare .DW pointers and .DB strings separately; verify type label table integrity |
| **Risk rating** | Low |
| **Reasoning** | Two-pass structure (pointer table + string table) adds validation complexity but is still pure data; no macros, no charmap, no control flow; 16 type names |

---

## Candidate 4: `data/wild/probabilities.asm` (rank 4)

| Field | Detail |
|---|---|
| **Master file** | `data/wild/probabilities.asm` |
| **Size** | 1,216 bytes |
| **Type** | Data-only: cumulative probability table using custom MACRO + .DB |
| **Labels** | `WildMonEncounterSlotChances:` (single label); uses `table_width 2` and custom `wild_chance` MACRO |
| **WLA bank region** | WLA bank file: `wla/pkrd/bank0X.asm` (likely bank 02-03) |
| **Dependencies** | Custom MACRO (`wild_chance`), `DEF` constants (`wild_chance_total`, `wild_chance_slot`), `assert_table_length NUM_WILDMONS`, `ASSERT` with inline check |
| **Validation** | Byte-for-byte: compare checksums; verify cumulative probability sums to 256 |
| **Risk rating** | Medium |
| **Reasoning** | Uses custom MACRO for table construction (not RGBDS conditional like `IF DEF(_RED)`); custom macro syntax may need WLA-DX conversion; has inline ASSERT validation |

---

## Candidate 5: `data/yes_no_menu_strings.asm` (rank 5)

| Field | Detail |
|---|---|
| **Master file** | `data/yes_no_menu_strings.asm` |
| **Size** | 893 bytes |
| **Type** | Data-only: two-option menu layout table using custom MACRO |
| **Labels** | `TwoOptionMenuStrings:`, `.NoYesMenu:`, `.YesNoMenu:`, `.NorthWestMenu:`, `.SouthEastMenu:`, `.NorthEastMenu:`, `.TradeCancelMenu:`, `.HealCancelMenu:`, `.NoYesMenu:` |
| **WLA bank region** | WLA bank file: `wla/pkrd/bank0X.asm` (likely bank 02-03) |
| **Dependencies** | Custom MACRO (`two_option_menu`), `assert_table_length NUM_TWO_OPTION_MENUS`; conditional constants (`_RED`/`_BLUE` menu sizes) but no `IF DEF` in this file |
| **Validation** | Byte-for-byte: compare checksums; verify table length |
| **Risk rating** | Medium |
| **Reasoning** | Custom MACRO for table layout; conditional menu sizes via constants (not `IF DEF`); still data-only, no charmap concerns |

---

## Summary

| Rank | File | Size | Type | Risk | Key concern |
|---|---|---|---|---|---|
| 1 | `data/battle/stat_names.asm` | 185 B | .DB table | Low | None — simplest possible candidate |
| 2 | `data/battle/stat_mod_names.asm` | 630 B | .DB table + asserts | Low | Assert macros are simple length checks |
| 3 | `data/types/names.asm` | 672 B | .DW pointers + .DB strings | Low | Two-pass structure requires separate pointer/string validation |
| 4 | `data/wild/probabilities.asm` | 1,216 B | Custom MACRO table | Medium | Custom MACRO syntax needs conversion |
| 5 | `data/yes_no_menu_strings.asm` | 893 B | Custom MACRO table | Medium | Custom MACRO syntax; conditional constants |

---

## Recommendation

**Choose: `data/battle/stat_names.asm` (Candidate 1)**

Reasons:
- Smallest file (185 bytes), making it the lowest-risk reconciliation target
- Pure .DB table with 5 entries (HEALTH/ATTACK/DEFENSE/SPEED/SPECIAL)
- Zero macros, zero charmap, zero conditionals, zero code flow
- Single label (`VitaminStats:`)
- Byte-for-byte validation: checksum comparison is trivial
- Likely in early WLA bank files (bank 00-01), easy to locate in `wla/pkrd/`
- No dependencies on constants, macros, or conditional compilation

Validation command:
```bash
# Reconcile into wla/data/battle/stat_names_reconcile.asm
# Then verify byte-for-byte:
diff data/battle/stat_names.asm wla/data/battle/stat_names_reconcile.asm && echo "MATCH" || echo "DIFFER"
# Or checksum:
md5sum data/battle/stat_names.asm wla/data/battle/stat_names_reconcile.asm
```
