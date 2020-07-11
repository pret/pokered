NAME_LENGTH EQU 11
ITEM_NAME_LENGTH EQU 13

; PrintNumber
	const_def 5
	const BIT_MONEY_SIGN     ; 5
	const BIT_LEFT_ALIGN     ; 6
	const BIT_LEADING_ZEROES ; 7

MONEY_SIGN EQU     (1 << BIT_MONEY_SIGN)
LEFT_ALIGN EQU     (1 << BIT_LEFT_ALIGN)
LEADING_ZEROES EQU (1 << BIT_LEADING_ZEROES)

; special text IDs (see home/text_script.asm)
	const_def $d0
	const TEXT_MON_FAINTED      ; $d0
	const TEXT_BLACKED_OUT      ; $d1
	const TEXT_REPEL_WORE_OFF   ; $d2
	const TEXT_SAFARI_GAME_OVER ; $d3

TEXT_START_MENU EQU $00
