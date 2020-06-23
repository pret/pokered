; Format: Special Effect ID (1 byte), Address (2 bytes)
SpecialEffectPointers:
	db SE_DARK_SCREEN_FLASH ; $FE
	dw AnimationFlashScreen
	db SE_DARK_SCREEN_PALETTE ; $FD
	dw AnimationDarkScreenPalette
	db SE_RESET_SCREEN_PALETTE ; $FC
	dw AnimationResetScreenPalette
	db SE_SHAKE_SCREEN ; $FB
	dw AnimationShakeScreen
	db SE_WATER_DROPLETS_EVERYWHERE ; $FA
	dw AnimationWaterDropletsEverywhere
	db SE_DARKEN_MON_PALETTE ; $F9
	dw AnimationDarkenMonPalette
	db SE_FLASH_SCREEN_LONG ; $F8
	dw AnimationFlashScreenLong
	db SE_SLIDE_MON_UP ; $F7
	dw AnimationSlideMonUp
	db SE_SLIDE_MON_DOWN ; $F6
	dw AnimationSlideMonDown
	db SE_FLASH_MON_PIC ; $F5
	dw AnimationFlashMonPic
	db SE_SLIDE_MON_OFF ; $F4
	dw AnimationSlideMonOff
	db SE_BLINK_MON ; $F3
	dw AnimationBlinkMon
	db SE_MOVE_MON_HORIZONTALLY ; $F2
	dw AnimationMoveMonHorizontally
	db SE_RESET_MON_POSITION ; $F1
	dw AnimationResetMonPosition
	db SE_LIGHT_SCREEN_PALETTE ; $F0
	dw AnimationLightScreenPalette
	db SE_HIDE_MON_PIC ; $EF
	dw AnimationHideMonPic
	db SE_SQUISH_MON_PIC ; $EE
	dw AnimationSquishMonPic
	db SE_SHOOT_BALLS_UPWARD ; $ED
	dw AnimationShootBallsUpward
	db SE_SHOOT_MANY_BALLS_UPWARD ; $EC
	dw AnimationShootManyBallsUpward
	db SE_BOUNCE_UP_AND_DOWN ; $EB
	dw AnimationBoundUpAndDown
	db SE_MINIMIZE_MON ; $EA
	dw AnimationMinimizeMon
	db SE_SLIDE_MON_DOWN_AND_HIDE ; $E9
	dw AnimationSlideMonDownAndHide
	db SE_TRANSFORM_MON ; $E8
	dw AnimationTransformMon
	db SE_LEAVES_FALLING ; $E7
	dw AnimationLeavesFalling
	db SE_PETALS_FALLING ; $E6
	dw AnimationPetalsFalling
	db SE_SLIDE_MON_HALF_OFF ; $E5
	dw AnimationSlideMonHalfOff
	db SE_SHAKE_ENEMY_HUD ; $E4
	dw AnimationShakeEnemyHUD
	db SE_SHAKE_ENEMY_HUD_2 ; unused--same pointer as SE_SHAKE_ENEMY_HUD ($E4)
	dw AnimationShakeEnemyHUD
	db SE_SPIRAL_BALLS_INWARD ; $E2
	dw AnimationSpiralBallsInward
	db SE_DELAY_ANIMATION_10 ; $E1
	dw AnimationDelay10
	db SE_FLASH_ENEMY_MON_PIC ; unused--same as SE_FLASH_MON_PIC ($F5), but for the enemy mon
	dw AnimationFlashEnemyMonPic
	db SE_HIDE_ENEMY_MON_PIC ; $DF
	dw AnimationHideEnemyMonPic
	db SE_BLINK_ENEMY_MON ; $DE
	dw AnimationBlinkEnemyMon
	db SE_SHOW_MON_PIC ; $DD
	dw AnimationShowMonPic
	db SE_SHOW_ENEMY_MON_PIC ; $DC
	dw AnimationShowEnemyMonPic
	db SE_SLIDE_ENEMY_MON_OFF ; $DB
	dw AnimationSlideEnemyMonOff
	db SE_SHAKE_BACK_AND_FORTH ; $DA
	dw AnimationShakeBackAndForth
	db SE_SUBSTITUTE_MON ; $D9
	dw AnimationSubstitute
	db SE_WAVY_SCREEN ; $D8
	dw AnimationWavyScreen
	db $FF
