; base data struct members (see data/pokemon/base_stats/*.asm)
rsreset
DEF BASE_DEX_NO      rb
DEF BASE_STATS       rb NUM_STATS
rsset BASE_STATS
DEF BASE_HP          rb
DEF BASE_ATK         rb
DEF BASE_DEF         rb
DEF BASE_SPD         rb
DEF BASE_SPC         rb
DEF BASE_TYPES       rw
rsset BASE_TYPES
DEF BASE_TYPE_1      rb
DEF BASE_TYPE_2      rb
DEF BASE_CATCH_RATE  rb
DEF BASE_EXP         rb
DEF BASE_PIC_SIZE    rb
DEF BASE_FRONTPIC    rw
DEF BASE_BACKPIC     rw
DEF BASE_MOVES       rb NUM_MOVES
DEF BASE_GROWTH_RATE rb
DEF BASE_TMHM        rb (NUM_TM_HM + 7) / 8
                     rb_skip
DEF BASE_DATA_SIZE EQU _RS

; party_struct members (see macros/ram.asm)
rsreset
DEF MON_SPECIES    rb
DEF MON_HP         rw
DEF MON_BOX_LEVEL  rb
DEF MON_STATUS     rb
DEF MON_TYPE       rw
rsset MON_TYPE
DEF MON_TYPE1      rb
DEF MON_TYPE2      rb
DEF MON_CATCH_RATE rb
DEF MON_MOVES      rb NUM_MOVES
DEF MON_OTID       rw
DEF MON_EXP        rb 3
DEF MON_HP_EXP     rw
DEF MON_ATK_EXP    rw
DEF MON_DEF_EXP    rw
DEF MON_SPD_EXP    rw
DEF MON_SPC_EXP    rw
DEF MON_DVS        rw
DEF MON_PP         rb NUM_MOVES
DEF BOXMON_STRUCT_LENGTH EQU _RS ; $21
DEF MON_LEVEL      rb
DEF MON_STATS      rw NUM_STATS
rsset MON_STATS
DEF MON_MAXHP      rw
DEF MON_ATK        rw
DEF MON_DEF        rw
DEF MON_SPD        rw
DEF MON_SPC        rw
DEF PARTYMON_STRUCT_LENGTH EQU _RS ; $2c

DEF PARTY_LENGTH EQU 6

DEF MONS_PER_BOX EQU 20
DEF NUM_BOXES    EQU 12

DEF HOF_MON           EQU $10
DEF HOF_TEAM          EQU PARTY_LENGTH * HOF_MON
DEF HOF_TEAM_CAPACITY EQU 50

; mon data locations
; Note that some values are not supported by all functions that use these values.
	const_def
	const PLAYER_PARTY_DATA ; 0
	const ENEMY_PARTY_DATA  ; 1
	const BOX_DATA          ; 2
	const DAYCARE_DATA      ; 3
	const BATTLE_MON_DATA   ; 4

; Evolution types
	const_def 1
	const EVOLVE_LEVEL ; 1
	const EVOLVE_ITEM  ; 2
	const EVOLVE_TRADE ; 3

; evolution data (see data/pokemon/evos_moves.asm)
DEF NUM_EVOS_IN_BUFFER EQU 3

; wMonHGrowthRate values
; GrowthRateTable indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW
DEF NUM_GROWTH_RATES EQU const_value

; wild data (see data/wild/maps/*.asm)
DEF NUM_WILDMONS EQU 10
DEF WILDDATA_LENGTH EQU 1 + NUM_WILDMONS * 2

; PP in box_struct (see macros/ram.asm)
DEF PP_UP_MASK EQU %11000000 ; number of PP Up used
DEF PP_MASK    EQU %00111111 ; currently remaining PP
