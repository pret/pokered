; PureRGBnote: ADDED: in this file, code for using the telephones in the mart were added.
CeladonMart1F_Script:
	jp EnableAutoTextBoxDrawing

CeladonMart1F_TextPointers:
	def_text_pointers
	dw_const CeladonMart1FReceptionistText,     TEXT_CELADONMART1F_RECEPTIONIST
	dw_const CeladonMart1FDirectorySignText,    TEXT_CELADONMART1F_DIRECTORY_SIGN
	dw_const CeladonMart1FCurrentFloorSignText, TEXT_CELADONMART1F_CURRENT_FLOOR_SIGN
	dw_const CeladonMart1PhoneLeft,             TEXT_CELADONMART1F_PHONE_LEFT
	dw_const CeladonMart1PhoneRight,            TEXT_CELADONMART1F_PHONE_RIGHT

CeladonMart1FReceptionistText:
	text_far _CeladonMart1FReceptionistText
	text_end

; PureRGBnote: CHANGED: this function was changed to reduce the amount of text data needed for duplicate text.
CeladonMart1FDirectorySignText:
	text_far _CeladonMart1FCurrentFloorSignText
	text_promptbutton
	text_asm
	ld hl, .2f
	rst _PrintText
	ld hl, .3f
	rst _PrintText
	ld hl, .4f
	rst _PrintText
	ld hl, .5f
	rst _PrintText
	ld hl, .roof
	rst _PrintText
	rst TextScriptEnd
.2f
	text_far _CeladonMart2FDirectorySignText
	text_promptbutton
	text_end
.3f
	text_far _CeladonMart3FCurrentFloorSignText
	text_promptbutton
	text_end
.4f
	text_far _CeladonMart4FDirectorySignText
	text_end
.5f
	text_far _CeladonMart5FCurrentFloorSignText
	text_promptbutton
	text_end
.roof
	text_far _CeladonMartRoofCurrentFloorSignText
	text_end

CeladonMart1FCurrentFloorSignText:
	text_far _CeladonMart1FCurrentFloorSignText
	text_end

CeladonMart1PhoneLeft:
CeladonMart1PhoneRight:
	text_asm
	call SaveScreenTilesToBuffer2
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, CeladonMart1PhoneQuestion
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .no
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $25
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .success
	ld hl, CeladonMart1PhoneNotEnoughCash
	jr .printText
.success
	ld hl, CeladonMart1CallWhoQuestion
	rst _PrintText
	ld hl, CeladonMartPhoneList
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBox
	jr nz, .no

	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
	call SubtractMoney
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	ld hl, CeladonMartUsePhoneCallStart
	rst _PrintText
	call DialPhone
	call StartCall
	ld a, SFX_NOISE_INSTRUMENT03
	call PlaySoundWaitForCurrent
	ld c, 5
	rst _DelayFrames
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
	ld a, SFX_NOISE_INSTRUMENT10
	rst _PlaySound
	ld hl, CeladonMartUsePhoneCallEnd
	rst _PrintText
	call PlayDefaultMusic
	rst TextScriptEnd
.no
	ld hl, CeladonMartUsePhoneTextNo
.printText
	rst _PrintText
.done
	rst TextScriptEnd

CeladonMart1PhoneQuestion:
	text_far _CeladonMartUsePhoneText
	text_end

CeladonMart1PhoneNotEnoughCash:
	text_far _GenericNotEnoughMoneyText
	text_end

CeladonMart1CallWhoQuestion:
	text_far _CeladonMartCallWhoText
	text_end

CeladonMartUsePhoneTextNo:
	text_far _CeladonMartUsePhoneTextNo
	text_end

CeladonMartUsePhoneCallStart:
	text_far _CeladonMartCallStartText
	text_end

CeladonMartUsePhoneCallEnd:
	text_far _CeladonMartUsePhoneCallEnd
	text_end

SubtractMoney:
	; put coin in
	ld a, SFX_59
	call PlaySoundWaitForCurrent
	; subtract money
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $25
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	; wait a little bit
	ld c, 40
	rst _DelayFrames
	ret

DialPhone:
	; dial
	ld b, 4
.loopdial
	ld a, SFX_SWITCH
	rst _PlaySound
	dec b
	jr z, .donedial
	ld c, 20
	rst _DelayFrames
	jr .loopdial
.donedial
	ld c, 50
	rst _DelayFrames

	; call outgoing sounds 
	call Random
	and %11 ; 0-3 rings
	ld b, a
	jr nz, .loop
	inc b ; if it's 0, increase it to 2
	inc b ; 50% of the time we'll get 2 rings
.loop
	push bc
	ld b, 60
.loop2
	push bc
	ld a, SFX_TURN_OFF_PC
	rst _PlaySound
	ld c, 2
	rst _DelayFrames
	pop bc
	dec b
	jr nz, .loop2
	pop bc
	dec b
	jr z, .doneOutgoing
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
	ld c, 120
	rst _DelayFrames
	jr .loop
.doneOutgoing
	; phone gets picked up
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	ld a, SFX_NOISE_INSTRUMENT01
	rst _PlaySound
	ld c, 5
	rst _DelayFrames
	ld a, SFX_STOP_ALL_MUSIC
	rst _PlaySound
	ld a, SFX_NOISE_INSTRUMENT06
	rst _PlaySound
	ld c, 10
	rst _DelayFrames
	ret

StartCall:
	ld a, [wCurrentMenuItem]
	add a
	ld d, 0
	ld e, a
	ld hl, CallScriptList
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

CallScriptList:
	dw CallHome
	dw CallOak
	dw CallRival
	db -1

CallHome:
	ld c, BANK(Music_PalletTown)
	ld a, MUSIC_PALLET_TOWN
	call PlayMusic
	call Random
	and %11
	jp z, .dad ; 25% chance of getting dad on the phone
	; mom picks up instead
	ld hl, CeladonMartCallMomText
	rst _PrintText
	ld hl, CeladonMartCallMomQuestion1
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CeladonMartCallMomGreatText
	jr z, .printTextGoodByeMom
	dec a
	jr z, .bored
	; homesick
	ResetEventRange EVENT_CALLED_MOM_RICE_BALLS, EVENT_CALLED_MOM_LASAGNA
	ld hl, CeladonMartCallMomHomesickText
	rst _PrintText
	ld hl, CeladonMartCallMomQuestion3
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CeladonMartCallMomRiceBallsText
	jr z, .printTextGoodByeMom
	dec a
	ld hl, CeladonMartCallMomJellyDonutsText
	jr z, .printTextGoodByeMom
	dec a
	ld hl, CeladonMartCallMomBrisketText
	jr z, .printTextGoodByeMom
	ld hl, CeladonMartCallMomLasagnaText
	jr .printTextGoodByeMom
.bored
	ld hl, CeladonMartCallMomBoredText
	rst _PrintText
	ld hl, CeladonMartCallMomQuestion2
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CeladonMartCallMomGoodIdeaText
	jr z, .printTextGoodByeMom
	ld hl, CeladonMartCallMomGamblingText
.printTextGoodByeMom
	rst _PrintText
	ld hl, CeladonMartCallMomGoodbyeText
	rst _PrintText
	ld hl, CeladonMartCallMomQuestion4
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	cp 2
	ld hl, CeladonMartCallMomGoodbyeSweetSon
	jr z, .done
	ld hl, CeladonMartCallMomGoodbyeComplete
	jr .done
.dad
	ld a, [wPlayerStarter]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, CeladonMartCallDadText
	rst _PrintText
	ld a, [wPlayerStarter]
	cp STARTER3
	ld hl, CeladonMartCallDadBulbasaurText
	jr z, .dadPart2
	cp STARTER2
	ld hl, CeladonMartCallDadSquirtleText
	jr z, .dadPart2
	ld hl, CeladonMartCallDadCharmanderText
.dadPart2
	rst _PrintText
	ld hl, wObtainedBadges
	ld b, 1
	call CountSetBits
	ld a, [wNumSetBits]
	add NUMBER_CHAR_OFFSET
	ld [w2CharStringBuffer], a
	ld a, "@"
	ld [w2CharStringBuffer + 1], a
	SetEvent EVENT_CALLED_DAD_WAITING
	ld hl, CeladonMartCallDadText2
.done
	rst _PrintText
	ret

CeladonMartCallMomText:
	text_far _CeladonMartCallMomText
	text_end

CeladonMartCallMomGreatText:
	text_far _CeladonMartCallMomGreatText
	text_end

CeladonMartCallMomBoredText:
	text_far _CeladonMartCallMomBoredText
	text_end

CeladonMartCallMomGoodIdeaText:
	text_far _CeladonMartCallMomGoodIdeaText
	text_end

CeladonMartCallMomGamblingText:
	text_far _CeladonMartCallMomGamblingText
	text_end

CeladonMartCallMomHomesickText:
	text_far _CeladonMartCallMomHomesickText
	text_end

CeladonMartCallMomRiceBallsText:
	text_far _CeladonMartCallMomRiceBallsText
	text_asm
	SetEvent EVENT_CALLED_MOM_RICE_BALLS
	rst TextScriptEnd

CeladonMartCallMomJellyDonutsText:
	text_far _CeladonMartCallMomJellyDonutsText
	text_asm
	SetEvent EVENT_CALLED_MOM_JELLY_DONUTS
	rst TextScriptEnd

CeladonMartCallMomBrisketText:
	text_asm
	ld hl, CeladonMartCallMomBrisketText1
	rst _PrintText
	CheckEvent EVENT_MET_DAD
	ld hl, CeladonMartCallMomBrisketText2
	jr z, .noDad
	ld hl, CeladonMartDadBrisketText
.noDad
	rst _PrintText
	ld hl, CeladonMartCallMomBrisketText3
	rst _PrintText
	SetEvent EVENT_CALLED_MOM_BRISKET
	rst TextScriptEnd

CeladonMartCallMomBrisketText1:
	text_far _CeladonMartCallMomBrisketText
	text_end

CeladonMartCallMomBrisketText2:
	text_far _CeladonMartCallMomBrisketText2
	text_end

CeladonMartDadBrisketText:
	text_far _CeladonMartDadBrisketText
	text_end

CeladonMartCallMomBrisketText3:
	text_far _CeladonMartCallMomBrisketText3
	text_end

CeladonMartCallMomLasagnaText:
	text_far _CeladonMartCallMomLasagnaText
	text_asm
	SetEvent EVENT_CALLED_MOM_LASAGNA
	rst TextScriptEnd

CeladonMartCallMomGoodbyeText:
	text_far _CeladonMartCallMomGoodbyeText
	text_end

CeladonMartCallMomGoodbyeSweetSon:
	text_far _CeladonMartCallMomGoodbyeSweetSon
	text_end

CeladonMartCallMomGoodbyeComplete:
	text_far _CeladonMartCallMomGoodbyeComplete
	text_end

CeladonMartCallDadText:
	text_far _CeladonMartCallDadText
	text_end

CeladonMartCallDadBulbasaurText:
	text_far _CeladonMartCallDadBulbasaurText
	text_end

CeladonMartCallDadCharmanderText:
	text_far _CeladonMartCallDadCharmanderText
	text_end

CeladonMartCallDadSquirtleText:
	text_far _CeladonMartCallDadSquirtleText
	text_end

CeladonMartCallDadText2:
	text_far _CeladonMartCallDadText2
	text_end

CallOak:
	ld c, BANK(Music_MeetProfOak)
	ld a, MUSIC_MEET_PROF_OAK
	call PlayMusic
	ld a, [wPlayerStarter]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, CeladonMartCallOakText
	rst _PrintText

	ld hl, CeladonMartCallOakQuestion1
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CeladonMartCallOakTextItEvolved
	jr z, .question2
	ld hl, CeladonMartCallOakTextILoveIt
.question2
	rst _PrintText
	ld hl, CeladonMartCallOakQuestion2
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer2
	ld a, [wCurrentMenuItem]
	and a
	ld hl, CeladonMartCallOakTextKeepingBusy
	jr z, .done
	ld hl, CeladonMartCallOakTextHowsDaisy
.done
	rst _PrintText
	ld hl, CeladonMartCallOakTextGottaGo
	rst _PrintText
	ret

CeladonMartCallOakText:
	text_far _CeladonMartCallOakText
	text_end

CeladonMartCallOakTextItEvolved:
	text_far _CeladonMartCallOakTextItEvolved
	text_end

CeladonMartCallOakTextILoveIt:
	text_far _CeladonMartCallOakTextILoveIt
	text_end

CeladonMartCallOakTextKeepingBusy:
	text_far _CeladonMartCallOakTextKeepingBusy
	text_end

CeladonMartCallOakTextHowsDaisy:
	text_far _CeladonMartCallOakTextHowsDaisy
	text_end

CeladonMartCallOakTextGottaGo:
	text_far _CeladonMartCallOakTextGottaGo
	text_end

CallRival:
	ld c, BANK(Music_PalletTown)
	ld a, MUSIC_PALLET_TOWN
	call PlayMusic
	ld hl, CeladonMartCallRivalText
	rst _PrintText
	CheckEvent EVENT_GOT_TOWN_MAP
	jr nz, .haveMap
	call .rivalPart1
	jr .rivalPart2
.haveMap
	ld hl, CeladonMartCallRivalText2
	rst _PrintText
	call .rivalPart1
	ld hl, CeladonMartCallRivalText3map
	rst _PrintText
.rivalPart2
	ld a, SFX_NOISE_INSTRUMENT04
	rst _PlaySound
	ld a, SFX_NOISE_INSTRUMENT05
	call PlaySoundWaitForCurrent
	ld hl, CeladonMartCallRivalText4
	rst _PrintText
	ret
.rivalPart1
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, CeladonMartCallRivalText3
	rst _PrintText
	SetEvent EVENT_CALLED_RIVAL_FROM_CELADON
	; make sure daisy sitting is the NPC that is shown because she can be walking around at this point
	ld a, HS_DAISY_SITTING
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_DAISY_WALKING
	ld [wMissableObjectIndex], a
	predef_jump HideObject

CeladonMartCallRivalText:
	text_far _CeladonMartCallRivalText
	text_end

CeladonMartCallRivalText2:
	text_far _CeladonMartCallRivalText2
	text_end

CeladonMartCallRivalText3:
	text_far _CeladonMartCallRivalText3
	text_end

CeladonMartCallRivalText3map:
	text_far _CeladonMartCallRivalText3map
	text_end

CeladonMartCallRivalText4:
	text_far _CeladonMartCallRivalText4
	text_end
