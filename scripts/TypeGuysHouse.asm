; PureRGBnote: ADDED: new area with a guy who can remap typings back to their original ones.

TypeGuysHouse_Script:
	call TypeGuysHouseCheckTurnOffLights
	callfar CheckUsedFlash
	jp EnableAutoTextBoxDrawing

TypeGuysHouse_TextPointers:
	def_text_pointers
	dw_const TypeGuysHouseTypeGuyText,              TEXT_TYPE_GUYS_HOUSE_TYPE_GUY
	dw_const TypeGuysHouseShortBookCaseText,        TEXT_TYPE_GUYS_HOUSE_SHORT_BOOKCASE
	dw_const TypeGuysHouseSculptureText,            TEXT_TYPE_GUYS_HOUSE_SCULPTURE
	dw_const TypeGuysHouseRightTallBookcaseText,    TEXT_TYPE_GUYS_HOUSE_RIGHT_TALL_BOOKCASE
	dw_const TypeGuysHouseLeftTallBookcaseText,     TEXT_TYPE_GUYS_HOUSE_LEFT_TALL_BOOKCASE
	dw_const TypeGuysHouseComputer.text,            TEXT_TYPE_GUYS_HOUSE_COMPUTER

TypeGuysHouseCheckTurnOffLights:
	ld hl, wCurrentMapScriptFlags
	bit 5, [hl]
	res 5, [hl]
	ret z
	ld a, [wXCoord]
	cp 8
	jr c, .notDark
	; turn off the lights if you just entered the type guy's room
	ResetEvent EVENT_TYPE_GUY_SKIP_INTRO
	jr TypeGuysHouseTurnOffLights
.notDark
	xor a
	ld [wMapPalOffset], a
	ret

CheckLoadLightSwitch::
	CheckEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	jr nz, LoadLightSwitchOnGraphic
	; fall through

LoadLightSwitchOffGraphic:
	ld de, LightSwitchOff
	lb bc, BANK(LightSwitchOff), 1
	jr LoadLightSwitchGraphicCommon
LoadLightSwitchOnGraphic:
	ld de, LightSwitchOn
	lb bc, BANK(LightSwitchOn), 1
	; fall through
LoadLightSwitchGraphicCommon:
	ld hl, vChars2 tile $46
	jp CopyVideoDataDouble

TypeGuysHouseLightSwitch::
	ld a, SFX_TELEPORT_ENTER_2
	rst _PlaySound
	CheckEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	jr nz, .turnOff
	SetEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	; turn on the lights
	xor a
	ld [wMapPalOffset], a
	xor a
	ld [wMuteAudioAndPauseMusic], a
	; add the "on" light switch tile
	jr LoadLightSwitchOnGraphic
.turnOff
	; fall through
TypeGuysHouseTurnOffLights:
	ResetEvent EVENT_TYPE_GUY_LIGHT_SWITCH
	; turn off the lights
	ld a, 6
	ld [wMapPalOffset], a
	ld a, 1
	ld [wMuteAudioAndPauseMusic], a
	; add the "off" light switch tile
	jr LoadLightSwitchOffGraphic

TypeGuysHouseTooDarkText:
	text_far _TypeGuysHouseTooDarkText
	text_end

CheckLightsTurnedOn:
	ld a, [wMapPalOffset]
	cp 6
	ret

TypeGuysHouseComputer::
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	ret nz
	ld a, TEXT_TYPE_GUYS_HOUSE_COMPUTER
	ldh [hSpriteIndexOrTextID], a
	jp DisplayTextID
.text
	text_asm
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .computer
.done
	rst _PrintText
	rst TextScriptEnd
.computer
	text_far _TypeGuysHouseTypeGuysComputerText
	text_end

TypeGuysHouseShortBookCaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld a, [wXCoord]
	cp 12
	ld hl, .smallShelf
	jr nz, .done
	ld hl, .smallShelfSide
.done
	rst _PrintText
	rst TextScriptEnd
.smallShelfSide
	text_far _TypeGuysHouseShortBookCaseSideText
	text_end
.smallShelf
	text_far _TypeGuysHouseShortBookCaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseShortBookCaseText2
	text_end

TypeGuysHouseSculptureText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .sculpture
.done
	rst _PrintText
	rst TextScriptEnd
.sculpture
	text_far _TypeGuysHouseSculptureText
	text_end


TypeGuysHouseRightTallBookcaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .rightTallBookcase
.done
	rst _PrintText
	rst TextScriptEnd
.rightTallBookcase
	text_far _TypeGuysHouseRightTallBookcaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseRightTallBookcaseText2
	text_end


TypeGuysHouseLeftTallBookcaseText:
	text_asm 
	call CheckLightsTurnedOn
	ld hl, TypeGuysHouseTooDarkText
	jr z, .done
	ld hl, .leftTallBookcase
.done
	rst _PrintText
	rst TextScriptEnd
.leftTallBookcase
	text_far _TypeGuysHouseLeftTallBookcaseText
	text_far _FlippedToARandomPage
	text_far _TypeGuysHouseLeftTallBookcaseText2
	text_end



TypeGuysHouseTypeGuyText:
	text_asm
	call CheckLightsTurnedOn
	jr nz, .typeGuyTalks
	; asleep
	ld hl, .sleeping
	rst _PrintText
	rst TextScriptEnd
.typeGuyTalks
	CheckEvent EVENT_TYPE_GUY_SKIP_INTRO
	jr nz, .skip
	SetEvent EVENT_TYPE_GUY_SKIP_INTRO
	ld hl, .awake
	rst _PrintText
.skip
	ld hl, .awake2
	rst _PrintText
	call SaveScreenTilesToBuffer2
	ld a, [wListScrollOffset]
	push af ; save list scroll offset to preserve item list index
	xor a
	ld [wCurrentMenuItem], a
	ld [wListScrollOffset], a
.loop
	ld hl, PokemonTypeGuyList
	call LoadItemList
	ld hl, wItemList
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wPrintItemPrices], a
	ld [wMenuItemToSwap], a
	ld [wListMenuCustomType], a
	ld a, 2
	ld [wListMenuHoverTextType], a
	ld a, CUSTOMLISTMENU
	ld [wListMenuID], a
	call DisplayListMenuID
	jr c, .done
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wListScrollOffset]
	add b
	ld c, a
	ld b, FLAG_TEST
	push bc
	ld hl, wPkmnTypeRemapFlags
	predef FlagActionPredef
	ld a, c
	and a
	pop bc
	ld b, FLAG_RESET
	jr nz, .reset
	ld b, FLAG_SET
.reset
	predef FlagActionPredef ; set or reset the flag
	call LoadScreenTilesFromBuffer2 ; restore screen tiles from before displaying list
	jr .loop
.done
	xor a
	ld [wListMenuHoverTextType], a
	ld [wCurrentMenuItem], a
	ld hl, wPkmnTypeRemapFlags
	ld b, 3
	call CountSetBits
	and a ; is the number of set bits non-zero
	ld hl, .doneText
	jr nz, .print
	ld hl, .beThatWay
.print
	rst _PrintText
	pop af
	ld [wListScrollOffset], a ; restore list scroll offset to preserve item list index
	rst TextScriptEnd
.sleeping
	text_far _TypeGuysHouseTypeGuySleepingText
	text_end
.awake
	text_far _TypeGuysHouseTypeGuyAwakeText
	text_end
.awake2
	text_far _TypeGuysHouseTypeGuyAwakeText2
	text_end
.doneText
	text_far _TypeGuysHouseTypeGuyDoneText
	text_end
.beThatWay
	text_far _TypeGuysHouseTypeGuyFineText
	text_end

PokemonTypeGuyList::
	db 23
	db BUTTERFREE
	db FEAROW
	db SANDSHREW
	db SANDSLASH
	db NINETALES
	db GOLDUCK
	db VICTREEBEL
	db PONYTA
	db RAPIDASH
	db DODUO
	db DODRIO
	db KINGLER
	db VOLTORB
	db ELECTRODE
	db MAROWAK
	db SEADRA
	db GOLDEEN
	db SEAKING
	db MR_MIME
	db ELECTABUZZ
	db PINSIR
	db KABUTO
	db KABUTOPS
	db -1