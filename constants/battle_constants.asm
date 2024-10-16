DEF MAX_LEVEL EQU 100

; maximum moves known per mon
DEF NUM_MOVES EQU 4

; significant stat values
DEF BASE_STAT_LEVEL EQU 7
DEF MAX_STAT_LEVEL EQU 13

; VitaminStats indexes (see data/battle/stat_names.asm)
	const_def 1
	const STAT_HEALTH
	const STAT_ATTACK
	const STAT_DEFENSE
	const STAT_SPEED
	const STAT_SPECIAL
DEF NUM_STATS EQU const_value - 1

; StatModTextStrings indexes (see data/battle/stat_mod_names.asm)
	const_def
	const MOD_ATTACK
	const MOD_DEFENSE
	const MOD_SPEED
	const MOD_SPECIAL
	const MOD_ACCURACY
	const MOD_EVASION
	const_skip 2
DEF NUM_STAT_MODS EQU const_value

; Moves struct fields (see data/moves/moves.asm)
rsreset
DEF MOVE_ANIM   rb
DEF MOVE_EFFECT rb
DEF MOVE_POWER  rb
DEF MOVE_TYPE   rb
DEF MOVE_ACC    rb
DEF MOVE_PP     rb
DEF MOVE_LENGTH EQU _RS

; battle type constants (wBattleType values)
	const_def
	const BATTLE_TYPE_NORMAL  ; 0
	const BATTLE_TYPE_OLD_MAN ; 1
	const BATTLE_TYPE_SAFARI  ; 2

; damage limits before type effectiveness
DEF MIN_NEUTRAL_DAMAGE EQU 2
DEF MAX_NEUTRAL_DAMAGE EQU 999

; fixed damage constants
DEF SONICBOOM_DAMAGE   EQU 20
;DEF DRAGON_RAGE_DAMAGE EQU 40

; type effectiveness factors, scaled by 10
DEF FOUR_TIMES_EFFECTIVE EQU 40
DEF SUPER_EFFECTIVE    EQU 20
DEF MORE_EFFECTIVE     EQU 15
DEF EFFECTIVE          EQU 10
DEF NOT_VERY_EFFECTIVE EQU 05
DEF NO_EFFECT          EQU 00

; non-volatile statuses
DEF SLP_MASK EQU %111 ; 0-7 turns
	const_def 3
	const PSN ; 3
	const BRN ; 4
	const FRZ ; 5
	const PAR ; 6

DEF MAX_STAT_VALUE EQU 999

; trainer dvs
DEF ATKDEFDV_TRAINER EQU $98
DEF SPDSPCDV_TRAINER EQU $88

; wDamageMultipliers
DEF BIT_STAB_DAMAGE EQU 7
DEF EFFECTIVENESS_MASK EQU %01111111

; wPlayerBattleStatus1 or wEnemyBattleStatus1 bit flags
	const_def
	const DEFENSE_CURLED           ; 0 ; PureRGBnote: CHANGED: used to be bide, now it's for defense curl's super effective move resist
	const THRASHING_ABOUT          ; 1 ; e.g. Thrash, Petal Dance
	const ATTACKING_MULTIPLE_TIMES ; 2 ; e.g. Double Kick, Fury Attack
	const FLINCHED                 ; 3
	const CHARGING_UP              ; 4 ; e.g. Fly/Dig
	const USING_TRAPPING_MOVE      ; 5 ; e.g. Wrap
	const INVULNERABLE             ; 6 ; first turn of Fly/Dig
	const CONFUSED                 ; 7

; wPlayerBattleStatus2 or wEnemyBattleStatus2 bit flags
	const_def
	const USING_X_ACCURACY         ; 0
	const STAT_DOWN_IMMUNITY       ; 1 ; Mist and Guard Spec primary effect
	const GETTING_PUMPED           ; 2 ; Focus Energy
	const PSYCHIC_IMMUNITY         ; 3 ; Haze secondary effect
	const HAS_SUBSTITUTE_UP        ; 4
	const NEEDS_TO_RECHARGE        ; 5 ; Hyper Beam
	const NORMAL_FIGHTING_IMMUNITY ; 6 ; Mist secondary effect
	const SEEDED                   ; 7

; wPlayerBattleStatus3 or wEnemyBattleStatus3 bit flags
	const_def
	const BADLY_POISONED      ; 0 ; Toxic
	const HAS_LIGHT_SCREEN_UP ; 1
	const HAS_REFLECT_UP      ; 2
	const TRANSFORMED         ; 3
	const ALREADY_ACTED		  ; 4 ; PureRGBnote: ADDED: marker for whether an opponent used an item or switched pokemon at the start of a turn
	const BOOSTED_FIREWALL    ; 5 ; PureRGBnote: ADDED: used firewall on a burned opponent once (triggers highest damage state)