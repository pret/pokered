ReflectLightScreenEffect_:
	ld hl, wPlayerBattleStatus3
	ld de, wPlayerMoveEffect
	ld a, [H_WHOSETURN]
	and a
	jr z, .reflectLightScreenEffect
	ld hl, wEnemyBattleStatus3
	ld de, wEnemyMoveEffect
.reflectLightScreenEffect
	ld a, [de]
	cp LIGHT_SCREEN_EFFECT
	jr nz, .reflect
	bit HAS_LIGHT_SCREEN_UP, [hl] ; is mon already protected by light screen?
	jr nz, .moveFailed
	set HAS_LIGHT_SCREEN_UP, [hl] ; mon is now protected by light screen
	ld hl, LightScreenProtectedText
	jr .playAnim
.reflect
	bit HAS_REFLECT_UP, [hl] ; is mon already protected by reflect?
	jr nz, .moveFailed
	set HAS_REFLECT_UP, [hl] ; mon is now protected by reflect
	ld hl, ReflectGainedArmorText
.playAnim
	push hl
	ld hl, PlayCurrentMoveAnimation
	call BankswitchEtoF
	pop hl
	jp PrintText
.moveFailed
	ld c, 50
	call DelayFrames
	ld hl, PrintButItFailedText_
	jp BankswitchEtoF

LightScreenProtectedText:
	TX_FAR _LightScreenProtectedText
	db "@"

ReflectGainedArmorText:
	TX_FAR _ReflectGainedArmorText
	db "@"

BankswitchEtoF:
	ld b, BANK(BattleCore)
	jp Bankswitch
