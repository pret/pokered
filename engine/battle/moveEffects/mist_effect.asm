MistEffect_:
	ld hl, wPlayerBattleStatus2
	ld a, [H_WHOSETURN]
	and a
	jr z, .mistEffect
	ld hl, wEnemyBattleStatus2
.mistEffect
	bit PROTECTED_BY_MIST, [hl] ; is mon protected by mist?
	jr nz, .mistAlreadyInUse
	set PROTECTED_BY_MIST, [hl] ; mon is now protected by mist
	callab PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.mistAlreadyInUse
	jpab PrintButItFailedText_

ShroudedInMistText:
	TX_FAR _ShroudedInMistText
	db "@"
