DEF COIN_CASE EQU $45 ; constant was changed
DEF TOWN_MAP EQU $05 ; constant was changed

SaveFileUpdateText:
	text_far _SaveFileUpdateText
	text_end

PressStartToContinueText:
	text_far _SaveFileUpdateTextConfirm
	text_end

SaveFileUpdateCompleteText:
	text_far _SaveFileUpdateCompleteText
	text_end

SaveFileUpdateWarpText:
	text_far _SaveFileUpdateWarpText
	text_end

SaveFileUpdateCheck::
	ld a, [wGameInternalVersion]
	cp CURRENT_INTERNAL_VERSION
	ret z ; also nc
	ld hl, SaveFileUpdateText
	rst _PrintText
	call SaveScreenTilesToBuffer1
	xor a
	ld [wCurrentMenuItem], a
.reload
	ld hl, SaveFileUpdaterMenu
	ld b, A_BUTTON | START | B_BUTTON
	call DisplayMultiChoiceTextBoxNoMenuReset
	jr nz, .exitSaveUpdater
	ldh a, [hJoy5]
	bit BIT_A_BUTTON, a
	jr z, .startPressed
	ld hl, PressStartToContinueText
	rst _PrintText
	jr .reload
.startPressed
	call LoadScreenTilesFromBuffer1
	call .updateSaveFile
	ld hl, SaveFileUpdateCompleteText
	rst _PrintText
	call DisplayTextPromptButton
	; last step: set the current internal version so we don't update the save again later
	ld hl, wGameInternalVersion
	ld [hl], CURRENT_INTERNAL_VERSION
	ld hl, SaveFileUpdateWarpText
	rst _PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a ; clear carry
	dec a
	ret
.exitSaveUpdater
	scf
	ret
.updateSaveFile
	ld a, [wCurrentMenuItem]
	and a
	jp z, EarlierVersionSaveFileUpdate
	; fall through
OriginalGameSaveFileUpdate:
	; first we will copy item data to the correct locations
	; step 1: copy the pc item data over to the new location
	ld hl, wOriginalGameBoxItemsData
	ld de, wNumBoxItems
	ld bc, 102 ; 50 items * 2 plus extra byte plus number of items byte
	rst _CopyData
	; step 2: copy the bag item data over to the new location
	ld hl, wOriginalGameBagItemsData
	ld de, wNumBagItems
	ld bc, 42 ; 20 items * 2 plus extra byte plus number of items byte
	rst _CopyData
	CheckEvent EVENT_GOT_TOWN_MAP
	ld a, TOWN_MAP
	call nz, RemoveItemFromBagAndBox
	; step 4: check if COIN CASE has been obtained by player. If so remove coin case item from player inventory.
	CheckEvent EVENT_GOT_COIN_CASE
	ld a, COIN_CASE
	call nz, RemoveItemFromBagAndBox
	; step 5: check if the player has opened every CARD_KEY door. If so remove from player inventory.
	callfar CheckAllCardKeyEvents
	CheckEvent EVENT_ALL_CARD_KEY_DOORS_OPENED
	ld a, CARD_KEY
	call nz, RemoveItemFromBagAndBox
	; lift key and secret key can be used by the player in the regular spots regardless of what else they did in-game. No need to check those.
	; step 6: do any other event constant updates that are necessary from versions earlier than the current one
	call EarlierVersionEventConstantsUpdate
	; step 7: initialize the new extra hidden objects flags
	callfar InitializeExtraMissableObjectsFlags
	; step 8: shift normal hidden object flags according to current ordering
	call TransferMovedHideShowFlags
	ld de, RemovedHideShowFlags
	ld c, NUM_HS_ORIGINAL_OBJECTS / 8 - 1
	ld hl, wMissableObjectFlags + NUM_HS_ORIGINAL_OBJECTS / 8
	call RemoveValuesFromFlagArray
	ld hl, InsertDefaultValueToHideShowArray
	call SaveFileUpdaterLoadPointer
	ld de, AddedHideShowFlags
	ld c, NUM_HS_OBJECTS / 8
	ld hl, wMissableObjectFlags
	call InsertValuesToFlagArray
	call UpdateNewHideShowFlagsBasedOnGameProgression
	; step 9: clear movedex flags since it's in previously bag item memory
	ld hl, wMovedexSeen
	ld bc, wMovedexSeenEnd - wMovedexSeen
	xor a
	call FillMemory
	; step 10: clear some additional data that is now in previously box item memory
	ld hl, wPocketAbraNick
	ld bc, wOriginalGameBoxItemsDataEnd - wPocketAbraNick
	xor a
	call FillMemory
	; step 11: update wObtainedHiddenItemsFlags since new hidden items were added
	ld de, RemovedHiddenItemFlags
	ld c, MAX_HIDDEN_ITEMS / 8 - 1
	ld hl, wObtainedHiddenItemsFlags + MAX_HIDDEN_ITEMS / 8
	call RemoveValuesFromFlagArray
	ld hl, InsertZeroToFlagArray
	call SaveFileUpdaterLoadPointer
	ld de, AddedHiddenItemFlags
	ld c, MAX_HIDDEN_ITEMS / 8
	ld hl, wObtainedHiddenItemsFlags
	call InsertValuesToFlagArray
	; step 12: EVENT_BECAME_CHAMP set if player became champ
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	ret z
	SetEvent EVENT_BECAME_CHAMP
	ret
	

SaveFileUpdaterLoadPointer:
	ld a, l
	ld [wListPointer], a
	ld a, h
   	ld [wListPointer + 1], a
   	ret

EarlierVersionSaveFileUpdate:
	; step 1: Booster chip variable was changed to an event flag, set event flag if it was set previously in the other version
	ld a, [wPrior2_6_0_BoosterChipActive]
	and a
	jr z, .dontSet
	SetEvent EVENT_BOOSTER_CHIP_ACTIVE
.dontSet
	; first we will copy item data to the correct locations since pc items was moved in 2.6.0
	; step 2: copy data that is in the space that wBoxItems will be moved to to a temporary storage area
	ld hl, wPrior2_6_0_StartData
	ld de, wSaveTransferTempData
	ld bc, wPrior2_6_0_EndData - wPrior2_6_0_StartData
	rst _CopyData
	; step 3: copy the pc item data over to the new location
	ld hl, wPrior2_6_0_BoxItemsData
	ld de, wNumBoxItems
	ld bc, 102 ; 50 items * 2 plus extra byte plus number of items byte
	rst _CopyData
	; step 4: copy the bag item data over from temporary storage
	ld hl, wSaveTransferTempNumBagItems
	ld de, wNumBagItems
	ld bc, 62 ; 30 items * 2 plus extra byte plus number of items byte
	rst _CopyData
	; step 5: copy other data that was moved
	ld hl, wSaveTransferTempPocketAbraNick
	ld de, wPocketAbraNick
	ld bc, 11
	rst _CopyData
	ld a, [wSaveTransferTempColorSwapsUsed]
	ld [wColorSwapsUsed], a
	call EarlierVersionEventConstantsUpdate
	; step 6: update hide show variables based on events (if possible)
	CheckEvent EVENT_MET_DAD
	ld a, HS_REDS_HOUSE_1F_DAD
	call z, .hideExtraObjectEntry
	CheckEvent EVENT_DIAMOND_MINE_COMPLETED
	ld a, HS_PROSPECTORS_HOUSE_PROSPECTOR
	call z, .hideExtraObjectEntry
	callfar SetDetentionHideShows
	ld hl, SaveFileUpdater2_6_0_Hides
	; fall through
.hideMultipleObjects
	ld a, [hli]
	cp -1
	ret z
	push hl
	call .hideExtraObjectEntry
	pop hl
	jr .hideMultipleObjects
.hideExtraObjectEntry
	ld [wMissableObjectIndex], a
	predef_jump HideExtraObject

SaveFileUpdater2_6_0_Hides:
	; despite the champ arena having been introduced already before 2.6.0, we can reset the values to deal with even earlier versions
	; since all of the values are supposed to be set to HIDE anyway at every point in time other than during battles in the champ arena.
	db HS_CHAMP_ARENA_CHALLENGER
	db HS_CHAMP_ARENA_PROXY_PLAYER
	db HS_CHAMP_ARENA_TM_KID
	db HS_CHAMP_ARENA_CROWD_1
	db HS_CHAMP_ARENA_CROWD_2
	db HS_CHAMP_ARENA_VARIABLE_CROWD_1
	db HS_CHAMP_ARENA_VARIABLE_CROWD_2
	db HS_CHAMP_ARENA_CROWD_3 
	db HS_CHAMP_ARENA_VARIABLE_CROWD_3 
	db HS_CHAMP_ARENA_CROWD_4 
	; new variables for 2.6.0...only necessary to set them if they're by default HIDE
	db HS_VOLCANO_RUBY_1
	db HS_VOLCANO_RUBY_2
	db HS_VOLCANO_RUBY_3
	db HS_VOLCANO_ANIMATION_PROXY
	db HS_DIGLETTS_CAVE_DIGLETT1
	db HS_DIGLETTS_CAVE_DIGLETT2
	db HS_DIGLETTS_CAVE_DIGLETT3
	db HS_DIGLETTS_CAVE_DIGLETT4
	db HS_SAFARI_ZONE_CENTER_REST_HOUSE_ERIK
	db HS_ERIK_HOUSE
	db HS_SARA_HOUSE
	db HS_ERIK_SARA_HOUSE_NOTE2
	db -1

EarlierVersionEventConstantsUpdate:
	; step 1: check if player has completed S.S. ANNE. If so remove S.S. Ticket item from their inventory since it's no longer needed.
	CheckEvent EVENT_GOT_HM01
	jr z, .didntGetCutYet
	ld a, S_S_TICKET
	call RemoveItemFromBagAndBox
.didntGetCutYet
	; these script constants were changed so fix their values to 0
	xor a
	ld hl, wSeafoamIslandsB3FCurScript
	ld [hl], a
	ld hl, wSeafoamIslandsB4FCurScript
	ld [hl], a
	ret

RemoveItemFromBagAndBox:
	ldh [hItemToRemoveID], a
	callfar RemoveItemByID
	jpfar RemoveBoxItemByID

; removed hide show flags - flags in the original game that don't exist in this romhack anymore or were moved to extra flags
; this array is read backwards, just so the order of which flags is a little bit clearer. we need to iterate from the highest removed
; flag to the lowest to keep their const values accurate.
	db -1
	db HS_ORIGINAL_SILPH_CO_7F_8                 ; AA XXX sprite doesn't exist
	db HS_ORIGINAL_UNUSED_MAP_F4_1
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_1       ; C3 X
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_2       ; C4 X
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_3       ; C5 X
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_4       ; C6 X
	db HS_ORIGINAL_SAFARI_ZONE_NORTH_ITEM_1      ; C7 X
	db HS_ORIGINAL_SAFARI_ZONE_NORTH_ITEM_2      ; C8 X
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_1       ; C9 X
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_2       ; CA X
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_3       ; CB X
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_4       ; CC X
RemovedHideShowFlags::
	db HS_ORIGINAL_SAFARI_ZONE_CENTER_ITEM       ; CD X

RemoveValuesFromFlagArray::
.outerLoopShiftLeft
	ld a, [de]
	cp -1
	ret z
	push hl
	push bc
	srl_a_3x
	; a = which byte in missable object flags it is
	ld b, a
	; start at the end of the missable object flags and start shifting left
	ld a, c
	sub b
	; a = how many bytes we will shift by 1 before the final byte is reached
.loopShiftBytes
	rr [hl]
	dec hl
	dec a
	jr nz, .loopShiftBytes
	ld c, 0
	jr nc, .noCarry
	ld c, $FF
.noCarry
	push bc
	;now deal with the first byte
	; hl = the first byte
	ld c, 0
	ld a, [de]
	and %111 ; remainder after dividing by 8 aka which bit it is
	ld b, a
	ld a, [hl]
	push hl
	ld l, a
	ld h, c ; c = 0
	; shift l into c skipping bit b
.loopShiftFirstByte
	ld a, b
	cp h
	jr z, .skipBit
	srl l
	rr c
.next
	inc h
	ld a, h
	cp 8
	jr nz, .loopShiftFirstByte
	jr .doneShiftFirstByte
.skipBit
	srl l
	jr .next
.doneShiftFirstByte
	pop hl
	ld [hl], c
	pop bc
	srl c
	rr [hl]
	; go to next
	dec de
	pop bc
	pop hl
	jr .outerLoopShiftLeft

; flags in the current game but not in the original one
AddedHideShowFlags:
	db HS_PEWTER_CITY_ITEM
	db HS_CERULEAN_ITEM
	db HS_ROUTE_2_ITEM_3                ; NEW X
	db HS_ROUTE_4_ITEM_2                ; NEW X
	db HS_ROUTE_5_ITEM                  ; NEW X
	db HS_ROUTE_6_ITEM                  ; NEW X
	db HS_ROUTE_8_ITEM                  ; NEW X
	db HS_ROUTE_10_ITEM                 ; NEW X
	db HS_ROUTE_11_ITEM                 ; NEW X
	db HS_ROUTE_12_ITEM_3               ; NEW X
	db HS_ROUTE_21_ITEM                 ; NEW X
	db HS_ROUTE_22_ITEM_1               ; NEW X
	db HS_ROUTE_22_ITEM_2               ; NEW X
	db HS_ROUTE_23_ITEM_1               ; NEW X
	db HS_ROUTE_23_ITEM_2               ; NEW X
	db HS_ROUTE_24_ITEM_2               ; NEW X
	db HS_CELADON_MANSION_ROOF_ITEM     ; NEW X
	db HS_SILPH_CO_1F_TRAINER_1         ; NEW
	db HS_SILPH_CO_1F_TRAINER_2         ; NEW
	db HS_SILPH_CO_1F_TRAINER_3         ; NEW
	db HS_SILPH_CO_1F_TRAINER_4         ; NEW
	db HS_ROCK_TUNNEL_1F_ITEM           ; NEW X
	db HS_ROCK_TUNNEL_B1F_ITEM_1        ; NEW X
	db HS_ROCK_TUNNEL_B1F_ITEM_2        ; NEW X
	db HS_SEAFOAM_ISLANDS_B3F_DOME_FOSSIL ; E2
	db HS_SEAFOAM_ISLANDS_B3F_HELIX_FOSSIL ; E3
	db -1

InsertValuesToFlagArray::
.outerLoopShiftRight
	ld a, [de]
	cp -1
	ret z
	push hl
	push bc
	srl_a_3x 
	; a = which byte in missable object flags it is
	push de
	ld d, 0
	ld e, a
	add hl, de
	push hl
	ld a, c
	sub e
	dec a ; discount the first byte
	jr z, .skipShiftOtherBytes ; if only one byte to shift, don't do anything else
	ld c, a
	ld a, [hli]
	rla
	; shift this byte and all other bytes after it right by 1 bit to account for the new space
.loopFlagArrayShiftRight
	rl [hl]
	inc hl
	dec c
	jr nz, .loopFlagArrayShiftRight
.skipShiftOtherBytes
	pop hl
	pop de
	; now deal with the first byte
	ld a, [hl]
	push hl
	ld c, 0
	ld a, [de]
	and %111 ; remainder after dividing by 8 aka which bit it is
	ld b, a
	ld l, [hl]
	ld a, c ; c = 0
	; shift l into c, appending the default value for that hide/show for byte b
.loopShiftFirstByte
	cp b
	jr z, .shiftDefaultValue
	sra l
	rr c
.next
	inc a
	cp 8
	jr nz, .loopShiftFirstByte
	jr .doneShiftFirstByte
.shiftDefaultValue
	push af
	push de
	push bc
	push hl
	hl_deref wListPointer
	call hl_caller
	pop hl
	ld h, d
	pop bc
	pop de
	pop af
	sra h
	rr c
	jr .next
.doneShiftFirstByte
	pop hl
	ld [hl], c
	inc de
	pop bc
	pop hl
	jr .outerLoopShiftRight



InsertDefaultValueToHideShowArray:
	dec de
	ld a, [de] ; a = which hide show flag it is
	ld e, a
	callfar GetObjectDefaultState
	ld a, d
	cp HIDE
	ld d, $FF
	ret z
InsertZeroToFlagArray:
	ld d, 0
	ret

MACRO transfer_flags
	db \1 / 8, \1 % 8, \2 / 8, \1 % 8
ENDM

; some hide show flags were moved to the extra hide show flags instead due to the map using extra flags instead.

TransferHideShowFlagArray:
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_1, HS_SAFARI_ZONE_EAST_ITEM_1
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_2, HS_SAFARI_ZONE_EAST_ITEM_2
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_3, HS_SAFARI_ZONE_EAST_ITEM_3       
	db HS_ORIGINAL_SAFARI_ZONE_EAST_ITEM_4, HS_SAFARI_ZONE_EAST_ITEM_4      
	db HS_ORIGINAL_SAFARI_ZONE_NORTH_ITEM_1, HS_SAFARI_ZONE_NORTH_ITEM_1      
	db HS_ORIGINAL_SAFARI_ZONE_NORTH_ITEM_2, HS_SAFARI_ZONE_NORTH_ITEM_2      
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_1, HS_SAFARI_ZONE_WEST_ITEM_1      
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_2, HS_SAFARI_ZONE_WEST_ITEM_2      
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_3, HS_SAFARI_ZONE_WEST_ITEM_3
	db HS_ORIGINAL_SAFARI_ZONE_WEST_ITEM_4, HS_SAFARI_ZONE_WEST_ITEM_4
	db HS_ORIGINAL_SAFARI_ZONE_CENTER_ITEM, HS_SAFARI_ZONE_CENTER_ITEM
	db -1

TransferMovedHideShowFlags:
	ld de, TransferHideShowFlagArray
.loop
	ld a, [de]
	cp -1
	ret z
	ld hl, wMissableObjectFlags
	ld c, a
	ld b, FLAG_TEST
	push de
	predef FlagActionPredef
	pop de
	ld a, c
	and a
	ld b, FLAG_SET
	jr nz, .transferValue
	ld b, FLAG_RESET
.transferValue
	inc de
	ld a, [de]
	ld c, a
	ld hl, wExtraMissableObjectFlags
	push de
	predef FlagActionPredef
	pop de
	inc de
	jr .loop


HideShowFlagsThatNeedUpdating:
	db HS_SILPH_CO_1F_TRAINER_1
	db HS_SILPH_CO_1F_TRAINER_2
	db HS_SILPH_CO_1F_TRAINER_3
	db HS_SILPH_CO_1F_TRAINER_4
	db -1

UpdateNewHideShowFlagsBasedOnGameProgression:
	CheckEvent EVENT_BEAT_SILPH_CO_GIOVANNI
	ret z
	ld hl, HideShowFlagsThatNeedUpdating
.loop
	; only need to be updated if they have to be shown since they were defaulted to hidden in the last function
	ld a, [hli]
	cp -1
	jr z, .next
	push hl
	ld [wMissableObjectIndex], a
	predef ShowObject
	pop hl
	jr .loop
.next
	ld a, HS_MEW_VERMILION_DOCK
	call SaveFileUpdaterHideObjectEntry
	CheckEvent EVENT_BEAT_CHAMPION_RIVAL
	jr z, .dontHideRocketHouseGuy
	ld a, HS_CERULEAN_ROCKET_HOUSE_1F_GUY
	call SaveFileUpdaterHideObjectEntry
.dontHideRocketHouseGuy
	ld a, [wStatusFlags4]
	bit BIT_GOT_SILPH_CO_LAPRAS_OR_ITEM, a
	jr z, .dontHideCeladonLaprasGuy
	ld a, HS_LAPRAS_GUY_CELADON
	call SaveFileUpdaterHideObjectEntry
.dontHideCeladonLaprasGuy
	CheckEvent EVENT_GOT_DOME_FOSSIL
	ld a, HS_SEAFOAM_ISLANDS_B3F_DOME_FOSSIL
	call nz, SaveFileUpdaterHideObjectEntry
	CheckEvent EVENT_GOT_HELIX_FOSSIL
	ret z
	ld a, HS_SEAFOAM_ISLANDS_B3F_HELIX_FOSSIL
SaveFileUpdaterHideObjectEntry:
	ld [wMissableObjectIndex], a
	predef_jump HideObject


	db -1
RemovedHiddenItemFlags:
	db 34

AddedHiddenItemFlags:
	db 5
	db 16
	db 22
	db 50
	db 51
	db -1


; Note: if EVENT_RESCUED_MR_FUJI_2 is ever used set it correctly in save updater.