PKMNLeaguePC: ; 0x7657e
	ld hl, AccessedHoFPCText
	call PrintText
	ld hl, wd730
	set 6, [hl]
	push hl
	ld a, [wUpdateSpritesEnabled]
	push af
	ld a, [hTilesetType]
	push af
	xor a
	ld [hTilesetType], a
	ld [W_SPRITEFLIPPED], a
	ld [wUpdateSpritesEnabled], a
	ld [wTrainerScreenX], a
	ld [wcd42], a
	ld a, [wd5a2]
	ld b, a
	cp NUM_HOF_TEAMS + 1
	jr c, .first
	ld b, NUM_HOF_TEAMS
	sub b
	ld [wcd42], a
.first
	ld hl, wcd42
	inc [hl]
	push bc
	ld a, [wTrainerScreenX]
	ld [wWhichTrade], a
	callba LoadHallOfFameTeams
	call Func_765e5
	pop bc
	jr c, .second
	ld hl, wTrainerScreenX
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .first
.second
	pop af
	ld [hTilesetType], a
	pop af
	ld [wUpdateSpritesEnabled], a
	pop hl
	res 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call GoPAL_SET_CF1C
	jp GBPalNormal

Func_765e5: ; 765e5 (1d:65e5)
	ld c, PARTY_LENGTH
.loop
	push bc
	call Func_76610
	call WaitForTextScrollButtonPress
	ld a, [hJoyHeld]
	bit 1, a
	jr nz, .exit
	ld hl, wHallOfFame + HOF_MON
	ld de, wHallOfFame
	ld bc, HOF_TEAM - HOF_MON
	call CopyData
	pop bc
	ld a, [wHallOfFame + 0]
	cp $ff
	jr z, .done
	dec c
	jr nz, .loop
.done
	and a
	ret
.exit
	pop bc
	scf
	ret

Func_76610: ; 76610 (1d:6610)
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld hl, wHallOfFame
	ld a, [hli]
	ld [wWhichTrade], a
	ld [wcf91], a
	ld [wd0b5], a
	ld [wBattleMonSpecies2], a
	ld [wcf1d], a
	ld a, [hli]
	ld [wTrainerFacingDirection], a
	ld de, wcd6d
	ld bc, $000B
	call CopyData
	ld b, $0B
	ld c, 0
	call GoPAL_SET
	hlCoord 12, 5
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	call GBPalNormal
	hlCoord 0, 13
	ld b, 2
	ld c, $12
	call TextBoxBorder
	hlCoord 1, 15
	ld de, HallOfFameNoText
	call PlaceString
	hlCoord 16, 15
	ld de, wcd42
	ld bc, $0103
	call PrintNumber
	ld b, BANK(Func_702f0)
	ld hl, Func_702f0
	jp Bankswitch

HallOfFameNoText: ; 76670 (1d:6670)
	db "HALL OF FAME No   @"

AccessedHoFPCText: ; 76683 (1d:6683)
	TX_FAR _AccessedHoFPCText
	db "@"
