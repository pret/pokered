; special effects that are part of move animations
	const_def $C0
FIRST_SE_ID EQU const_value
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
	const_def
	const SUBANIM_00
	const SUBANIM_01
	const SUBANIM_02
	const SUBANIM_03
	const SUBANIM_04
	const SUBANIM_05
	const SUBANIM_06
	const SUBANIM_07
	const SUBANIM_08
	const SUBANIM_09
	const SUBANIM_0A
	const SUBANIM_0B
	const SUBANIM_0C
	const SUBANIM_0D
	const SUBANIM_0E
	const SUBANIM_0F
	const SUBANIM_10
	const SUBANIM_11
	const SUBANIM_12
	const SUBANIM_13
	const SUBANIM_14
	const SUBANIM_15
	const SUBANIM_16
	const SUBANIM_17
	const SUBANIM_18
	const SUBANIM_19
	const SUBANIM_1A
	const SUBANIM_1B
	const SUBANIM_1C
	const SUBANIM_1D
	const SUBANIM_1E
	const SUBANIM_1F
	const SUBANIM_20
	const SUBANIM_21
	const SUBANIM_22
	const SUBANIM_23
	const SUBANIM_24
	const SUBANIM_25
	const SUBANIM_26
	const SUBANIM_27
	const SUBANIM_28
	const SUBANIM_29
	const SUBANIM_2A
	const SUBANIM_2B
	const SUBANIM_2C
	const SUBANIM_2D
	const SUBANIM_2E
	const SUBANIM_2F
	const SUBANIM_30
	const SUBANIM_31
	const SUBANIM_32
	const SUBANIM_33
	const SUBANIM_34
	const SUBANIM_35
	const SUBANIM_36
	const SUBANIM_37
	const SUBANIM_38
	const SUBANIM_39
	const SUBANIM_3A
	const SUBANIM_3B
	const SUBANIM_3C
	const SUBANIM_3D
	const SUBANIM_3E
	const SUBANIM_3F
	const SUBANIM_40
	const SUBANIM_41
	const SUBANIM_42
	const SUBANIM_43
	const SUBANIM_44
	const SUBANIM_45
	const SUBANIM_46
	const SUBANIM_47
	const SUBANIM_48
	const SUBANIM_49
	const SUBANIM_4A
	const SUBANIM_4B
	const SUBANIM_4C
	const SUBANIM_4D
	const SUBANIM_4E
	const SUBANIM_4F
	const SUBANIM_50
	const SUBANIM_51
	const SUBANIM_52
	const SUBANIM_53
	const SUBANIM_54
	const SUBANIM_55

; types of subanimations
	const_def
	const SUBANIMTYPE_NORMAL
	const SUBANIMTYPE_HVFLIP
	const SUBANIMTYPE_HFLIP
	const SUBANIMTYPE_COORDFLIP
	const SUBANIMTYPE_REVERSE
	const SUBANIMTYPE_ENEMY

; frame blocks that are part of subanimations
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
