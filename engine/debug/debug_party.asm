SetDebugNewGameParty: ; unreferenced except in _DEBUG
	ld de, DebugNewGameParty
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wcf91], a
	ld a, %01000000 ; PureRGBnote: ADDED: 1 in higher nybble to skip nicknaming in debug mode
	ld [wMonDataLocation], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de
	call AddPartyMon
	jr .loop

DebugNewGameParty: ; unreferenced except in _DEBUG
	; Exeggutor is the only debug party member shared with Red, Green, and Japanese Blue.
	; "Tsunekazu Ishihara: Exeggutor is my favorite. That's because I was
	; always using this character while I was debugging the program."
	; From https://web.archive.org/web/20000607152840/http://pocket.ign.com/news/14973.html
	db EXEGGUTOR, 99
IF DEF(_DEBUG)
	db MEW, 50
ELSE
	db MEW, 20
ENDC
	db ARMORED_MEWTWO, 99
	db DUGTRIO, 99
	db ARTICUNO, 99
IF DEF(_DEBUG)
	db PIKACHU, 15
ENDC
	db -1 ; end

PrepareNewGameDebug: ; dummy except in _DEBUG
IF DEF(_DEBUG)
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a

	; Fly anywhere.
	dec a ; $ff (all bits)
	ld [wTownVisitedFlag], a
	ld [wTownVisitedFlag + 1], a

	; Get all badges except Earth Badge.
	ld a, ~(1 << BIT_EARTHBADGE)
	ld [wObtainedBadges], a

	call SetDebugNewGameParty

	; Exeggutor gets four HM moves.
	ld hl, wPartyMon1Moves
	ld a, FLY
	ld [hli], a
	ld a, CUT
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld a, TRI_ATTACK
	ld [hl], a
	ld hl, wPartyMon1PP
	ld a, 15
	ld [hli], a
	ld a, 30
	ld [hli], a
	ld a, 15
	ld [hli], a
	ld [hl], a

	; Jolteon gets Thunderbolt.
	ld hl, wPartyMon3Moves + 3
	ld a, THUNDERBOLT
	ld [hl], a
	ld hl, wPartyMon3PP + 3
	ld a, 15
	ld [hl], a

	; Articuno gets Fly.
	ld hl, wPartyMon4Moves
	ld a, STRENGTH
	ld [hl], a
	ld hl, wPartyMon4PP
	ld a, 15
	ld [hl], a

	; Articuno gets Fly.
	ld hl, wPartyMon5Moves
	ld a, FLY
	ld [hl], a
	ld hl, wPartyMon5PP
	ld a, 15
	ld [hl], a

	; Pikachu gets Surf.
	ld hl, wPartyMon6Moves + 2
	ld a, SURF
	ld [hl], a
	ld hl, wPartyMon6PP + 2
	ld a, 15
	ld [hl], a

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, DebugItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wcf91], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .items_loop
.items_end

	; Complete the Pokédex and Movedex
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned - 1
	call DebugSetPokedexEntries
	ld [hl], %01111111
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen - 1
	call DebugSetPokedexEntries
	ld [hl], %01111111
	ld hl, wMovedexSeen
	ld b, wMovedexSeenEnd - wMovedexSeen - 1
	call DebugSetPokedexEntries
	ld [hl], %00011111
	SetEvent EVENT_GOT_POKEDEX
	SetEvent EVENT_GOT_MOVEDEX

	
	ld a, HS_LYING_OLD_MAN
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OLD_MAN
	ld [wMissableObjectIndex], a
	predef ShowObject

	; Rival chose Squirtle,
	; Player chose Charmander.
	ld hl, wRivalStarter
	ld a, STARTER2
	ld [hli], a
	inc hl ; hl = wPlayerStarter
	ld a, STARTER1
	ld [hl], a

	ret

DebugSetPokedexEntries:
	ld a, %11111111
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

DebugItemsList:
	db BICYCLE, 1
	db FULL_RESTORE, 99
	db FULL_HEAL, 99
	db RARE_CANDY, 99
	db MAX_ELIXER, 99
	db MASTER_BALL, 99
	db HYPER_BALL, 99
	db POKE_FLUTE, 1
	db SILPH_SCOPE, 1
	db SECRET_KEY, 1
	db CARD_KEY, 1
	db S_S_TICKET, 1
	db LIFT_KEY, 1
	db OLD_ROD, 1
	db GOOD_ROD, 1
	db SUPER_ROD, 1
	db POCKET_ABRA, 1
	db HM_SURF, 1
	db HM_FLY, 1
	db TOPSECRETKEY, 1
	db -1 ; end

DebugUnusedList:
	db -1 ; end
ELSE
	ret
ENDC
