RedsHouse1FScript: ; 48168 (12:4168)
	jp EnableAutoTextBoxDrawing

RedsHouse1FTextPointers: ; 4816b (12:416b)
	dw RedsHouse1FText1
	dw RedsHouse1FText2

RedsHouse1FText1: ; 4816f (12:416f) ; 416F Mom
	db 8
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

MomWakeUpText: ; 48185 (12:4185)
	TX_FAR _MomWakeUpText
	db "@"

MomHealPokemon: ; 4818a (12:418a)
	ld hl, MomHealText1
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wc0ee], a
	call PlaySound ; play sound?
.next
	ld a, [wc026]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wd35b]
	ld [wc0ee], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, MomHealText2
	jp PrintText

MomHealText1: ; 481bc (12:41bc)
	TX_FAR _MomHealText1
	db "@"
MomHealText2: ; 481c1 (12:41c1)
	TX_FAR _MomHealText2
	db "@"

RedsHouse1FText2: ; 0x481c6 TV
	db 8
	ld a,[wSpriteStateData1 + 9]
	cp 4
	ld hl,TVWrongSideText
	jr nz,.done ; if player is not facing up
	ld hl,StandByMeText
.done
	call PrintText
	jp TextScriptEnd

StandByMeText: ; 481da (12:41da)
	TX_FAR _StandByMeText
	db "@"

TVWrongSideText: ; 481df (12:41df)
	TX_FAR _TVWrongSideText
	db "@"
