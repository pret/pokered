DisplayPartyMenu:: ; 13fc (0:13fc)
	ld a,[$ffd7]
	push af
	xor a
	ld [$ffd7],a
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call PartyMenuInit
	call DrawPartyMenu
	jp HandlePartyMenuInput

GoBackToPartyMenu:: ; 1411 (0:1411)
	ld a,[$ffd7]
	push af
	xor a
	ld [$ffd7],a
	call PartyMenuInit
	call RedrawPartyMenu
	jp HandlePartyMenuInput

PartyMenuInit:: ; 1420 (0:1420)
	ld a,$01
	call BankswitchHome
	call LoadHpBarAndStatusTilePatterns
	ld hl,wd730
	set 6,[hl] ; turn off letter printing delay
	xor a
	ld [wcc49],a
	ld [wcc37],a
	ld hl,wTopMenuItemY
	inc a
	ld [hli],a ; top menu item Y
	xor a
	ld [hli],a ; top menu item X
	ld a,[wcc2b]
	push af
	ld [hli],a ; current menu item ID
	inc hl
	ld a,[wPartyCount]
	and a ; are there more than 0 pokemon in the party?
	jr z,.storeMaxMenuItemID
	dec a
; if party is not empty, the max menu item ID is ([wPartyCount] - 1)
; otherwise, it is 0
.storeMaxMenuItemID
	ld [hli],a ; max menu item ID
	ld a,[wd11f]
	and a
	ld a,%00000011 ; A button and B button
	jr z,.next
	xor a
	ld [wd11f],a
	inc a
.next
	ld [hli],a ; menu watched keys
	pop af
	ld [hl],a ; old menu item ID
	ret

HandlePartyMenuInput:: ; 145a (0:145a)
	ld a,1
	ld [wMenuWrappingEnabled],a
	ld a,$40
	ld [wd09b],a
	call HandleMenuInputPokemonSelection
	call PlaceUnfilledArrowMenuCursor
	ld b,a
	xor a
	ld [wd09b],a
	ld a,[wCurrentMenuItem]
	ld [wcc2b],a
	ld hl,wd730
	res 6,[hl] ; turn on letter printing delay
	ld a,[wcc35]
	and a
	jp nz,.swappingPokemon
	pop af
	ld [$ffd7],a
	bit 1,b
	jr nz,.noPokemonChosen
	ld a,[wPartyCount]
	and a
	jr z,.noPokemonChosen
	ld a,[wCurrentMenuItem]
	ld [wWhichPokemon],a
	ld hl,wPartySpecies
	ld b,0
	ld c,a
	add hl,bc
	ld a,[hl]
	ld [wcf91],a
	ld [wBattleMonSpecies2],a
	call BankswitchBack
	and a
	ret
.noPokemonChosen
	call BankswitchBack
	scf
	ret
.swappingPokemon
	bit 1,b ; was the B button pressed?
	jr z,.handleSwap ; if not, handle swapping the pokemon
.cancelSwap ; if the B button was pressed
	callba ErasePartyMenuCursors
	xor a
	ld [wcc35],a
	ld [wd07d],a
	call RedrawPartyMenu
	jr HandlePartyMenuInput
.handleSwap
	ld a,[wCurrentMenuItem]
	ld [wWhichPokemon],a
	callba SwitchPartyMon
	jr HandlePartyMenuInput

DrawPartyMenu:: ; 14d4 (0:14d4)
	ld hl, DrawPartyMenu_
	jr DrawPartyMenuCommon

RedrawPartyMenu:: ; 14d9 (0:14d9)
	ld hl, RedrawPartyMenu_

DrawPartyMenuCommon:: ; 14dc (0:14dc)
	ld b, BANK(RedrawPartyMenu_)
	jp Bankswitch