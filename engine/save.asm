LoadSAV: ; 735e8 (1c:75e8)
;(if carry -> write
;"the file data is destroyed")
	call ClearScreen
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	call LoadSAVCheckSum
	jr c, .badsum
	call LoadSAVCheckSum1
	jr c, .badsum
	call LoadSAVCheckSum2
	jr c, .badsum
	ld a, $2 ; good checksum
	jr .goodsum
.badsum
	ld hl, wd730
	push hl
	set 6, [hl]
	ld hl, FileDataDestroyedText
	call PrintText
	ld c, 100
	call DelayFrames
	pop hl
	res 6, [hl]
	ld a, $1 ; bad checksum
.goodsum
	ld [wd088], a ; checksum flag
	ret

FileDataDestroyedText: ; 7361e (1c:761e)
	TX_FAR _FileDataDestroyedText
	db "@"

LoadSAVCheckSum: ; 73623 (1c:7623)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, sPlayerName ; hero name located in SRAM
	ld bc, sMainDataCheckSum - sPlayerName ; but here checks the full SAV
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum] ; SAV's checksum
	cp c
	jp z, .Func_73652
	ld hl, sPlayerName
	ld bc, sMainDataCheckSum - sPlayerName
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum] ; SAV's checksum
	cp c
	jp nz, SAVBadCheckSum

.Func_73652 ; 73652 (1c:7652)
	ld hl, sPlayerName
	ld de, wPlayerName
	ld bc, 11
	call CopyData
	ld hl, sMainData
	ld de, wPokedexOwned
	ld bc, sSpriteData - sMainData
	call CopyData
	ld hl, W_CURMAPTILESET
	set 7, [hl]
	ld hl, sSpriteData
	ld de, wSpriteStateData1
	ld bc, sPartyData - sSpriteData
	call CopyData
	ld a, [sTilesetType]
	ld [hTilesetType], a
	ld hl, sCurBoxData
	ld de, W_NUMINBOX
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call CopyData
	and a
	jp SAVGoodChecksum

LoadSAVCheckSum1: ; 73690 (1c:7690)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, sPlayerName ; hero name located in SRAM
	ld bc, sMainDataCheckSum - sPlayerName  ; but here checks the full SAV
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum] ; SAV's checksum
	cp c
	jr nz, SAVBadCheckSum
	ld hl, sCurBoxData
	ld de, W_NUMINBOX
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call CopyData
	and a
	jp SAVGoodChecksum

LoadSAVCheckSum2: ; 736bd (1c:76bd)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, sPlayerName ; hero name located in SRAM
	ld bc, sMainDataCheckSum - sPlayerName  ; but here checks the full SAV
	call SAVCheckSum
	ld c, a
	ld a, [sMainDataCheckSum] ; SAV's checksum
	cp c
	jp nz, SAVBadCheckSum
	ld hl, sPartyData
	ld de, wPartyCount
	ld bc, wPokedexOwned - wPartyCount
	call CopyData
	ld hl, sMainData
	ld de, wPokedexOwned
	ld bc, wPokedexSeenEnd - wPokedexOwned
	call CopyData
	and a
	jp SAVGoodChecksum

SAVBadCheckSum: ; 736f7 (1c:76f7)
	scf

SAVGoodChecksum: ; 736f8 (1c:76f8)
	ld a, $0
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

Func_73701: ; 73701 (1c:7701)
	call LoadSAVCheckSum
	call LoadSAVCheckSum1
	jp LoadSAVCheckSum2

SaveSAV: ; 7370a (1c:770a)
	callba PrintSaveScreenText
	ld hl,WouldYouLikeToSaveText
	call SaveSAVConfirm
	and a   ;|0 = Yes|1 = No|
	ret nz
	ld a,[wd088]
	dec a
	jr z,.save
	call SAVCheckRandomID
	jr z,.save
	ld hl,OlderFileWillBeErasedText
	call SaveSAVConfirm
	and a
	ret nz
.save
	call SaveSAVtoSRAM
	coord hl, 1, 13
	ld bc,$0412
	call ClearScreenArea ; clear area 4x12 starting at 13,1
	coord hl, 1, 14
	ld de,NowSavingString
	call PlaceString
	ld c,120
	call DelayFrames
	ld hl,GameSavedText
	call PrintText
	ld a, (SFX_02_5d - SFX_Headers_02) / 3 ;sound for saved game
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c,30
	jp DelayFrames

NowSavingString:
	db "Now saving...@"

SaveSAVConfirm: ; 73768 (1c:7768)
	call PrintText
	coord hl, 0, 7
	ld bc,$0801
	ld a,TWO_OPTION_MENU
	ld [wTextBoxID],a
	call DisplayTextBoxID ; yes/no menu
	ld a,[wCurrentMenuItem]
	ret

WouldYouLikeToSaveText: ; 0x7377d
	TX_FAR _WouldYouLikeToSaveText
	db "@"

GameSavedText: ; 73782 (1c:7782)
	TX_FAR _GameSavedText
	db "@"

OlderFileWillBeErasedText: ; 73787 (1c:7787)
	TX_FAR _OlderFileWillBeErasedText
	db "@"

SaveSAVtoSRAM0: ; 7378c (1c:778c)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, wPlayerName
	ld de, sPlayerName
	ld bc, 11
	call CopyData
	ld hl, wPokedexOwned
	ld de, sMainData
	ld bc, W_NUMINBOX - wPokedexOwned
	call CopyData
	ld hl, wSpriteStateData1
	ld de, sSpriteData
	ld bc, sPartyData - sSpriteData
	call CopyData
	ld hl, W_NUMINBOX
	ld de, sCurBoxData
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call CopyData
	ld a, [hTilesetType]
	ld [sTilesetType], a
	ld hl, sPlayerName
	ld bc, sMainDataCheckSum - sPlayerName
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM1: ; 737e2 (1c:77e2)
; stored pokémon
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, W_NUMINBOX
	ld de, sCurBoxData
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call CopyData
	ld hl, sPlayerName
	ld bc, sMainDataCheckSum - sPlayerName
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM2: ; 7380f (1c:780f)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamBank], a
	ld hl, wPartyCount
	ld de, sPartyData
	ld bc, wPokedexOwned - wPartyCount
	call CopyData
	ld hl, wPokedexOwned ; pokédex only
	ld de, sMainData
	ld bc, wPokedexSeenEnd - wPokedexOwned
	call CopyData
	ld hl, sPlayerName
	ld bc, sMainDataCheckSum - sPlayerName
	call SAVCheckSum
	ld [sMainDataCheckSum], a
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

SaveSAVtoSRAM: ; 73848 (1c:7848)
	ld a, $2
	ld [wd088], a
	call SaveSAVtoSRAM0
	call SaveSAVtoSRAM1
	jp SaveSAVtoSRAM2

SAVCheckSum: ; 73856 (1c:7856)
;Check Sum (result[1 byte] is complemented)
	ld d, $0
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

Func_73863: ; 73863 (1c:7863)
	ld hl, sBox1 ; sBox7
	ld de, sBoxes1CheckSum2 ; sBoxes2CheckSum2
	ld b, NUM_BOXES / 2
.asm_7386b
	push bc
	push de
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call SAVCheckSum
	pop de
	ld [de], a
	inc de
	pop bc
	dec b
	jr nz, .asm_7386b
	ret

Func_7387b: ; 7387b (1c:787b)
	ld hl, PointerTable_73895
	ld a, [wCurrentBoxNum]
	and $7f
	cp NUM_BOXES / 2
	ld b, $2
	jr c, .asm_7388c
	inc b
	sub NUM_BOXES / 2
.asm_7388c
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

PointerTable_73895: ; 73895 (1c:7895)
	dw sBox1 ; sBox7
	dw sBox2 ; sBox8
	dw sBox3 ; sBox9
	dw sBox4 ; sBox10
	dw sBox5 ; sBox11
	dw sBox6 ; sBox12

ChangeBox:: ; 738a1 (1c:78a1)
	ld hl, WhenYouChangeBoxText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz ; return if No was chosen
	ld hl, wCurrentBoxNum
	bit 7, [hl]
	call z, Func_73a29
	call Func_7393f
	call UpdateSprites
	ld hl, hFlags_0xFFF6
	set 1, [hl]
	call HandleMenuInput
	ld hl, hFlags_0xFFF6
	res 1, [hl]
	bit 1, a
	ret nz
	call Func_7387b
	ld e, l
	ld d, h
	ld hl, W_NUMINBOX
	call Func_7390e
	ld a, [wCurrentMenuItem]
	set 7, a
	ld [wCurrentBoxNum], a
	call Func_7387b
	ld de, W_NUMINBOX
	call Func_7390e
	ld hl, W_MAPTEXTPTR
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
	ld a, (SFX_02_5d - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ret

WhenYouChangeBoxText: ; 73909 (1c:7909)
	TX_FAR _WhenYouChangeBoxText
	db "@"

Func_7390e: ; 7390e (1c:790e)
	push hl
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, b
	ld [MBC1SRamBank], a
	ld bc, wBoxMonNicksEnd - W_NUMINBOX
	call CopyData
	pop hl
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ld hl, sBox1 ; sBox7
	ld bc, sBoxes1CheckSum - sBox1
	call SAVCheckSum
	ld [sBoxes1CheckSum], a ; sBoxes2CheckSum
	call Func_73863
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

Func_7393f: ; 7393f (1c:793f)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a
	ld a, $3
	ld [wMenuWatchedKeys], a
	ld a, $b
	ld [wMaxMenuItem], a
	ld a, $1
	ld [wTopMenuItemY], a
	ld a, $c
	ld [wTopMenuItemX], a
	xor a
	ld [wMenuWatchMovingOutOfBounds], a
	ld a, [wCurrentBoxNum]
	and $7f
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	coord hl, 0, 0
	ld b, $2
	ld c, $9
	call TextBoxBorder
	ld hl, ChooseABoxText
	call PrintText
	coord hl, 11, 0
	ld b, $c
	ld c, $7
	call TextBoxBorder
	ld hl, hFlags_0xFFF6
	set 2, [hl]
	ld de, BoxNames
	coord hl, 13, 1
	call PlaceString
	ld hl, hFlags_0xFFF6
	res 2, [hl]
	ld a, [wCurrentBoxNum]
	and $7f
	cp 9
	jr c, .asm_739a6
	sub 9
	coord hl, 8, 2
	ld [hl], "1"
	add "0"
	jr .asm_739a8
.asm_739a6
	add "1"
.asm_739a8
	Coorda 9, 2
	coord hl, 1, 2
	ld de, BoxNoText
	call PlaceString
	call Func_73a84
	coord hl, 18, 1
	ld de, wWhichTrade
	ld bc, SCREEN_WIDTH
	ld a, $c
.asm_739c2
	push af
	ld a, [de]
	and a
	jr z, .asm_739c9
	ld [hl], $78
.asm_739c9
	add hl, bc
	inc de
	pop af
	dec a
	jr nz, .asm_739c2
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a
	ret

ChooseABoxText: ; 739d4 (1c:79d4)
	TX_FAR _ChooseABoxText
	db "@"

BoxNames: ; 739d9 (1c:79d9)
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

BoxNoText: ; 73a21 (1c:7a21)
	db "BOX No.@"

Func_73a29: ; 73a29 (1c:7a29)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, $2
	ld [MBC1SRamBank], a
	call Func_73a4b
	ld a, $3
	ld [MBC1SRamBank], a
	call Func_73a4b
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

Func_73a4b: ; 73a4b (1c:7a4b)
	ld hl, sBox1 ; sBox7
	call Func_73a7f
	ld hl, sBox2 ; sBox8
	call Func_73a7f
	ld hl, sBox3 ; sBox9
	call Func_73a7f
	ld hl, sBox4 ; sBox10
	call Func_73a7f
	ld hl, sBox5 ; sBox11
	call Func_73a7f
	ld hl, sBox6 ; sBox12
	call Func_73a7f
	ld hl, sBox1 ; sBox7
	ld bc, sBoxes1CheckSum - sBox1
	call SAVCheckSum
	ld [sBoxes1CheckSum], a ; sBoxes2CheckSum
	call Func_73863
	ret

Func_73a7f: ; 73a7f (1c:7a7f)
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

Func_73a84: ; 73a84 (1c:7a84)
	ld hl, wWhichTrade
	push hl
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	ld a, $2
	ld [MBC1SRamBank], a
	call Func_73ab8
	ld a, $3
	ld [MBC1SRamBank], a
	call Func_73ab8
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	pop hl
	ld a, [wCurrentBoxNum]
	and $7f
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [W_NUMINBOX]
	ld [hl], a
	ret

Func_73ab8: ; 73ab8 (1c:7ab8)
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

SAVCheckRandomID: ; 73ad1 (1c:7ad1)
;checks if Sav file is the same by checking player's name 1st letter ($a598)
; and the two random numbers generated at game beginning
;(which are stored at wPlayerID)s
	ld a,$0a
	ld [MBC1SRamEnable],a
	ld a,$01
	ld [MBC1SRamBankingMode],a
	ld [MBC1SRamBank],a
	ld a,[sPlayerName]
	and a
	jr z,.next
	ld hl,sPlayerName
	ld bc, sMainDataCheckSum - sPlayerName
	call SAVCheckSum
	ld c,a
	ld a,[sMainDataCheckSum]
	cp c
	jr nz,.next
	ld hl,sMainData + 98 ; player ID
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld a,[wPlayerID]
	cp l
	jr nz,.next
	ld a,[wPlayerID + 1]
	cp h
.next
	ld a,$00
	ld [MBC1SRamBankingMode],a
	ld [MBC1SRamEnable],a
	ret

SaveHallOfFameTeams: ; 73b0d (1c:7b0d)
	ld a, [wNumHoFTeams]
	dec a
	cp HOF_TEAM_CAPACITY
	jr nc, .asm_73b28
	ld hl, sHallOfFame
	ld bc, HOF_TEAM
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wcc5b
	ld bc, HOF_TEAM
	jr HallOfFame_Copy

.asm_73b28
	ld hl, sHallOfFame + HOF_TEAM
	ld de, sHallOfFame
	ld bc, HOF_TEAM * (HOF_TEAM_CAPACITY - 1)
	call HallOfFame_Copy
	ld hl, wcc5b
	ld de, sHallOfFame + HOF_TEAM * (HOF_TEAM_CAPACITY - 1)
	ld bc, HOF_TEAM
	jr HallOfFame_Copy

LoadHallOfFameTeams: ; 73b3f (1c:7b3f)
	ld hl, sHallOfFame
	ld bc, HOF_TEAM
	ld a, [wWhichTrade]
	call AddNTimes
	ld de, wcc5b
	ld bc, HOF_TEAM
	; fallthrough

HallOfFame_Copy: ; 73b51 (1c:7b51)
	ld a, SRAM_ENABLE
	ld [MBC1SRamEnable], a
	ld a, $1
	ld [MBC1SRamBankingMode], a
	xor a
	ld [MBC1SRamBank], a
	call CopyData
	xor a
	ld [MBC1SRamBankingMode], a
	ld [MBC1SRamEnable], a
	ret

ClearSAV: ; 73b6a (1c:7b6a)
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

PadSRAM_FF: ; 73b8f (1c:7b8f)
	ld [MBC1SRamBank], a
	ld hl, $a000
	ld bc, $2000
	ld a, $ff
	jp FillMemory
