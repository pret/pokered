PKMNLeaguePC:
	ld hl, AccessedHoFPCText
	call PrintText
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	push hl
	ld a, [wUpdateSpritesEnabled]
	push af
	ldh a, [hTileAnimations]
	push af
	xor a
	ldh [hTileAnimations], a
	ld [wSpriteFlipped], a
	ld [wUpdateSpritesEnabled], a
	ld [wHoFTeamIndex2], a
	ld [wHoFTeamNo], a
	ld a, [wNumHoFTeams]
	ld b, a
	cp HOF_TEAM_CAPACITY + 1
	jr c, .loop
; If the total number of hall of fame teams is greater than the storage
; capacity, then calculate the number of the first team that is still recorded.
	ld b, HOF_TEAM_CAPACITY
	sub b
	ld [wHoFTeamNo], a
.loop
	ld hl, wHoFTeamNo
	inc [hl]
	push bc
	ld a, [wHoFTeamIndex2]
	ld [wHoFTeamIndex], a
	farcall LoadHallOfFameTeams
	call LeaguePCShowTeam
	pop bc
	jr c, .doneShowingTeams
	ld hl, wHoFTeamIndex2
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .loop
.doneShowingTeams
	pop af
	ldh [hTileAnimations], a
	pop af
	ld [wUpdateSpritesEnabled], a
	pop hl
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call RunDefaultPaletteCommand
	jp GBPalNormal

LeaguePCShowTeam:
	ld c, PARTY_LENGTH
.loop
	push bc
	call LeaguePCShowMon
	call WaitForTextScrollButtonPress
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
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

LeaguePCShowMon:
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld hl, wHallOfFame
	ld a, [hli]
	ld [wHoFMonSpecies], a
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	ld [wBattleMonSpecies2], a
	ld [wWholeScreenPaletteMonSpecies], a
	ld a, [hli]
	ld [wHoFMonLevel], a
	ld de, wNameBuffer
	ld bc, NAME_LENGTH
	call CopyData
	ld b, SET_PAL_POKEMON_WHOLE_SCREEN
	ld c, 0
	call RunPaletteCommand
	hlcoord 12, 5
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	call GBPalNormal
	hlcoord 0, 13
	ld b, 2
	ld c, $12
	call TextBoxBorder
	hlcoord 1, 15
	ld de, HallOfFameNoText
	call PlaceString
	hlcoord 16, 15
	ld de, wHoFTeamNo
	lb bc, 1, 3
	call PrintNumber
	farjp HoFDisplayMonInfo

HallOfFameNoText:
	db "HALL OF FAME No   @"

AccessedHoFPCText:
	text_far _AccessedHoFPCText
	text_end
