RedsHouse1F_Script:
	jp EnableAutoTextBoxDrawing

RedsHouse1F_TextPointers:
	dw RedsHouse1FText1
	dw RedsHouse1FText2

RedsHouse1FText1: ; Mom
	text_asm
	ld a, [wd72e]
	bit 3, a
	jr nz, .heal ; if player has received a Pokémon from Oak, heal team
	ld hl, MomWakeUpText
	call PrintText
	jr .done
.heal
	call MomHealPokemon
.done
	jp TextScriptEnd

MomWakeUpText:
	text_far _MomWakeUpText
	text_end

MomHealPokemon:
	ld hl, MomHealText1
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
	ld hl, MomHealText2
	jp PrintText

MomHealText1:
	text_far _MomHealText1
	text_end
MomHealText2:
	text_far _MomHealText2
	text_end

RedsHouse1FText2: ; TV
	text_asm
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ld hl, TVWrongSideText
	jr nz, .notUp
	ld hl, StandByMeText
.notUp
	call PrintText
	jp TextScriptEnd

StandByMeText:
	text_far _StandByMeText
	text_end

TVWrongSideText:
	text_far _TVWrongSideText
	text_end
