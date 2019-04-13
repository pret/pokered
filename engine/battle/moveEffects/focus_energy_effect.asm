FocusEnergyEffect_:
	ld hl, wPlayerBattleStatus2
	ld a, [H_WHOSETURN]
	and a
	jr z, .notEnemy
	ld hl, wEnemyBattleStatus2
.notEnemy
	bit GETTING_PUMPED, [hl] ; is mon already using focus energy?
	jr nz, .alreadyUsing
	set GETTING_PUMPED, [hl] ; mon is now using focus energy
	callab PlayCurrentMoveAnimation
	ld hl, GettingPumpedText
	jp PrintText
.alreadyUsing
	ld c, 50
	call DelayFrames
	jpab PrintButItFailedText_

GettingPumpedText:
	TX_DELAY
	TX_FAR _GettingPumpedText
	db "@"
