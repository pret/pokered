MACRO predef_id
	ld a, (\1Predef - PredefPointers) / 3
ENDM

MACRO predef
	predef_id \1
	rst _Predef
ENDM

MACRO predef_jump
	predef_id \1
	rst _Predef
	ret
ENDM


MACRO tx_pre_id
	ld a, (\1_id - TextPredefs) / 2 + 1
ENDM

MACRO tx_pre
	tx_pre_id \1
	call PrintPredefTextID
ENDM

MACRO tx_pre_jump
	tx_pre_id \1
	jp PrintPredefTextID
ENDM

MACRO db_tx_pre
	db (\1_id - TextPredefs) / 2 + 1
ENDM
