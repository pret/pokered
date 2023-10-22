; PureRGBnote: ADDED: code for preventing softlocks. 
; For cut, it just keeps the tree cut down until you leave the area where you could get softlocked if it reappeared.
; For surf, autosurf just stays active even if you have no pokemon with SURF if you're on an island.

; format: map id, left x coord, right x coord, top y coord, bottom y coord
; the coordinates form a square in which being inside this square you are "inside a cut alcove"
; these are checked directly in their map scripts and the cut trees are removed in cases where you would get blocked from inside an alcove
VermilionCutAlcove::  db 6, 15, 19, 23
Route2CutAlcove::     db 12, 19, 22, 68
Route8CutAlcove::     db 29, 40, 8, 15
Route12CutAlcove1::   db 4, 6, 87, 89
Route12CutAlcove2::   db 4, 8, 99, 107
Route13CutAlcove::    db 35, 48, 3, 8
Route16CutAlcove::    db 24, 35, 2, 8
Route25CutAlcove::    db 22, 26, 4, 5
CeladonCutAlcove1::   db 2, 17, 27, 31
CeladonCutAlcove2::   db 2, 36, 32, 34
CeladonGymCutAlcove:: db 2, 7, 3, 7

; input
; de = address (in this bank) of the coordinate range to check the player is within
FarArePlayerCoordsInRange::
	ld h, d
	ld l, e
CheckAreaForRestriction:
	ld b, [hl]
	inc hl
	ld c, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld e, [hl]
	jp ArePlayerCoordsInRange

; deleting surf from your pokemon in specific parts of these maps won't clear the autosurf flag to avoid softlocks
SurfRestrictedAreas:
	; format: map id, left x coord, right x coord, top y coord, bottom y coord
	db CELADON_CITY, 21, 24, 16, 17
	db SAFARI_ZONE_CENTER, 12, 17, 10, 11
	db VERMILION_CITY, 4, 7, 28, 29
	db ROUTE_10, 2, 15, 30, 45
	db ROUTE_12, 14, 15, 34, 37
	db ROUTE_20, 32, 35, 8, 9
	db ROUTE_20, 46, 61, 2, 11
	db ROUTE_21, 8, 13, 1, 9
	db ROUTE_21, 4, 7, 24, 25
	db ROUTE_21, 14, 17, 56, 57
	db ROUTE_23, 8, 9, 90, 91
	db -1

CheckInSurfRestrictedMapOrArea::
	ld hl, SurfRestrictedMapsOnMoveDelete
	ld de, 1
	ld a, [wCurMap]
	call IsInArray
	ret c ; if we're in specific maps, don't clear the autosurf bit on deleting surf
	;fall through
CheckInSurfRestrictedArea::
	ld hl, SurfRestrictedAreas
.loop
	ld a, [hl]
	cp -1
	jr z, .notRestricted
	ld b, a
	ld a, [wCurMap]
	cp b
	jr nz, .nextEntryWhole
	inc hl
	; map matches
	call CheckAreaForRestriction
	ret c
	inc hl
	jr .loop
.nextEntryWhole
	ld b, 0
	ld c, 5
	add hl, bc
	jr .loop
.notRestricted
	and a
	ret

; Searches for a specific move in the party and also counts how many occurrences of it there are
; input
; d = which move ID to look for
; output
; d = how many matches
; z flag = whether a match was found (set = match found)
IsMoveInParty:
	ld c, d ; which move to check
	ld hl, wPartyMon1Moves
	ld d, 0 ; how many matches were found
	ld e, 0 ; which pokemon we're on
	push bc
.nextPoke
	pop bc
	ld b, NUM_MOVES
.moveloop
	ld a, [hl]
	cp c ; is it the specified move?
	jr nz, .noMatch
	inc d ; increase number of matches
.noMatch
	inc hl
	dec b
	jr nz, .moveloop
	inc e
	ld a, e
	cp PARTY_LENGTH
	jr z, .done
	push bc
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	jr .nextPoke
.done
	ld a, d
	and a
	ret

; input
; d = move ID
; output
; z flag set if learnable

IsMoveLearnableByParty:
	ld a, [wMoveNum]
	push af
	ld a, [wcf91]
	push af
	ld a, [wd0b5]
	push af
	ld a, d
	ld [wMoveNum], a
	ld e, 0 ; which pokemon we're on in the party
	ld hl, wPartyMon1Species
.loop
	ld a, [hl]
	ld [wcf91], a
	push de
	predef CanLearnTM
	pop de
	ld a, c
	and a ; can the pokemon learn the move?
	jr nz, .learnable
	inc e
	ld a, e
	cp PARTY_LENGTH
	jr z, .notLearnable
	ld hl, wPartyMon1Species
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes
	jr .loop
.learnable
	ld b, 1
	jr .done
.notLearnable
	ld b, 0
.done
	pop af
	ld [wd0b5], a
	pop af
	ld [wcf91], a
	pop af
	ld [wMoveNum], a
	ld a, b
	and a
	ret

; input
; b = leftmost x coord
; c = rightmost x coord
; d = topmost y coord
; e = bottommost y coord
; returns carry flag = within range
ArePlayerCoordsInRange:
	ld a, [wXCoord]
	cp b
	; must be greater than or equal to b to be within coords
	jr c, .notInCoords
	cp c
	; must be less than or equal to c to be within coords
	jr z, .equal1
	jr nc, .notInCoords
.equal1
	ld a, [wYCoord]
	cp d
	; must be greater than or equal to d to be within coords
	jr c, .notInCoords
	cp e
	; must be less than or equal to e to be within coords
	jr z, .equal2
	jr nc, .notInCoords
.equal2
	scf
	ret	
.notInCoords
	and a
	ret

; some cut alcoves have multiple trees to enter them so we need to track which to remove on loading the map after a battle or save load
; this gets called when we cut down any tree
CheckSetCutEvents:
	ld a, [wCurMap]
	cp CELADON_GYM
	jr z, .celadonGym
	cp ROUTE_8
	jr z, .route8
	ret
.celadonGym
	ld a, [wXCoord]
	cp 1
	jr z, .celadonGymLeft
	cp 3
	jr z, .celadonGymLeft
	cp 5
	jr z, .celadonGymBottom
	; otherwise it's the right tree
	SetEvent EVENT_CUT_DOWN_CELADON_GYM_RIGHT_TREE
	ret
.celadonGymLeft
	SetEvent EVENT_CUT_DOWN_CELADON_GYM_LEFT_TREE
	ret
.celadonGymBottom
	SetEvent EVENT_CUT_DOWN_CELADON_GYM_BOTTOM_TREE
	ret
.route8
	ld a, [wXCoord]
	cp 31 ; if our x coord while cutting a tree is <31 we're cutting the left tree
	jr c, .route8left
	; otherwise it's the right one
	SetEvent EVENT_CUT_DOWN_ROUTE8_RIGHT_TREE
	ret
.route8left
	SetEvent EVENT_CUT_DOWN_ROUTE8_LEFT_TREE
	ret

; input d = which species to look for
IsMonInParty::
	ld hl, wPartyMon1Species
	ld bc, wPartyMon2 - wPartyMon1
	ld e, PARTY_LENGTH
.loop
	ld a, [hl]
	cp d
	jr z, .found
	add hl, bc
	dec e
	jr z, .notFound
	jr .loop
.found
	scf
	ret
.notFound
	and a
	ret
