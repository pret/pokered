DrawHPBar::
; Draw an HP bar d tiles long, and fill it to e pixels.
; If c is nonzero, show at least a sliver regardless.
; The right end of the bar changes with [wHPBarType].

	push hl
	push de
	push bc

	; Left
	ld a, $71 ; "HP:"
	ld [hli], a
	ld a, $62
	ld [hli], a

	push hl

	; Middle
	ld a, $63 ; empty
.draw
	ld [hli], a
	dec d
	jr nz, .draw

	; Right
	ld a, [wHPBarType]
	dec a
	ld a, $6d ; status screen and battle
	jr z, .ok
	dec a ; pokemon menu
.ok
	ld [hl], a

	pop hl

	ld a, e
	and a
	jr nz, .fill

	; If c is nonzero, draw a pixel anyway.
	ld a, c
	and a
	jr z, .done
	ld e, 1

.fill
	ld a, e
	sub 8
	jr c, .partial
	ld e, a
	ld a, $6b ; full
	ld [hli], a
	ld a, e
	and a
	jr z, .done
	jr .fill

.partial
	; Fill remaining pixels at the end if necessary.
	ld a, $63 ; empty
	add e
	ld [hl], a
.done
	pop bc
	pop de
	pop hl
	ret


; loads pokemon data from one of multiple sources to wLoadedMon
; loads base stats to wMonHeader
; INPUT:
; [wWhichPokemon] = index of pokemon within party/box
; [wMonDataLocation] = source
; 00: player's party
; 01: enemy's party
; 02: current box
; 03: daycare
; OUTPUT:
; [wcf91] = pokemon ID
; wLoadedMon = base address of pokemon data
; wMonHeader = base address of base stats
LoadMonData::
	jpfar LoadMonData_

OverwritewMoves::
; Write c to [wMoves + b]. Unused.
	ld hl, wMoves
	ld e, b
	ld d, 0
	add hl, de
	ld a, c
	ld [hl], a
	ret

LoadFlippedFrontSpriteByMonIndex::
	ld a, 1
	ld [wSpriteFlipped], a

LoadFrontSpriteByMonIndex::
	push hl
	ld a, [wd11e]
	push af
	ld a, [wcf91]
	ld [wd11e], a
	predef IndexToPokedex
	ld hl, wd11e
	ld a, [hl]
	pop bc
	ld [hl], b
	and a
	pop hl
	jr z, .invalidDexNumber ; dex #0 invalid
	cp NUM_POKEMON + 1
	jr c, .validDexNumber   ; dex >#151 invalid
.invalidDexNumber
	ld a, RHYDON ; $1
	ld [wcf91], a
	ret
.validDexNumber
	push hl
	ld de, vFrontPic
	call LoadMonFrontSprite
	pop hl
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(CopyUncompressedPicToHL)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	xor a
	ldh [hStartTileID], a
	call CopyUncompressedPicToHL
	xor a
	ld [wSpriteFlipped], a
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret


;PlayCry::
; Play monster a's cry.
;	call GetCryData
;	call PlaySound
;	jp WaitForSoundToFinish

;GetCryData::
; Load cry data for monster a.
;	dec a
;	ld c, a
;	ld b, 0
;	ld hl, CryData
;	add hl, bc
;	add hl, bc
;	add hl, bc

;	ld a, BANK(CryData)
;	call BankswitchHome
;	ld a, [hli]
;	ld b, a ; cry id
;	ld a, [hli]
;	ld [wFrequencyModifier], a
;	ld a, [hl]
;	ld [wTempoModifier], a
;	call BankswitchBack

	; Cry headers have 3 channels,
	; and start from index CRY_SFX_START,
	; so add 3 times the cry id.
;	ld a, b
;	ld c, CRY_SFX_START
;	rlca ; * 2
;	add b
;	add c
;	ret

DisplayPartyMenu::
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call PartyMenuInit
	call DrawPartyMenu
	jp HandlePartyMenuInput

GoBackToPartyMenu::
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	call PartyMenuInit
	call RedrawPartyMenu
	jp HandlePartyMenuInput

PartyMenuInit::
	ld a, 1 ; hardcoded bank
	call BankswitchHome
	call LoadHpBarAndStatusTilePatterns
	ld hl, wd730
	set 6, [hl] ; turn off letter printing delay
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, wTopMenuItemY
	inc a
	ld [hli], a ; top menu item Y
	xor a
	ld [hli], a ; top menu item X
	ld a, [wPartyAndBillsPCSavedMenuItem]
	push af
	ld [hli], a ; current menu item ID
	inc hl
	ld a, [wPartyCount]
	and a ; are there more than 0 pokemon in the party?
	jr z, .storeMaxMenuItemID
	dec a
; if party is not empty, the max menu item ID is ([wPartyCount] - 1)
; otherwise, it is 0
.storeMaxMenuItemID
	ld [hli], a ; max menu item ID
	ld a, [wForcePlayerToChooseMon]
	and a
	ld a, A_BUTTON | B_BUTTON
	jr z, .next
	xor a
	ld [wForcePlayerToChooseMon], a
	inc a ; a = A_BUTTON
.next
	ld [hli], a ; menu watched keys
	pop af
	ld [hl], a ; old menu item ID
	ret

HandlePartyMenuInput::
	ld a, 1
	ld [wMenuWrappingEnabled], a
	ld a, $40
	ld [wPartyMenuAnimMonEnabled], a
	call HandleMenuInput_
	call PlaceUnfilledArrowMenuCursor
	ld b, a
	xor a
	ld [wPartyMenuAnimMonEnabled], a
	ld a, [wCurrentMenuItem]
	ld [wPartyAndBillsPCSavedMenuItem], a
	ld hl, wd730
	res 6, [hl] ; turn on letter printing delay
	ld a, [wMenuItemToSwap]
	and a
	jp nz, .swappingPokemon
	pop af
	ldh [hTileAnimations], a
	bit 1, b
	jr nz, .noPokemonChosen
	ld a, [wPartyCount]
	and a
	jr z, .noPokemonChosen
	ld a, [wCurrentMenuItem]
	ld [wWhichPokemon], a
	ld hl, wPartySpecies
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wcf91], a
	ld [wBattleMonSpecies2], a
	call BankswitchBack
	and a
	ret
.noPokemonChosen
	call BankswitchBack
	scf
	ret
.swappingPokemon
	bit BIT_B_BUTTON, b
	jr z, .handleSwap ; if not, handle swapping the pokemon
.cancelSwap ; if the B button was pressed
	farcall ErasePartyMenuCursors
	xor a
	ld [wMenuItemToSwap], a
	ld [wPartyMenuTypeOrMessageID], a
	call RedrawPartyMenu
	jr HandlePartyMenuInput
.handleSwap
	ld a, [wCurrentMenuItem]
	ld [wWhichPokemon], a
	farcall SwitchPartyMon
	jr HandlePartyMenuInput

DrawPartyMenu::
	ld hl, DrawPartyMenu_
	jr DrawPartyMenuCommon

RedrawPartyMenu::
	ld hl, RedrawPartyMenu_

DrawPartyMenuCommon::
	ld b, BANK(RedrawPartyMenu_)
	jp Bankswitch

; prints a pokemon's status condition
; INPUT:
; de = address of status condition
; hl = destination address
PrintStatusCondition::
	push de
	dec de
	dec de ; de = address of current HP
	ld a, [de]
	ld b, a
	dec de
	ld a, [de]
	or b ; is the pokemon's HP zero?
	pop de
	jr nz, PrintStatusConditionNotFainted
; if the pokemon's HP is 0, print "FNT"
	ld a, "F"
	ld [hli], a
	ld a, "N"
	ld [hli], a
	ld [hl], "T"
	and a
	ret

PrintStatusConditionNotFainted::
	homecall_sf PrintStatusAilment
	ret

; function to print pokemon level, leaving off the ":L" if the level is at least 100
; INPUT:
; hl = destination address
; [wLoadedMonLevel] = level
PrintLevel::
	ld a, "<LV>" ; ":L" tile ID
	ld [hli], a
	ld c, 2 ; number of digits
	ld a, [wLoadedMonLevel] ; level
	cp 100
	jr c, PrintLevelCommon
; if level at least 100, write over the ":L" tile
	dec hl
	inc c ; increment number of digits to 3
	jr PrintLevelCommon

; prints the level without leaving off ":L" regardless of level
; INPUT:
; hl = destination address
; [wLoadedMonLevel] = level
PrintLevelFull::
	ld a, "<LV>" ; ":L" tile ID
	ld [hli], a
	ld c, 3 ; number of digits
	ld a, [wLoadedMonLevel] ; level

PrintLevelCommon::
	ld [wd11e], a
	ld de, wd11e
	ld b, LEFT_ALIGN | 1 ; 1 byte
	jp PrintNumber

GetwMoves::
; Unused. Returns the move at index a from wMoves in a
	ld hl, wMoves
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	ret

; copies the base stat data of a pokemon to wMonHeader
; INPUT:
; [wd0b5] = pokemon ID
GetMonHeader::
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(BaseStats)
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	push bc
	push de
	push hl
	ld a, [wd11e]
	push af
	ld a, [wd0b5]
	ld [wd11e], a
	ld de, FossilKabutopsPic
	ld b, $66 ; size of Kabutops fossil and Ghost sprites
	cp FOSSIL_KABUTOPS ; Kabutops fossil
	jr z, .specialID
	ld de, GhostPic
	cp MON_GHOST ; Ghost
	jr z, .specialID
	ld de, FossilAerodactylPic
	ld b, $77 ; size of Aerodactyl fossil sprite
	cp FOSSIL_AERODACTYL ; Aerodactyl fossil
	jr z, .specialID
	cp MEW
	jr z, .mew
	predef IndexToPokedex   ; convert pokemon ID in [wd11e] to pokedex number
	ld a, [wd11e]
	dec a
	ld bc, BASE_DATA_SIZE
	ld hl, BaseStats
	call AddNTimes
	ld de, wMonHeader
	ld bc, BASE_DATA_SIZE
	call CopyData
	jr .done
.specialID
	ld hl, wMonHSpriteDim
	ld [hl], b ; write sprite dimensions
	inc hl
	ld [hl], e ; write front sprite pointer
	inc hl
	ld [hl], d
	jr .done
.mew
	ld hl, MewBaseStats
	ld de, wMonHeader
	ld bc, BASE_DATA_SIZE
	ld a, BANK(MewBaseStats)
	call FarCopyData
.done
	ld a, [wd0b5]
	ld [wMonHIndex], a
	pop af
	ld [wd11e], a
	pop hl
	pop de
	pop bc
	pop af
	ldh [hLoadedROMBank], a
	ld [MBC1RomBank], a
	ret

; copy party pokemon's name to wcd6d
GetPartyMonName2::
	ld a, [wWhichPokemon] ; index within party
	ld hl, wPartyMonNicks

; this is called more often
GetPartyMonName::
	push hl
	push bc
	call SkipFixedLengthTextEntries ; add NAME_LENGTH to hl, a times
	ld de, wcd6d
	push de
	ld bc, NAME_LENGTH
	call CopyData
	pop de
	pop bc
	pop hl
	ret
