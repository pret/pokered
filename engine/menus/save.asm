TryLoadSaveFile:
	call ClearScreen
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call LoadMainData
	jr c, .badsum
	call LoadCurrentBoxData
	jr c, .badsum
	call LoadPartyAndDexData
	jr c, .badsum
	ld a, $2 ; good checksum
	jr .done
.badsum
	ld hl, wStatusFlags5
	push hl
	set BIT_NO_TEXT_DELAY, [hl]
	ld hl, FileDataDestroyedText
	call PrintText
	ld c, 100
	call DelayFrames
	pop hl
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, $1 ; bad checksum
.done
	ld [wSaveFileStatus], a
	ret

FileDataDestroyedText:
	text_far _FileDataDestroyedText
	text_end

LoadMainData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
; This vc_hook does not have to be in any particular location.
; It is defined here because it refers to the same labels as the two lines below.
	vc_hook Unknown_save_limit
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp z, .checkSumMatched

; If the computed checksum didn't match the saved on, try again.
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp nz, CheckSumFailed

.checkSumMatched
	ld hl, sPlayerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, sMainData
	ld de, wMainDataStart
	ld bc, wMainDataEnd - wMainDataStart
	call CopyData
	ld hl, wCurMapTileset
	set BIT_NO_PREVIOUS_MAP, [hl]
	ld hl, sSpriteData
	ld de, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	call CopyData
	ld a, [sTileAnimations]
	ldh [hTileAnimations], a

; this part is redundant, LoadCurrentBoxData is always called next
	ld hl, sCurBoxData
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData

	and a
	jp GoodCheckSum

LoadCurrentBoxData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jr nz, CheckSumFailed
	ld hl, sCurBoxData
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	and a
	jp GoodCheckSum

LoadPartyAndDexData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp nz, CheckSumFailed
	ld hl, sPartyData
	ld de, wPartyDataStart
	ld bc, wPartyDataEnd - wPartyDataStart
	call CopyData
	ld hl, sMainData
	ld de, wPokedexOwned
	ld bc, wPokedexSeenEnd - wPokedexOwned
	call CopyData
	and a
	jp GoodCheckSum

CheckSumFailed:
	scf
	; fallthrough

GoodCheckSum:
	ld a, BMODE_SIMPLE ; preserve flags
	ld [rBMODE], a
	ASSERT RAMG_SRAM_DISABLE == BMODE_SIMPLE
	ld [rRAMG], a
	ret

TryLoadSaveFileIgnoreChecksum: ; unreferenced
; don't update wSaveFileStatus upon success or failure
; don't display warning in case of failed checksum
	call LoadMainData
	call LoadCurrentBoxData
	jp LoadPartyAndDexData

SaveMenu:
	farcall PrintSaveScreenText
	ld hl, WouldYouLikeToSaveText
	call SaveTheGame_YesOrNo
	and a   ;|0 = Yes|1 = No|
	ret nz
	ld a, [wSaveFileStatus]
	dec a
	jr z, .save
	call CheckPreviousSaveFile
	jr z, .save
	ld hl, OlderFileWillBeErasedText
	call SaveTheGame_YesOrNo
	and a
	ret nz
.save
	call SaveGameData
	hlcoord 1, 13
	lb bc, 4, 18
	call ClearScreenArea
	hlcoord 1, 14
	ld de, NowSavingString
	call PlaceString
	ld c, 120
	call DelayFrames
	ld hl, GameSavedText
	call PrintText
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, 30
	jp DelayFrames

NowSavingString:
	db "Now saving...@"

SaveTheGame_YesOrNo:
	call PrintText
	hlcoord 0, 7
	lb bc, 8, 1
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem]
	ret

WouldYouLikeToSaveText:
	text_far _WouldYouLikeToSaveText
	text_end

GameSavedText:
	text_far _GameSavedText
	text_end

OlderFileWillBeErasedText:
	text_far _OlderFileWillBeErasedText
	text_end

SaveMainData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a

	ld hl, wPlayerName
	ld de, sPlayerName
	ld bc, NAME_LENGTH
	call CopyData
	ld hl, wMainDataStart
	ld de, sMainData
	ld bc, wMainDataEnd - wMainDataStart
	call CopyData
	ld hl, wSpriteDataStart
	ld de, sSpriteData
	ld bc, wSpriteDataEnd - wSpriteDataStart
	call CopyData
	ld hl, wBoxDataStart

; this part is redundant, SaveCurrentBoxData is always called next
	ld de, sCurBoxData
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	ldh a, [hTileAnimations]
	ld [sTileAnimations], a

	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

SaveCurrentBoxData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
	ld hl, wBoxDataStart
	ld de, sCurBoxData
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

SavePartyAndDexData:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
	ld hl, wPartyDataStart
	ld de, sPartyData
	ld bc, wPartyDataEnd - wPartyDataStart
	call CopyData
	ld hl, wPokedexOwned ; pokédex only
	ld de, sMainData
	ld bc, wPokedexSeenEnd - wPokedexOwned
	call CopyData
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

SaveGameData::
	ld a, $2
	ld [wSaveFileStatus], a
	call SaveMainData
	call SaveCurrentBoxData
	jp SavePartyAndDexData

CalcCheckSum:
;Check Sum (result[1 byte] is complemented)
	ld d, 0
.loop
	ld a, [hli]
	add d
	ld d, a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, d
	cpl
	ret

CalcIndividualBoxCheckSums:
	ld hl, sBox1 ; sBox7
	ld de, sBank2IndividualBoxChecksums ; sBank3IndividualBoxChecksums
	ld b, NUM_BOXES / 2
.loop
	push bc
	push de
	ld bc, wBoxDataEnd - wBoxDataStart
	call CalcCheckSum
	pop de
	ld [de], a
	inc de
	pop bc
	dec b
	jr nz, .loop
	ret

GetBoxSRAMLocation:
; in: a = box num
; out: b = box SRAM bank, hl = pointer to start of box
	ld hl, BoxSRAMPointerTable
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	cp NUM_BOXES / 2
	ld b, 2
	jr c, .next
	inc b
	sub NUM_BOXES / 2
.next
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

BoxSRAMPointerTable:
	dw sBox1 ; sBox7
	dw sBox2 ; sBox8
	dw sBox3 ; sBox9
	dw sBox4 ; sBox10
	dw sBox5 ; sBox11
	dw sBox6 ; sBox12

ChangeBox::
	ld hl, WhenYouChangeBoxText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz ; return if No was chosen
	ld hl, wCurrentBoxNum
	bit BIT_HAS_CHANGED_BOXES, [hl] ; is it the first time player is changing the box?
	call z, EmptyAllSRAMBoxes ; if so, empty all boxes in SRAM
	call DisplayChangeBoxMenu
	call UpdateSprites
	ld hl, hUILayoutFlags
	set BIT_DOUBLE_SPACED_MENU, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_DOUBLE_SPACED_MENU, [hl]
	bit B_PAD_B, a
	ret nz
	call GetBoxSRAMLocation
	ld e, l
	ld d, h
	ld hl, wBoxDataStart
	call CopyBoxToOrFromSRAM ; copy old box from WRAM to SRAM
	ld a, [wCurrentMenuItem]
	set BIT_HAS_CHANGED_BOXES, a
	ld [wCurrentBoxNum], a
	call GetBoxSRAMLocation
	ld de, wBoxDataStart
	call CopyBoxToOrFromSRAM ; copy new box from SRAM to WRAM
	ld hl, wCurMapTextPtr
	ld de, wChangeBoxSavedMapTextPointer
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call RestoreMapTextPointer
	call SaveGameData
	ld hl, wChangeBoxSavedMapTextPointer
	call SetMapTextPointer
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ret

WhenYouChangeBoxText:
	text_far _WhenYouChangeBoxText
	text_end

CopyBoxToOrFromSRAM:
; copy an entire box from hl to de with b as the SRAM bank
	push hl
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ld a, b
	ld [rRAMB], a
	ld bc, wBoxDataEnd - wBoxDataStart
	call CopyData
	pop hl

; mark the source box as an empty box
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, sBox1 ; sBox7
	ld bc, sBank2AllBoxesChecksum - sBox1
	call CalcCheckSum
	ld [sBank2AllBoxesChecksum], a ; sBank3AllBoxesChecksum
	call CalcIndividualBoxCheckSums
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

DisplayChangeBoxMenu:
	xor a
	ldh [hAutoBGTransferEnabled], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 11
	ld [wMaxMenuItem], a
	ld a, 1
	ld [wTopMenuItemY], a
	ld a, 12
	ld [wTopMenuItemX], a
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	hlcoord 0, 0
	ld b, 2
	ld c, 9
	call TextBoxBorder
	ld hl, ChooseABoxText
	call PrintText
	hlcoord 11, 0
	ld b, 12
	ld c, 7
	call TextBoxBorder
	ld hl, hUILayoutFlags
	set BIT_SINGLE_SPACED_LINES, [hl]
	ld de, BoxNames
	hlcoord 13, 1
	call PlaceString
	ld hl, hUILayoutFlags
	res BIT_SINGLE_SPACED_LINES, [hl]
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	cp 9
	jr c, .singleDigitBoxNum
	sub 9
	hlcoord 8, 2
	ld [hl], "1"
	add "0"
	jr .next
.singleDigitBoxNum
	add "1"
.next
	ldcoord_a 9, 2
	hlcoord 1, 2
	ld de, BoxNoText
	call PlaceString
	call GetMonCountsForAllBoxes
	hlcoord 18, 1
	ld de, wBoxMonCounts
	ld bc, SCREEN_WIDTH
	ld a, NUM_BOXES
.loop
	push af
	ld a, [de]
	and a ; is the box empty?
	jr z, .skipPlacingPokeball
	ld [hl], $78 ; place pokeball tile next to box name if box not empty
.skipPlacingPokeball
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .loop
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

ChooseABoxText:
	text_far _ChooseABoxText
	text_end

BoxNames:
	db   "BOX 1"
	next "BOX 2"
	next "BOX 3"
	next "BOX 4"
	next "BOX 5"
	next "BOX 6"
	next "BOX 7"
	next "BOX 8"
	next "BOX 9"
	next "BOX10"
	next "BOX11"
	next "BOX12@"

BoxNoText:
	db "BOX No.@"

EmptyAllSRAMBoxes:
; marks all boxes in SRAM as empty (initialisation for the first time the
; player changes the box)
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ld a, BANK("Saved Boxes 1")
	ld [rRAMB], a
	call EmptySRAMBoxesInBank
	ld a, BANK("Saved Boxes 2")
	ld [rRAMB], a
	call EmptySRAMBoxesInBank
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

EmptySRAMBoxesInBank:
; marks every box in the current SRAM bank as empty
	ld hl, sBox1 ; sBox7
	call EmptySRAMBox
	ld hl, sBox2 ; sBox8
	call EmptySRAMBox
	ld hl, sBox3 ; sBox9
	call EmptySRAMBox
	ld hl, sBox4 ; sBox10
	call EmptySRAMBox
	ld hl, sBox5 ; sBox11
	call EmptySRAMBox
	ld hl, sBox6 ; sBox12
	call EmptySRAMBox
	ld hl, sBox1 ; sBox7
	ld bc, sBank2AllBoxesChecksum - sBox1
	call CalcCheckSum
	ld [sBank2AllBoxesChecksum], a ; sBank3AllBoxesChecksum
	call CalcIndividualBoxCheckSums
	ret

EmptySRAMBox:
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

GetMonCountsForAllBoxes:
	ld hl, wBoxMonCounts
	push hl
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ld a, BANK("Saved Boxes 1")
	ld [rRAMB], a
	call GetMonCountsForBoxesInBank
	ld a, BANK("Saved Boxes 2")
	ld [rRAMB], a
	call GetMonCountsForBoxesInBank
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	pop hl

; copy the count for the current box from WRAM
	ld a, [wCurrentBoxNum]
	and BOX_NUM_MASK
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wBoxCount]
	ld [hl], a

	ret

GetMonCountsForBoxesInBank:
	ld a, [sBox1] ; sBox7
	ld [hli], a
	ld a, [sBox2] ; sBox8
	ld [hli], a
	ld a, [sBox3] ; sBox9
	ld [hli], a
	ld a, [sBox4] ; sBox10
	ld [hli], a
	ld a, [sBox5] ; sBox11
	ld [hli], a
	ld a, [sBox6] ; sBox12
	ld [hli], a
	ret

; check if we're trying to save over a different playthrough
; return result in zero flag
; z set: a valid save file was found, and saved PlayerID is different from wPlayerID
CheckPreviousSaveFile:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK("Save Data") == BMODE_ADVANCED
	ld [rRAMB], a
	ld a, [sPlayerName]
	and a
	jr z, .next
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call CalcCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jr nz, .next ; return z set if save data is corrupted
	ld hl, sMainData + (wPlayerID - wMainDataStart) ; player ID
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerID]
	cp l
	jr nz, .next
	ld a, [wPlayerID + 1]
	cp h
.next
	ld a, BMODE_SIMPLE
	ld [rBMODE], a
	ASSERT RAMG_SRAM_DISABLE == BMODE_SIMPLE
	ld [rRAMG], a
	ret

SaveHallOfFameTeams:
	ld a, [wNumHoFTeams]
	dec a
	cp HOF_TEAM_CAPACITY
	jr nc, .shiftHOFTeams
	ld hl, sHallOfFame
	ld bc, HOF_TEAM
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wHallOfFame
	ld bc, HOF_TEAM
	jr HallOfFame_Copy

.shiftHOFTeams
; if the space designated for HOF teams is full, then shift all HOF teams to the next slot, making space for the new HOF team
; this deletes the last HOF team though
	ld hl, sHallOfFame + HOF_TEAM
	ld de, sHallOfFame
	ld bc, HOF_TEAM * (HOF_TEAM_CAPACITY - 1)
	call HallOfFame_Copy
	ld hl, wHallOfFame
	ld de, sHallOfFame + HOF_TEAM * (HOF_TEAM_CAPACITY - 1)
	ld bc, HOF_TEAM
	jr HallOfFame_Copy

LoadHallOfFameTeams:
	ld hl, sHallOfFame
	ld bc, HOF_TEAM
	ld a, [wHoFTeamIndex]
	call AddNTimes
	ld de, wHallOfFame
	ld bc, HOF_TEAM
	; fallthrough

HallOfFame_Copy:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	xor a
	ld [rRAMB], a
	call CopyData
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

; Fill SRAM with $ff, erasing save data. Used by DoClearSaveDialogue
ClearAllSRAMBanks:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	xor a
	call .PadSRAM_FF
	ld a, 1
	call .PadSRAM_FF
	ld a, 2
	call .PadSRAM_FF
	ld a, 3
	call .PadSRAM_FF
	xor a
	ld [rBMODE], a
	ld [rRAMG], a
	ret

.PadSRAM_FF
	ld [rRAMB], a
	ld hl, STARTOF(SRAM)
	ld bc, SIZEOF(SRAM)
	ld a, $ff
	jp FillMemory
