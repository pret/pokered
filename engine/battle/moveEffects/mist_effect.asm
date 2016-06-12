MistEffect_:
	ld hl, wPlayerBattleStatus2
	ld a, [H_WHOSETURN]
	and a
	jr z, .mistEffect
	ld hl, wEnemyBattleStatus2
.mistEffect
	bit ProtectedByMist, [hl] ; is mon protected by mist?
	jr nz, .mistAlreadyInUse
	set ProtectedByMist, [hl] ; mon is now protected by mist
	callab PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.mistAlreadyInUse
	jpab PrintButItFailedText_

ShroudedInMistText:
	TX_FAR _ShroudedInMistText
	db "@"
