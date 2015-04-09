ReflectLightScreenEffect_: ; 3bb97 (e:7b97)
	ld hl, W_PLAYERBATTSTATUS3
	ld de, W_PLAYERMOVEEFFECT
	ld a, [H_WHOSETURN]
	and a
	jr z, .reflectLightScreenEffect
	ld hl, W_ENEMYBATTSTATUS3
	ld de, W_ENEMYMOVEEFFECT
.reflectLightScreenEffect
	ld a, [de]
	cp LIGHT_SCREEN_EFFECT
	jr nz, .reflect
	bit HasLightScreenUp, [hl] ; is mon already protected by light screen?
	jr nz, .moveFailed
	set HasLightScreenUp, [hl] ; mon is now protected by light screen
	ld hl, LightScreenProtectedText
	jr .playAnim
.reflect
	bit HasReflectUp, [hl] ; is mon already protected by reflect?
	jr nz, .moveFailed
	set HasReflectUp, [hl] ; mon is now protected by reflect
	ld hl, ReflectGainedArmorText
.playAnim
	push hl
	ld hl, PlayCurrentMoveAnimation
	call BankswitchEtoF
	pop hl
	jp PrintText
.moveFailed
	ld c, $32
	call DelayFrames
	ld hl, PrintButItFailedText_
	jp BankswitchEtoF

LightScreenProtectedText: ; 3bbd7 (e:7bd7)
	TX_FAR _LightScreenProtectedText
	db "@"

ReflectGainedArmorText: ; 3bbdc (e:7bdc)
	TX_FAR _ReflectGainedArmorText
	db "@"

BankswitchEtoF: ; 3bbe1 (e:7be1)
	ld b, BANK(BattleCore)
	jp Bankswitch
