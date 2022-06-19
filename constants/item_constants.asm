; item ids
; indexes for:
; - ItemNames (see data/items/names.asm)
; - ItemPrices (see data/items/prices.asm)
; - TechnicalMachinePrices (see data/items/tm_prices.asm)
; - KeyItemFlags (see data/items/key_items.asm)
; - ItemUsePtrTable (see engine/items/item_effects.asm)
	const_def
	const NO_ITEM       ; $00
	const MASTER_BALL   ; $01
	const ULTRA_BALL    ; $02
	const GREAT_BALL    ; $03
	const POKE_BALL     ; $04
	const HYPER_BALL    ; $05
	const BICYCLE       ; $06
	const SURFBOARD     ; $07 buggy?
	const SAFARI_BALL   ; $08
	const POKEDEX       ; $09 pointless item?
	const MOON_STONE    ; $0A
	const ANTIDOTE      ; $0B
	const BURN_HEAL     ; $0C
	const ICE_HEAL      ; $0D
	const AWAKENING     ; $0E
	const PARLYZ_HEAL   ; $0F
	const FULL_RESTORE  ; $10
	const MAX_POTION    ; $11
	const HYPER_POTION  ; $12
	const SUPER_POTION  ; $13
	const POTION        ; $14
	const BOULDERBADGE  ; $15
	const CASCADEBADGE  ; $16
SAFARI_BAIT EQU $15 ; overload
SAFARI_ROCK EQU $16 ; overload
	const THUNDERBADGE  ; $17
	const RAINBOWBADGE  ; $18
	const SOULBADGE     ; $19
	const MARSHBADGE    ; $1A
	const VOLCANOBADGE  ; $1B
	const EARTHBADGE    ; $1C
	const ESCAPE_ROPE   ; $1D
	const REPEL         ; $1E
	const OLD_AMBER     ; $1F
	const FIRE_STONE    ; $20
	const THUNDER_STONE ; $21
	const WATER_STONE   ; $22
	const HP_UP         ; $23
	const PROTEIN       ; $24
	const IRON          ; $25
	const CARBOS        ; $26
	const CALCIUM       ; $27
	const RARE_CANDY    ; $28
	const DOME_FOSSIL   ; $29
	const HELIX_FOSSIL  ; $2A
	const SECRET_KEY    ; $2B
	const POCKET_ABRA   ; $2C
	const BIKE_VOUCHER  ; $2D
	const X_ACCURACY    ; $2E
	const LEAF_STONE    ; $2F
	const CARD_KEY      ; $30
	const NUGGET        ; $31
	const APEX_CHIP     ; $32
	const POKE_DOLL     ; $33
	const FULL_HEAL     ; $34
	const REVIVE        ; $35
	const MAX_REVIVE    ; $36
	const GUARD_SPEC    ; $37
	const SUPER_REPEL   ; $38
	const MAX_REPEL     ; $39
	const DIRE_HIT      ; $3A
	const COIN          ; $3B ; useless item?
	const FRESH_WATER   ; $3C
	const SODA_POP      ; $3D
	const LEMONADE      ; $3E
	const S_S_TICKET    ; $3F
	const GOLD_TEETH    ; $40
	const X_ATTACK      ; $41
	const X_DEFEND      ; $42
	const X_SPEED       ; $43
	const X_SPECIAL     ; $44
	const LOST_WALLET   ; $45 ; Used to be COIN_CASE before coin case was switched to be an event only
	const OAKS_PARCEL   ; $46
	const ITEMFINDER    ; $47
	const SILPH_SCOPE   ; $48
	const POKE_FLUTE    ; $49
	const LIFT_KEY      ; $4A
	const BOOSTER_CHIP  ; $4B
	const OLD_ROD       ; $4C
	const GOOD_ROD      ; $4D
	const SUPER_ROD     ; $4E
	const PP_UP         ; $4F
	const ETHER         ; $50
	const MAX_ETHER     ; $51
	const ELIXER        ; $52
	const MAX_ELIXER    ; $53
NUM_ITEMS EQU const_value - 1

; elevator floors use item IDs
	const FLOOR_B2F     ; $54
	const FLOOR_B1F     ; $55
	const FLOOR_1F      ; $56
	const FLOOR_2F      ; $57
	const FLOOR_3F      ; $58
	const FLOOR_4F      ; $59
	const FLOOR_5F      ; $5A
	const FLOOR_6F      ; $5B
	const FLOOR_7F      ; $5C
	const FLOOR_8F      ; $5D
	const FLOOR_9F      ; $5E
	const FLOOR_10F     ; $5F
	const FLOOR_11F     ; $60
	const FLOOR_B4F     ; $61
NUM_FLOORS EQU const_value - 1 - NUM_ITEMS

	const TREE_ROUTE_2  ; 62
	const TREE_CERULEAN_CITY ;63
	const TREE_ROUTE_9  ;64
	const TREE_FUCHSIA_CITY ;65

	const SAFARI_CLASSIC  ; 66
	const SAFARI_RANGER_HUNT ;67
	const SAFARI_FREE_ROAM  ;68

	const_next $C4

; HMs are defined before TMs, so the actual number of TM definitions
; is not yet available. The TM quantity is hard-coded here and must
; match the actual number below.
NUM_TMS EQU 50

__tmhm_value__ = NUM_TMS + 1

add_tmnum: MACRO
\1_TMNUM EQU __tmhm_value__
__tmhm_value__ += 1
ENDM

add_hm: MACRO
; Defines three constants:
; - HM_\1: the item id, starting at $C4
; - \1_TMNUM: the learnable TM/HM flag, starting at 51
; - HM##_MOVE: alias for the move id, equal to the value of \1
	const HM_\1
HM_VALUE = __tmhm_value__ - NUM_TMS
HM{02d:HM_VALUE}_MOVE EQU \1
	add_tmnum \1
ENDM

HM01 EQU const_value
	add_hm CUT          ; $C4
	add_hm FLY          ; $C5
	add_hm SURF         ; $C6
	add_hm STRENGTH     ; $C7
	add_hm FLASH        ; $C8
NUM_HMS EQU const_value - HM01

__tmhm_value__ = 1

add_tm: MACRO
; Defines three constants:
; - TM_\1: the item id, starting at $C9
; - \1_TMNUM: the learnable TM/HM flag, starting at 1
; - TM##_MOVE: alias for the move id, equal to the value of \1
	const TM_\1
TM{02d:__tmhm_value__}_MOVE EQU \1
	add_tmnum \1
ENDM

TM01 EQU const_value
	add_tm ICE_PUNCH   ; $C9
	add_tm RAZOR_WIND   ; $CA
	add_tm LEECH_SEED ; $CB
	add_tm PIN_MISSILE    ; $CC
	add_tm FIRE_PUNCH    ; $CD
	add_tm TOXIC        ; $CE
	add_tm HORN_DRILL   ; $CF
	add_tm BODY_SLAM    ; $D0
	add_tm SLASH    ; $D1
	add_tm DOUBLE_EDGE  ; $D2
	add_tm BUBBLEBEAM   ; $D3
	add_tm AURORA_BEAM    ; $D4
	add_tm ICE_BEAM     ; $D5
	add_tm BLIZZARD     ; $D6
	add_tm HYPER_BEAM   ; $D7
	add_tm AMNESIA      ; $D8
	add_tm HI_JUMP_KICK   ; $D9
	add_tm THUNDERPUNCH      ; $DA
	add_tm ROLLING_KICK ; $DB
	add_tm BARRIER         ; $DC
	add_tm RAZOR_LEAF   ; $DD
	add_tm SOLARBEAM    ; $DE
	add_tm DRAGON_RAGE  ; $DF
	add_tm THUNDERBOLT  ; $E0
	add_tm THUNDER      ; $E1
	add_tm EARTHQUAKE   ; $E2
	add_tm CRABHAMMER	; $E3
	add_tm DIG          ; $E4
	add_tm PSYCHIC_M    ; $E5
	add_tm MEGA_DRAIN     ; $E6
	add_tm KINESIS        ; $E7 FIREWALL
	add_tm SWORDS_DANCE  ; $E8
	add_tm REFLECT      ; $E9
	add_tm BIDE         ; $EA 
	add_tm AGILITY    ; $EB
	add_tm BARRAGE ; $EC
	add_tm FIRE_BLAST     ; $ED
	add_tm FLAMETHROWER   ; $EE
	add_tm SLAM        ; $EF
	add_tm KARATE_CHOP   ; $F0
	add_tm MEDITATE   ; $F1 
	add_tm LOVELY_KISS  ; $F2
	add_tm SKY_ATTACK   ; $F3
	add_tm LIGHT_SCREEN         ; $F4
	add_tm THUNDER_WAVE ; $F5
	add_tm PSYBEAM      ; $F6
	add_tm SLUDGE    ; $F7
	add_tm ROCK_SLIDE   ; $F8
	add_tm GLARE   ; $F9
	add_tm SUBSTITUTE   ; $FA
ASSERT NUM_TMS == const_value - TM01, "NUM_TMS ({d:NUM_TMS}) does not match the number of add_tm definitions"

NUM_TM_HM EQU NUM_TMS + NUM_HMS

; 50 TMs + 5 HMs = 55 learnable TM/HM flags per Pokémon.
; These fit in 7 bytes, with one unused bit left over.
__tmhm_value__ = NUM_TM_HM + 1
UNUSED_TMNUM EQU __tmhm_value__
