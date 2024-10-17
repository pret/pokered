; PureRGBnote: CHANGED: since Old rod is obtained in cerulean and good rod in vermilion now, this fishing guru will give either
; the SUPER ROD or the FISHING GUIDE depending on which of the last two gurus you talked to first.
; PureRGBnote: ADDED: This map is also used for ERIK and SARA's house.
FuchsiaGoodRodHouse_Script:
	call FuchsiaGoodRodHouseOnMapLoad
	jp EnableAutoTextBoxDrawing

FuchsiaGoodRodHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaGoodRodHouseFishingGuruText, TEXT_FUCHSIAGOODRODHOUSE_FISHING_GURU
	dw_const FuchsiaFishingGuide,                TEXT_FUCHSIAGOODRODHOUSE_FISHING_GUIDE
	dw_const ErikSarasHouseSaraText,             TEXT_FUCHSIAGOODRODHOUSE_SARA
	dw_const ErikSarasHouseErikText,             TEXT_FUCHSIAGOODRODHOUSE_ERIK
	dw_const ErikSarasHouseNoteText,             TEXT_FUCHSIAGOODRODHOUSE_NOTE
	dw_const ErikSarasHouseSecondNoteText,       TEXT_FUCHSIAGOODRODHOUSE_NOTE2
	dw_const FuchsiaGoodRodHouseGarbageText,     TEXT_FUCHSIAGOODRODHOUSE_GARBAGE
	dw_const ErikSarasHousePhoneText,            TEXT_ERIKSARASHOUSE_PHONE
	dw_const ErikSarasHouseComputerText,         TEXT_ERIKSARASHOUSE_COMPUTER
	dw_const ErikSarasHouseNorthGarbageText,     TEXT_ERIKSARASHOUSE_NORTH_GARBAGE
	dw_const ErikSarasHouseLeftShelfText,        TEXT_ERIKSARASHOUSE_LEFT_SHELF
	dw_const ErikSarasHouseMiddleShelfText,      TEXT_ERIKSARASHOUSE_MIDDLE_SHELF
	dw_const ErikSarasHouseRightShelfText,       TEXT_ERIKSARASHOUSE_RIGHT_SHELF
	dw_const ErikSarasHouseLeftPeriscopeText,    TEXT_ERIKSARASHOUSE_LEFT_PERISCOPE
	dw_const ErikSarasHouseRightPeriscopeText,   TEXT_ERIKSARASHOUSE_RIGHT_PERISCOPE
	dw_const ErikSarasHouseSouthGarbageText,     TEXT_ERIKSARASHOUSE_SOUTH_GARBAGE
	dw_const ErikSarasHouseOpenBookText,         TEXT_ERIKSARASHOUSE_OPEN_BOOK
	dw_const ErikSarasHouseAfterEventText,       TEXT_ERIKSARASHOUSE_AFTER_EVENT

FuchsiaGoodRodHouseOnMapLoad:
	ld hl, wCurrentMapScriptFlags
	bit BIT_CUR_MAP_LOADED_1, [hl]
	res BIT_CUR_MAP_LOADED_1, [hl]
	ret z
	ld a, [wXCoord]
	cp 12
	ret c ; if we're less than 12 x coord we're in the good rod house not erik and sara's house
	; check if we should hide erik and sara in the safari zone (we do if they are in their house)
	call AreErikAndSaraAtHome
	ret nz
	call Random
	and %00110011
	ld [wMapMultiTextTracker], a
	CheckAndResetEvent EVENT_DRAGONAIR_EVENT_ENDING_TEXT_TRIGGER
	jr z, .noEndingText
	call UpdateSprites
	ld a, $4A
	call .replaceTileBlockEntry
	ld hl, vTileset tile $40
	ld de, FoodTiles
	lb bc, BANK(FoodTiles), 2
	call CopyVideoData
	call DoErikSaraFacings
	ld a, TEXT_ERIKSARASHOUSE_AFTER_EVENT
	ldh [hTextID], a
	call DisplayTextID
	call GBFadeOutToBlack
	ld a, FUCHSIAGOODRODHOUSE_ERIK
	call SetSpriteFacingDown
	ld a, FUCHSIAGOODRODHOUSE_SARA
	call SetSpriteFacingDown
	call UpdateSprites
	ld a, $32
	call .replaceTileBlockEntry
	ld a, HS_ERIK_SARA_HOUSE_NOTE2
	ld [wMissableObjectIndex], a
	predef ShowExtraObject
	jp GBFadeInFromBlack
.replaceTileBlockEntry
	ld [wNewTileBlockID], a
	lb bc, 5, 10
	predef_jump ReplaceTileBlock
.noEndingText
	ld a, HS_SAFARI_ZONE_CENTER_REST_HOUSE_SARA
	call FuchsiaGoodRodHouseHideExtraObjectEntry
	ld a, HS_SAFARI_ZONE_CENTER_REST_HOUSE_ERIK
	; fall through
FuchsiaGoodRodHouseHideExtraObjectEntry:
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

FuchsiaGoodRodHouseFishingGuruText:
	text_asm
	CheckEvent EVENT_GOT_FUCHSIA_FISHING_GURU_ITEM
	jr nz, .printEndText
	ld hl, FuchsiaGuruIntro
	rst _PrintText
	callfar LastTwoGurusScript
	rst TextScriptEnd
.printEndText
	ld hl, FuchsiaGuruEnd
	rst _PrintText
	rst TextScriptEnd

FuchsiaGuruIntro:
	text_far _FuchsiaGuruIntro
	text_end

FuchsiaGuruEnd:
	text_far _FuchsiaGuruEnd
	text_end

FuchsiaFishingGuide:
	text_asm
	callfar LastTwoGurusFishingGuideBookText
	rst TextScriptEnd

; PureRGBnote: ADDED: text entry for the garbage can in this room

FuchsiaGoodRodHouseGarbageText:
	text_far _FuchsiaGoodRodHouseGarbageText
	text_end

; nz if they're not at home
AreErikAndSaraAtHome:
	CheckExtraHideShowState HS_ERIK_HOUSE
	ld hl, ErikSaraNoPokingAround
	ret

ErikSarasHouseNoteText:
	text_asm
	call AreErikAndSaraAtHome
	ld hl, .notHome
	jr nz, .printDone
	ld hl, .home
.printDone
	rst _PrintText
	rst TextScriptEnd
.notHome
	text_far _ErikSarasHouseNoteNotHomeText
	text_end
.home
	text_far _ErikSarasHouseNoteHomeText
	text_end

ErikSarasHousePhoneText:
	text_far _ErikSarasHousePhoneText
	text_end

ErikSarasHouseComputerText:
	text_asm
	call AreErikAndSaraAtHome
	jr nz, .printDone
	CheckEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	ld hl, .dragonairStats
	jr nz, .printDone
	ld hl, .email
.printDone
	rst _PrintText
	rst TextScriptEnd
.email
	text_far _EmailHereText
	text_far _ErikSarasHouseDragonairEmailText
	text_end
.dragonairStats
	text_far _ErikSarasHouseComputerAfterText
	text_end

ErikSaraNoPokingAround:
	text_far _ShouldntLookNoOneHome
	text_end

ErikSarasHouseNorthGarbageText:
	text_asm
	call AreErikAndSaraAtHome
	jr nz, .printDone
	ld hl, .home
.printDone
	rst _PrintText
	rst TextScriptEnd
.home
	text_far _GarbageCrumpledUpPaper
	text_far _ErikSarasHouseNorthGarbageText
	text_end

ErikSarasHouseSouthGarbageText:
	text_asm
	call AreErikAndSaraAtHome
	jr nz, .printDone
	ld hl, .home
.printDone
	rst _PrintText
	rst TextScriptEnd
.home
	text_far _ErikSarasHouseSouthGarbageText
	text_end

ErikSarasHouseLeftShelfText:
	text_far _ErikSarasHouseLeftBookText
	text_far _FlippedToARandomPage
	text_far _ErikSarasHouseLeftBookText2
	text_end

ErikSarasHouseMiddleShelfText:
	text_far _ErikSarasHouseCenterBookText
	text_far _FlippedToARandomPage
	text_far _ErikSarasHouseCenterBookText2
	text_end

ErikSarasHouseRightShelfText:
	text_far _ErikSarasHouseRightBookText
	text_far _FlippedToARandomPage
	text_far _ErikSarasHouseRightBookText2
	text_end


ErikSarasHouseOpenBookText: 
	text_asm
	call AreErikAndSaraAtHome
	jr nz, .printDone
	ld hl, .home
.printDone
	rst _PrintText
	rst TextScriptEnd
.home
	text_far _ErikSarasHouseBookText
	text_end

ErikSarasHouseLeftPeriscopeText:
	text_asm
	call AreErikAndSaraAtHome
	ld hl, PeriscopeInitialText
	jr nz, .printDone
	CheckAndSetEvent EVENT_PERISCOPES_EXPLAINED
	jr z, .notExplained
	ld hl, .periscopeIntro
	rst _PrintText
	ld hl, wMapMultiTextTracker
	ld a, [hl]
	swap a
	and %00110011
	inc a
	swap a
	ld [hl], a
	swap a
	; 4 random texts can display
	and %11
	ld hl, .goldeen
	jr z, .printDone
	dec a
	ld hl, .staryu
	jr z, .printDone
	dec a
	ld hl, .horsea
	jr z, .printDone
	ld hl, .krabby
	jr .printDone
.notExplained
	ld a, FUCHSIAGOODRODHOUSE_ERIK
	call SetSpriteFacingLeft
	ld hl, ExplainPeriscopesText
.printDone
	rst _PrintText
	rst TextScriptEnd
.periscopeIntro
	text_far _ErikSarasHouseLeftPeriscopeIntro
	text_end
.staryu
	text_far _CoralReefCameraStaryu
	text_end
.horsea
	text_far _CoralReefCameraHorsea
	text_end
.krabby
	text_far _CoralReefCameraKrabby
	text_end
.goldeen
	text_far _CoralReefCameraGoldeen
	text_end

ExplainPeriscopesText:
	text_far _ErikSarasHousePeriscopeExplanation
	text_end

PeriscopeInitialText:
	text_far _PeriscopeInitialText
	text_end

ErikSarasHouseRightPeriscopeText:
	text_asm
	call AreErikAndSaraAtHome
	ld hl, PeriscopeInitialText
	jr nz, .printDone
	CheckAndSetEvent EVENT_PERISCOPES_EXPLAINED
	jr z, ErikSarasHouseLeftPeriscopeText.notExplained
	ld hl, .periscopeIntro
	rst _PrintText
	; 4 random texts can display
	ld hl, wMapMultiTextTracker
	ld a, [hl]
	and %00110011
	inc a
	ld [hl], a
	and %11
	ld hl, .nothing
	jr z, .printDone
	dec a
	ld hl, .magikarp
	jr z, .printDone
	dec a
	ld hl, .tentacruel
	jr z, .printDone
	ld hl, .gyarados
	jr .printDone
.printDone
	rst _PrintText
	rst TextScriptEnd
.periscopeIntro
	text_far _ErikSarasHouseRightPeriscopeIntro
	text_end
.magikarp
	text_far _DeepSeaCameraMagikarp
	text_end
.tentacruel
	text_far _DeepSeaCameraTentacruel
	text_end
.gyarados
	text_far _DeepSeaCameraGyarados
	text_end
.nothing
	text_far _DeepSeaCameraBubbles
	text_end

ErikSarasHouseSaraText:
	text_asm
	CheckEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	jr z, .notAlreadyClearedDragonairEvent
	ld hl, .goBack
	rst _PrintText
.goBackQuestionEntry
	call DoErikSaraFacings
	ld hl, .goBackQuestion
	rst _PrintText
	jr .chooseDragonair
.notAlreadyClearedDragonairEvent
	CheckAndSetEvent EVENT_MET_ERIK_SARA_IN_HOUSE
	jr nz, .alreadyMet
	ld hl, .welcomeSara
	rst _PrintText
	rst TextScriptEnd
.alreadyMet
	ld hl, .interested
	rst _PrintText
.firstQuestionEntry
	call DoErikSaraFacings
	CheckEvent EVENT_ERIK_SARA_EXPLAINED_RESEARCH_ONCE
	jr z, .noFirstQuestion
	call .doYesNo
	jr nz, .noResearch
	jr .skipFirstPrompt
.noFirstQuestion
	call DisplayTextPromptButton
.skipFirstPrompt
	SetEvent EVENT_ERIK_SARA_EXPLAINED_RESEARCH_ONCE
	ld hl, .researchExp
	rst _PrintText
	call .doYesNo
	jr z, .noSeafoamInfo
	ld hl, .seafoamInfo
	rst _PrintText
.noSeafoamInfo
	ld hl, .researchExp2
	rst _PrintText
.noResearch
	ld hl, .wantDragonair
	rst _PrintText
.chooseDragonair
	call ChooseDragonairForEvent
	ld a, [wWhichPokemon]
	cp $FF
  	ld hl, .lowLevel
  	jr z, .printDone
  	cp $FD
  	jr nc, .done
  	ld hl, .perfectDragonair
  	rst _PrintText
  	call .doYesNo
  	ld hl, .suitYourself
  	jr nz, .printDone
  	ld a, [wWhichPokemon]
  	push af
  	; heal your mons so dragonair can't be fainted
  	predef HealParty
  	pop af
  	ld [wWhichPokemon], a
	call GetPartyMonName2 ; have to re-get its name since healparty changes wNameBuffer
	ResetEvent EVENT_DRAGONAIR_EVENT_BEAT_CLOYSTER ; allows repeating of the dragonair event
	ResetEvent EVENT_DRAGONAIR_EVENT_FOUGHT_CLOYSTER_ONCE
  	; load scripted warp to seafoam islands b4f
  	ld a, 4 ; 5th warp
	ld [wDestinationWarpID], a
	ld a, SEAFOAM_ISLANDS_B4F
	ldh [hWarpDestinationMap], a
	ld hl, wStatusFlags3
	set BIT_WARP_FROM_CUR_SCRIPT, [hl] ; scripted warp flag
	ld a, SCRIPT_SEAFOAMISLANDSB4F_DRAGONAIR_EVENT_START
	ld [wSeafoamIslandsB4FCurScript], a
  	ld hl, .letsDoThis
.printDone
	rst _PrintText
.done
	rst TextScriptEnd
.doYesNo
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret
.welcomeSara
	text_far _SaraHouseIntroText
	text_end
.interested
	text_far _SaraInterestedQuestion
	text_end
.researchExp
	text_far _SaraHouseFirstStepText
	text_end
.seafoamInfo
	text_far _SaraSeafoamExplanationText
	text_end
.researchExp2
	text_far _ErikDragonairResearch
	text_end
.wantDragonair
	text_far _ErikWantsDragonairText
	text_end
.lowLevel
	text_far _ShowedDragonairLowLevelText
	text_end
.perfectDragonair
	text_far _ShowedDragonairText
	text_end
.suitYourself
	text_far _FossilGuyDenied
	text_end
.letsDoThis
	text_far _ShowedDragonairLetsDoThis
	text_end
.goBack
	text_far _ErikSarasHouseGoBackSaraText
	text_end
.goBackQuestion
	text_far _ErikSarasHouseGoBackQuestionText
	text_end

ErikSarasHouseErikText:
	text_asm
	CheckEvent EVENT_DRAGONAIR_EVENT_CLEARED_ONCE
	jr z, .notAlreadyClearedDragonairEvent
	ld hl, .goBack
	rst _PrintText
	jp ErikSarasHouseSaraText.goBackQuestionEntry
.notAlreadyClearedDragonairEvent
	CheckAndSetEvent EVENT_MET_ERIK_SARA_IN_HOUSE
	jr nz, .alreadyMet
	ld hl, .welcomeErik
	rst _PrintText
	rst TextScriptEnd
.alreadyMet
	ld hl, .interested
	rst _PrintText
	jp ErikSarasHouseSaraText.firstQuestionEntry
.welcomeErik
	text_far _ErikHouseIntroText
	text_end
.interested
	text_far _ErikInterestedQuestion
	text_end
.goBack
	text_far _ErikSarasHouseGoBackErikText
	text_end

DoErikSaraFacings:
	; face erik and sara based on player's x position
	ld a, [wXCoord]
	sub 19
	lb de, SPRITE_FACING_LEFT, SPRITE_FACING_LEFT
	jr z, .dofacings
	dec a
	ld d, SPRITE_FACING_UP
	jr z, .dofacings
	dec a
	ld d, SPRITE_FACING_RIGHT
	jr z, .dofacings
	dec a
	ld e, SPRITE_FACING_UP
	jr z, .dofacings
	ld e, SPRITE_FACING_RIGHT
.dofacings
	ld a, FUCHSIAGOODRODHOUSE_SARA
	ld b, d
	call ChangeSpriteFacing
	ld a, FUCHSIAGOODRODHOUSE_ERIK
	ld b, e
	jp ChangeSpriteFacing

ChooseDragonairForEvent::
	callfar GenericShowPartyMenuSelection
	ld a, $FD
	ld hl, .forgetIt
	jr c, .printDone
	call GetPartyMonName2
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Species
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hl]
  	cp DRAGONAIR
  	jr z, .dragonair
  	cp WINTER_DRAGONAIR
  	ld hl, .already
  	ld a, $FE
  	jr z, .printDone
  	ld hl, .wrongMon
  	jr .printDone
.dragonair
	ld a, [wWhichPokemon]
	ld hl, wPartyMon1Level
 	ld bc, wPartyMon2 - wPartyMon1
  	call AddNTimes
  	ld a, [hl]
  	cp 45
  	ld a, $FF
  	ret nc ; success
.failed
	ld [wWhichPokemon], a
	ret
.printDone
	ld [wWhichPokemon], a
	rst _PrintText
	ret
.forgetIt
	text_far _GenericForgetItText
	text_end
.wrongMon
	text_far _SecretLabMewtwoReactionText4
	text_end
.already
	text_far _DragonairEventAlready
	text_end

ErikSarasHouseAfterEventText:
	text_far _DragonairEventEnd
	text_end

ErikSarasHouseSecondNoteText:
	text_far _ErikSarasHouseSecondNoteText
	text_end