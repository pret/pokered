NamePointers::
; entries correspond to *_NAME constants
	dw MonsterNames
	dw MoveNames
	dw UnusedBadgeNames
	dw ItemNames
	dw wPartyMonOT ; player's OT names list
	dw wEnemyMonOT ; enemy's OT names list
	dw TrainerNames

GetName::
; arguments:
; [wd0b5] = which name
; [wNameListType] = which list
; [wPredefBank] = bank of list
;
; returns pointer to name in de
	ld a, [wd0b5]
	ld [wd11e], a

	; TM names are separate from item names.
	; BUG: This applies to all names instead of just items.
	cp HM01
	jp nc, GetMachineName

	ldh a, [hLoadedROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [wNameListType]    ;List3759_entrySelector
	dec a
	jr nz, .otherEntries
	;1 = MON_NAMES
	call GetMonName
	ld hl, NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .gotPtr
.otherEntries
	;2-7 = OTHER ENTRIES
	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld a, [wNameListType]    ;VariousNames' entryID
	dec a
	add a
	ld d, 0
	ld e, a
	jr nc, .skip
	inc d
.skip
	ld hl, NamePointers
	add hl, de
	ld a, [hli]
	ldh [hSwapTemp + 1], a
	ld a, [hl]
	ldh [hSwapTemp], a
	ldh a, [hSwapTemp]
	ld h, a
	ldh a, [hSwapTemp + 1]
	ld l, a
	ld a, [wd0b5]
	ld b, a
	ld c, 0
.nextName
	ld d, h
	ld e, l
.nextChar
	ld a, [hli]
	cp "@"
	jr nz, .nextChar
	inc c           ;entry counter
	ld a, b          ;wanted entry
	cp c
	jr nz, .nextName
	ld h, d
	ld l, e
	ld de, wcd6d
	ld bc, $14
	call CopyData
.gotPtr
	ld a, e
	ld [wUnusedCF8D], a
	ld a, d
	ld [wUnusedCF8D + 1], a
	pop de
	pop bc
	pop hl
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
