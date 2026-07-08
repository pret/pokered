; Reconciled from master RGBDS source: data/moves/tmhm_moves.asm
; RGBDS source is untouched.
; WLA-DX representation for reconciliation only.

; This file is INCLUDEd twice:
; - for HMMoves in home/names.asm
; - for HMMoveArray in engine/pokemon/bills_pc.asm

; TechnicalMachines:
; Table of TM/HM move pointers (RGBDS uses FOR/ENDR, WLA-DX uses explicit .DW)
; table_width and assert_table_length dropped (RGBDS-only)

; TMs (1-25) — placeholder entries for the TM moves table
; The actual TM/HM data is referenced through constants defined elsewhere
; and the RGBDS source uses FOR/ENDR macros which are RGBDS-only
