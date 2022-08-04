; PureRGBnote: ADDED: new house in saffron city. The super nerd from Mt Moon returns and will teleport to cinnabar with his teleporter
; in order to revive fossils for you early. There is also a bunch of amusing text to read in his house.
FossilGuysHouse_Script:
	jp EnableAutoTextBoxDrawing


FossilGuysHouse_TextPointers:
	dw FossilGuysHouseText1
	dw FossilGuysHouseText2
	dw FossilGuysHouseText3
	dw FossilGuysHouseText4
	dw FossilGuysHouseText5
	dw FossilGuysHouseText5
	dw FossilGuysHouseText6
	dw FossilGuysHouseText7

FossilGuysHouseText1:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jp z, .neverMet
	CheckEvent EVENT_SUPER_NERD_GOING_TO_CINNABAR
	jp nz, .comeBackLater
	CheckEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
	jp nz, .stageThreeStart
	CheckEvent EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD
	jp nz, .doneRevivedAmber
	CheckEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	jp nz, .stageTwoStart
	CheckEvent EVENT_SKIP_FOSSIL_GUY_GREETING
	jr nz, .skip
	ld hl, FossilGuyGreeting
	call PrintText
.skip
	CheckEvent EVENT_GAVE_FOSSIL_TO_SUPER_NERD
	jr z, .stageOneStart
	jr .doneRevivedFossil
.stageOneStart
	CheckEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	jp nz, .goToCinnabar
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .checkHelix
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr nz, .checkDome
.noFossil
	ld hl, FossilGuyWhereFossilText
	call PrintText
	jp .done
.checkHelix
	ld b, HELIX_FOSSIL
	jr .checkItemFossil
.checkDome
	ld b, DOME_FOSSIL
.checkItemFossil
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .noFossil
	push bc
	ld hl, FossilGuyHaveFossil
	call PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeItem
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_FOSSIL_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR, EVENT_SKIP_FOSSIL_GUY_GREETING
	ld hl, FossilGuyGaveFossil
	call PrintText
	jp .done
.suitYourself
	ld hl, FossilGuyDenied
	call PrintText
	jp .done
.doneRevivedFossil
	ld hl, FossilGuyCameBackFossil
	call PrintText
	CheckEvent EVENT_GOT_DOME_FOSSIL
	jr z, .doneOmanyte
	ld a, KABUTO
	jr .finishGiveFossil
.doneOmanyte
	ld a, OMANYTE	
.finishGiveFossil
	ld b, a
	ld c, 24
	call GivePokemon
	jp nc, .done
	SetEvent EVENT_RECEIVED_FOSSIL_PKMN_FROM_SUPER_NERD
	ResetEvent EVENT_SKIP_FOSSIL_GUY_GREETING
	jp .done
.stageTwoStart
	ld b, OLD_AMBER
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .greetingEnd
	push bc
	ld hl, FossilGuyHaveAmber
	call PrintText
	call YesNoChoice
	pop bc
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .suitYourself
.removeAmber
	ld a, b
	ld [wWhichPokemon], a ; load item index to be removed
	ld hl, wNumBagItems
	ld a, 1 ; one item
	ld [wItemQuantity], a
	call RemoveItemFromInventory
	SetEvents EVENT_GAVE_OLD_AMBER_TO_SUPER_NERD, EVENT_SUPER_NERD_GOING_TO_CINNABAR
	ld hl, FossilGuyGaveAmber
	call PrintText
	jr .done
.doneRevivedAmber
	ld hl, FossilGuyCameBackAmber
	call PrintText
	ld b, AERODACTYL
	ld c, 24
	call GivePokemon
	jr nc, .done
	SetEvent EVENT_RECEIVED_AERODACTYL_FROM_SUPER_NERD
	jr .done
.stageThreeStart
	CheckEvent EVENT_SEAFOAM_FOUND_OTHER_FOSSIL
	jr nz, .goToCinnabar
.endText
	ld hl, FossilGuyEndText
	call PrintText
	jr .done
.goToCinnabar
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	jr nz, .checkDome2
.checkHelix2
	ld b, HELIX_FOSSIL
	jr .checkItemFossil2
.checkDome2
	ld b, DOME_FOSSIL
.checkItemFossil2
	predef GetIndexOfItemInBag
	ld a, b
	cp $FF ; not in bag
	jr z, .endText
	ld hl, FossilGuyGoToCinnabarText
	call PrintText
	jr .done
.greetingEnd
	ld hl, FossilGuyGreetingEnd
	call PrintText
	jr .done
.comeBackLater
	ld hl, FossilGuyComeBackLater
	call PrintText
	jr .done
.neverMet
	ld hl, FossilGuyNeverMet
	call PrintText
.done
	jp TextScriptEnd

; Conversation text

FossilGuyGreeting:
	text_far _FossilGuyGreeting
	text_end

FossilGuyGreetingEnd:
	text_far _FossilGuyGreetingEnd
	text_end

FossilGuyComeBackLater:
	text_far _FossilGuyComeBackLater
	text_end

FossilGuyNeverMet:
	text_far _FossilGuyNeverMet
	text_end

FossilGuyWhereFossilText:
	text_far _FossilGuyWhereFossilText
	text_end

FossilGuyHaveFossil:
	text_far _FossilGuyHaveFossil
	text_end

FossilGuyDenied:
	text_far _FossilGuyDenied
	text_end

FossilGuyGaveFossil:
	text_far _FossilGuyGaveFossil
	text_end

FossilGuyCameBackFossil:
	text_far _FossilGuyCameBackFossil
	text_end

FossilGuyHaveAmber:
	text_far _FossilGuyHaveOldAmber
	text_end

FossilGuyGaveAmber:
	text_far _FossilGuyGiveOldAmber
	text_end

FossilGuyCameBackAmber:
	text_far _FossilGuyGiveAerodactyl
	text_end

FossilGuyEndText:
	text_far _FossilGuyEndingText
	text_end

FossilGuyGoToCinnabarText:
	text_far _FossilGuyGoToCinnabarText
	text_end

; cat text

FossilGuysHouseText2:
	text_asm
	CheckEvent EVENT_MET_FOSSIL_GUYS_CAT
	jr nz, .metCatAlready
	SetEvent EVENT_MET_FOSSIL_GUYS_CAT
	ld hl, FossilGuysHouseCatText1
	call PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText2
	jr .done
.metCatAlready
	ld hl, FossilGuysHouseCatText3
	call PrintText
	call FossilGuyFacesPlayerDirection
	ld hl, FossilGuysHouseCatText4
.done
	call PrintText
	jp TextScriptEnd

; makes fossil guy face the player
FossilGuyFacesPlayerDirection:
	ld a, 1
	ldh [hSpriteIndex], a
	ld a, [wXCoord]
	cp 1
	jr z, .checkYcoord
	cp 0
	ld a, SPRITE_FACING_LEFT
	jr z, .doFacing
	ld a, SPRITE_FACING_RIGHT
	jr .doFacing
.checkYcoord
	ld a, [wYCoord]
	cp 4
	ret c ; don't need to change facing if facing up is the best option
	ld a, SPRITE_FACING_DOWN
.doFacing
  	ldh [hSpriteFacingDirection], a
  	call SetSpriteFacingDirection
	ret
	

FossilGuysHouseCatText1:
	text_far _CeladonMansion1Text1
	sound_cry_meowth
	text_promptbutton
	text_end

FossilGuysHouseCatText2:
	text_far _FossilGuysCat2
	text_end

FossilGuysHouseCatText3:
	text_far _FossilGuysCat1
	sound_cry_meowth
	text_promptbutton
	text_end

FossilGuysHouseCatText4:
	text_far _FossilGuysCat3
	text_end

; sign/house object text

FossilGuysHouseText3:
	text_asm
	CheckEitherEventSet EVENT_GOT_DOME_FOSSIL, EVENT_GOT_HELIX_FOSSIL
	jr z, .done
	ld hl, FossilGuysPaperText
	call PrintText
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ld hl, FossilGuysKabutoText
	jr nz, .print
	ld hl, FossilGuysOmanyteText
.print
	call PrintText	
.done
	jp TextScriptEnd

FossilGuysPaperText:
	text_far _FossilGuysPaperText
	text_end

FossilGuysKabutoText:
	text_far _FossilGuysPaperTextKabuto
	text_end

FossilGuysOmanyteText:
	text_far _FossilGuysPaperTextOmanyte
	text_end

FossilGuysHouseText4:
	text_far _FossilGuysRock
	text_end

FossilGuysHouseText5:
	text_far _FossilGuysTeleporterText
	text_end

FossilGuysHouseText6:
	text_far _FossilGuysPosterText
	text_end

FossilGuysHouseText7:
	text_far _FossilGuysDesk
	text_end
