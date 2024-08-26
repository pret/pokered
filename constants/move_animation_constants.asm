; special effects that are part of move animations
; SpecialEffectPointers associates them with effect routines (see data/battle_anims/special_effect_pointers.asm)
	const_def $C0
DEF FIRST_SE_ID EQU const_value
	const_skip $E
;;;;;;;;;; PureRGBnote: ADDED: new special effects
	const SE_CROSSHAIR_SCANS_OPPONENT  ; $CF used in Conversion attack mode anim
	const SE_LIGHT_SCREEN_FLASH        ; $D0 used in Teleport
	const SE_SNOWFLAKES_EVERYWHERE     ; $D1 used in Blizzard
	const SE_STATIC_EVERYWHERE         ; $D2 used in Constrict (Static Snag)
	const SE_SMOKE_EVERYWHERE          ; $D3 used in Poison Gas 
	const SE_FIRE_EVERYWHERE           ; $D4 used in Take Down (Heat Rush)
	const SE_SLIDE_ENEMY_MON_DOWN_AND_HIDE   ; $D5 used in Sludge 
	const SE_SLIDE_ENEMY_MON_HALF_OFF  ; $D6 used in Slam 
	const SE_SHAKE_BACK_AND_FORTH_SHORT; $D7 used in Rolling Kick
;;;;;;;;;;
	const SE_WAVY_SCREEN               ; $D8 used in Psywave/Night Shade/Psychic etc.
	const SE_SUBSTITUTE_MON            ; $D9 used in Substitute (turns the pokemon into a mini sprite)
	const SE_SHAKE_BACK_AND_FORTH      ; $DA used in Double Team
	const SE_SLIDE_ENEMY_MON_OFF       ; $DB used in Whirlwind
	const SE_SHOW_ENEMY_MON_PIC        ; $DC used in Seismic Toss
	const SE_SHOW_MON_PIC              ; $DD used in Low Kick/Quick Attack/Seismic Toss etc.
	const SE_BLINK_ENEMY_MON           ; $DE used in Seismic Toss
	const SE_HIDE_ENEMY_MON_PIC        ; $DF used in Seismic Toss
	const SE_WATER_DROPLETS_EVERYWHERE_FAST       ; $E0 ; PureRGBnote: ADDED: used in Hydro Pump
	const SE_DELAY_ANIMATION_10        ; $E1 used in lots of animations
	const SE_SPIRAL_BALLS_INWARD       ; $E2 used in Growth/Focus Energy/Hyper Beam etc.
	const SE_SPIRAL_BALLS_INWARD_FAST  ; $E3 ; PureRGBnote: ADDED: used in Drill Peck and Horn Drill
	const SE_SHAKE_ENEMY_HUD           ; $E4
	const SE_SLIDE_MON_HALF_OFF        ; $E5 used in Softboiled
	const SE_PETALS_FALLING            ; $E6 used in Petal Dance
	const SE_LEAVES_FALLING            ; $E7 used in Razor Leaf
	const SE_TRANSFORM_MON             ; $E8 used in Transform
	const SE_SLIDE_MON_DOWN_AND_HIDE   ; $E9 used in Acid Armor
	const SE_MINIMIZE_MON              ; $EA used in Minimize
	const SE_BOUNCE_UP_AND_DOWN        ; $EB used in Splash
	const SE_SHOOT_MANY_BALLS_UPWARD   ; $EC unused ; PureRGBnote: ADDED: used in Swords Dance, Amnesia
	const SE_SHOOT_BALLS_UPWARD        ; $ED used in Teleport/Sky Attack
	const SE_SQUISH_MON_PIC            ; $EE used in Teleport/Sky Attack
	const SE_HIDE_MON_PIC              ; $EF
	const SE_LIGHT_SCREEN_PALETTE      ; $F0 used in Mist/Double Edge/Absorb/etc.
	const SE_RESET_MON_POSITION        ; $F1 used in Tackle/Body Slam/etc.
	const SE_MOVE_MON_HORIZONTALLY     ; $F2 used in Tackle/Body Slam/etc.
	const SE_BLINK_MON                 ; $F3 used in Recover
	const SE_SLIDE_MON_OFF             ; $F4 used in Seismic Toss/Low Kick/etc.
	const SE_FLASH_MON_PIC             ; $F5
	const SE_SLIDE_MON_DOWN            ; $F6 used in Withdraw/Waterfall/fainting
	const SE_SLIDE_MON_UP              ; $F7 used in Dig/Waterfall/etc.
	const SE_FLASH_SCREEN_LONG         ; $F8 used in Confusion/Psychic/etc.
	const SE_DARKEN_MON_PALETTE        ; $F9 used in Smokescreen/Smog/etc.
	const SE_WATER_DROPLETS_EVERYWHERE ; $FA used in Mist/Surf/Toxic/etc.
	const SE_SHAKE_SCREEN              ; $FB used in Earthquake/Fissure/etc.
	const SE_RESET_SCREEN_PALETTE      ; $FC used in Leer/Thunderpunch/etc.
	const SE_DARK_SCREEN_PALETTE       ; $FD used in Hyper Beam/Thunderpunch/etc.
	const SE_DARK_SCREEN_FLASH         ; $FE used in Cut/Take Down/etc.

; subanimations that are part of move animations
; SubanimationPointers indexes (see data/battle_anims/subanimations.asm)

; The 0 or 1 in the name of a subanim indicates whether to use tileset 0 or 1 data/moves/animations.asm.
; "Both" indicates either can be used for different images using the same animation.
	const_def
	const SUBANIM_0_STAR ; 00
	const SUBANIM_0_STAR_TWICE ; 01
	const SUBANIM_0_STAR_THRICE ; 02
	const SUBANIM_0_STAR_DESCENDING ; 03
	const SUBANIM_1_STAR_BIG_MOVING ; 04
	const SUBANIM_1_STAR_BIG ; 05
	const SUBANIM_0_BALL_TOSS_HIGH ; 06
	const SUBANIM_0_BALL_TOSS_MIDDLE ; 07
	const SUBANIM_0_BALL_TOSS_LOW ; 08
	const SUBANIM_0_BALL_SHAKE_ENEMY ; 09
	const SUBANIM_0_BALL_POOF_ENEMY ; 0A
	const SUBANIM_0_BALL_BLOCK ; 0B
	const SUBANIM_1_FLAME_COLUMN_1 ; 0C
	const SUBANIM_1_FLAME_COLUMN_2 ; 0D
	const SUBANIM_1_FLAME_COLUMN_3 ; 0E
	const SUBANIM_0_SCRATCHES ; 0F
	const SUBANIM_1_TORNADO ; 10
	const SUBANIM_1_FLAMES ; 11
	const SUBANIM_0_HEART_1_MUSIC ; 12
	const SUBANIM_1_BLOB_TOSS ; 13
	const SUBANIM_1_BLOB_DRIP_ENEMY ; 14
	const SUBANIM_1_SHOUT ; 15
	const SUBANIM_0_SLICE ; 16
	const SUBANIM_0_BIRDIES_CIRCLING_ENEMY ; 17
	const SUBANIM_1_SWORDS_CIRCLING ; 18
	const SUBANIM_1_CLOUD_TOSS ; 19
	const SUBANIM_0_WATER_COLUMNS ; 1A
	const SUBANIM_1_SEED_TOSS ; 1B
	const SUBANIM_1_SEED_LAND ; 1C
	const SUBANIM_0_ROCKS_LIFT ; 1D
	const SUBANIM_0_ROCKS_TOSS ; 1E
	const SUBANIM_1_FLAME_BEAM ; 1F
	const SUBANIM_1_FLAME_STAR ; 20
	const SUBANIM_0_CIRCLES_1_SQUARES_CENTERING_ENEMY ; 21
	const SUBANIM_0_CIRCLE_1_SQUARE_TOSS_BACK ; 22
	const SUBANIM_0_BIND ; 23
	const SUBANIM_0_STATUS_PARALYZED ; 24
	const SUBANIM_0_STATUS_CONFUSED ; 25
	const SUBANIM_0_STATUS_CONFUSED_ENEMY ; 26
	const SUBANIM_0_STATUS_POISONED ; 27
	const SUBANIM_1_SAND ; 28
	const SUBANIM_1_LIGHTNING_BALL ; 29
	const SUBANIM_0_SLICE_BOTH_SIDES ; 2A
	const SUBANIM_1_LIGHTNING ; 2B
	const SUBANIM_0_WATER_DROPLETS ; 2C
	const SUBANIM_0_CIRCLES_CENTERING ; 2D
	const SUBANIM_0_BEAM ; 2E
	const SUBANIM_0_ICE_RISE ; 2F
	const SUBANIM_0_ROCKS_FALL_ENEMY ; 30
	const SUBANIM_0_SOUND_WAVE ; 31
	const SUBANIM_0_CIRCLE_1_SQUARE_HALF_TOSS ; unused 32
	const SUBANIM_1_BARRIER ; 33
	const SUBANIM_1_SELFDESTRUCT ; 34
	const SUBANIM_0_WATER_BUBBLES ; 35
	const SUBANIM_0_CIRCLES_FALLING ; 36
	const SUBANIM_0_STRING_SHOT ; 37
	const SUBANIM_0_ICE_FALL ; 38
	const SUBANIM_0_CIRCLE_1_SQUARE_APPEARS ; unused 39
	const SUBANIM_0_STATUS_SLEEP ; 3A
	const SUBANIM_0_STATUS_SLEEP_ENEMY ; 3B
	const SUBANIM_0_WATER_1_FIRE_BARRIER ; 3C
	const SUBANIM_0_WATER_1_FIRE_GEYSER ; unused 3D
	const SUBANIM_1_STAR_BIG_TOSS ; 3E
	const SUBANIM_1_STARS_SMALL_TOSS ; 3F
	const SUBANIM_1_MUSIC_CIRCLING_ENEMY ; 40
	const SUBANIM_1_CIRCLE_BLACK_TOSS ; 41
	const SUBANIM_1_EXPLOSION_SMALL_ENEMY ; 42
	const SUBANIM_0_CIRCLE_1_SQUARE_CLOSING ; 43
	const SUBANIM_1_LEAVES_TOSS ; 44
	const SUBANIM_0_HORN_JAB_TWICE ; 45
	const SUBANIM_0_HORN_JAB_THRICE ; 46
	const SUBANIM_0_BALL_POOF ; 47
	const SUBANIM_2_TRADE_BALL_DROP ; 48
	const SUBANIM_2_TRADE_BALL_SHAKE ; 49
	const SUBANIM_2_TRADE_BALL_APPEAR ; 4A
	const SUBANIM_2_TRADE_BALL_POOF ; 4B
	const SUBANIM_0_EGG_SHAKING ; 4C
	const SUBANIM_1_TRIANGLE_TOSS ; 4D
	const SUBANIM_1_SPHERE_BIG ; 4E
	const SUBANIM_1_SPHERE_BIG_RISE ; 4F
	const SUBANIM_1_SPHERE_BIG_FALL ; 50
	const SUBANIM_0_SHELL ; 51
	const SUBANIM_0_COIN_BOUNCE ; 52
	const SUBANIM_0_SAFARI_ROCK ; 53
	const SUBANIM_0_SAFARI_BAIT ; 54
	const SUBANIM_0_STAR_HIGH ; 55
;;;;;;;;;; PureRGBnote: ADDED: new subanimations
	const SUBANIM_AMNESIA
	const SUBANIM_AMNESIA1
	const SUBANIM_BURN
	const SUBANIM_AMNESIA_ENEMY
	const SUBANIM_AMNESIA1_ENEMY
	const SUBANIM_0_PIN_JAB
	const SUBANIM_0_PIN_MISSILE
	const SUBANIM_0_BARB_JAB
	const SUBANIM_0_SPARKLES_FALLING
	const SUBANIM_0_CIRCLE_SPLITTING
	const SUBANIM_0_SOUND_WAVE_SHOT
	const SUBANIM_2_BONE_TOSS
	const SUBANIM_2_BONE_RECOVER
	const SUBANIM_2_ANGER_SYMBOL
	const SUBANIM_2_ANGER_SYMBOL_ENEMY
;;;;;;;;;;
DEF NUM_SUBANIMS EQU const_value

; types of subanimations
	const_def
	const SUBANIMTYPE_NORMAL
	const SUBANIMTYPE_HVFLIP
	const SUBANIMTYPE_HFLIP
	const SUBANIMTYPE_COORDFLIP
	const SUBANIMTYPE_REVERSE
	const SUBANIMTYPE_ENEMY

; frame blocks that are part of subanimations
; FrameBlockPointers indexes (see data/battle_anims/frame_blocks.asm)
	const_def
	const FRAMEBLOCK_00
	const FRAMEBLOCK_01
	const FRAMEBLOCK_02
	const FRAMEBLOCK_03
	const FRAMEBLOCK_04
	const FRAMEBLOCK_05
	const FRAMEBLOCK_06
	const FRAMEBLOCK_07
	const FRAMEBLOCK_08
	const FRAMEBLOCK_09
	const FRAMEBLOCK_0A
	const FRAMEBLOCK_0B
	const FRAMEBLOCK_0C
	const FRAMEBLOCK_0D
	const FRAMEBLOCK_0E
	const FRAMEBLOCK_0F
	const FRAMEBLOCK_10
	const FRAMEBLOCK_11
	const FRAMEBLOCK_12
	const FRAMEBLOCK_13
	const FRAMEBLOCK_14
	const FRAMEBLOCK_15
	const FRAMEBLOCK_16
	const FRAMEBLOCK_17
	const FRAMEBLOCK_18
	const FRAMEBLOCK_19
	const FRAMEBLOCK_1A
	const FRAMEBLOCK_1B
	const FRAMEBLOCK_1C
	const FRAMEBLOCK_1D
	const FRAMEBLOCK_1E
	const FRAMEBLOCK_1F
	const FRAMEBLOCK_20
	const FRAMEBLOCK_21
	const FRAMEBLOCK_22
	const FRAMEBLOCK_23
	const FRAMEBLOCK_24
	const FRAMEBLOCK_25
	const FRAMEBLOCK_26
	const FRAMEBLOCK_27
	const FRAMEBLOCK_28
	const FRAMEBLOCK_29
	const FRAMEBLOCK_2A
	const FRAMEBLOCK_2B
	const FRAMEBLOCK_2C
	const FRAMEBLOCK_2D
	const FRAMEBLOCK_2E
	const FRAMEBLOCK_2F
	const FRAMEBLOCK_30
	const FRAMEBLOCK_31
	const FRAMEBLOCK_32
	const FRAMEBLOCK_33
	const FRAMEBLOCK_34
	const FRAMEBLOCK_35
	const FRAMEBLOCK_36
	const FRAMEBLOCK_37
	const FRAMEBLOCK_38
	const FRAMEBLOCK_39
	const FRAMEBLOCK_3A
	const FRAMEBLOCK_3B
	const FRAMEBLOCK_3C
	const FRAMEBLOCK_3D
	const FRAMEBLOCK_3E
	const FRAMEBLOCK_3F
	const FRAMEBLOCK_40
	const FRAMEBLOCK_41
	const FRAMEBLOCK_42
	const FRAMEBLOCK_43
	const FRAMEBLOCK_44
	const FRAMEBLOCK_45
	const FRAMEBLOCK_46
	const FRAMEBLOCK_47
	const FRAMEBLOCK_SMALL_BLACK_CIRCLE
	const FRAMEBLOCK_LARGE_BLACK_CIRCLE
	const FRAMEBLOCK_4A
	const FRAMEBLOCK_4B
	const FRAMEBLOCK_4C
	const FRAMEBLOCK_4D
	const FRAMEBLOCK_4E
	const FRAMEBLOCK_4F
	const FRAMEBLOCK_50
	const FRAMEBLOCK_51
	const FRAMEBLOCK_52
	const FRAMEBLOCK_53
	const FRAMEBLOCK_54
	const FRAMEBLOCK_55
	const FRAMEBLOCK_56
	const FRAMEBLOCK_57
	const FRAMEBLOCK_58
	const FRAMEBLOCK_59
	const FRAMEBLOCK_5A
	const FRAMEBLOCK_5B
	const FRAMEBLOCK_5C
	const FRAMEBLOCK_5D
	const FRAMEBLOCK_5E
	const FRAMEBLOCK_5F
	const FRAMEBLOCK_60
	const FRAMEBLOCK_61
	const FRAMEBLOCK_62
	const FRAMEBLOCK_63
	const FRAMEBLOCK_64
	const FRAMEBLOCK_65
	const FRAMEBLOCK_66
	const FRAMEBLOCK_67
	const FRAMEBLOCK_68
	const FRAMEBLOCK_69
	const FRAMEBLOCK_6A
	const FRAMEBLOCK_6B
	const FRAMEBLOCK_6C
	const FRAMEBLOCK_6D
	const FRAMEBLOCK_6E
	const FRAMEBLOCK_6F
	const FRAMEBLOCK_70
	const FRAMEBLOCK_71
	const FRAMEBLOCK_72
	const FRAMEBLOCK_73
	const FRAMEBLOCK_74
	const FRAMEBLOCK_75
	const FRAMEBLOCK_76
	const FRAMEBLOCK_77
	const FRAMEBLOCK_78
	const FRAMEBLOCK_79
	const FRAMEBLOCK_7A
	const FRAMEBLOCK_7B
	const FRAMEBLOCK_7C
	const FRAMEBLOCK_7D
	const FRAMEBLOCK_7E
	const FRAMEBLOCK_7F
DEF NUM_FRAMEBLOCKS EQU const_value

; base coordinates that are part of subanimations
; FrameBlockBaseCoords indexes (see data/battle_anims/base_coords.asm)
	const_def
	const BASECOORD_00
	const BASECOORD_01
	const BASECOORD_02
	const BASECOORD_03
	const BASECOORD_04
	const BASECOORD_05
	const BASECOORD_06
	const BASECOORD_07
	const BASECOORD_08
	const BASECOORD_09
	const BASECOORD_0A
	const BASECOORD_0B
	const BASECOORD_0C
	const BASECOORD_0D
	const BASECOORD_0E
	const BASECOORD_0F
	const BASECOORD_10
	const BASECOORD_11
	const BASECOORD_12
	const BASECOORD_13
	const BASECOORD_14
	const BASECOORD_15
	const BASECOORD_16
	const BASECOORD_17
	const BASECOORD_18
	const BASECOORD_19
	const BASECOORD_1A
	const BASECOORD_1B
	const BASECOORD_1C
	const BASECOORD_1D
	const BASECOORD_1E
	const BASECOORD_1F
	const BASECOORD_20
	const BASECOORD_21
	const BASECOORD_22
	const BASECOORD_23
	const BASECOORD_24
	const BASECOORD_25
	const BASECOORD_26
	const BASECOORD_27
	const BASECOORD_28
	const BASECOORD_29
	const BASECOORD_2A
	const BASECOORD_2B
	const BASECOORD_2C
	const BASECOORD_2D
	const BASECOORD_2E
	const BASECOORD_2F
	const BASECOORD_30
	const BASECOORD_31
	const BASECOORD_32
	const BASECOORD_33
	const BASECOORD_34
	const BASECOORD_35
	const BASECOORD_36
	const BASECOORD_37
	const BASECOORD_38
	const BASECOORD_39
	const BASECOORD_3A
	const BASECOORD_3B
	const BASECOORD_3C
	const BASECOORD_3D
	const BASECOORD_3E
	const BASECOORD_3F
	const BASECOORD_40
	const BASECOORD_41
	const BASECOORD_42
	const BASECOORD_43
	const BASECOORD_44
	const BASECOORD_45
	const BASECOORD_46
	const BASECOORD_47
	const BASECOORD_48
	const BASECOORD_49
	const BASECOORD_4A
	const BASECOORD_4B
	const BASECOORD_4C
	const BASECOORD_4D
	const BASECOORD_4E
	const BASECOORD_4F
	const BASECOORD_50
	const BASECOORD_51
	const BASECOORD_52
	const BASECOORD_53
	const BASECOORD_54
	const BASECOORD_55
	const BASECOORD_56
	const BASECOORD_57
	const BASECOORD_58
	const BASECOORD_59
	const BASECOORD_5A
	const BASECOORD_5B
	const BASECOORD_5C
	const BASECOORD_5D
	const BASECOORD_5E
	const BASECOORD_5F
	const BASECOORD_60
	const BASECOORD_61
	const BASECOORD_62
	const BASECOORD_63
	const BASECOORD_64
	const BASECOORD_65
	const BASECOORD_66
	const BASECOORD_67
	const BASECOORD_68
	const BASECOORD_69
	const BASECOORD_6A
	const BASECOORD_6B
	const BASECOORD_6C
	const BASECOORD_6D
	const BASECOORD_6E
	const BASECOORD_6F
	const BASECOORD_70
	const BASECOORD_71
	const BASECOORD_72
	const BASECOORD_73
	const BASECOORD_74
	const BASECOORD_75
	const BASECOORD_76
	const BASECOORD_77
	const BASECOORD_78
	const BASECOORD_79
	const BASECOORD_7A
	const BASECOORD_7B
	const BASECOORD_7C
	const BASECOORD_7D
	const BASECOORD_7E
	const BASECOORD_7F
	const BASECOORD_80
	const BASECOORD_81
	const BASECOORD_82
	const BASECOORD_83
	const BASECOORD_84
	const BASECOORD_85
	const BASECOORD_86
	const BASECOORD_87
	const BASECOORD_88
	const BASECOORD_89
	const BASECOORD_8A
	const BASECOORD_8B
	const BASECOORD_8C
	const BASECOORD_8D
	const BASECOORD_8E
	const BASECOORD_8F
	const BASECOORD_90
	const BASECOORD_91
	const BASECOORD_92
	const BASECOORD_93
	const BASECOORD_94
	const BASECOORD_95
	const BASECOORD_96
	const BASECOORD_97
	const BASECOORD_98
	const BASECOORD_99
	const BASECOORD_9A
	const BASECOORD_9B
	const BASECOORD_9C
	const BASECOORD_9D
	const BASECOORD_9E
	const BASECOORD_9F
	const BASECOORD_A0
	const BASECOORD_A1
	const BASECOORD_A2
	const BASECOORD_A3
	const BASECOORD_A4
	const BASECOORD_A5
	const BASECOORD_A6
	const BASECOORD_A7
	const BASECOORD_A8
	const BASECOORD_A9
	const BASECOORD_AA
	const BASECOORD_AB
	const BASECOORD_AC
	const BASECOORD_AD
	const BASECOORD_AE
	const BASECOORD_AF
	const BASECOORD_B0
	const BASECOORD_B1
	const BASECOORD_B2
DEF NUM_BASECOORDS EQU const_value

; frame block modes that are part of subanimations
	const_def
	const FRAMEBLOCKMODE_00
	const FRAMEBLOCKMODE_01
	const FRAMEBLOCKMODE_02
	const FRAMEBLOCKMODE_03
	const FRAMEBLOCKMODE_04
