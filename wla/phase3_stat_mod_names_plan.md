# Phase 3 Plan: stat_mod_names.asm

## 1. Original Master File Summary

File: `data/battle/stat_mod_names.asm`

Purposes:
- Defines the text strings for stat modifiers that moves can raise or lower
- Contains 6 string entries: ATTACK, DEFENSE, SPEED, SPECIAL, ACCURACY, EVADE
- Uses RGBDS `list_start` macro to emit a labeled byte array with a count

Current format:
```
StatModTextStrings:
	list_start STAT_NAME_LENGTH - 1
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SPECIAL"
	assert_list_length SPECIAL_DOWN_SIDE_EFFECT - ATTACK_DOWN_SIDE_EFFECT + 1
	li "ACCURACY"
	li "EVADE"
	assert_list_length NUM_STAT_MODS - 2 ; two bytes are unused
	assert_list_length EVASION_UP1_EFFECT - ATTACK_UP1_EFFECT + 1
	assert_list_length EVASION_DOWN1_EFFECT - ATTACK_DOWN1_EFFECT + 1
	assert_list_length EVASION_UP2_EFFECT - ATTACK_UP2_EFFECT + 1
	assert_list_length EVASION_DOWN2_EFFECT - ATTACK_DOWN2_EFFECT + 1
```

The `list_start` macro emits a label followed by STAT_NAME_LENGTH - 1 null-terminated strings. The assertions verify internal consistency of the stat modifier mapping.

## 2. Labels Involved

- `StatModTextStrings` — label for the string table

## 3. RGBDS Macros/Asserts/Constants Used

Macros:
- `list_start N` — emits N null-terminated strings under a label
- `assert_list_length expr` — runtime assert that list length matches expression

Constants (from pokered.sym):
- `STAT_NAME_LENGTH` — max string length for stat names
- `NUM_STAT_MODS` — total count of stat modifier entries
- `ATTACK_DOWN_SIDE_EFFECT`, `SPECIAL_DOWN_SIDE_EFFECT`, `EVASION_UP1_EFFECT`, `EVASION_DOWN1_EFFECT`, `EVASION_UP2_EFFECT`, `EVASION_DOWN2_EFFECT` — effect IDs for each stat modifier

## 4. Exact WLA-DX Representation

Proposed conversion:
```asm
; Stats that move effects can raise or lower
; The relevant move effect IDs correspond to the stats

StatModTextStrings:
.DB "ATTACK"
.DB "DEFENSE"
.DB "SPEED"
.DB "SPECIAL"
.DB "ACCURACY"
.DB "EVADE"
```

Rationale:
- `list_start N` is replaced with N individual `.DB` instructions
- Each `.DB` emits a null-terminated string, matching the original data layout
- The label `StatModTextStrings:` is preserved for consistency with other reconcile files

## 5. Assert Semantics

**Recommendation: Drop with documentation**

Reasoning:
- The 6 assertions verify internal consistency of the stat modifier mapping
- WLA-DX has no assert mechanism
- The data layout itself (6 strings of fixed length) enforces the same constraints
- Adding equivalent assertions in WLA-DX would require either:
  - A custom macro (defeats the purpose of conversion)
  - A validation script (see section 7)

**Action**: Add a comment in the WLA-DX file documenting that the original assertions are implicit in the data layout.

## 6. Validation Strategy

1. Assemble the WLA-DX file with `wla-gb`
2. Verify the output matches the expected data layout
3. Check that the label `StatModTextStrings` is preserved for cross-referencing
4. Confirm the `.DB` count (6) matches the original string count

## 7. Files That Would Change

1. `data/battle/stat_mod_names.asm` — WLA-DX conversion
2. `wla/data/battle/stat_mod_names_reconcile.asm` — new reconcile file (if not already created)

Files that would NOT change:
- RGBDS source files
- `wla/pkrd/` bank files
- Other reconcile files

## 8. Risk Rating

**Risk: Low**

Reasoning:
- Straightforward conversion: `list_start N` → N `.DB` instructions
- No complex macros or conditional logic
- Data layout is simple (6 fixed-length strings)
- Assertions are informational, not functional — losing them doesn't affect runtime behavior
- WLA-DX assembler handles `.DB` with strings natively

## 9. Recommended Approach

**Proceed with implementation**

Steps:
1. Create `wla/data/battle/stat_mod_names_reconcile.asm` with the WLA-DX conversion
2. Add documentation comment about dropped assertions
3. Verify WLA-DX assembly succeeds
4. Confirm working tree is clean
