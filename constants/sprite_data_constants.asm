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
	const PLAYER_DIR_BIT_RIGHT ; 0
	const PLAYER_DIR_BIT_LEFT  ; 1
	const PLAYER_DIR_BIT_DOWN  ; 2
	const PLAYER_DIR_BIT_UP    ; 3

DEF PLAYER_DIR_RIGHT EQU 1 << PLAYER_DIR_BIT_RIGHT
DEF PLAYER_DIR_LEFT  EQU 1 << PLAYER_DIR_BIT_LEFT
DEF PLAYER_DIR_DOWN  EQU 1 << PLAYER_DIR_BIT_DOWN
DEF PLAYER_DIR_UP    EQU 1 << PLAYER_DIR_BIT_UP
