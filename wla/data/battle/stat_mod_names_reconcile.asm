; Reconciled from master RGBDS source: data/battle/stat_mod_names.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; Stats that move effects can raise or lower
; The relevant move effect IDs correspond to the stats

; .li (list_start) is RGBDS-only; WLA-DX has no equivalent.
; The .li "labels" here were string placeholders — converted to .DB with the
; actual string values that follow the original .li entries.
StatModTextStrings:
.DB "ATTACK"
.DB "DEFENSE"
.DB "SPEED"
.DB "SPECIAL"
.DB "ACCURACY"
.DB "EVADE"

; assert_list_length is RGBDS-only; dropped. Validation is by explicit
; count/string comparison against the master source.
