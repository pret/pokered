SetDebugNewGameParty: ; unreferenced except in _DEBUG
	ld de, DebugNewGameParty
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wCurPartySpecies], a
	ld a, %01000000 ; PureRGBnote: ADDED: 1 in higher nybble to skip nicknaming in debug mode
	ld [wMonDataLocation], a
	inc de
	ld a, [de]
	ld [wCurEnemyLevel], a
	inc de
	call AddPartyMon
	jr .loop

DebugNewGameParty: ; unreferenced except in _DEBUG
	; Exeggutor is the only debug party member shared with Red, Green, and Japanese Blue.
	; "Tsunekazu Ishihara: Exeggutor is my favorite. That's because I was
	; always using this character while I was debugging the program."
	; From https://web.archive.org/web/20000607152840/http://pocket.ign.com/news/14973.html
	db TENTACRUEL, 99
	db VOLCANIC_MAGMAR, 50
	db ARMORED_MEWTWO, 99
	db HARDENED_ONIX, 99
	db WINTER_DRAGONAIR, 99
	db MAROWAK, 30
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

	; Tentacruel gets four HM moves.
	ld hl, wPartyMon1Moves
	ld a, FLY
	ld [hli], a
	ld a, CUT
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld [hl], CONVERSION
	ld hl, wPartyMon1PP
	ld a, 15
	ld [hli], a
	ld a, 30
	ld [hli], a
	ld a, 15
	ld [hli], a
	ld [hl], a

	; Armored Mewtwo gets Thunderbolt.
	ld hl, wPartyMon3Moves + 1
	ld a, THUNDERBOLT
	ld [hli], a
	ld [hl], PSYCHIC_M
	ld hl, wPartyMon3PP + 1
	ld [hl], 15

	; Hardened Onix gets Strength.
	ld hl, wPartyMon4Moves
	ld [hl], STRENGTH
	ld hl, wPartyMon4PP
	ld [hl], 15

	; Articuno gets Fly.
	ld hl, wPartyMon5Moves
	ld [hl], FLY
	ld hl, wPartyMon5PP
	ld [hl], 15

	; Pikachu gets Surf, Flash, and DIG.
	ld hl, wPartyMon6Moves
	ld a, SURF
	ld [hli], a
	ld a, FLASH
	ld [hli], a
	ld [hl], DIG
	ld hl, wPartyMon6Flags
	set 0, [hl] ; ghost marowak

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, DebugNewGameItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wCurItem], a
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
	SetEvent EVENT_LEARNED_TO_DIG_BETWEEN_TOWNS
	SetEvent EVENT_DELETED_ROUTE2_TREES
	SetEvent EVENT_DELETED_CERULEAN_TREE
	SetEvent EVENT_DELETED_ROUTE9_TREE
	SetEvent EVENT_DELETED_FUCHSIA_TREES 
	SetEvent EVENT_CAUGHT_GHOST_MAROWAK
	;SetEvent EVENT_ARENA_ALL_CHALLENGERS_DEFEATED

	;callfar SilphCo11FTeamRocketLeavesScript

	
	ld a, HS_LYING_OLD_MAN
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_OLD_MAN
	ld [wMissableObjectIndex], a
	predef ShowObject

	; Rival chose Squirtle,
	; Player chose Charmander.
	ld hl, wRivalStarter
	ASSERT wRivalStarter + 2 == wPlayerStarter
	ld a, STARTER2
	ld [hli], a
	inc hl ; hl = wPlayerStarter
	ld [hl], STARTER1
	ret

DebugSetPokedexEntries:
	ld a, %11111111
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

DebugNewGameItemsList:
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
	db TM_SUBSTITUTE, 20
	db TOPSECRETKEY, 1
	db POKE_DOLL, 1
	db -1 ; end

ELSE
	ret
ENDC
