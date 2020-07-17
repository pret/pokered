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
