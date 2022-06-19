DisplayPokemonCenterDialogue_::
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, wd72e
	bit 2, [hl]
	set 1, [hl]
	set 2, [hl]
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
	jr z, .normalWelcome ; NEW: if you're holding b when you start talking to the nurse, it'll skip right to healing.
.fastWelcome
	CheckEventHL EVENT_DONATED_TO_POKECENTER_CHARITY ; must donate to pokecenter charity at rock tunnel pokecenter to be able to do this
	jr z, .normalWelcome
	ld a, 1
	ld [wUnusedC000], a
	ld hl, PokemonCenterFastWelcomeText
	call PrintText
	jr .skipToHeal
.normalWelcome
	ld hl, PokemonCenterWelcomeText
	call PrintText
	jr nz, .skipShallWeHealYourPokemon
	ld hl, ShallWeHealYourPokemonText
	call PrintText
.skipShallWeHealYourPokemon
	call YesNoChoicePokeCenter ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	; call SetLastBlackoutMap ; FIXED: set last blackout map on entering a pokemon center instead of when healing
	call LoadScreenTilesFromBuffer1 ; restore screen
	ld hl, NeedYourPokemonText
	call PrintText
.skipToHeal
	ld a, $18
	ld [wSprite01StateData1ImageIndex], a ; make the nurse turn to face the machine
	call Delay3
	predef HealParty
	farcall AnimateHealingMachine ; do the healing machine animation
	xor a
	ld [wAudioFadeOutControl], a
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, [wMapMusicSoundID]
	ld [wLastMusicSoundID], a
	ld [wNewSoundID], a
	call PlaySound
	ld a, [wUnusedC000]
	and a
	jr nz, .skipFightingFit ; NEW: if you're holding b when you start talking to the nurse, it'll skip right to healing.
	ld hl, PokemonFightingFitText
	call PrintText
.skipFightingFit
	ld a, $14
	ld [wSprite01StateData1ImageIndex], a ; make the nurse bow
	ld c, a
	call DelayFrames
	jr .done
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	call PrintText
	xor a
	ld [wUnusedC000], a
	jp UpdateSprites

PokemonCenterWelcomeText:
	text_far _PokemonCenterWelcomeText
	text_end

ShallWeHealYourPokemonText:
	text_pause
	text_far _ShallWeHealYourPokemonText
	text_end

NeedYourPokemonText:
	text_far _NeedYourPokemonText
	text_end

PokemonCenterFastWelcomeText:
	text_far _PokemonCenterFastWelcomeText
	text_end

PokemonFightingFitText:
	text_far _PokemonFightingFitText
	text_end

PokemonCenterFarewellText:
	text_pause
	text_far _PokemonCenterFarewellText
	text_end
