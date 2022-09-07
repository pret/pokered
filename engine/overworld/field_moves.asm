TryFieldMove:: ; predef
	call GetPredefRegisters
	call TrySurf
	ret z
	call TryCut
	ret

TrySurf:
	ld a, [wWalkBikeSurfState]
	cp 2 ; is the player already surfing?
	jr z, .no
	callfar IsNextTileShoreOrWater
	jr c, .no
	ld hl, TilePairCollisionsWater
	call CheckForTilePairCollisions2
	jr c, .no
	ld d, SURF
	call HasPartyMove
	jr nz, .no
	ld a, [wObtainedBadges]
	bit 4, a ; SOUL BADGE
	jr z, .no
	callfar IsSurfingAllowed
	ld hl, wd728
	bit 1, [hl]
	res 1, [hl]
	jr z, .no
	call InitializeFieldMoveTextBox
	ld hl, PromptToSurfText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no2
	call GetPartyMonName2
	ld a, SURFBOARD
	ld [wcf91], a
	ld [wPseudoItemID], a
	call UseItem
.yes2
	call CloseFieldMoveTextBox
.yes
	xor a
	ret
.no2
	call CloseFieldMoveTextBox
.no
	ld a, 1
	and a
	ret

TryCut:
	call IsCutTile
	jr nc, TrySurf.no
	call InitializeFieldMoveTextBox
	ld hl, ExplainCutText
	call PrintText
	call ManualTextScroll
	ld d, CUT
	call HasPartyMove
	jr nz, TrySurf.no2
	ld a, [wObtainedBadges]
	bit 1, a ; CASCADE BADGE
	jr z, TrySurf.no2
	ld hl, PromptToCutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, TrySurf.no2
	call GetPartyMonName2
	callfar Cut2
	call CloseFieldMoveTextBox
	jr TrySurf.yes2

IsCutTile:
; partial copy from UsedCut
	ld a, [wCurMapTileset]
	and a ; OVERWORLD
	jr z, .overworld
	cp GYM
	jr nz, .no
	ld a, [wTileInFrontOfPlayer]
	cp $50 ; gym cut tree
	jr nz, .no
	jr .yes
.overworld
	ld a, [wTileInFrontOfPlayer]
	cp $3d ; cut tree
	jr nz, .no
.yes
	scf
	ret
.no
	and a
	ret

HasPartyMove::
; Return z (optional: in wWhichTrade) if a PartyMon has move d.
; Updates wWhichPokemon.
	push bc
	push de
	push hl

	ld a, [wPartyCount]
	and a
	jr z, .no
	ld b, a
	ld c, 0
	ld hl, wPartyMons + (wPartyMon1Moves - wPartyMon1)
.loop
	ld e, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .yes
	dec e
	jr nz, .check_move

	ld a, wPartyMon2 - wPartyMon1 - NUM_MOVES
	add l
	ld l, a
	adc h
	sub l
	ld h, a

	inc c
	ld a, c
	cp b
	jr c, .loop
	jr .no

.yes
	ld a, c
	ld [wWhichPokemon], a
	xor a ; probably redundant
	ld [wWhichTrade], a
	jr .done
.no
	ld a, 1
	and a
	ld [wWhichTrade], a
.done
	pop hl
	pop de
	pop bc
	ret

InitializeFieldMoveTextBox:
	call EnableAutoTextBoxDrawing
	ld a, 1 ; not 0
	ld [hSpriteIndexOrTextID], a
	callfar DisplayTextIDInit
	ret

CloseFieldMoveTextBox:
	ld a,[hLoadedROMBank]
	push af
	jp CloseTextDisplay

PromptToSurfText:
	text_far _PromptToSurfText
	text_end

ExplainCutText:
	text_far _ExplainCutText
	text_end

PromptToCutText:
	text_far _PromptToCutText
	text_end