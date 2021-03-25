MAX_LEVEL EQU 100

NUM_MOVES EQU 4

; VitaminStats indexes (see data/battle/stat_names.asm)
	const_def
	const STAT_HEALTH
	const STAT_ATTACK
	const STAT_DEFENSE
	const STAT_SPEED
	const STAT_SPECIAL
NUM_STATS EQU const_value

; StatModTextStrings indexes (see data/battle/stat_mod_names.asm)
	const_def
	const MOD_ATTACK
	const MOD_DEFENSE
	const MOD_SPEED
	const MOD_SPECIAL
	const MOD_ACCURACY
	const MOD_EVASION
	const_skip 2
NUM_STAT_MODS EQU const_value

; Moves struct fields (see data/moves/moves.asm)
rsreset
MOVE_ANIM   rb
MOVE_EFFECT rb
MOVE_POWER  rb
MOVE_TYPE   rb
MOVE_ACC    rb
MOVE_PP     rb
MOVE_LENGTH EQU _RS

; D733 flags
BIT_TEST_BATTLE EQU 0

; battle type constants (wBattleType values)
	const_def
	const BATTLE_TYPE_NORMAL  ; 0
	const BATTLE_TYPE_OLD_MAN ; 1
	const BATTLE_TYPE_SAFARI  ; 2

; damage limits before type effectiveness
MIN_NEUTRAL_DAMAGE EQU 2
MAX_NEUTRAL_DAMAGE EQU 999

; fixed damage constants
SONICBOOM_DAMAGE   EQU 20
DRAGON_RAGE_DAMAGE EQU 40

; type effectiveness factors, scaled by 10
SUPER_EFFECTIVE    EQU 20
MORE_EFFECTIVE     EQU 15
EFFECTIVE          EQU 10
NOT_VERY_EFFECTIVE EQU 05
NO_EFFECT          EQU 00

; non-volatile statuses
SLP EQU %111 ; sleep counter
	const_def 3
	const PSN ; 3
	const BRN ; 4
	const FRZ ; 5
	const PAR ; 6

MAX_STAT_VALUE EQU 999

; trainer dvs
ATKDEFDV_TRAINER EQU $98
SPDSPCDV_TRAINER EQU $88

; wPlayerBattleStatus1 or wEnemyBattleStatus1 bit flags
	const_def
	const STORING_ENERGY           ; 0 ; Bide
	const THRASHING_ABOUT          ; 1 ; e.g. Thrash
	const ATTACKING_MULTIPLE_TIMES ; 2 ; e.g. Double Kick, Fury Attack
	const FLINCHED                 ; 3
	const CHARGING_UP              ; 4 ; e.g. Solar Beam, Fly
	const USING_TRAPPING_MOVE      ; 5 ; e.g. Wrap
	const INVULNERABLE             ; 6 ; charging up Fly/Dig
	const CONFUSED                 ; 7

; wPlayerBattleStatus2 or wEnemyBattleStatus2 bit flags
	const_def
	const USING_X_ACCURACY    ; 0
	const PROTECTED_BY_MIST   ; 1
	const GETTING_PUMPED      ; 2 ; Focus Energy
	const_skip                ; 3 ; unused
	const HAS_SUBSTITUTE_UP   ; 4
	const NEEDS_TO_RECHARGE   ; 5 ; Hyper Beam
	const USING_RAGE          ; 6
	const SEEDED              ; 7

; wPlayerBattleStatus3 or wEnemyBattleStatus3 bit flags
	const_def
	const BADLY_POISONED      ; 0
	const HAS_LIGHT_SCREEN_UP ; 1
	const HAS_REFLECT_UP      ; 2
	const TRANSFORMED         ; 3
