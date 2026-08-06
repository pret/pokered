; SUBANIM_* and SE_* constants use the same series
DEF FIRST_SE_ID EQU $C0

; special effects that are part of move animations
; SpecialEffectPointers associates them with effect routines (see data/battle_anims/special_effect_pointers.asm)
	listable_const_def FIRST_SE_ID
	const_skip $18
	const SE_WAVY_SCREEN               ; $D8 used in Psywave/Night Shade/Psychic etc.
	const SE_SUBSTITUTE_MON            ; $D9 used in Substitute (turns the pokemon into a mini sprite)
	const SE_SHAKE_BACK_AND_FORTH      ; $DA used in Double Team
	const SE_SLIDE_ENEMY_MON_OFF       ; $DB used in Whirlwind
	const SE_SHOW_ENEMY_MON_PIC        ; $DC used in Seismic Toss
	const SE_SHOW_MON_PIC              ; $DD used in Low Kick/Quick Attack/Seismic Toss etc.
	const SE_BLINK_ENEMY_MON           ; $DE used in Seismic Toss
	const SE_HIDE_ENEMY_MON_PIC        ; $DF used in Seismic Toss
	const SE_FLASH_ENEMY_MON_PIC       ; $E0 unused
	const SE_DELAY_ANIMATION_10        ; $E1 used in lots of animations
	const SE_SPIRAL_BALLS_INWARD       ; $E2 used in Growth/Focus Energy/Hyper Beam etc.
	const SE_SHAKE_ENEMY_HUD_2         ; $E3 unused
	const SE_SHAKE_ENEMY_HUD           ; $E4
	const SE_SLIDE_MON_HALF_OFF        ; $E5 used in Softboiled
	const SE_PETALS_FALLING            ; $E6 used in Petal Dance
	const SE_LEAVES_FALLING            ; $E7 used in Razor Leaf
	const SE_TRANSFORM_MON             ; $E8 used in Transform
	const SE_SLIDE_MON_DOWN_AND_HIDE   ; $E9 used in Acid Armor
	const SE_MINIMIZE_MON              ; $EA used in Minimize
	const SE_BOUNCE_UP_AND_DOWN        ; $EB used in Splash
	const SE_SHOOT_MANY_BALLS_UPWARD   ; $EC used in an unused animation
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
	const_def 0, 1, FIRST_SE_ID - 1
	const SUBANIM_0_STAR
	const SUBANIM_0_STAR_TWICE
	const SUBANIM_0_STAR_THRICE
	const SUBANIM_0_STAR_DESCENDING
	const SUBANIM_1_STAR_BIG_MOVING
	const SUBANIM_1_STAR_BIG
	const SUBANIM_0_BALL_TOSS_HIGH
	const SUBANIM_0_BALL_TOSS_MIDDLE
	const SUBANIM_0_BALL_TOSS_LOW
	const SUBANIM_0_BALL_SHAKE_ENEMY
	const SUBANIM_0_BALL_POOF_ENEMY
	const SUBANIM_0_BALL_BLOCK
	const SUBANIM_1_FLAME_COLUMN_1
	const SUBANIM_1_FLAME_COLUMN_2
	const SUBANIM_1_FLAME_COLUMN_3
	const SUBANIM_0_SCRATCHES
	const SUBANIM_1_TORNADO
	const SUBANIM_1_FLAMES
	const SUBANIM_0_HEART_1_MUSIC
	const SUBANIM_1_BLOB_TOSS
	const SUBANIM_1_BLOB_DRIP_ENEMY
	const SUBANIM_1_SHOUT
	const SUBANIM_0_SLICE
	const SUBANIM_0_BIRDIES_CIRCLING_ENEMY
	const SUBANIM_1_SWORDS_CIRCLING
	const SUBANIM_1_CLOUD_TOSS
	const SUBANIM_0_WATER_COLUMNS
	const SUBANIM_1_SEED_TOSS
	const SUBANIM_1_SEED_LAND
	const SUBANIM_0_ROCKS_LIFT
	const SUBANIM_0_ROCKS_TOSS
	const SUBANIM_1_FLAME_BEAM
	const SUBANIM_1_FLAME_STAR
	const SUBANIM_0_CIRCLES_1_SQUARES_CENTERING_ENEMY
	const SUBANIM_0_CIRCLE_1_SQUARE_TOSS_BACK
	const SUBANIM_0_BIND
	const SUBANIM_0_STATUS_PARALYZED
	const SUBANIM_0_STATUS_CONFUSED
	const SUBANIM_0_STATUS_CONFUSED_ENEMY
	const SUBANIM_0_STATUS_POISONED
	const SUBANIM_1_SAND
	const SUBANIM_1_LIGHTNING_BALL
	const SUBANIM_0_SLICE_BOTH_SIDES
	const SUBANIM_1_LIGHTNING
	const SUBANIM_0_WATER_DROPLETS
	const SUBANIM_0_CIRCLES_CENTERING
	const SUBANIM_0_BEAM
	const SUBANIM_0_ICE_RISE
	const SUBANIM_0_ROCKS_FALL_ENEMY
	const SUBANIM_0_SOUND_WAVE
	const SUBANIM_0_CIRCLE_1_SQUARE_HALF_TOSS ; unused
	const SUBANIM_1_BARRIER
	const SUBANIM_1_SELFDESTRUCT
	const SUBANIM_0_WATER_BUBBLES
	const SUBANIM_0_CIRCLES_FALLING
	const SUBANIM_0_STRING_SHOT
	const SUBANIM_0_ICE_FALL
	const SUBANIM_0_CIRCLE_1_SQUARE_APPEARS ; unused
	const SUBANIM_0_STATUS_SLEEP
	const SUBANIM_0_STATUS_SLEEP_ENEMY
	const SUBANIM_0_WATER_1_FIRE_BARRIER ; unused
	const SUBANIM_0_WATER_1_FIRE_GEYSER ; unused
	const SUBANIM_1_STAR_BIG_TOSS
	const SUBANIM_1_STARS_SMALL_TOSS
	const SUBANIM_1_MUSIC_CIRCLING_ENEMY
	const SUBANIM_1_CIRCLE_BLACK_TOSS
	const SUBANIM_1_EXPLOSION_SMALL_ENEMY
	const SUBANIM_0_CIRCLE_1_SQUARE_CLOSING
	const SUBANIM_1_LEAVES_TOSS
	const SUBANIM_0_HORN_JAB_TWICE
	const SUBANIM_0_HORN_JAB_THRICE
	const SUBANIM_0_BALL_POOF
	const SUBANIM_2_TRADE_BALL_DROP
	const SUBANIM_2_TRADE_BALL_SHAKE
	const SUBANIM_2_TRADE_BALL_APPEAR
	const SUBANIM_2_TRADE_BALL_POOF
	const SUBANIM_0_EGG_SHAKING
	const SUBANIM_1_TRIANGLE_TOSS
	const SUBANIM_1_SPHERE_BIG
	const SUBANIM_1_SPHERE_BIG_RISE
	const SUBANIM_1_SPHERE_BIG_FALL
	const SUBANIM_0_SHELL
	const SUBANIM_0_COIN_BOUNCE
	const SUBANIM_0_SAFARI_ROCK
	const SUBANIM_0_SAFARI_BAIT
	const SUBANIM_0_STAR_HIGH
DEF NUM_SUBANIMS EQU const_value

; types of subanimations
	const_def 0, 1, 7 ; (see MACRO subanim in data/battle_anims/subanimations.asm)
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
DEF NUM_BASECOORDS EQU const_value

; frame block modes that are part of subanimations
	const_def
	const FRAMEBLOCKMODE_00
	const FRAMEBLOCKMODE_01
	const FRAMEBLOCKMODE_02
	const FRAMEBLOCKMODE_03
	const FRAMEBLOCKMODE_04
