; base data struct members (see data/pokemon/base_stats/*.asm)
rsreset
BASE_DEX_NO      rb
BASE_STATS       rb NUM_STATS
rsset BASE_STATS
BASE_HP          rb
BASE_ATK         rb
BASE_DEF         rb
BASE_SPD         rb
BASE_SPC         rb
BASE_TYPES       rw
rsset BASE_TYPES
BASE_TYPE_1      rb
BASE_TYPE_2      rb
BASE_CATCH_RATE  rb
BASE_EXP         rb
BASE_PIC_SIZE    rb
BASE_FRONTPIC    rw
BASE_BACKPIC     rw
BASE_MOVES       rb NUM_MOVES
BASE_GROWTH_RATE rb
BASE_TMHM        rb (NUM_TM_HM + 7) / 8
                 rb_skip
BASE_DATA_SIZE EQU _RS


PARTY_LENGTH EQU 6

MONS_PER_BOX EQU 20
NUM_BOXES    EQU 12

HOF_MON           EQU $10
HOF_TEAM          EQU PARTY_LENGTH * HOF_MON
HOF_TEAM_CAPACITY EQU 50


; mon data locations
; Note that some values are not supported by all functions that use these values.
	const_def
	const PLAYER_PARTY_DATA ; 0
	const ENEMY_PARTY_DATA  ; 1
	const BOX_DATA          ; 2
	const DAYCARE_DATA      ; 3
	const BATTLE_MON_DATA   ; 4


; See data/pokemon/evos_moves.asm

; Evolution types
	const_def 1
	const EV_LEVEL ; 1
	const EV_ITEM  ; 2
	const EV_TRADE ; 3

MAX_EVOLUTIONS EQU 3
EVOLUTION_SIZE EQU 4


; wMonHGrowthRate values
; GrowthRateTable indexes (see data/growth_rates.asm)
	const_def
	const GROWTH_MEDIUM_FAST
	const GROWTH_SLIGHTLY_FAST
	const GROWTH_SLIGHTLY_SLOW
	const GROWTH_MEDIUM_SLOW
	const GROWTH_FAST
	const GROWTH_SLOW
NUM_GROWTH_RATES EQU const_value

; wild data (see data/wild/maps/*.asm)
NUM_WILDMONS EQU 10
WILDDATA_LENGTH EQU 1 + NUM_WILDMONS * 2
