MACRO move
	db \1 ; animation (interchangeable with move id)
	db \2 ; effect
	db \3 ; power
	db \4 ; type
	db \5 percent ; accuracy
	db \6 ; pp
	ASSERT \6 <= 40, "PP must be 40 or less"
ENDM

Moves:
; Characteristics of each move.
	table_width MOVE_LENGTH
	move POUND,        NO_ADDITIONAL_EFFECT,        40, NORMAL,       100, 35
	move KARATE_CHOP,  NO_ADDITIONAL_EFFECT,        50, FIGHTING,     100, 25
	move DOUBLESLAP,   ATTACK_TWICE_EFFECT,         30, FAIRY,        100, 25
	move COMET_PUNCH,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, NORMAL,        85, 15
	move MEGA_PUNCH,   NO_ADDITIONAL_EFFECT,        80, NORMAL,        90, 20
	move PAY_DAY,      PAY_DAY_EFFECT,              60, NORMAL,       100, 20
	move FIRE_PUNCH,   BURN_SIDE_EFFECT1,           75, FIRE,         100, 15
	move ICE_PUNCH,    FREEZE_SIDE_EFFECT1,         75, ICE,          100, 15
	move THUNDERPUNCH, PARALYZE_SIDE_EFFECT1,       75, ELECTRIC,     100, 15
	move SCRATCH,      NO_ADDITIONAL_EFFECT,        40, NORMAL,       100, 35
	move VICEGRIP,     FLINCH_SIDE_EFFECT1,         60, NORMAL,       100, 30
	move GUILLOTINE,   OHKO_EFFECT,                  1, NORMAL,        30,  5
	move RAZOR_WIND,   CHARGE_EFFECT,               80, NORMAL,       100, 10
	move SWORDS_DANCE, ATTACK_UP2_EFFECT,            0, BIRD,         100, 20
	move CUT,          NO_ADDITIONAL_EFFECT,        55, NORMAL,       100, 30
	move GUST,         NO_ADDITIONAL_EFFECT,        40, FLYING,       100, 35
	move WING_ATTACK,  NO_ADDITIONAL_EFFECT,        60, FLYING,       100, 35
	move WHIRLWIND,    SWITCH_AND_TELEPORT_EFFECT,   0, BIRD,         100, 20
	move FLY,          FLY_EFFECT,                  90, FLYING,        95, 15
	move BIND,         TRAPPING_EFFECT,             25, NORMAL,        90, 20
	move SLAM,         NO_ADDITIONAL_EFFECT,        80, NORMAL,       100, 20
	move VINE_WHIP,    NO_ADDITIONAL_EFFECT,        45, GRASS,        100, 25
	move STOMP,        FLINCH_SIDE_EFFECT2,         65, NORMAL,       100, 20
	move DOUBLE_KICK,  ATTACK_TWICE_EFFECT,         30, FIGHTING,     100, 30
	move MEGA_KICK,    NO_ADDITIONAL_EFFECT,       120, NORMAL,        75,  5
	move JUMP_KICK,    RECOIL_EFFECT,              100, FIGHTING,      95, 15
	move ROLLING_KICK, FLINCH_SIDE_EFFECT2,         70, FIGHTING,     100, 15
	move SAND_ATTACK,  ACCURACY_DOWN1_EFFECT,        0, BIRD,         100, 15
	move HEADBUTT,     FLINCH_SIDE_EFFECT2,         70, NORMAL,       100, 15
	move HORN_ATTACK,  NO_ADDITIONAL_EFFECT,        65, NORMAL,       100, 25
	move FURY_ATTACK,  TWO_TO_FIVE_ATTACKS_EFFECT,  20, NORMAL,       100, 20
	move HORN_DRILL,   OHKO_EFFECT,                  1, NORMAL,        30,  5
	move TACKLE,       NO_ADDITIONAL_EFFECT,        40, NORMAL,       100, 35
	move BODY_SLAM,    PARALYZE_SIDE_EFFECT2,       85, NORMAL,       100, 15
	move WRAP,         TRAPPING_EFFECT,             15, NORMAL,        95, 20
	move TAKE_DOWN,    RECOIL_EFFECT,               90, NORMAL,        90, 20
	move THRASH,       THRASH_PETAL_DANCE_EFFECT,   90, NORMAL,       100, 15
	move DOUBLE_EDGE,  RECOIL_EFFECT,              100, NORMAL,       100, 15
	move TAIL_WHIP,    DEFENSE_DOWN1_EFFECT,         0, BIRD,       100, 30
	move POISON_STING, POISON_SIDE_EFFECT1,         25, POISON,       100, 35
	move TWINEEDLE,    TWINEEDLE_EFFECT,            35, BUG,          100, 20
	move PIN_MISSILE,  TWO_TO_FIVE_ATTACKS_EFFECT,  25, BUG,           95, 20
	move LEER,         DEFENSE_DOWN1_EFFECT,         0, BIRD,       100, 30
	move BITE,         FLINCH_SIDE_EFFECT1,         60, DARK,         100, 25
	move GROWL,        ATTACK_DOWN1_EFFECT,          0, BIRD,         100, 40
	move ROAR,         SWITCH_AND_TELEPORT_EFFECT,   0, BIRD,         100, 20
	move SING,         SLEEP_EFFECT,                 0, BIRD,          55, 15
	move SUPERSONIC,   CONFUSION_EFFECT,             0, BIRD,          55, 20
	move SONICBOOM,    SPECIAL_DAMAGE_EFFECT,        1, NORMAL,       100, 20
	move DISABLE,      DISABLE_EFFECT,               0, BIRD,       100, 20
	move ACID,         DEFENSE_DOWN_SIDE_EFFECT,    40, POISON,       100, 30
	move EMBER,        BURN_SIDE_EFFECT1,           40, FIRE,         100, 25
	move FLAMETHROWER, BURN_SIDE_EFFECT1,           90, FIRE,         100, 15
	move MIST,         MIST_EFFECT,                  0, ICE,          100, 30
	move WATER_GUN,    NO_ADDITIONAL_EFFECT,        40, WATER,        100, 25
	move HYDRO_PUMP,   NO_ADDITIONAL_EFFECT,       110, WATER,         80,  5
	move SURF,         NO_ADDITIONAL_EFFECT,        90, WATER,        100, 15
	move ICE_BEAM,     FREEZE_SIDE_EFFECT1,         90, ICE,          100, 10
	move BLIZZARD,     FREEZE_SIDE_EFFECT1,        110, ICE,           70,  5
	move PSYBEAM,      CONFUSION_SIDE_EFFECT,       65, PSYCHIC_TYPE, 100, 20
	move BUBBLEBEAM,   SPEED_DOWN_SIDE_EFFECT,      65, WATER,        100, 20
	move AURORA_BEAM,  ATTACK_DOWN_SIDE_EFFECT,     65, ICE,          100, 20
	move HYPER_BEAM,   HYPER_BEAM_EFFECT,          150, NORMAL,        90,  5
	move PECK,         NO_ADDITIONAL_EFFECT,        35, FLYING,       100, 35
	move DRILL_PECK,   NO_ADDITIONAL_EFFECT,        80, FLYING,       100, 20
	move SUBMISSION,   RECOIL_EFFECT,               80, FIGHTING,     100, 25
	move LOW_KICK,     FLINCH_SIDE_EFFECT2,         50, FIGHTING,     100, 20
	move COUNTER,      NO_ADDITIONAL_EFFECT,         1, FIGHTING,     100, 20
	move SEISMIC_TOSS, SPECIAL_DAMAGE_EFFECT,        1, FIGHTING,     100, 20
	move STRENGTH,     NO_ADDITIONAL_EFFECT,        80, NORMAL,       100, 15
	move ABSORB,       DRAIN_HP_EFFECT,             20, GRASS,        100, 25
	move MEGA_DRAIN,   DRAIN_HP_EFFECT,             40, GRASS,        100, 15
	move LEECH_SEED,   LEECH_SEED_EFFECT,            0, GRASS,         90, 10
	move GROWTH,       SPECIAL_UP1_EFFECT,           0, BIRD,         100, 40
	move RAZOR_LEAF,   NO_ADDITIONAL_EFFECT,        55, GRASS,         95, 25
	move SOLARBEAM,    CHARGE_EFFECT,              120, GRASS,        100, 10
	move POISONPOWDER, POISON_EFFECT,                0, POISON,        75, 35
	move STUN_SPORE,   PARALYZE_EFFECT,              0, GRASS,         75, 30
	move SLEEP_POWDER, SLEEP_EFFECT,                 0, GRASS,         75, 15
	move PETAL_DANCE,  CONFUSION_SIDE_EFFECT,       90, GRASS,        100, 20
	move STRING_SHOT,  SPEED_DOWN2_EFFECT,           0, BUG,          100, 40
	move DRAGON_RAGE,  SPECIAL_DAMAGE_EFFECT,        1, DRAGON,       100, 10
	move FIRE_SPIN,    TRAPPING_EFFECT,             15, FIRE,          70, 15
	move THUNDERSHOCK, PARALYZE_SIDE_EFFECT1,       40, ELECTRIC,     100, 30
	move THUNDERBOLT,  PARALYZE_SIDE_EFFECT1,       90, ELECTRIC,     100, 15
	move THUNDER_WAVE, PARALYZE_EFFECT,              0, ELECTRIC,      90, 20
	move THUNDER,      PARALYZE_SIDE_EFFECT1,      110, ELECTRIC,      70, 10
	move ROCK_THROW,   NO_ADDITIONAL_EFFECT,        50, ROCK,          65, 15
	move EARTHQUAKE,   NO_ADDITIONAL_EFFECT,        80, GROUND,       100, 10
	move FISSURE,      OHKO_EFFECT,                  1, GROUND,        30,  5
	move DIG,          CHARGE_EFFECT,              100, GROUND,       100, 10
	move TOXIC,        POISON_EFFECT,                0, POISON,        90, 10
	move CONFUSION,    CONFUSION_SIDE_EFFECT,       50, PSYCHIC_TYPE, 100, 25
	move PSYCHIC_M,    SPECIAL_DOWN_SIDE_EFFECT,    90, PSYCHIC_TYPE, 100, 10
	move HYPNOSIS,     SLEEP_EFFECT,                 0, PSYCHIC_TYPE,  60, 20
	move MEDITATE,     ATTACK_UP1_EFFECT,            0, BIRD,         100, 40
	move AGILITY,      SPEED_UP2_EFFECT,             0, BIRD,         100, 30
	move QUICK_ATTACK, NO_ADDITIONAL_EFFECT,        40, NORMAL,       100, 30
	move RAGE,         RAGE_EFFECT,                 20, NORMAL,       100, 20
	move TELEPORT,     SWITCH_AND_TELEPORT_EFFECT,   0, PSYCHIC_TYPE, 100, 20
	move NIGHT_SHADE,  SPECIAL_DAMAGE_EFFECT,        0, GHOST,        100, 15
	move MIMIC,        MIMIC_EFFECT,                 0, BIRD,       100, 10
	move SCREECH,      DEFENSE_DOWN2_EFFECT,         0, BIRD,        85, 40
	move DOUBLE_TEAM,  EVASION_UP1_EFFECT,           0, BIRD,       100, 15
	move RECOVER,      HEAL_EFFECT,                  0, BIRD,       100,  5
	move HARDEN,       DEFENSE_UP1_EFFECT,           0, BIRD,       100, 30
	move MINIMIZE,     EVASION_UP2_EFFECT,           0, BIRD,       100, 10
	move SMOKESCREEN,  ACCURACY_DOWN1_EFFECT,        0, BIRD,       100, 20
	move CONFUSE_RAY,  CONFUSION_EFFECT,             0, GHOST,        100, 10
	move WITHDRAW,     DEFENSE_UP1_EFFECT,           0, BIRD,         100, 40
	move DEFENSE_CURL, DEFENSE_UP1_EFFECT,           0, BIRD,         100, 40
	move BARRIER,      DEFENSE_UP2_EFFECT,           0, BIRD,         100, 20
	move LIGHT_SCREEN, LIGHT_SCREEN_EFFECT,          0, BIRD,         100, 30
	move HAZE,         HAZE_EFFECT,                  0, BIRD,         100, 30
	move REFLECT,      REFLECT_EFFECT,               0, BIRD,         100, 20
	move FOCUS_ENERGY, FOCUS_ENERGY_EFFECT,          0, BIRD,         100, 30
	move BIDE,         BIDE_EFFECT,                  0, BIRD,         100, 10
	move METRONOME,    METRONOME_EFFECT,             0, BIRD,         100, 10
	move MIRROR_MOVE,  MIRROR_MOVE_EFFECT,           0, FLYING,       100, 20
	move SELFDESTRUCT, EXPLODE_EFFECT,             130, NORMAL,       100,  5
	move EGG_BOMB,     NO_ADDITIONAL_EFFECT,       100, NORMAL,        75, 10
	move LICK,         PARALYZE_SIDE_EFFECT2,       30, GHOST,        100, 30
	move SMOG,         POISON_SIDE_EFFECT2,         30, POISON,        70, 20
	move SLUDGE,       POISON_SIDE_EFFECT2,         65, POISON,       100, 20
	move BONE_CLUB,    FLINCH_SIDE_EFFECT1,         65, GROUND,        85, 20
	move FIRE_BLAST,   BURN_SIDE_EFFECT2,          110, FIRE,          85,  5
	move WATERFALL,    FLINCH_SIDE_EFFECT2,         80, WATER,        100, 15
	move CLAMP,        TRAPPING_EFFECT,             35, WATER,         85, 15
	move SWIFT,        SWIFT_EFFECT,                60, NORMAL,       100, 20
	move SKULL_BASH,   CHARGE_EFFECT,              130, NORMAL,       100, 10
	move SPIKE_CANNON, TWO_TO_FIVE_ATTACKS_EFFECT,  20, NORMAL,       100, 15
	move CONSTRICT,    SPEED_DOWN_SIDE_EFFECT,      10, NORMAL,       100, 35
	move AMNESIA,      SPECIAL_UP2_EFFECT,           0, BIRD,         100, 20
	move KINESIS,      ACCURACY_DOWN1_EFFECT,        0, BIRD,          80, 15
	move SOFTBOILED,   HEAL_EFFECT,                  0, BIRD,         100,  5
	move HI_JUMP_KICK, RECOIL_EFFECT,              130, FIGHTING,      90, 10
	move GLARE,        PARALYZE_EFFECT,              0, BIRD,       100, 30
	move DREAM_EATER,  DREAM_EATER_EFFECT,         100, PSYCHIC_TYPE, 100, 15
	move POISON_GAS,   POISON_EFFECT,                0, POISON,        90, 40
	move BARRAGE,      TWO_TO_FIVE_ATTACKS_EFFECT,  15, NORMAL,        85, 20
	move LEECH_LIFE,   DRAIN_HP_EFFECT,             20, BUG,          100, 15
	move LOVELY_KISS,  SLEEP_EFFECT,                 0, BIRD,        75, 10
	move SKY_ATTACK,   CHARGE_EFFECT,              140, FLYING,        90,  5
	move TRANSFORM,    TRANSFORM_EFFECT,             0, BIRD,       100, 10
	move BUBBLE,       SPEED_DOWN_SIDE_EFFECT,      40, WATER,        100, 30
	move DIZZY_PUNCH,  NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 10
	move SPORE,        SLEEP_EFFECT,                 0, GRASS,        100, 15
	move FLASH,        ACCURACY_DOWN1_EFFECT,        0, BIRD,       100, 20
	move PSYWAVE,      SPECIAL_DAMAGE_EFFECT,        1, PSYCHIC_TYPE, 100, 15
	move SPLASH,       SPLASH_EFFECT,                0, NORMAL,       100, 40
	move ACID_ARMOR,   DEFENSE_UP2_EFFECT,           0, POISON,       100, 20
	move CRABHAMMER,   NO_ADDITIONAL_EFFECT,       100, WATER,         90, 10
	move EXPLOSION,    EXPLODE_EFFECT,             170, NORMAL,       100,  5
	move FURY_SWIPES,  TWO_TO_FIVE_ATTACKS_EFFECT,  18, NORMAL,       100, 15
	move BONEMERANG,   ATTACK_TWICE_EFFECT,         50, GROUND,        90, 10
	move REST,         HEAL_EFFECT,                  0, BIRD, 100,  5
	move ROCK_SLIDE,   FLINCH_SIDE_EFFECT1,         75, ROCK,          90, 10
	move HYPER_FANG,   FLINCH_SIDE_EFFECT1,         80, NORMAL,        90, 15
	move SHARPEN,      ATTACK_UP1_EFFECT,            0, BIRD,       100, 30
	move CONVERSION,   CONVERSION_EFFECT,            0, BIRD,       100, 30
	move TRI_ATTACK,   NO_ADDITIONAL_EFFECT,        80, NORMAL,       100, 10
	move SUPER_FANG,   SUPER_FANG_EFFECT,            1, NORMAL,        90, 10
	move SLASH,        NO_ADDITIONAL_EFFECT,        70, NORMAL,       100, 20
	move SUBSTITUTE,   SUBSTITUTE_EFFECT,            0, BIRD,       100, 10
   
; New moves go here
    move EXTREMESPEED, NO_ADDITIONAL_EFFECT,        80, NORMAL,       100,  5

	move MACH_PUNCH,   NO_ADDITIONAL_EFFECT,        40, FIGHTING,     100, 30
	move SUPERPOWER,   ATTACK_DEFENSE_SELFDOWN1,   120, FIGHTING,     100,  5
	move CLOSE_COMBAT, DEFENSE_SPECIAL_SELFDOWN1,  120, FIGHTING,     100,  5
	move DRAIN_PUNCH,  DRAIN_HP_EFFECT,             75, FIGHTING,     100, 10

    move ROOST,	       HEAL_EFFECT,	                 0,	FLYING,	      100,  5
	move AIR_CUTTER,   NO_ADDITIONAL_EFFECT,	    60,	FLYING,	       95, 25
	move AERIAL_ACE,   SWIFT_EFFECT,	            60,	FLYING,	      100, 20
	move AIR_SLASH,	   FLINCH_SIDE_EFFECT2,	        75,	FLYING,	       95, 15
	move BRAVE_BIRD,   RECOIL_EFFECT,	           120,	FLYING,	      100, 15
	move HURRICANE,	   CONFUSION_SIDE_EFFECT,	   120,	FLYING,	       70, 10

	move SLUDGE_BOMB,  POISON_SIDE_EFFECT2,         90, POISON,       100, 10
	move POISON_JAB,   POISON_SIDE_EFFECT2,         80, POISON,       100, 15

	move MUD_SLAP,     ACCURACY_DOWN1_EFFECT,       20, GROUND,       100, 10
	move MUD_SHOT,     SPEED_DOWN1_EFFECT,          55, GROUND,        95, 15
	move EARTH_POWER,  SPECIAL_DOWN_SIDE_EFFECT,    90, GROUND,       100, 10
	move DRILL_RUN,    NO_ADDITIONAL_EFFECT,        80, GROUND,        95, 10

	move ROCK_TOMB,    SPEED_DOWN1_EFFECT,          60, ROCK,         95,  15
	move HEAD_SMASH,   RECOIL_EFFECT,              150, ROCK,         70,   5
	move STONE_EDGE,   NO_ADDITIONAL_EFFECT,       100, ROCK,         80,   5

	move BUG_BITE,     NO_ADDITIONAL_EFFECT,        60, BUG,          100, 25
	move X_SCISSOR,    NO_ADDITIONAL_EFFECT,        80, BUG,          100, 15
	move INFESTATION,  TRAPPING_EFFECT,             20, BUG,           80, 20

	move SHADOW_BALL,  SPECIAL_DOWN_SIDE_EFFECT,    80,	GHOST,	      100, 15 
	move SHADOW_PUNCH, SWIFT_EFFECT,	            60,	GHOST,	      100, 20 
	move SHADOW_SNEAK, NO_ADDITIONAL_EFFECT,	    40,	GHOST,	      100, 30 
	move SHADOW_CLAW,  NO_ADDITIONAL_EFFECT,	    70,	GHOST,	      100, 15 

    move IRON_TAIL,    DEFENSE_DOWN_SIDE_EFFECT,   100, STEEL,	       75, 15 
	move SMART_STRIKE, SWIFT_EFFECT,                70, STEEL,        100, 10
	move BULLET_PUNCH, NO_ADDITIONAL_EFFECT,	    40,	STEEL,	      100, 30 
	move FLASH_CANNON, SPECIAL_DOWN_SIDE_EFFECT,	80, STEEL, 		  100, 10 
	move IRON_HEAD,    FLINCH_SIDE_EFFECT2,         80, STEEL,        100, 15


    move WILL_O_WISP,  BURN_EFFECT,	     			 0,	FIRE,	       85, 15 
	move FLARE_BLITZ,  RECOIL_EFFECT,	           120,	FIRE,	      100, 15 
	move BLAST_BURN,   HYPER_BEAM_EFFECT,	       150,	FIRE,	       90,  5  
	move HEAT_WAVE,    BURN_SIDE_EFFECT1,          100, FIRE,          90, 10 

    move WATER_PULSE,  CONFUSION_SIDE_EFFECT,	    60,	WATER,	      100, 20 
	move AQUA_JET,     NO_ADDITIONAL_EFFECT,	    40,	WATER,	      100, 20 
	move SCALD,        BURN_SIDE_EFFECT2,           80,	WATER,	      100, 15 
	move HYDRO_CANNON, HYPER_BEAM_EFFECT,          150,	WATER,	       90,  5  

    move GIGA_DRAIN,   DRAIN_HP_EFFECT,	            75,	GRASS,        100, 10 
	move MAGICAL_LEAF, SWIFT_EFFECT,	            60,	GRASS,        100, 20 
	move BULLET_SEED,  TWO_TO_FIVE_ATTACKS_EFFECT,  25,	GRASS,        100, 30 
	move LEAF_STORM,   SPECIAL_SELFDOWN2,	   	   130, GRASS,         90,  5  
	move ENERGY_BALL,  SPECIAL_DOWN_SIDE_EFFECT,    90,	GRASS,        100, 10 
	move FRENZY_PLANT, HYPER_BEAM_EFFECT,	       150,	GRASS,         90,  5  

;	move ZAP_CANNON,   PARALYZE_EFFECT,            120, ELECTRIC,      50,  5
	move SHOCK_WAVE,   SWIFT_EFFECT,                60, ELECTRIC,     100, 20
	move WILD_CHARGE,  RECOIL_EFFECT,               90, ELECTRIC,     100, 15
	move VOLT_TACKLE,  RECOIL_EFFECT,              120, ELECTRIC,     100, 15

    move ZEN_HEADBUTT, FLINCH_SIDE_EFFECT2,	        80,	PSYCHIC_TYPE,  90, 15 
	move PSYCHO_CUT,   NO_ADDITIONAL_EFFECT,	    70,	PSYCHIC_TYPE, 100, 20 

    move ICICLE_SPEAR, TWO_TO_FIVE_ATTACKS_EFFECT,  25,	ICE,	      100, 30 
	move ICICLE_CRASH, FLINCH_SIDE_EFFECT2,	        85,	ICE,	       90, 10 
    move POWDER_SNOW,  FREEZE_SIDE_EFFECT1,         40, ICE,          100, 25    

    move TWISTER,	   FLINCH_SIDE_EFFECT2,	        40,	DRAGON,	      100, 20 
	move DRAGONBREATH, PARALYZE_SIDE_EFFECT2,	    60,	DRAGON,	      100, 20 
	move OUTRAGE,	   THRASH_PETAL_DANCE_EFFECT,  120,	DRAGON,	      100, 10 
	move DRAGON_CLAW,  NO_ADDITIONAL_EFFECT,	    80,	DRAGON,	      100, 15
	move DRACO_METEOR, SPECIAL_SELFDOWN2,          130, DRAGON,        90,  5 

    move FEINT_ATTACK, SWIFT_EFFECT,	            60,	DARK,	      100, 20 
	move CRUNCH,	   SPECIAL_DOWN_SIDE_EFFECT,    80,	DARK,	      100, 15 
	move NIGHT_SLASH,  NO_ADDITIONAL_EFFECT,	    70,	DARK,	      100, 15 
	move DARK_PULSE,   FLINCH_SIDE_EFFECT2,	        80,	DARK,	      100, 15

    move CHARM,	       ATTACK_DOWN2_EFFECT,	         0,	BIRD,	      100, 20 
	move DRAININGKISS, DRAIN_HP_EFFECT,	            50,	FAIRY,	      100, 10 
	move PLAY_ROUGH,   ATTACK_DOWN_SIDE_EFFECT,     90,	FAIRY,	       90, 10 
	move MOONBLAST,	   SPECIAL_DOWN_SIDE_EFFECT,	95,	FAIRY,	      100, 15
	move DAZZLE_GLEAM, NO_ADDITIONAL_EFFECT,        80, FAIRY,        100, 10

; more additional moves, mainly signatures
    move DBLIRONBASH,  ATTACK_TWICE_EFFECT,         60, STEEL,        100,  5
    move DRAGONHAMMER, NO_ADDITIONAL_EFFECT,        90, DRAGON,       100, 15

	move FREEZINGLARE, FREEZE_SIDE_EFFECT1,         90, PSYCHIC_TYPE, 100, 10
	move TUNDERUSKICK, DEFENSE_DOWN1_EFFECT,        90, FIGHTING,     100, 10
	move FIERY_WRATH, FLINCH_SIDE_EFFECT2,         90, DARK,         100, 10

; struggle
	move STRUGGLE,     RECOIL_EFFECT,               50, BIRD,         100, 10
	assert_table_length NUM_ATTACKS
