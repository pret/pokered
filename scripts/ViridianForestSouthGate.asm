ViridianForestSouthGate_Script:
	jp EnableAutoTextBoxDrawing

ViridianForestSouthGate_TextPointers:
	dw ViridianForestEntranceText1
	dw ViridianForestEntranceText2
	dw House1FMomText

ViridianForestEntranceText1:
	text_far _ViridianForestEntranceText1
	text_end

ViridianForestEntranceText2:
	text_far _ViridianForestEntranceText2
	text_end
	
House1FMomText:
	text_asm
	ld a, [wd72e]
	bit 3, a ; received a Pokémon from Oak?
	jr nz, .heal
	ld hl, WakeUpText
	call PrintText
	jr .done
.heal
	call HealPokemon
.done
	jp TextScriptEnd

WakeUpText:
	text_far _MomWakeUpText
	text_end

HealPokemon:
	ld hl, HealText1
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, HealText2
	jp PrintText

HealText1:
	text_far _ViridianSouthGateHealText1
	text_end
HealText2:
	text_far _ViridianSouthGateHealText2
	text_end