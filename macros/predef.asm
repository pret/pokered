predef_const: MACRO
	const \1PredefID
ENDM

add_predef: MACRO
\1Predef::
	db BANK(\1)
	dw \1
ENDM

predef_id: MACRO
	ld a, (\1Predef - PredefPointers) / 3
ENDM

predef: MACRO
	predef_id \1
	call Predef
ENDM

predef_jump: MACRO
	predef_id \1
	jp Predef
ENDM

tx_pre_const: MACRO
	const \1_id
ENDM

add_tx_pre: MACRO
\1_id:: dw \1
ENDM

db_tx_pre: MACRO
	db (\1_id - TextPredefs) / 2 + 1
ENDM

tx_pre_id: MACRO
	ld a, (\1_id - TextPredefs) / 2 + 1
ENDM

tx_pre: MACRO
	tx_pre_id \1
	call PrintPredefTextID
ENDM

tx_pre_jump: MACRO
	tx_pre_id \1
	jp PrintPredefTextID
ENDM
