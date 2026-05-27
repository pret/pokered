MACRO sprite_facing_const
	const \1
	DEF \2 EQU \1 << 4
ENDM

; sprite facing directions
	nybble_const_def 0, $4
	sprite_facing_const SPRITE_FACING_DOWN,  NPC_MOVEMENT_DOWN  ; $00, $00
	sprite_facing_const SPRITE_FACING_UP,    NPC_MOVEMENT_UP    ; $04, $40
	sprite_facing_const SPRITE_FACING_LEFT,  NPC_MOVEMENT_LEFT  ; $08, $80
	sprite_facing_const SPRITE_FACING_RIGHT, NPC_MOVEMENT_RIGHT ; $0C, $C0

DEF NPC_CHANGE_FACING EQU $E0

; player direction constants
	bit_const_def
	shift_const PLAYER_DIR_RIGHT ; $01 (BIT_PLAYER_DIR_RIGHT ; 0)
	shift_const PLAYER_DIR_LEFT  ; $02 (BIT_PLAYER_DIR_LEFT  ; 1)
	shift_const PLAYER_DIR_DOWN  ; $04 (BIT_PLAYER_DIR_DOWN  ; 2)
	shift_const PLAYER_DIR_UP    ; $08 (BIT_PLAYER_DIR_UP    ; 3)
