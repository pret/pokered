; PureRGBnote: ADDED: Defense curl has a new effect in which super effective moves hitting the user will be reduced to neutral damage.
_DefenseCurlEffect::
	ld hl, wPlayerBattleStatus1
	ldh a, [hWhoseTurn]
	and a
	jr z, .reflectLightScreenEffect
	ld hl, wEnemyBattleStatus1
.reflectLightScreenEffect
	bit DEFENSE_CURLED, [hl] ; is mon already used defense curl?
	jr nz, .moveFailed
	set DEFENSE_CURLED, [hl] ; mon is now protected by defense curl
	callfar PlayCurrentMoveAnimation
	ld hl, DefenseCurlGuardedText
	rst _PrintText
	ret
.moveFailed
	ld c, 20
	rst _DelayFrames
	jpfar PrintButItFailedText_

DefenseCurlGuardedText:
	text_far _GuardedAgainstSuperEffectiveMovesText
	text_end
