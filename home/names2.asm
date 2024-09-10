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
; [wNameListIndex] = which name
; [wNameListType] = which list
; [wPredefBank] = bank of list
;
; returns pointer to name in de
	ld a, [wNameListIndex]
	ld [wNamedObjectIndex], a

	; TM names are separate from item names.
	; BUG: This applies to all names instead of just items.
	ASSERT NUM_POKEMON_INDEXES < HM01, \
		"A bug in GetName will get TM/HM names for Pokémon above ${x:HM01}."
	ASSERT NUM_ATTACKS < HM01, \
		"A bug in GetName will get TM/HM names for moves above ${x:HM01}."
	ASSERT NUM_TRAINERS < HM01, \
		"A bug in GetName will get TM/HM names for trainers above ${x:HM01}."
	cp HM01
	jp nc, GetMachineName

	ldh a, [hLoadedROMBank]
	push af
	push hl
	push bc
	push de
	ld a, [wNameListType]
	dec a
	jr nz, .otherEntries
	; 1 = MONSTER_NAME
	call GetMonName
	ld hl, NAME_LENGTH
	add hl, de
	ld e, l
	ld d, h
	jr .gotPtr
.otherEntries
	; 2-7 = other names
	ld a, [wPredefBank]
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ld a, [wNameListType]
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
	ld a, [wNameListIndex]
	ld b, a ; wanted entry
	ld c, 0 ; entry counter
.nextName
	ld d, h
	ld e, l
.nextChar
	ld a, [hli]
	cp "@"
	jr nz, .nextChar
	inc c
	ld a, b
	cp c
	jr nz, .nextName
	ld h, d
	ld l, e
	ld de, wNameBuffer
	ld bc, NAME_BUFFER_LENGTH
	call CopyData
.gotPtr
	ld a, e
	ld [wUnusedNamePointer], a
	ld a, d
	ld [wUnusedNamePointer + 1], a
	pop de
	pop bc
	pop hl
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret
