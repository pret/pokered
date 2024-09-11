; TypeNames indexes (see data/types/names.asm)
	const_def

DEF PHYSICAL EQU const_value
	const NORMAL       ; $00
	const FIGHTING     ; $01
	const FLYING       ; $02
	const POISON       ; $03
	const GROUND       ; $04
	const ROCK         ; $05
	const TYPELESS     ; $06 PureRGBnote: CHANGED: used with struggle
	const BUG          ; $07
	const GHOST        ; $08 PureRGBnote: CHANGED: GHOST type has dynamic typing, special if your base special is higher than attack, physical if they're the same or attack is higher
	const CRYSTAL      ; $09 PureRGBnote: ADDED: used with hardened onix (same as rock type but resists water and ice + normally damaged by grass, still gets stab on rock moves)
	const BONEMERANG_TYPE ; $0A PureRGBnote: ADDED: used with bonemerang...same as ground but can hit flying/floating pokemon for neutral dmg
DEF UNUSED_TYPES EQU const_value
	const_next 20
DEF UNUSED_TYPES_END EQU const_value

DEF SPECIAL EQU const_value
	const FIRE         ; $14
	const WATER        ; $15
	const GRASS        ; $16
	const ELECTRIC     ; $17
	const PSYCHIC_TYPE ; $18
	const ICE          ; $19
	const DRAGON       ; $1A
	const TRI          ; $1B PureRGBnote: ADDED: used with tri attack
	const FLOATING     ; $1C PureRGBnote: ADDED: used with floating magneton / weezing, can upgrade yours in specific places

DEF NUM_TYPES EQU const_value
