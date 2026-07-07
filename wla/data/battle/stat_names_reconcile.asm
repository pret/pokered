; Reconciled from master RGBDS source: data/battle/stat_names.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; .li (list_start) is RGBDS-only; WLA-DX has no equivalent.
; .assert_list_length is RGBDS-only; dropped with documentation in WLA_DX_PORTING.md.
; Source labels are preserved where safe; .db strings converted to .DB for consistency.

.VitaminStats:
.DB "HEALTH"
.DB "ATTACK"
.DB "DEFENSE"
.DB "SPEED"
.DB "SPECIAL"
