; PureRGBnote: FIXED: function to redraw the party menu without any bottom box text, used to avoid minor graphical glitches
EmptyPartyMenuRedraw::
	hlcoord 11, 11
	lb bc, 1, 9
	call ClearScreenArea
	ld a, EMPTY_PARTY_MENU ; new party menu text option - it just displays no text in the bottom box since we'll be writing there immediately
	ld [wPartyMenuTypeOrMessageID], a
	call RedrawPartyMenu 
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	ret

ReloadEnemyMonPicAfterStatusScreen::
	ld a, [wEnemyBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a ; does the enemy mon have a substitute?
	ld hl, AnimationSubstituteEnemyMon
	jr nz, .doEnemyMonAnimation
; enemy mon doesn't have substitute
	ld a, [wEnemyMonMinimized]
	and a ; has the enemy mon used Minimise?
	ld hl, AnimationMinimizeEnemyMon
	jr nz, .doEnemyMonAnimation
; enemy mon isn't minimized
	call CheckShouldReloadGhostSprite
	jr c, LoadGhostSprite
; enemy mon is showing normally
	ld a, [wEnemyMonSpecies]
	ld [wcf91], a
	ld [wd0b5], a
	call GetMonHeader
	ld de, vFrontPic
	jp LoadMonFrontSprite
.doEnemyMonAnimation
	ld b, BANK(AnimationSubstituteEnemyMon) ; BANK(AnimationMinimizeEnemyMon)
	rst _Bankswitch
	ret ; enemy mon pic has been reloaded, so return to the party menu

LoadGhostData::
	ld a, MON_GHOST
	ld [wd11e], a
	call GetMonName
	ld hl, wcd6d
	ld de, wEnemyMonNick  ; set name to "GHOST"
	ld bc, NAME_LENGTH
	rst _CopyData
	; fall through
LoadGhostSprite:
	ld hl, wMonHSpriteDim
	ld a, $66
	ld [hli], a   ; write sprite dimensions
	ld bc, GhostPic
	ld a, c
	ld [hli], a   ; write front sprite pointer
	ld [hl], b
	ld a, [wcf91]
	push af
	ld a, MON_GHOST
	ld [wcf91], a
	ld de, vFrontPic
	call LoadMonFrontSprite ; load ghost sprite
	pop af
	ld [wcf91], a
	ret

CheckShouldLoadGhostSprite::
	ld a, [wCurOpponent]
	cp RESTLESS_SOUL
	jr z, CheckShouldReloadGhostSprite.yes
	; fall through
CheckShouldReloadGhostSprite::
	callfar IsGhostBattle
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret