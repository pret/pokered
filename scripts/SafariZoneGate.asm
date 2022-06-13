

SafariZoneGate_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SafariZoneGate_ScriptPointers
	ld a, [wSafariZoneGateCurScript]
	jp CallFunctionInTable

SafariZoneGate_ScriptPointers:
	dw .SafariZoneEntranceScript0
	dw .SafariZoneEntranceScript1
	dw .SafariZoneEntranceScript2
	dw .SafariZoneEntranceScript3
	dw .SafariZoneEntranceScript4
	dw .SafariZoneEntranceScript5
	dw .SafariZoneEntranceScript6
	dw .SafariZoneEntranceScript7

.SafariZoneEntranceScript0
	ld hl, .CoordsData_75221
	call ArePlayerCoordsInArray
	ret nc
	ld a, $3
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	xor a
	ldh [hJoyHeld], a
	ld a, SPRITE_FACING_RIGHT
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, [wCoordIndex]
	cp $1
	jr z, .asm_7520f
	ld a, $2
	ld [wSafariZoneGateCurScript], a
	ret
.asm_7520f
	ld a, D_RIGHT
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ld [wSafariZoneGateCurScript], a
	ret

.CoordsData_75221:
	dbmapcoord  3,  2
	dbmapcoord  4,  2
	db -1 ; end

.SafariZoneEntranceScript1
	call SafariZoneEntranceScript_752b4
	ret nz
.SafariZoneEntranceScript2
	xor a
	ldh [hJoyHeld], a
	ld [wJoyIgnore], a
	call UpdateSprites
	ld a, $4
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ret

.SafariZoneEntranceScript3
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $5
	ld [wSafariZoneGateCurScript], a
	ret

.SafariZoneEntranceScript5
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerMovingDirection], a
	CheckAndResetEvent EVENT_SAFARI_GAME_OVER
	jr z, .asm_7527f
	ResetEventReuseHL EVENT_IN_SAFARI_ZONE
	call UpdateSprites
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wSafariType]
	and a
	jr nz, .rangerHuntDone
	ld a, $6
	jr .doneSafari
.rangerHuntDone
	ld a, [wNumSafariBalls] ; if wNumSafariBalls = 0 at the end of Ranger Hunt safari, we've defeated all rangers and won
	and a
	jr z, .rangerHuntSuccess
	ld a, $7 ; failed ranger hunt
	jr .doneSafari
.rangerHuntSuccess
	ld a, $8
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wNumSafariBalls], a
	ld a, D_DOWN
	ld c, $2
	call SafariZoneEntranceAutoWalk
	ld a, $7
	ld [wSafariZoneGateCurScript], a
	jr .asm_75286
.doneSafari
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	xor a
	ld [wNumSafariBalls], a
	ld a, D_DOWN
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ld a, $4
	ld [wSafariZoneGateCurScript], a
	jr .asm_75286
.asm_7527f
	ld a, $5
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_75286
	ret

.SafariZoneEntranceScript4
	call SafariZoneEntranceScript_752b4
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, $0
	ld [wSafariZoneGateCurScript], a
	ret

.SafariZoneEntranceScript6
	call SafariZoneEntranceScript_752b4
	ret nz
	call Delay3
	ld a, [wcf0d]
	ld [wSafariZoneGateCurScript], a
	ret

.SafariZoneEntranceScript7
	call SafariZoneEntranceScript_752b4
	ret nz
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	ld a, $9
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, D_DOWN
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $4
	ld [wSafariZoneGateCurScript], a
	ret	

SafariZoneEntranceAutoWalk:
	push af
	ld b, 0
	ld a, c
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

SafariZoneEntranceScript_752b4:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret

SafariZoneGate_TextPointers:
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText2
	dw .SafariZoneEntranceText1
	dw .SafariZoneEntranceText4
	dw .SafariZoneEntranceText5
	dw .SafariZoneEntranceText6
	dw .SafariZoneEntranceText7
	dw .SafariZoneEntranceText8
	dw .SafariZoneEntranceText9

.SafariZoneEntranceText1Get
	text_far _SafariZoneEntranceText1
	text_end

.SafariZoneEntranceHyperBallOwedText
	text_far _SafariZoneEntranceHyperBallOwedText
	text_end

.SafariZoneEntranceText1
	text_asm
	CheckEvent EVENT_OWED_HYPER_BALL
	jr nz, .owedHyperBall1
	jr .default1
.owedHyperBall1
	ld hl, .SafariZoneEntranceHyperBallOwedText
	call PrintText
	jr .done1
.default1
	ld hl, .SafariZoneEntranceText1Get
	call PrintText
.done1
	jp TextScriptEnd
	

.SafariZoneEntranceText_9e6e4
	text_far _SafariZoneEntranceText_9e6e4
	text_end	

.SafariZoneEntranceText4
	text_asm
	CheckEvent EVENT_OWED_HYPER_BALL
	jr nz, .owedHyperBall4
	jr .default4
.owedHyperBall4
	ld a, PLAYER_DIR_RIGHT
	ld [wPlayerMovingDirection], a
	call GiveHyperBall
	jp .CantPayWalkDown
.default4
	ld hl, .SafariZoneEntranceText_9e6e4
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .PleaseComeAgain
	xor a
	ldh [hMoney], a
	ld a, $05
	ldh [hMoney + 1], a
	ld a, $00
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .success
	ld hl, .NotEnoughMoneyText
	call PrintText
	jr .CantPayWalkDown

.success
	xor a
	ld [wPriceTemp], a
	ld a, $05
	ld [wPriceTemp + 1], a
	ld a, $00
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, .MakePaymentText
	call PrintText
	call AskGameType
	jr c, .PleaseComeAgain ; if we cancelled, don't continue
	ld a, D_UP
	ld c, 3
	call SafariZoneEntranceAutoWalk
	SetEvent EVENT_IN_SAFARI_ZONE
	ResetEventReuseHL EVENT_SAFARI_GAME_OVER
	ResetEventRange EVENT_BEAT_SAFARI_ZONE_CENTER_RANGER_0, EVENT_BEAT_SAFARI_ZONE_WEST_TRAINER_4 ;reset all trainers in the safari zone so they can be battled again
	ld a, 3
	ld [wSafariZoneGateCurScript], a
	jr .done
.PleaseComeAgain
	ld hl, PleaseComeAgainText
	call PrintText
.CantPayWalkDown
	ld a, D_DOWN
	ld c, 1
	call SafariZoneEntranceAutoWalk
	ld a, 4
	ld [wSafariZoneGateCurScript], a
.done
	jp TextScriptEnd

.MakePaymentText
	text_far SafariZoneEntranceText_9e747
	text_end

.NotEnoughMoneyText
	text_far _SafariZoneEntranceText_7536a
	text_end

.SafariZoneEntranceText5
	text_far SafariZoneEntranceText_9e814
	text_asm
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_7539c
	ld hl, .SafariZoneEntranceText_753bb
	call PrintText
	xor a
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, D_DOWN
	ld c, $3
	call SafariZoneEntranceAutoWalk
	ResetEvents EVENT_SAFARI_GAME_OVER, EVENT_IN_SAFARI_ZONE
	ld a, $0
	ld [wcf0d], a
	jr .asm_753b3
.asm_7539c
	ld hl, .SafariZoneEntranceText_753c0
	call PrintText
	ld a, SPRITE_FACING_UP
	ld [wSpritePlayerStateData1FacingDirection], a
	ld a, D_UP
	ld c, $1
	call SafariZoneEntranceAutoWalk
	ld a, $5
	ld [wcf0d], a
.asm_753b3
	ld a, $6
	ld [wSafariZoneGateCurScript], a
	jp TextScriptEnd

.SafariZoneEntranceText_753bb
	text_far _SafariZoneEntranceText_753bb
	text_end

.SafariZoneEntranceText_753c0
	text_far _SafariZoneEntranceText_753c0
	text_end

.SafariZoneEntranceText6
	text_far _SafariZoneEntranceText_753c5
	text_end

.SafariZoneEntranceText7
	text_far _RangerHuntDoneFailText
	text_end

.SafariZoneEntranceText8
	text_asm 
	ld hl, .RangerHuntDoneSuccessText
	call PrintText
	SetEvent EVENT_OWED_HYPER_BALL
	jp TextScriptEnd

.RangerHuntDoneSuccessText
	text_far _RangerHuntDoneSuccessText
	text_end

.SafariZoneEntranceText2
	text_asm
	ld hl, .FirstTimeQuestionText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .RegularText
	jr nz, .Explanation
	call AskGameTypeExplanation
	jr c, .noSelection
	jp TextScriptEnd
.noSelection
	ld hl, PleaseComeAgainText
.Explanation
	call PrintText
	jp TextScriptEnd

.FirstTimeQuestionText
	text_far _SafariZoneEntranceText_753e6
	text_end

.RegularText
	text_far _SafariZoneEntranceText_753f0
	text_end

.SafariZoneEntranceText9
	text_asm
	call GiveHyperBall
	jp TextScriptEnd

AskGameType:
	ld a, 0
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld hl, SafariZoneEntranceWhatGame
	call PrintText
	ld hl, GameList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .goodbye
	ld hl, TextPointers_SafariGames
	ld a, [wcf91]
	sub SAFARI_CLASSIC
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
.goodbye
	; give back the 500 that was just deducted
	ld de, wPlayerMoney + 2
	ld hl, hMoney + 2 ; total price of items
	ld c, 3 ; length of money in bytes
	predef AddBCDPredef ; add total price to money
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redraw money text box
	scf
	ret

GameList:
	db 3
	db SAFARI_CLASSIC
	db SAFARI_RANGER_HUNT
	db SAFARI_FREE_ROAM
	db -1 ; end

TextPointers_SafariGames:
	dw SafariClassicPaidInfo
	dw SafariRangerHuntPaidInfo
	dw SafariFreeRoamPaidInfo

SafariZoneEntranceWhatGame:
	text_far _SafariZoneEntranceWhatGame
	text_end

PleaseComeAgainText:
	text_far _SafariZoneEntranceText_75365
	text_end

SafariClassicPaidInfo:
	text_asm
	ld hl, SafariZoneClassicText
	call PrintText
	ld hl, SafariZoneEntranceSafariBallsReceived
	call PrintText
	ld hl, SafariZonePAText
	call PrintText
	ld a, 30
	ld [wNumSafariBalls], a
	ld a, HIGH(702)
	ld [wSafariSteps], a
	ld a, LOW(702)
	ld [wSafariSteps + 1], a
	ld a, SAFARI_TYPE_CLASSIC
	ld [wSafariType], a
	call HideAllTrainers
	jp TextScriptEnd

SafariRangerHuntPaidInfo:
	text_asm
	ld hl, SafariZoneRangerHunt
	call PrintText
	ld hl, SafariZonePATextNoBalls
	call PrintText
	ld a, 5
	ld [wNumSafariBalls], a ; Number of Rangers (reused Safari Ball flag)
	ld a, HIGH(702)
	ld [wSafariSteps], a
	ld a, LOW(702)
	ld [wSafariSteps + 1], a
	ld a, SAFARI_TYPE_RANGER_HUNT
	ld [wSafariType], a
	call ShowAllTrainers
	jp TextScriptEnd

SafariFreeRoamPaidInfo:
	text_asm
	ld hl, SafariZoneFreeRoam
	call PrintText
	xor a
	ld [wNumSafariBalls], a
	ld a, SAFARI_TYPE_FREE_ROAM
	ld [wSafariType], a
	call ShowAllTrainers
	call HideRangers
	jp TextScriptEnd

SafariZoneClassicText:
	text_far _SafariZoneClassic
	text_end

SafariZoneEntranceSafariBallsReceived:
	text_far _SafariZoneEntranceSafariBallsReceived
	sound_get_item_1
	text_end

SafariZonePAText:
	text_far _SafariZoneEntranceText_75360
	text_end

SafariZoneRangerHunt:
	text_far _SafariZoneRangerHunt
	text_end

SafariZoneFreeRoam:
	text_far _SafariZoneFreeRoam
	text_end

SafariZonePATextNoBalls:
	text_far _SafariZonePATextNoBalls
	text_end

GiveHyperBall:
	lb bc, HYPER_BALL, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHyperBallText
	call PrintText
	ResetEvent EVENT_OWED_HYPER_BALL
	jr .done
.BagFull
	ld hl, HyperBallNoRoomText
	call PrintText
	jr .done
.done
	ret

ReceivedHyperBallText:
	text_far _ReceivedHyperBallText
	sound_get_key_item
	text_end

HyperBallNoRoomText:
	text_far _TM34NoRoomText
	text_end

HideShowRangers:
	db HS_SAFARI_ZONE_NORTH_RANGER_0
	db HS_SAFARI_ZONE_WEST_RANGER_0
	db HS_SAFARI_ZONE_WEST_RANGER_1
	db HS_SAFARI_ZONE_CENTER_RANGER_0
	db HS_SAFARI_ZONE_EAST_RANGER_0
	db -1 ; end

HideShowTrainers:
	db HS_SAFARI_ZONE_EAST_RANGER_0     
	db HS_SAFARI_ZONE_EAST_TRAINER_0    
	db HS_SAFARI_ZONE_EAST_TRAINER_1    
	db HS_SAFARI_ZONE_EAST_TRAINER_2    
	db HS_SAFARI_ZONE_EAST_TRAINER_3    
	db HS_SAFARI_ZONE_NORTH_RANGER_0    
	db HS_SAFARI_ZONE_NORTH_TRAINER_0   
	db HS_SAFARI_ZONE_NORTH_TRAINER_1   
	db HS_SAFARI_ZONE_NORTH_TRAINER_2   
	db HS_SAFARI_ZONE_NORTH_TRAINER_3   
	db HS_SAFARI_ZONE_NORTH_TRAINER_4   
	db HS_SAFARI_ZONE_WEST_RANGER_0    
	db HS_SAFARI_ZONE_WEST_RANGER_1    
	db HS_SAFARI_ZONE_WEST_TRAINER_0   
	db HS_SAFARI_ZONE_WEST_TRAINER_1   
	db HS_SAFARI_ZONE_WEST_TRAINER_2   
	db HS_SAFARI_ZONE_WEST_TRAINER_3   
	db HS_SAFARI_ZONE_WEST_TRAINER_4   
	db HS_SAFARI_ZONE_CENTER_RANGER_0     
	db HS_SAFARI_ZONE_CENTER_TRAINER_0    
	db HS_SAFARI_ZONE_CENTER_TRAINER_1    
	db HS_SAFARI_ZONE_CENTER_TRAINER_2    
	db HS_SAFARI_ZONE_CENTER_TRAINER_3
	db -1 ; end 

HideAllTrainers:
	ld hl, HideShowTrainers         ; table items to hide
	jp HideAllHl

ShowAllTrainers:
	ld hl, HideShowTrainers         ; table items to hide
	jp ShowAllHl

HideRangers:
	ld hl, HideShowRangers
	jp HideAllHl

ShowAllHl:
.loop
	ld a, [hli]                  ; read move from move table
	ld [wMissableObjectIndex], a
	push af
	push hl
	predef ShowExtraObject
	pop hl
	pop af
	inc a
	jr nz, .loop
.done
	ret

HideAllHl:
.loop
	ld a, [hli]                  ; read move from move table
	ld [wMissableObjectIndex], a
	push af
	push hl
	predef HideExtraObject
	pop hl
	pop af
	inc a
	jr nz, .loop
.done
	ret

AskGameTypeExplanation:
	ld a, 0
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
	ld hl, SafariZoneHelp
	call PrintText
	ld hl, GameList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld a, SPECIALLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .goodbye
	ld hl, TextPointers_SafariExplanations
	ld a, [wcf91]
	sub SAFARI_CLASSIC
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
.goodbye
	scf
	ret

TextPointers_SafariExplanations:
	dw ExplanationText
	dw SafariZoneRangerHunt
	dw SafariZoneFreeRoam

SafariZoneHelp:
	text_far _SafariZoneHelp
	text_end

ExplanationText:
	text_far _SafariZoneEntranceText_753eb
	text_end