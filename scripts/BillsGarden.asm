BillsGarden_Script:
	call EnableAutoTextBoxDrawing
	ld hl, BillsGarden_ScriptPointers
	ld a, [wBillsGardenCurScript]
	jp CallFunctionInTable

BillsGarden_ScriptPointers:
	def_script_pointers
	dw_const BillsGardenScript0,  SCRIPT_BILLS_GARDEN_DEFAULT_SCRIPT

BillsGardenScript0:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	jr z, .checkOverHeard
	CheckEvent EVENT_IN_BILLS_GARDEN
	ret nz
	ResetEvent EVENT_OVERHEARD_BILLS_GARDEN_CONVERSATION
	SetEvent EVENT_IN_BILLS_GARDEN
	CheckEvent EVENT_ENTERED_BILLS_GARDEN_FIRST_TIME
	jr z, .firstEntrance
	; runs when the map is first loaded
.rerollRandom
	ld b, 0
	call Random
	cp 50 ; ~20% chance of first visitor
	jr c, .foundMatch
	inc b
	cp 100 ; ~20% chance of second visitor
	jr c, .foundMatch
	inc b
	cp 150 ; ~20% chance of third visitor
	jr c, .foundMatch
	inc b
	cp 200 ; ~20% chance of fourth visitor
	jr c, .foundMatch
	inc b
	cp 228 ; ~10% chance of fifth visitor
	jr c, .foundMatch
	inc b ; ~10% chance of sixth visitor
.foundMatch
	call CheckPreviousVisitors
	jr c, .rerollRandom
	; update the previous visitors list
	ld a, [wBillsGardenPreviousVisitors+1]
	ld [wBillsGardenPreviousVisitors+2], a
	ld a, [wBillsGardenPreviousVisitors]
	ld [wBillsGardenPreviousVisitors+1], a
	ld a, b
	ld [wBillsGardenPreviousVisitors], a
	jp ReplaceVisitors
.firstEntrance
	; use misty and bike shop owner the first time we enter the garden
	SetEvent EVENT_ENTERED_BILLS_GARDEN_FIRST_TIME
	ld a, 2
	ld [wBillsGardenVisitor], a
	ld [wBillsGardenPreviousVisitors+1], a
	ld [wBillsGardenPreviousVisitors+2], a
	jp ReplaceVisitors
.checkOverHeard
	CheckEvent EVENT_OVERHEARD_BILLS_GARDEN_CONVERSATION
	ret nz
	; if we're on specific tiles, ask the player if they want to overhear a conversation
	ld hl, BillsGarden_EavesdropTiles
	call ArePlayerCoordsInArray
	ret nc
	SetEvent EVENT_OVERHEARD_BILLS_GARDEN_CONVERSATION
	ld a, [wBillsGardenVisitor]
	cp 5
	ret z ; no overheard for mom/dad
	ld a, TEXT_BILLS_GARDEN_OVERHEARD
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID


CheckPreviousVisitors:
	; the last 3 visitors are remembered and won't be chosen the next time you enter the area
	ld hl, wBillsGardenPreviousVisitors
	ld c, 3
.loop
	ld a, [hli]
	cp b
	jr z, .match
	and a
	dec c
	ret z ; no match
	jr .loop
.match
	scf
	ret

ReplaceVisitors:
	ld a, [wBillsGardenVisitor]
	and a
	ret z ; set 0 needs no replacing
	dec a ; set 0 is not included in the list of replacements so set 1 starts at index 0
	add a ; multiply by 2
	add a ; multiply by 2 again (x4 in total)
	add a ; multiply by 2 again (x8 in total)
	ld e, a
	ld d, 0
	ld hl, BillsGarden_NPCSets ; a set of NPC data takes up 8 bytes so we go to 8*setnumber offset in the list
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a ; de = sprite's address
	inc hl
	ld b, [hl] ; b = sprite's bank
	ld c, 12 ; 12 tiles to be copied
	push hl
	ld hl, vChars0 tile 12
	call CopyVideoData
	pop hl
	inc hl
	ld a, [hli] ; a = first sprite's picture ID
	ld [wSprite01StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs], a
	ld a, [hli]
	ld d, [hl]
	ld e, a ; de = second sprite's address
	inc hl
	ld b, [hl] ; b = second sprite's bank
	ld c, 12 ; 12 tiles to be copied
	push hl
	ld hl, vChars0 tile 24
	call CopyVideoData
	pop hl
	inc hl
	ld a, [hl] ; a = second sprite's picture ID
	cp SPRITE_MISTY
	ld [wSprite02StateData1PictureID], a
	ld [wMapSpriteOriginalPictureIDs+1], a
	ret nz
.checkReplaceMisty
	; based on the player's options, we might need to change misty's sprite to the original sprite
	ld a, [wSpriteOptions2]
	bit BIT_MENU_ICON_SPRITES, a
	ret nz
	ld a, SPRITE_BRUNETTE_GIRL
	ld [wSprite02StateData1PictureID], a
	lb bc, BANK(BrunetteGirlSprite), 12
	ld de, BrunetteGirlSprite
	ld hl, vChars0 tile 24
	jp CopyVideoData


BillsGarden_NPCSets:
	; default set of sprites is erika and sabrina
	; set 2
	dw BlueSprite
	db BANK(BlueSprite)
	db SPRITE_BLUE
	dw DaisySprite
	db BANK(DaisySprite)
	db SPRITE_DAISY
	; set 3
	dw BikeShopClerkSprite
	db BANK(BikeShopClerkSprite)
	db SPRITE_BIKE_SHOP_CLERK
	dw MistySprite
	db BANK(MistySprite)
	db SPRITE_MISTY
	; set 4
	dw AgathaSprite
	db BANK(AgathaSprite)
	db SPRITE_AGATHA
	dw OakSprite
	db BANK(OakSprite)
	db SPRITE_OAK
	; set 5
	dw MrFujiSprite
	db BANK(MrFujiSprite)
	db SPRITE_MR_FUJI
	dw GiovanniSprite
	db BANK(GiovanniSprite)
	db SPRITE_GIOVANNI
	; set 6
	dw DadSprite
	db BANK(DadSprite)
	db SPRITE_DAD
	dw MomSprite
	db BANK(MomSprite)
	db SPRITE_MOM

BillsGarden_EavesdropTiles:
	dbmapcoord 8, 4
	dbmapcoord 8, 5
	dbmapcoord 9, 5
	dbmapcoord 10, 5
	dbmapcoord 11, 4
	dbmapcoord 11, 5
	db -1 ; end

; make a sprite face b direction
DoSpriteFacing:
	ldh [hSpriteIndex], a
	ld a, b
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
  	jp UpdateSprites



BillsGarden_TextPointers:
	def_text_pointers
	dw_const BillsGardenLeftNPCText,   TEXT_BILLS_GARDEN_VARIABLE_GUEST1
	dw_const BillsGardenRightNPCText,  TEXT_BILLS_GARDEN_VARIABLE_GUEST2
	dw_const BillsGardenSignText,      TEXT_BILLS_GARDEN_SIGN
	dw_const BillsGardenOverheardText, TEXT_BILLS_GARDEN_OVERHEARD

BillsGardenLeftNPCText:
	text_asm
	ld a, [wBillsGardenVisitor]
	ld hl, BillsGardenLeftNPCTextPointers
	call GetAddressFromPointerArray
	rst _PrintText
	rst TextScriptEnd

BillsGardenLeftNPCTextPointers:
	dw BillsGardenErikaText
	dw BillsGardenBlueText
	dw BillsGardenBikeShopOwnerText
	dw BillsGardenAgathaText
	dw BillsGardenMrFujiText
	dw BillsGardenDadText

BillsGardenRightNPCText:
	text_asm
	ld a, [wBillsGardenVisitor]
	ld hl, BillsGardenRightNPCTextPointers
	call GetAddressFromPointerArray
	rst _PrintText
	rst TextScriptEnd

BillsGardenRightNPCTextPointers:
	dw BillsGardenSabrinaText
	dw BillsGardenDaisyText
	dw BillsGardenMistyText
	dw BillsGardenOakText
	dw BillsGardenGiovanniText
	dw BillsGardenMomText

BillsGardenSignText:
	text_far _BillsGardenSignText
	text_end

BillsGardenOverheardText:
	text_asm
	ld hl, BillsGardenEavesDropQuestion
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, BillsGardenEavesDropQuestionNo
	jr nz, .done
	ld a, [wBillsGardenVisitor]
	ld hl, BillsGardenOverheardTextPointers
	call GetAddressFromPointerArray
.done
	rst _PrintText
	rst TextScriptEnd

BillsGardenEavesDropQuestion:
	text_far _BillsGardenEavesdropQuestion
	text_end

BillsGardenEavesDropQuestionNo:
	text_far _CeladonMartUsePhoneTextNo
	text_end

BillsGardenOverheardTextPointers:
	dw BillsGardenErikaSabrinaOverheardText
	dw BillsGardenBlueDaisyOverheardText
	dw BillsGardenBikeShopOwnerMistyOverheardText
	dw BillsGardenAgathaOakOverheardText
	dw BillsGardenMrFujiGiovanniOverheardText

; erika and sabrina

BillsGardenErikaSabrinaOverheardText:
	text_far _BillsGardenErikaSabrinaOverheardText
	text_end

BillsGardenErikaText:
	text_asm
	ld hl, BillsGardenErikaText1
	rst _PrintText
	xor a
	ld [wCurrentMenuItem], a
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, BillsGardenErikaText2No
	jr nz, .print
	; make sabrina face left
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_LEFT
	call DoSpriteFacing
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_RIGHT
	call DoSpriteFacing
	ld hl, BillsGardenErikaText2Yes
	rst _PrintText
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenErikaText3
.print
	rst _PrintText
	rst TextScriptEnd

BillsGardenErikaText1:
	text_far _BillsGardenErikaText1
	text_end
BillsGardenErikaText2Yes:
	text_far _BillsGardenErikaText2Yes
	text_end
BillsGardenErikaText2No:
	text_far _BillsGardenErikaText2No
	text_end
BillsGardenErikaText3:
	text_far _BillsGardenErikaText3
	text_end

BillsGardenSabrinaText:
	text_far _BillsGardenSabrinaText
	text_end

; blue and daisy

BillsGardenBlueDaisyOverheardText:
	text_far _BillsGardenBlueDaisyOverheardText
	text_end

BillsGardenBlueText:
	text_asm 
	ld hl, BillsGardenBlueText1
	rst _PrintText
	; make daisy face down
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenBlueText2
	rst _PrintText
	; make blue face right
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_RIGHT
	call DoSpriteFacing
	ld hl, BillsGardenBlueText3
	rst _PrintText
	; make blue face down again
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenBlueText4
	rst _PrintText

	call SaveScreenTilesToBuffer1
	ld hl, BillsGardenBlueThanks
	ld b, A_BUTTON
	call DisplayMultiChoiceTextBox
	call LoadScreenTilesFromBuffer1
	ld a, [wCurrentMenuItem]
	and a
	ld hl, BillsGardenBlueText4Yes
	jr z, .yes
	ld hl, BillsGardenBlueText4No
.yes
	rst _PrintText
	rst TextScriptEnd

BillsGardenBlueText1:
	text_far _BillsGardenBlueText
	text_end
BillsGardenBlueText2:
	text_far _BillsGardenBlueText2
	text_end
BillsGardenBlueText3:
	text_far _BillsGardenBlueText3
	text_end
BillsGardenBlueText4:
	text_far _BillsGardenBlueText4
	text_end
BillsGardenBlueText4Yes:
	text_far _BillsGardenBlueText4Yes
	text_end
BillsGardenBlueText4No:
	text_far _BillsGardenBlueText4No
	text_end

BillsGardenDaisyText:
	text_asm
	ld hl, BillsGardenDaisyText1
	rst _PrintText
	; make blue face right
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_RIGHT
	call DoSpriteFacing
	ld hl, BillsGardenDaisyText2
	rst _PrintText
	rst TextScriptEnd

BillsGardenDaisyText1:
	text_far _BillsGardenDaisyText
	text_end
BillsGardenDaisyText2:
	text_far _BillsGardenDaisyText2
	text_end

; bike shop owner and misty

BillsGardenBikeShopOwnerMistyOverheardText:
	text_far _BillsGardenBikeShopOwnerMistyOverheardText
	text_end

BillsGardenBikeShopOwnerText:
	text_far _BillsGardenBikeShopOwnerText
	text_end

BillsGardenMistyText:
	text_asm
	ld hl, BillsGardenMistyText1
	rst _PrintText
	; make bike shop clerk face right
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_RIGHT
	call DoSpriteFacing
	ld hl, BillsGardenMistyText2
	rst _PrintText
	; make misty face left
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_LEFT
	call DoSpriteFacing
	ld hl, BillsGardenMistyText3
	rst _PrintText
	rst TextScriptEnd

BillsGardenMistyText1:
	text_far _BillsGardenMistyText
	text_end
BillsGardenMistyText2:
	text_far _BillsGardenMistyText2
	text_end
BillsGardenMistyText3:
	text_far _BillsGardenMistyText3
	text_end

; Agatha and Oak

BillsGardenAgathaOakOverheardText:
	text_far _BillsGardenAgathaOakOverheardText
	text_end

BillsGardenAgathaText:
	text_far _BillsGardenAgathaText
	text_end

BillsGardenOakText:
	text_asm
	ld hl, BillsGardenOakText1
	rst _PrintText
	; make agatha face right
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_RIGHT
	call DoSpriteFacing
	ld hl, BillsGardenOakText2
	rst _PrintText
	; make oak face left
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_LEFT
	call DoSpriteFacing
	ld hl, BillsGardenOakText3
	rst _PrintText
	; make oak face down
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenOakText4
	rst _PrintText
	; make agatha face left
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_LEFT
	call DoSpriteFacing
	ld hl, BillsGardenOakText5
	rst _PrintText
	rst TextScriptEnd

BillsGardenOakText1:
	text_far _BillsGardenOakText
	text_end
BillsGardenOakText2:
	text_far _BillsGardenOakText2
	text_end
BillsGardenOakText3:
	text_far _BillsGardenOakText3
	text_end
BillsGardenOakText4:
	text_far _BillsGardenOakText4
	text_end
BillsGardenOakText5:
	text_far _BillsGardenOakText5
	text_end


; input d = which pokemon to find
; returns flag c if found and d = which pokemon in party it was
FindPokemonInParty:
	ld b, 0
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp d
	jr z, .found
	inc b
	ld a, [wPartyCount]
	cp b
	jr nz, .loop
	and a
	ret
.found
	ld d, b ; which mon it was
	scf
	ret

; Mr Fuji and Giovanni

BillsGardenMrFujiGiovanniOverheardText:
	text_far _BillsGardenMrFujiGiovanniOverheardText
	text_end
BillsGardenMrFujiText:
	text_asm
	ld d, MEWTWO
	call FindPokemonInParty
	ld hl, BillsGardenMrFujiMewtwoText
	jr c, .done
	ld d, ARMORED_MEWTWO
	call FindPokemonInParty
	ld hl, BillsGardenMrFujiArmoredMewtwoText
	jr c, .done
	ld hl, BillsGardenMrFujiText1
.done
	rst _PrintText
	rst TextScriptEnd
BillsGardenMrFujiText1:
	text_far _BillsGardenMrFujiText
	text_end
BillsGardenMrFujiMewtwoText:
	text_far _BillsGardenMrFujiMewtwoText
	text_end
BillsGardenMrFujiArmoredMewtwoText:
	text_far _BillsGardenMrFujiArmoredMewtwoText
	text_end

BillsGardenGiovanniText:
	text_asm
	ld d, MEWTWO
	call FindPokemonInParty
	ld hl, BillsGardenGiovanniMewtwoText
	jr c, .done
	ld d, ARMORED_MEWTWO
	call FindPokemonInParty
	ld hl, BillsGardenGiovanniArmoredMewtwoText
	jr c, .done
	ld hl, BillsGardenGiovanniText1
.done
	rst _PrintText
	rst TextScriptEnd

BillsGardenGiovanniText1:
	text_far _BillsGardenGiovanniText
	text_end
BillsGardenGiovanniMewtwoText:
	text_far _BillsGardenGiovanniMewtwoText
	text_end
BillsGardenGiovanniArmoredMewtwoText:
	text_far _BillsGardenGiovanniArmoredMewtwoText
	text_end

; Dad and Mom

BillsGardenDadText:
	text_asm
	call SaveScreenTilesToBuffer2
	SetEvent EVENT_MET_DAD
	ld a, HS_REDS_HOUSE_1F_DAD
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	; make MOM face down
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenDadText1
	rst _PrintText
	; make MOM face left
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_LEFT
	call DoSpriteFacing
	ld hl, BillsGardenDadText2
	rst _PrintText
	; make MOM face down
	ld a, BILLS_GARDEN_VARIABLE_GUEST2
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenDadText3
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, BillsGardenDadText3No
	jr nz, .no
	call GBFadeOutToWhite
	ld c, 60
	rst _DelayFrames
	call ClearScreen
	ld hl, TextScriptEndingText
	rst _PrintText ; seemingly the only way of preventing sprites from flickering on the screen during the next printText
	call GBPalNormal
	ld hl, BillsGardenDadText3Yes
	rst _PrintText
	call LoadScreenTilesFromBuffer2
	call UpdateSprites
	call GBFadeInFromWhite
	ld hl, BillsGardenDadText4
.no
	rst _PrintText
	rst TextScriptEnd

BillsGardenDadText1:
	text_far _BillsGardenDadText
	text_end
BillsGardenDadText2:
	text_far _BillsGardenDadText2
	text_end
BillsGardenDadText3:
	text_far _BillsGardenDadText3
	text_end
BillsGardenDadText3No:
	text_far _BillsGardenDadText3No
	text_end
BillsGardenDadText3Yes:
	text_far _BillsGardenDadText3Yes
	text_end
BillsGardenDadText4:
	text_far _BillsGardenDadText4
	text_end

BillsGardenMomText:
	text_asm
	; make DAD face down
	ld a, BILLS_GARDEN_VARIABLE_GUEST1
	ld b, SPRITE_FACING_DOWN
	call DoSpriteFacing
	ld hl, BillsGardenMomText1
	rst _PrintText
	rst TextScriptEnd

BillsGardenMomText1:
	text_far _BillsGardenMomText
	text_end
