CinnabarLabFossilRoom_Script:
	jp EnableAutoTextBoxDrawing

CinnabarLabFossilRoom_TextPointers:
	dw Lab4Text1
	dw Lab4Text2
	dw Lab4Text3

Lab4Script_GetFossilsInBag:
; construct a list of all fossils in the player's bag
	xor a
	ld [wFilteredBagItemsCount], a
	ld de, wFilteredBagItems
	ld hl, FossilsList
.loop
	ld a, [hli]
	and a
	jr z, .done
	push hl
	push de
	ld [wd11e], a
	ld b, a
	predef GetQuantityOfItemInBag
	pop de
	pop hl
	ld a, b
	and a
	jr z, .loop

	; A fossil's in the bag
	ld a, [wd11e]
	ld [de], a
	inc de
	push hl
	ld hl, wFilteredBagItemsCount
	inc [hl]
	pop hl
	jr .loop
.done
	ld a, $ff
	ld [de], a
	ret

FossilsList:
	db DOME_FOSSIL
	db HELIX_FOSSIL
	db OLD_AMBER
	db 0 ; end

Lab4Text1:
	text_asm
	CheckEvent EVENT_GAVE_FOSSIL_TO_LAB
	jr nz, .asm_75d96
	ld hl, Lab4Text_75dc6
	call PrintText
	call Lab4Script_GetFossilsInBag
	ld a, [wFilteredBagItemsCount]
	and a
	jr z, .asm_75d8d
	farcall GiveFossilToCinnabarLab
	jr .asm_75d93
.asm_75d8d
	ld hl, Lab4Text_75dcb
	call PrintText
.asm_75d93
	jp TextScriptEnd
.asm_75d96
	CheckEventAfterBranchReuseA EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_GAVE_FOSSIL_TO_LAB
	jr z, .asm_75da2
	ld hl, Lab4Text_75dd0
	call PrintText
	jr .asm_75d93
.asm_75da2
	call LoadFossilItemAndMonNameBank1D
	ld hl, Lab4Text_75dd5
	call PrintText
	SetEvent EVENT_LAB_HANDING_OVER_FOSSIL_MON
	ld a, [wFossilMon]
	ld b, a
	ld c, 30
	call GivePokemon
	jr nc, .asm_75d93
	ResetEvents EVENT_GAVE_FOSSIL_TO_LAB, EVENT_LAB_STILL_REVIVING_FOSSIL, EVENT_LAB_HANDING_OVER_FOSSIL_MON
	jr .asm_75d93

Lab4Text_75dc6:
	text_far _Lab4Text_75dc6
	text_end

Lab4Text_75dcb:
	text_far _Lab4Text_75dcb
	text_end

Lab4Text_75dd0:
	text_far _Lab4Text_75dd0
	text_end

Lab4Text_75dd5:
	text_far _Lab4Text_75dd5
	text_end

Lab4Text2:
	text_asm
	ld a, TRADE_FOR_SAILOR
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

LoadFossilItemAndMonNameBank1D:
	farjp LoadFossilItemAndMonName

Lab4Text3:
	text_asm
	CheckEvent EVENT_MET_LAB_COLOR_CHANGER
	jr nz, .skipToColorChangeDialog
	SetEvent EVENT_MET_LAB_COLOR_CHANGER
	ld hl, LabColorChangerGreeting
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .noDeutsch
	ld hl, LabColorChangerGreetingYes
	jr .doneGreeting
.noDeutsch
	ld hl, LabColorChangerGreetingNo
.doneGreeting
	call PrintText
.skipToColorChangeDialog
	CheckEvent EVENT_BEAT_PROF_OAK_ONCE
	call nz, VasIsDas	
	call GetAvailableColorChanges
	and a
	jp z, .noChangesLeft
	ld a, AMOUNT_LEFT_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, LabColorChangerStart
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .noColorChange
	ld hl, LabColorChangerNext
	call PrintText
.showPartySelection
	call SaveScreenTilesToBuffer2
	xor a ; NORMAL_PARTY_MENU
	ld [wPartyMenuTypeOrMessageID], a
	dec a
	ld [wUpdateSpritesEnabled], a
	call DisplayPartyMenu
	jr c, .noPartySelection
	xor a
	ld [wMonDataLocation], a
	call LoadMonData
	callfar InGameTrade_RestoreScreen
	ld hl, LabColorChangerPics
	call PrintText
	call SaveScreenTilesToBuffer2
	call ShowBeforeAfterImages
	callfar InGameTrade_RestoreScreen
	ld hl, LabColorChangerPicsShown
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .showPartySelection
	ld hl, LabColorChangerStartColorChange
	call PrintText
	call DoColorSwap
	ld hl, LabColorChangerColorChangeDone
	call PrintText
.noColorChange
	ld hl, LabColorChangerGoodbye
	call PrintText
.done
	xor a
	ld [wUnusedC000], a
	jp TextScriptEnd
.noPartySelection
	callfar InGameTrade_RestoreScreen
	jr .noColorChange
.noChangesLeft
	ld hl, LabColorChangerNoChangesLeft
	call PrintText
	jr .noColorChange

VasIsDas:
	CheckEvent EVENT_LAB_COLOR_CHANGER_FULL_CHANGES
	ret nz
	ld hl, LabColorChangerVasIsDas
	call PrintText
	SetEvent EVENT_LAB_COLOR_CHANGER_FULL_CHANGES
	ret



; stores the amount of color changes available to use in wUnusedC000
GetAvailableColorChanges:
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld b, 15
	CheckEventHL EVENT_LAB_COLOR_CHANGER_FULL_CHANGES
	jr z, .startCount
	ld b, 25
.startCount
	cp 150
	jr nc, .doneCount
.count
	dec b
	add 10
	cp 150
	jr nc, .doneCount
	jr .count
.doneCount
	ld a, [wColorSwapsUsed]
	ld c, a
	ld a, b
	sub c
	ld [wUnusedC000], a
	ret

ShowBeforeAfterImages:
	call GBPalWhiteOut ; zero all palettes
	call ClearScreen
	call UpdateSprites
	ld hl, wd72c
	set 1, [hl]
	ld a, $33 ; 3/7 volume
	ldh [rNR50], a
	
	ld b, SET_PAL_BEFORE_AFTER
	call RunPaletteCommand
	
	call Delay3
	call GBPalNormal
	ld a, [wcf91]
	ld [wd0b5], a ; getmonheader input pokemon
	call GetMonHeader ; load pokemon picture location
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex ; draw pokemon picture
	hlcoord 11, 4
	ld de, BeforeString
	call PlaceString

	hlcoord 1, 9
	call LoadFlippedFrontSpriteByMonIndex ; draw pokemon picture
	hlcoord 11, 12
	ld de, AfterString
	call PlaceString

	ld a, [wcf91]
	call PlayCry ; play pokemon cry

	.waitForButtonPress
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and A_BUTTON | B_BUTTON
	jr z, .waitForButtonPress

 	ld a, $77
 	ldh [rNR50], a ; full volume
	
	ret

BeforeString:
	db "BEFORE@"

AfterString:
	db "AFTER@"


DoColorSwap:
	ld a, [wColorSwapsUsed]
	inc a
	ld [wColorSwapsUsed], a
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Flags
	ld bc, wPartyMon2 - wPartyMon1
	call AddNTimes ; we are jumping to the index of the chosen pokemon by incrementing N times where N = a
	ld a, [hl] ; hl points to the flags data of the chosen pokemon now 
	and 1 ; only the first bit of flags is used for alt color palette setting
	xor 1 ; toggle the value
	ld [hl], a ; store it
	call GBFadeOutToBlack
	call FiddlingAroundSounds
	call GBFadeInFromBlack
	ld a, [wUnusedC000] ; wUnusedC000 contains the number displayed in AMOUNT_LEFT_BOX currently
	dec a
	ld [wUnusedC000], a
	ld a, AMOUNT_LEFT_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID ; redisplay amount left box with decremented value
	call PlayDefaultMusic
	ret

FiddlingAroundSounds:
	ld a, SFX_STOP_ALL_MUSIC
	call PlaySound
	ld a, SFX_TRADE_MACHINE
	call PlaySound
	ld c, 40
	call DelayFrames
	ld a, SFX_NOISE_INSTRUMENT05
	call PlaySound
	ld c, 12
	call DelayFrames
	ld a, SFX_NOISE_INSTRUMENT05
	call PlaySound
	ld c, 12
	call DelayFrames
	ld a, SFX_NOISE_INSTRUMENT05
	call PlaySound
	ld c, 40
	call DelayFrames
	ld b, 20
.loop
	ld a, SFX_TURN_OFF_PC
	call PlaySound
	ld c, 2
	call DelayFrames
	dec b
	jr nz, .loop
	ld c, 60
	call DelayFrames
	ret

LabColorChangerGreeting:
	text_far _LabColorChangerGreeting
	text_end

LabColorChangerGreetingYes:
	text_far _LabColorChangerGreetingYes
	text_end

LabColorChangerGreetingNo:
	text_far _LabColorChangerGreetingNo
	text_end

LabColorChangerVasIsDas:
	text_far _LabColorChangerVasIsDas
	sound_get_item_2
	text_promptbutton
	text_end

LabColorChangerNoChangesLeft:
	text_far _LabColorChangerNoChangesLeft
	text_end

LabColorChangerStart:
	text_far _LabColorChangerStart
	text_end

LabColorChangerGoodbye:
	text_far _LabColorChangerGoodbye
	text_end

LabColorChangerNext:
	text_far _LabColorChangerNext
	text_end

LabColorChangerPics:
	text_far _LabColorChangerPics
	text_end

LabColorChangerPicsShown:
	text_far _LabColorChangerPicsShown
	text_end

LabColorChangerStartColorChange:
	text_far _LabColorChangerStartColorChange
	text_end

LabColorChangerColorChangeDone:
	text_far _LabColorChangerColorChangeDone
	sound_get_item_2
	text_promptbutton
	text_end