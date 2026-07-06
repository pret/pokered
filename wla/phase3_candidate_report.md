# Phase 3 Candidate Report: Stat Data Files

## Validation Output Summary

```
make              → Nothing to be done for 'all'
make wla-check-split → OK split files present: prelude + 64 banks + main
                                OK split bank files contain expected .BANK markers: 64/64
                                OK main.asm references prelude and 64 banks
                                OK representative monolith labels present in split banks: 510/510
make wla-report   → WLA-DX reconciliation status
                                split_dir: wla/pkrd
                                bank_count: 64/64
                                monolith_labels_indexed: 510
                                split_labels_indexed: 510
                                missing: none
                                uncovered_label_banks: none
git status        → On branch wla-dx-reconcile (clean, only untracked plan files)
```

---

## Candidate Regions (Rank 1 Safest → Rank 3)

### Candidate 1 (Safest): `stat_names_reconcile.asm`

| Field | Value |
|-------|-------|
| **Master file** | `data/battle/stat_names.asm` |
| **WLA bank file** | `wla/data/battle/stat_names_reconcile.asm` |
| **Labels** | `VitaminStats` |
| **Approx bank/address** | Bank 1, $C000–$C03F (estimated from prelude enum layout) |
| **Dependencies** | None — standalone `.DB` data table |
| **RGBDS macros/asserts** | None — pure `.DB` string table (5 entries) |
| **Size** | 122 bytes |
| **Why safe** | Smallest file; pure data table with no macros, asserts, or control flow; no cross-references |
| **Validation** | Assemble with `wla-gb -t -o /tmp/out.o wla/data/battle/stat_names_reconcile.asm` |
| **Touched RGBDS source?** | No |

---

### Candidate 2: `critical_hit_moves_reconcile.asm`

| Field | Value |
|-------|-------|
| **Master file** | `data/battle/critical_hit_moves.asm` |
| **WLA bank file** | `wla/data/battle/critical_hit_moves_reconcile.asm` |
| **Labels** | None (unlabeled `.DB` table) |
| **Approx bank/address** | Bank 1, $C040–$C07F (estimated) |
| **Dependencies** | None — standalone `.DB` symbol table (5 entries) |
| **RGBDS macros/asserts** | None — pure `.DB` symbol table |
| **Size** | 96 bytes |
| **Why safe** | Small; pure data; no macros, asserts, or control flow |
| **Validation** | Assemble with `wla-gb -t -o /tmp/out.o wla/data/battle/critical_hit_moves_reconcile.asm` |
| **Touched RGBDS source?** | No |

---

### Candidate 3: `stat_mod_names_reconcile.asm`

| Field | Value |
|-------|-------|
| **Master file** | `data/battle/stat_mod_names.asm` |
| **WLA bank file** | `wla/data/battle/stat_mod_names_reconcile.asm` |
| **Labels** | `StatModTextStrings` |
| **Approx bank/address** | Bank 1, $C080–$C0BF (estimated) |
| **Dependencies** | None — standalone `.DB` string table (6 entries) |
| **RGBDS macros/asserts** | None — pure `.DB` string table (original RGBDS `list_start` + asserts were dropped with documentation) |
| **Size** | 181 bytes |
| **Why safe** | Small; pure data; original RGBDS asserts were informational only (not functional) |
| **Validation** | Assemble with `wla-gb -t -o /tmp/out.o wla/data/battle/stat_mod_names_reconcile.asm` |
| **Touched RGBDS source?** | No |

---

### Candidate 4 (Not ranked — larger): `always_happen_effects_reconcile.asm`

- **Master file**: `data/battle/always_happen_effects.asm`
- **WLA bank file**: `wla/data/battle/always_happen_effects_reconcile.asm`
- **Entries**: 11 (largest of the four)
- **Risk**: Still LOW, but slightly higher surface area than the others

---

## Recommendation

**Proceed with Candidate 1: `stat_names_reconcile.asm`**

Rationale:
1. Smallest surface area (122 bytes)
2. Pure string data — no macros, no asserts, no conditional logic
3. Already converted in WLA-DX format
4. No dependencies on other files
5. Validation is a single `wla-gb -t` assemble check
6. Working tree is clean

**Do not** implement the conversion yet. Stop here and await explicit approval to proceed.
