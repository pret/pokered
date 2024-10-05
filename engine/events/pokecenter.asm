; PureRGBnote: ADDED: this code was modified to make it so you can speed up pokemon center dialog by holding B before talking to the nurse. 
;                     the ability to do this is unlocked by donating to the nurse at rock tunnel pokecenter.

DisplayPokemonCenterDialogue_::
	call SaveScreenTilesToBuffer1 ; save screen
	ld hl, wStatusFlags4
	bit BIT_USED_POKECENTER, [hl]
	set BIT_UNKNOWN_4_1, [hl]
	set BIT_USED_POKECENTER, [hl]
	ldh a, [hJoyHeld]
	bit BIT_B_BUTTON, a
	jr z, .normalWelcome ; NEW: if you're holding b when you start talking to the nurse, it'll skip right to healing.
.fastWelcome
	CheckEventHL EVENT_DONATED_TO_POKECENTER_CHARITY ; must donate to pokecenter charity at rock tunnel pokecenter to be able to do this
	jr z, .normalWelcome
	ld a, 1
	ld [wUnusedC000], a
	ld hl, PokemonCenterFastWelcomeText
	rst _PrintText
	jr .skipToHeal
.normalWelcome
	ld hl, PokemonCenterWelcomeText
	rst _PrintText
	jr nz, .skipShallWeHealYourPokemon
	ld hl, ShallWeHealYourPokemonText
	rst _PrintText
.skipShallWeHealYourPokemon
	call YesNoChoicePokeCenter ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declinedHealing ; if the player chose No
	; call SetLastBlackoutMap ; PureRGBnote: FIXED: set last blackout map on entering a pokemon center instead of when healing
	call LoadScreenTilesFromBuffer1 ; restore screen
	ld hl, NeedYourPokemonText
	rst _PrintText
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
	rst _PlaySound
	ld a, [wUnusedC000]
	and a
	jr nz, .skipFightingFit ; NEW: if you're holding b when you start talking to the nurse, it'll skip right to healing.
	ld hl, PokemonFightingFitText
	rst _PrintText
.skipFightingFit
	ld a, $14
	ld [wSprite01StateData1ImageIndex], a ; make the nurse bow
	ld c, a
	rst _DelayFrames
	jr .done
.declinedHealing
	call LoadScreenTilesFromBuffer1 ; restore screen
.done
	ld hl, PokemonCenterFarewellText
	rst _PrintText
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
