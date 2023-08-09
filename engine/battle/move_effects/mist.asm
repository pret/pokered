MistEffect_:
	ld hl, wPlayerBattleStatus2
	ldh a, [hWhoseTurn]
	and a
	jr z, .mistEffect
	ld hl, wEnemyBattleStatus2
.mistEffect
	bit NORMAL_FIGHTING_IMMUNITY, [hl] ; is mon protected by mist?
	jr nz, .mistAlreadyInUse
	set STAT_DOWN_IMMUNITY, [hl] ; mon is now protected by mist (shared with guard spec)
	set NORMAL_FIGHTING_IMMUNITY, [hl] ; secondary effect of mist
	callfar PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.mistAlreadyInUse
	ld c, 50
	rst _DelayFrames
	jpfar PrintButItFailedText_

ShroudedInMistText:
	text_far _ShroudedInMistText
	text_end
