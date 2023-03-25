Route1_Script:
	jp EnableAutoTextBoxDrawing
	;ld hl, Route1_ScriptPointers
	ld a, [wRoute1CurScript]
	jp CallFunctionInTable

Route1_TextPointers:
	dw Route1Text1
	dw Route1Text2
	dw Route1Text3
	dw Route1OakText

Route1Text1:
	text_asm
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, Route1ViridianMartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, Route1Text_1cae8
	jr .done
.bag_full
	ld hl, Route1Text_1caf3
	jr .done
.got_item
	ld hl, Route1Text_1caee
.done
	call PrintText
	jp TextScriptEnd

Route1ViridianMartSampleText:
	text_far _Route1ViridianMartSampleText
	text_end

Route1Text_1cae8:
	text_far _Route1Text_1cae8
	sound_get_item_1
	text_end

Route1Text_1caee:
	text_far _Route1Text_1caee
	text_end

Route1Text_1caf3:
	text_far _Route1Text_1caf3
	text_end

Route1Text2:
	text_far _Route1Text2
	text_end

Route1Text3:
	text_far _Route1Text3
	text_end

; oak stuff begins here

; text
Route1OakText:
	text_asm
	ld hl, OakBeforeBattleText
	call PrintText

;	call YesNoChoice ; this whole bit doesn't work for some reason
;	ld a, [wCurrentMenuItem]
;	and a
;	ld hl, OakYes
;	jr nz, .got_text
;	ld hl, OakNo
;.got_text
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	
	call Delay3
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a

	; select which team to use during the encounter
	ld a, [wRivalStarter]
	cp STARTER2
	jr nz, .NotSquirtle 
	ld a, $2 ; If Charmander, Venusaur
	jr .done
.NotSquirtle
	cp STARTER3
	jr nz, .Charmander
	ld a, $3 ; If Bulbasaur, Totartle
	jr .done
.Charmander
	cp STARTER1
	jr nz, .Pikachu
	ld a, $1 ; If Squirtle, Charizard
	jr .done
.Pikachu
	cp STARTER4
	jr nz, .Eevee
	ld a, $4 ; If Pikachu, Espeon
	jr .done
.Eevee
	ld a, $5 ; If Eevee, Gorochu
	jr .done
.done
	ld [wTrainerNo], a
	ld a, 1
	ld [wIsTrainerBattle], a

	ld a, $2
	ld [wRoute1CurScript], a
	
	ld hl, OakDefeatedText
	ld de, OakWonText
	call SaveEndBattleTextPointers
	jp TextScriptEnd

OakBeforeBattleText:
	text_far _OakBeforeBattleText
	text_end

OakDefeatedText:
	text_far _OakDefeatedText
	text_end

OakWonText:
	text_far _OakWonText
	text_end

OakYes:
	text_far _OakYes
	text_end

OakNo:
	text_far _OakNo
	text_end