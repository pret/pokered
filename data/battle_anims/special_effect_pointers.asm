MACRO special_effect
	db \1
	dw \2
ENDM

SpecialEffectPointers:
	; special effect id, effect routine address
	special_effect SE_DARK_SCREEN_FLASH,         AnimationFlashScreen             ; $FE
	special_effect SE_DARK_SCREEN_PALETTE,       AnimationDarkScreenPalette       ; $FD
	special_effect SE_RESET_SCREEN_PALETTE,      AnimationResetScreenPalette      ; $FC
	special_effect SE_SHAKE_SCREEN,              AnimationShakeScreen             ; $FB
	special_effect SE_WATER_DROPLETS_EVERYWHERE, AnimationWaterDropletsEverywhere ; $FA
	special_effect SE_DARKEN_MON_PALETTE,        AnimationDarkenMonPalette        ; $F9
	special_effect SE_FLASH_SCREEN_LONG,         AnimationFlashScreenLong         ; $F8
	special_effect SE_SLIDE_MON_UP,              AnimationSlideMonUp              ; $F7
	special_effect SE_SLIDE_MON_DOWN,            AnimationSlideMonDown            ; $F6
	special_effect SE_FLASH_MON_PIC,             AnimationFlashMonPic             ; $F5
	special_effect SE_SLIDE_MON_OFF,             AnimationSlideMonOff             ; $F4
	special_effect SE_BLINK_MON,                 AnimationBlinkMon                ; $F3
	special_effect SE_MOVE_MON_HORIZONTALLY,     AnimationMoveMonHorizontally     ; $F2
	special_effect SE_RESET_MON_POSITION,        AnimationResetMonPosition        ; $F1
	special_effect SE_LIGHT_SCREEN_PALETTE,      AnimationLightScreenPalette      ; $F0
	special_effect SE_HIDE_MON_PIC,              AnimationHideMonPic              ; $EF
	special_effect SE_SQUISH_MON_PIC,            AnimationSquishMonPic            ; $EE
	special_effect SE_SHOOT_BALLS_UPWARD,        AnimationShootBallsUpward        ; $ED
	special_effect SE_SHOOT_MANY_BALLS_UPWARD,   AnimationShootManyBallsUpward    ; $EC
	special_effect SE_BOUNCE_UP_AND_DOWN,        AnimationBoundUpAndDown          ; $EB
	special_effect SE_MINIMIZE_MON,              AnimationMinimizeMon             ; $EA
	special_effect SE_SLIDE_MON_DOWN_AND_HIDE,   AnimationSlideMonDownAndHide     ; $E9
	special_effect SE_TRANSFORM_MON,             AnimationTransformMon            ; $E8
	special_effect SE_LEAVES_FALLING,            AnimationLeavesFalling           ; $E7
	special_effect SE_PETALS_FALLING,            AnimationPetalsFalling           ; $E6
	special_effect SE_SLIDE_MON_HALF_OFF,        AnimationSlideMonHalfOff         ; $E5
	special_effect SE_SHAKE_ENEMY_HUD,           AnimationShakeEnemyHUD           ; $E4
	special_effect SE_SHAKE_ENEMY_HUD_2,         AnimationShakeEnemyHUD           ; $E3 unused
	special_effect SE_SPIRAL_BALLS_INWARD,       AnimationSpiralBallsInward       ; $E2
	special_effect SE_DELAY_ANIMATION_10,        AnimationDelay10                 ; $E1
	special_effect SE_FLASH_ENEMY_MON_PIC,       AnimationFlashEnemyMonPic        ; $E0 unused
	special_effect SE_HIDE_ENEMY_MON_PIC,        AnimationHideEnemyMonPic         ; $DF
	special_effect SE_BLINK_ENEMY_MON,           AnimationBlinkEnemyMon           ; $DE
	special_effect SE_SHOW_MON_PIC,              AnimationShowMonPic              ; $DD
	special_effect SE_SHOW_ENEMY_MON_PIC,        AnimationShowEnemyMonPic         ; $DC
	special_effect SE_SLIDE_ENEMY_MON_OFF,       AnimationSlideEnemyMonOff        ; $DB
	special_effect SE_SHAKE_BACK_AND_FORTH,      AnimationShakeBackAndForth       ; $DA
	special_effect SE_SUBSTITUTE_MON,            AnimationSubstitute              ; $D9
	special_effect SE_WAVY_SCREEN,               AnimationWavyScreen              ; $D8
	db -1 ; end
