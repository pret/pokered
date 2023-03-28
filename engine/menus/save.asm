LoadSAV:
;(if carry -> write
;"the file data is destroyed")
	call ClearScreen
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call LoadSAV0
	jr c, .badsum
	call LoadSAV1
	jr c, .badsum
	call LoadSAV2
	jr c, .badsum
	ld a, $2 ; good checksum
	jr .goodsum
.badsum
	ld hl, wd730
	push hl
	set 6, [hl]
	ld hl, FileDataDestroyedText
	rst _PrintText
	ld c, 100
	rst _DelayFrames
	pop hl
	res 6, [hl]
	ld a, $1 ; bad checksum
.goodsum
	ld [wSaveFileStatus], a
	ret

FileDataDestroyedText:
	text_far _FileDataDestroyedText
	text_end

LoadSAV0:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
; This vc_hook does not have to be in any particular location.
; It is defined here because it refers to the same labels as the two lines below.
	vc_hook Unknown_save_limit
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp z, .checkSumsMatched

; If the computed checksum didn't match the saved on, try again.
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp nz, SAVBadCheckSum

.checkSumsMatched
	ld hl, sPlayerName
	ld de, wPlayerName
	ld bc, NAME_LENGTH
	rst _CopyData
	ld hl, sMainData
	ld de, wMainDataStart
	ld bc, wMainDataEnd - wMainDataStart
	rst _CopyData
	ld hl, wCurMapTileset
	set 7, [hl]
	ld hl, sSpriteData
	ld de, wSpriteDataStart
	ld bc, wSpriteDataEnd - wSpriteDataStart
	rst _CopyData
	ld a, [sTileAnimations]
	ldh [hTileAnimations], a
	ld hl, sCurBoxData
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	rst _CopyData
	and a
	jp SAVGoodChecksum

LoadSAV1:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jr nz, SAVBadCheckSum
	ld hl, sCurBoxData
	ld de, wBoxDataStart
	ld bc, wBoxDataEnd - wBoxDataStart
	rst _CopyData
	and a
	jp SAVGoodChecksum

LoadSAV2:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jp nz, SAVBadCheckSum
	ld hl, sPartyData
	ld de, wPartyDataStart
	ld bc, wPartyDataEnd - wPartyDataStart
	rst _CopyData
	ld hl, sMainData
	ld de, wPokedexOwned
	ld bc, wPokedexSeenEnd - wPokedexOwned
	rst _CopyData
	and a
	jp SAVGoodChecksum

SAVBadCheckSum:
	scf

SAVGoodChecksum:
	ld a, $0
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

LoadSAVIgnoreBadCheckSum:
; unused function that loads save data and ignores bad checksums
	call LoadSAV0
	call LoadSAV1
	jp LoadSAV2

; PureRGBnote: CHANGED: remove "now saving" text because saving is near-instant now.
SaveSAV:
	farcall PrintSaveScreenText
	ld hl, WouldYouLikeToSaveText
	call SaveSAVConfirm
	and a   ;|0 = Yes|1 = No|
	ret nz
	ld a, [wSaveFileStatus]
	dec a
	jr z, .save
	call SAVCheckRandomID
	jr z, .save
	ld hl, OlderFileWillBeErasedText
	call SaveSAVConfirm
	and a
	ret nz
.save
	call SaveSAVtoSRAM
	hlcoord 1, 13
	lb bc, 4, 18
	call ClearScreenArea
	hlcoord 1, 14
	ld hl, GameSavedText
	rst _PrintText
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, 10 ; PureRGBnote: CHANGED: reduce artificial save delay to 1/3 of original.
	jp DelayFrames

SaveSAVConfirm:
	rst _PrintText
	hlcoord 0, 7
	lb bc, 8, 1
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
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

SaveSAVtoSRAM0:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
;;;;;;;;;; PureRGBnote: ADDED: duplicates of options variables in SRAM. These are loaded on boot of the game for instant options-efficacy.
	ld a, [wOptions2]
	ld [sOptions2], a
	ld a, [wSpriteOptions]
	ld [sSpriteOptions], a
	ld a, [wSpriteOptions3]
	ld [sSpriteOptions3], a
;;;;;;;;;;
	ld hl, wPlayerName
	ld de, sPlayerName
	ld bc, NAME_LENGTH
	rst _CopyData
	ld hl, wMainDataStart
	ld de, sMainData
	ld bc, wMainDataEnd - wMainDataStart
	rst _CopyData
	ld hl, wSpriteDataStart
	ld de, sSpriteData
	ld bc, wSpriteDataEnd - wSpriteDataStart
	rst _CopyData
	ld hl, wBoxDataStart
	ld de, sCurBoxData
	ld bc, wBoxDataEnd - wBoxDataStart
	rst _CopyData
	ldh a, [hTileAnimations]
	ld [sTileAnimations], a
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM1:
; stored pokémon
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, wBoxDataStart
	ld de, sCurBoxData
	ld bc, wBoxDataEnd - wBoxDataStart
	rst _CopyData
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM2:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, wPartyDataStart
	ld de, sPartyData
	ld bc, wPartyDataEnd - wPartyDataStart
	rst _CopyData
	ld hl, wPokedexOwned ; pokédex only
	ld de, sMainData
	ld bc, wPokedexSeenEnd - wPokedexOwned
	rst _CopyData
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM::
	ld a, $2
	ld [wSaveFileStatus], a
	call SaveSAVtoSRAM0
	call SaveSAVtoSRAM1
	jp SaveSAVtoSRAM2
;TODO: batteryless save call goes here

SAVCheckSum:
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
	call SAVCheckSum
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
	and $7f
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

; PureRGBnote: CHANGED: a lot of this function was modified to have a more advanced change box menu
ChangeBox::
	CheckEvent EVENT_HIDE_CHANGE_BOX_SAVE_MSG
	ld a, [wd730]
	push af
	jr nz, .savePromptSkip
	res 6, a ; turn on letter printing delay so we don't get instant text
	ld [wd730], a 
	
	ld hl, WhenYouChangeBoxText
	rst _PrintText

	ld hl, YesNoSkip
	ld a, l
	ld [wListPointer], a
	ld a, h
	ld [wListPointer + 1], a
	xor a
	ld [wCurrentMenuItem], a
	ld a, A_BUTTON | B_BUTTON
	ld [wMenuWatchedKeys], a
	callfar DisplayMultiChoiceMenu
	ldh a, [hJoy5]
	bit BIT_B_BUTTON, a
	jr nz, .done
	ld a, [wCurrentMenuItem]
	and a
	jr z, .yes ; jump if yes was chosen
	cp 1
	jr z, .done ; return if no was chosen

	SetEvent EVENT_HIDE_CHANGE_BOX_SAVE_MSG ; set this flag if SKIP was chosen
	ld hl, SkippedForeverText
	rst _PrintText
.savePromptSkip
.yes
	set 6, a ; turn off letter printing delay so we get instant text
	ld [wd730], a
	ld hl, wCurrentBoxNum
	bit 7, [hl] ; is it the first time player is changing the box?
	call z, EmptyAllSRAMBoxes ; if so, empty all boxes in SRAM
	callfar DisplayChangeBoxMenu
	call UpdateSprites
	ld hl, hUILayoutFlags
	set 1, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res 1, [hl]
	bit BIT_B_BUTTON, a
	jr nz, .done
	call GetBoxSRAMLocation
	ld e, l
	ld d, h
	ld hl, wBoxDataStart
	call CopyBoxToOrFromSRAM ; copy old box from WRAM to SRAM
	ld a, [wCurrentMenuItem]
	set 7, a
	ld [wCurrentBoxNum], a
	call GetBoxSRAMLocation
	ld de, wBoxDataStart
	call CopyBoxToOrFromSRAM ; copy new box from SRAM to WRAM
	ld hl, wMapTextPtr
	ld de, wChangeBoxSavedMapTextPointer
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	call RestoreMapTextPointer
	call SaveSAVtoSRAM
	ld hl, wChangeBoxSavedMapTextPointer
	call SetMapTextPointer
	ld a, SFX_SAVE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
.done
	pop af
	ld [wd730], a
	ret

WhenYouChangeBoxText:
	text_far _WhenYouChangeBoxText
	text_end

SkippedForeverText:
	text_far _SkippedForever
	text_end

CopyBoxToOrFromSRAM:
; copy an entire box from hl to de with b as the SRAM bank
	push hl
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, b
	ld [MBC1SRamBank], a
	ld bc, wBoxDataEnd - wBoxDataStart
	rst _CopyData
	pop hl

; mark the memory that the box was copied from as am empty box
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, sBox1 ; sBox7
	ld bc, sBank2AllBoxesChecksum - sBox1
	call SAVCheckSum
	ld [sBank2AllBoxesChecksum], a ; sBank3AllBoxesChecksum
	call CalcIndividualBoxCheckSums
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

EmptyAllSRAMBoxes:
; marks all boxes in SRAM as empty (initialisation for the first time the
; player changes the box)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, 2
	ld [MBC1SRamBank], a
	call EmptySRAMBoxesInBank
	ld a, 3
	ld [MBC1SRamBank], a
	call EmptySRAMBoxesInBank
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
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
	call SAVCheckSum
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
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, $2
	ld [MBC1SRamBank], a
	call GetMonCountsForBoxesInBank
	ld a, $3
	ld [MBC1SRamBank], a
	call GetMonCountsForBoxesInBank
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	pop hl

; copy the count for the current box from WRAM
	ld a, [wCurrentBoxNum]
	and $7f
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

SAVCheckRandomID:
; checks if Sav file is the same by checking player's name 1st letter
; and the two random numbers generated at game beginning
; (which are stored at wPlayerID)s
	ld a, $0a
	ld [MBC1SRamEnable], a
	ld a, $01
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld a, [sPlayerName]
	and a
	jr z, .next
	ld hl, sGameData
	ld bc, sGameDataEnd - sGameData
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum]
	cp c
	jr nz, .next
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
	ld a, $00
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
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
;;;;;;;;;; PureRGBnote: ADDED: additional data in SRAM is needed to store what palettes each of the hall of fame pokemon have.
	call HallOfFame_Copy
	ld a, [wNumHoFTeams]
	dec a
	ld hl, sHallOfFamePalettes
	ld bc, 1
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wHallOfFamePalettes
	ld bc, 1
;;;;;;;;;;
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
	call HallOfFame_Copy
	ld hl, sHallOfFamePalettes + 1
	ld de, sHallOfFamePalettes
	ld bc, (HOF_TEAM_CAPACITY - 1)
	call HallOfFame_Copy
	ld hl, wHallOfFamePalettes
	ld de, sHallOfFamePalettes + (HOF_TEAM_CAPACITY - 1)
	ld bc, 1
	jr HallOfFame_Copy

LoadHallOfFameTeams:
	ld hl, sHallOfFame
	ld bc, HOF_TEAM
	ld a, [wHoFTeamIndex]
	call AddNTimes
	ld de, wHallOfFame
	ld bc, HOF_TEAM
;;;;;;;;;; PureRGBnote: ADDED: additional data in SRAM is needed to store what palettes each of the hall of fame pokemon have.
	call HallOfFame_Copy
	ld hl, sHallOfFamePalettes
	ld bc, 1
	ld a, [wHoFTeamIndex]
	call AddNTimes
	ld de, wHallOfFamePalettes
	ld bc, 1
;;;;;;;;;;
	; fallthrough

HallOfFame_Copy:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	xor a
	ld [MBC1SRamBank], a
	rst _CopyData
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

ClearSAV:
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	xor a
	call PadSRAM_FF
	ld a, $1
	call PadSRAM_FF
	ld a, $2
	call PadSRAM_FF
	ld a, $3
	call PadSRAM_FF
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

PadSRAM_FF:
	ld [MBC1SRamBank], a
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	ld a, $ff
	jp FillMemory
