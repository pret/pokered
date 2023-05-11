CitrineRocketHouse_Script:
	jp EnableAutoTextBoxDrawing

CitrineRocketHouse_TextPointers:
	dw MartGuy1Text
	dw MartGuy2Text
	dw RocketText1
	dw RocketText2
	dw MeowthText
	dw JamesText
	dw JessieFight

MartGuy1Text:
	script_mart TM_SWORDS_DANCE, TM_TOXIC, TM_BODY_SLAM, TM_DOUBLE_EDGE, TM_BUBBLEBEAM, TM_ICE_BEAM, TM_BLIZZARD, TM_PAY_DAY, TM_COUNTER, TM_SEISMIC_TOSS, TM_MEGA_DRAIN, TM_THUNDERBOLT, TM_EARTHQUAKE, TM_DIG,

MartGuy2Text:
	script_mart  TM_PSYCHIC_M, TM_FIRE_BLAST, TM_THUNDER_WAVE, TM_EXPLOSION, TM_ROCK_SLIDE, PROTECTOR, UP_GRADE, DUBIOUS_DISC, METAL_COAT, BLK_AUGURITE, DOME_FOSSIL, HELIX_FOSSIL, WING_FOSSIL, OLD_AMBER

RocketText1:
	text_far _RocketText1
	text_end

RocketText2:
	text_far _RocketText2
	text_end

MeowthText:
	text_far _MeowthText
	text_asm
	ld a, MEOWTH
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

; James serves as our "Mr. Hyper". In the anime, it's revealed he collects Bottle Caps,
;so I think this is fitting.
JamesText:
	text_far _JamesText
	text_asm
	call SaveScreenTilesToBuffer2 ; It really doesn't need to be done this early, it just helps.
	
	ld b, BOTTLE_CAP ; Check bag for Bottle Caps. We only need one for this.
	predef GetQuantityOfItemInBag
	ld a, b
	and a
	jr z, .done ; If zero, James just moans as normal.
	
	ld hl, JamesSeesBottleCap ; Otherwise, he perks up.
	call PrintText
	
	call YesNoChoice ; Yes/No Prompt
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	; Proceed from here as if Yes is stated. 
	; Here, the menu should pop up and the player picks a Pokemon to juice.
	xor a
	ld [wUpdateSpritesEnabled], a
	ld [wPartyMenuTypeOrMessageID], a
	ld [wMenuItemToSwap], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	pop af
	ld hl, JamesDone
	call PrintText
	
	; DV increasing process.
	ld hl, %11111111; Fill out Attack and Defence
	
	; This can apparently work with 16-bit but it doesn't do what I want it to...right now. 
	;ld b, 0
	;ld c, a
	;add hl, bc
	
	ld [wPartyMon1DVs], a
	
	jr .done
.refused
	ld hl, JamesNo
	call PrintText
	jr .done
.done
	jp TextScriptEnd

JessieText1:
	text_far _JessieText1
	text_end

JessieFight:
	text_asm
	ld c, 0 ; BANK(Music_MeetJessieJames)
	ld a, MUSIC_MEET_JESSIE_JAMES
	call PlayMusic
	
	ld hl, JessieText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused

	ld hl, JessieFightText
	call PrintText
	
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	call Delay3
	ld a, OPP_JESSIE_JAMES
	ld [wCurOpponent], a
	ld a, 5
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $5
	ld [wCitrineRocketHouseCurScript], a
	ld hl, JessieLoseText
	ld de, JessieWinText
	call SaveEndBattleTextPointers
	jp TextScriptEnd
	jr .done
 .refused
	 ld hl, JessieText2
	 jr .done
 .done
	ld hl, JessieAfterBattleText
	call PrintText
	ld c, 0 ; BANK(Music_Dungeon2)
	ld a, MUSIC_DUNGEON1
	call PlayMusic
	jp TextScriptEnd

JessieFightText:
	text_far _JessieFightText
	text_end

JessieWinText:
	text_far _JessieWinText
	text_end

JessieLoseText:
	text_far _JessieLoseText
	text_end

JessieText2:
	text_far _JessieText2
	text_end

JessieAfterBattleText:
	text_far _JessieAfterBattleText
	text_end

JamesOpen:
	text_far _JamesText
	text_end

JamesSeesBottleCap:
	text_far _JamesSeesBottleCap
	text_end

JamesYes:
	text_far _JamesYes
	text_end

JamesNo:
	text_far _JamesNo
	text_end

JamesDone:
	text_far _JamesDone
	text_end
