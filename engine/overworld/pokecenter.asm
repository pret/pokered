DisplayPokemonCenterDialogue_: ; 6fe6 (1:6fe6)
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, PokemonCenterWelcomeText
	call PrintText
	ld hl, $d72e
	bit 2, [hl]
	set 1, [hl]
	set 2, [hl]
	jr nz, .skipShallWeHealYourPokemon
	ld hl, ShallWeHealYourPokemonText
	call PrintText
.skipShallWeHealYourPokemon
	call YesNoChoicePokeCenter ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	call SetLastBlackoutMap
	call LoadScreenTilesFromBuffer1 ; restore screen
	ld hl, NeedYourPokemonText
	call PrintText
	ld a, $18
	ld [$c112], a ; make the nurse turn to face the machine
	call Delay3
	PREDEF HealPartyPredef
	callba AnimateHealingMachine ; do the healing machine animation
	xor a
	ld [wMusicHeaderPointer], a
	ld a, [$c0f0]
	ld [$c0ef], a
	ld a, [$d35b]
	ld [$cfca], a
	ld [$c0ee], a
	call PlaySound
	ld hl, PokemonFightingFitText
	call PrintText
	ld a, $14
	ld [$c112], a ; make the nurse bow
	ld c, a
	call DelayFrames
	jr .done
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	call PrintText
	jp UpdateSprites ; move sprites

PokemonCenterWelcomeText: ; 705d (1:705d)
	TX_FAR _PokemonCenterWelcomeText
	db "@"

ShallWeHealYourPokemonText: ; 7062 (1:7062)
	db $a
	TX_FAR _ShallWeHealYourPokemonText
	db "@"

NeedYourPokemonText: ; 7068 (1:7068)
	TX_FAR _NeedYourPokemonText
	db "@"

PokemonFightingFitText: ; 706d (1:706d)
	TX_FAR _PokemonFightingFitText
	db "@"

PokemonCenterFarewellText: ; 7072 (1:7072)
	db $a
	TX_FAR _PokemonCenterFarewellText
	db "@"
