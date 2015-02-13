SubstituteEffectHandler: ; 17dad (5:7dad)
	ld c, 50
	call DelayFrames
	ld hl, wBattleMonMaxHP
	ld de, wPlayerSubstituteHP
	ld bc, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .notEnemy
	ld hl, wEnemyMonMaxHP
	ld de, wEnemySubstituteHP
	ld bc, W_ENEMYBATTSTATUS2
.notEnemy
	ld a, [bc]                    ;load flags
	bit HasSubstituteUp, a        ;user already has substitute?
	jr nz, .alreadyHasSubstitute  ;skip this code if so
	                              ;user doesn't have a substitute [yet]
	push bc
	ld a, [hli]  ;load max hp
	ld b, [hl]
	srl a        ;max hp / 4, [quarter health to remove from user]
	rr b
	srl a
	rr b
	push de
	ld de, wBattleMonHP - wBattleMonMaxHP
	add hl, de    ; point hl to current HP
	pop de
	ld a, b
	ld [de], a    ;save copy of HP to subtract in ccd7/ccd8 [how much HP substitute has]
	ld a, [hld]   ;load current hp
	sub b         ;subtract [max hp / 4]
	ld d, a       ;save low byte result in D
	ld a, [hl]
	sbc a, 0      ;borrow from high byte if needed
	pop bc
	jr c, .notEnoughHP  ;underflow means user would be left with negative health
                        ;bug: note since it only brances on carry, it will possibly leave user with 0HP
.userHasZeroOrMoreHP
	ldi [hl], a  ;store high byte HP
	ld [hl], d   ;store low byte HP
	ld h, b
	ld l, c
	set HasSubstituteUp, [hl] ;set bit 4 of flags, user now has substitute
	ld a, [W_OPTIONS]         ;load options
	bit 7, a                  ;battle animation is enabled?
	ld hl, PlayCurrentMoveAnimation         ;animation enabled: 0F:7BA8
	ld b, BANK(PlayCurrentMoveAnimation)
	jr z, .animationEnabled
	ld hl, AnimationSubstitute ;animation disabled: 1E:56E0
	ld b, BANK(AnimationSubstitute)
.animationEnabled
	call Bankswitch           ;jump to routine depending on animation setting
	ld hl, SubstituteText
	call PrintText
	ld hl, DrawHUDsAndHPBars
	ld b, BANK(DrawHUDsAndHPBars)
	jp Bankswitch
.alreadyHasSubstitute
	ld hl, HasSubstituteText
	jr .printText
.notEnoughHP
	ld hl, TooWeakSubstituteText
.printText
	jp PrintText

SubstituteText: ; 17e1d (5:7e1d)
	TX_FAR _SubstituteText
	db "@"

HasSubstituteText: ; 17e22 (5:7e22)
	TX_FAR _HasSubstituteText
	db "@"

TooWeakSubstituteText: ; 17e27 (5:7e27)
	TX_FAR _TooWeakSubstituteText
	db "@"
