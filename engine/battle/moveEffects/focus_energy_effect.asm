FocusEnergyEffect_: ; 27f86 (9:7f86)
	ld hl, wPlayerBattleStatus2
	ld a, [H_WHOSETURN]
	and a
	jr z, .notEnemy
	ld hl, wEnemyBattleStatus2
.notEnemy
	bit GettingPumped, [hl] ; is mon already using focus energy?
	jr nz, .alreadyUsing
	set GettingPumped, [hl] ; mon is now using focus energy
	callab PlayCurrentMoveAnimation
	ld hl, GettingPumpedText
	jp PrintText
.alreadyUsing
	ld c, 50
	call DelayFrames
	jpab PrintButItFailedText_

GettingPumpedText: ; 27fb3 (9:7fb3)
	db $0a
	TX_FAR _GettingPumpedText
	db "@"
