AskName: ; 64eb (1:64eb)
	call SaveScreenTilesToBuffer1
	call GetPredefRegisters
	push hl
	ld a, [W_ISINBATTLE]
	dec a
	ld hl, wTileMap
	ld b, $4
	ld c, $b
	call z, ClearScreenArea ; only if in wild batle
	ld a, [wcf91]
	ld [wd11e], a
	call GetMonName
	ld hl, DoYouWantToNicknameText
	call PrintText
	hlCoord 14, 7
	ld bc, $80f
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID
	pop hl
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_654c
	ld a, [wUpdateSpritesEnabled]
	push af
	xor a
	ld [wUpdateSpritesEnabled], a
	push hl
	ld a, $2
	ld [wd07d], a
	call DisplayNamingScreen
	ld a, [W_ISINBATTLE]
	and a
	jr nz, .asm_653e
	call ReloadMapSpriteTilePatterns
.asm_653e
	call LoadScreenTilesFromBuffer1
	pop hl
	pop af
	ld [wUpdateSpritesEnabled], a
	ld a, [wcf4b]
	cp $50
	ret nz
.asm_654c
	ld d, h
	ld e, l
	ld hl, wcd6d
	ld bc, $000b
	jp CopyData

DoYouWantToNicknameText: ; 0x6557
	TX_FAR _DoYouWantToNicknameText
	db "@"

Func_655c: ; 655c (1:655c)
	ld hl, wHPBarMaxHP
	xor a
	ld [wUpdateSpritesEnabled], a
	ld a, $2
	ld [wd07d], a
	call DisplayNamingScreen
	call GBPalWhiteOutWithDelay3
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadGBPal
	ld a, [wcf4b]
	cp $50
	jr z, .asm_6594
	ld hl, wPartyMonNicks
	ld bc, $b
	ld a, [wWhichPokemon]
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wHPBarMaxHP
	ld bc, $b
	call CopyData
	and a
	ret
.asm_6594
	scf
	ret

DisplayNamingScreen: ; 6596 (1:6596)
	push hl
	ld hl, wd730
	set 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call UpdateSprites
	ld b, $8
	call GoPAL_SET
	call LoadHpBarAndStatusTilePatterns
	call LoadEDTile
	callba Func_7176c
	hlCoord 0, 4
	ld b, $9
	ld c, $12
	call TextBoxBorder
	call PrintNamingText
	ld a, $3
	ld [wTopMenuItemY], a
	ld a, $1
	ld [wTopMenuItemX], a
	ld [wLastMenuItem], a
	ld [wCurrentMenuItem], a
	ld a, $ff
	ld [wMenuWatchedKeys], a
	ld a, $7
	ld [wMaxMenuItem], a
	ld a, $50
	ld [wcf4b], a
	xor a
	ld hl, wHPBarMaxHP + 1
	ld [hli], a
	ld [hli], a
	ld [W_SUBANIMTRANSFORM], a
.asm_65ed
	call PrintAlphabet
	call GBPalNormal
.asm_65f3
	ld a, [wHPBarMaxHP + 1]
	and a
	jr nz, .asm_662d
	call Func_680e
.asm_65fc
	call PlaceMenuCursor
.asm_65ff
	ld a, [wCurrentMenuItem]
	push af
	callba AnimatePartyMon_ForceSpeed1
	pop af
	ld [wCurrentMenuItem], a
	call JoypadLowSensitivity
	ld a, [hJoyPressed]
	and a
	jr z, .asm_65ff
	ld hl, .unknownPointerTable_665e
.asm_661a
	sla a
	jr c, .asm_6624
	inc hl
	inc hl
	inc hl
	inc hl
	jr .asm_661a
.asm_6624
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	jp [hl]
.asm_662d
	pop de
	ld hl, wcf4b
	ld bc, $b
	call CopyData
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call ClearSprites
	call GoPAL_SET_CF1C
	call GBPalNormal
	xor a
	ld [W_SUBANIMTRANSFORM], a
	ld hl, wd730
	res 6, [hl]
	ld a, [W_ISINBATTLE]
	and a
	jp z, LoadTextBoxTilePatterns
	ld hl, LoadHudTilePatterns
	ld b, BANK(LoadHudTilePatterns)
	jp Bankswitch

.unknownPointerTable_665e: ; 665e (1:665e)
	dw .asm_65fc
	dw .asm_673e
	dw .asm_65fc
	dw .asm_672c
	dw .asm_65fc
	dw .asm_6718
	dw .asm_65fc
	dw .asm_6702
	dw .asm_65f3
	dw .asm_668c
	dw .asm_65ed
	dw .asm_6683
	dw .asm_65f3
	dw .deleteLetter
	dw .asm_65f3
	dw .asm_6692

.asm_667e
	pop de
	ld de, .asm_65ed ; $65ed
	push de
.asm_6683
	ld a, [wHPBarOldHP]
	xor $1
	ld [wHPBarOldHP], a
	ret
.asm_668c
	ld a, $1
	ld [wHPBarMaxHP + 1], a
	ret
.asm_6692
	ld a, [wCurrentMenuItem]
	cp $5
	jr nz, .asm_66a0
	ld a, [wTopMenuItemX]
	cp $11
	jr z, .asm_668c
.asm_66a0
	ld a, [wCurrentMenuItem]
	cp $6
	jr nz, .asm_66ae
	ld a, [wTopMenuItemX]
	cp $1
	jr z, .asm_667e
.asm_66ae
	ld hl, wMenuCursorLocation
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hl]
	ld [wHPBarNewHP], a
	call CalcStringLength
	ld a, [wHPBarNewHP]
	cp $e5
	ld de, Dakutens ; $6885
	jr z, .asm_66e3
	cp $e4
	ld de, Handakutens ; $68d6
	jr z, .asm_66e3
	ld a, [wd07d]
	cp $2
	jr nc, .checkMonNameLength
	ld a, [wHPBarMaxHP]
	cp $7 ; max length of player/rival names
	jr .checkNameLength
.checkMonNameLength
	ld a, [wHPBarMaxHP]
	cp $a ; max length of pokemon nicknames
.checkNameLength
	jr c, .addLetter
	ret
.asm_66e3
	push hl
	call Func_6871
	pop hl
	ret nc
	dec hl
.addLetter
	ld a, [wHPBarNewHP]
	ld [hli], a
	ld [hl], $50
	ld a, (SFX_02_40 - SFX_Headers_02) / 3
	call PlaySound
	ret
.deleteLetter
	ld a, [wHPBarMaxHP]
	and a
	ret z
	call CalcStringLength
	dec hl
	ld [hl], $50
	ret
.asm_6702
	ld a, [wCurrentMenuItem]
	cp $6
	ret z
	ld a, [wTopMenuItemX]
	cp $11
	jp z, .asm_6714
	inc a
	inc a
	jr .asm_6755
.asm_6714
	ld a, $1
	jr .asm_6755
.asm_6718
	ld a, [wCurrentMenuItem]
	cp $6
	ret z
	ld a, [wTopMenuItemX]
	dec a
	jp z, .asm_6728
	dec a
	jr .asm_6755
.asm_6728
	ld a, $11
	jr .asm_6755
.asm_672c
	ld a, [wCurrentMenuItem]
	dec a
	ld [wCurrentMenuItem], a
	and a
	ret nz
	ld a, $6
	ld [wCurrentMenuItem], a
	ld a, $1
	jr .asm_6755
.asm_673e
	ld a, [wCurrentMenuItem]
	inc a
	ld [wCurrentMenuItem], a
	cp $7
	jr nz, .asm_6750
	ld a, $1
	ld [wCurrentMenuItem], a
	jr .asm_6755
.asm_6750
	cp $6
	ret nz
	ld a, $1
.asm_6755
	ld [wTopMenuItemX], a
	jp EraseMenuCursor

LoadEDTile: ; 675b (1:675b)
	ld de, ED_Tile
	ld hl, vFont + $700
	ld bc, $1
	jp CopyVideoDataDouble

ED_Tile: ; 6767 (1:6767)
	INCBIN "gfx/ED_tile.1bpp"

PrintAlphabet: ; 676f (1:676f)
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, [wHPBarOldHP]
	and a
	ld de, LowerCaseAlphabet ; $679e
	jr nz, .asm_677e
	ld de, UpperCaseAlphabet ; $67d6
.asm_677e
	hlCoord 2, 5
	ld bc, $509
.asm_6784
	push bc
.asm_6785
	ld a, [de]
	ld [hli], a
	inc hl
	inc de
	dec c
	jr nz, .asm_6785
	ld bc, $16
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_6784
	call PlaceString
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	jp Delay3

LowerCaseAlphabet: ; 679e (1:679e)
	db "abcdefghijklmnopqrstuvwxyz ×():;[]",$e1,$e2,"-?!♂♀/",$f2,",¥UPPER CASE@"

UpperCaseAlphabet: ; 67d6 (1:67d6)
	db "ABCDEFGHIJKLMNOPQRSTUVWXYZ ×():;[]",$e1,$e2,"-?!♂♀/",$f2,",¥lower case@"

Func_680e: ; 680e (1:680e)
	call CalcStringLength
	ld a, c
	ld [wHPBarMaxHP], a
	hlCoord 10, 2
	ld bc, $10a
	call ClearScreenArea
	hlCoord 10, 2
	ld de, wcf4b
	call PlaceString
	hlCoord 10, 3
	ld a, [wd07d]
	cp $2
	jr nc, .asm_6835
	ld b, $7
	jr .asm_6837
.asm_6835
	ld b, $a
.asm_6837
	ld a, $76
.asm_6839
	ld [hli], a
	dec b
	jr nz, .asm_6839
	ld a, [wd07d]
	cp $2
	ld a, [wHPBarMaxHP]
	jr nc, .asm_684b
	cp $7
	jr .asm_684d
.asm_684b
	cp $a
.asm_684d
	jr nz, .asm_6867
	call EraseMenuCursor
	ld a, $11
	ld [wTopMenuItemX], a
	ld a, $5
	ld [wCurrentMenuItem], a
	ld a, [wd07d]
	cp $2
	ld a, $9
	jr nc, .asm_6867
	ld a, $6
.asm_6867
	ld c, a
	ld b, $0
	hlCoord 10, 3
	add hl, bc
	ld [hl], $77
	ret

Func_6871: ; 6871 (1:6871)
	push de
	call CalcStringLength
	dec hl
	ld a, [hl]
	pop hl
	ld de, $2
	call IsInArray
	ret nc
	inc hl
	ld a, [hl]
	ld [wHPBarNewHP], a
	ret

Dakutens: ; 6885 (1:6885)
	db "かが", "きぎ", "くぐ", "けげ", "こご"
	db "さざ", "しじ", "すず", "せぜ", "そぞ"
	db "ただ", "ちぢ", "つづ", "てで", "とど"
	db "はば", "ひび", "ふぶ", "へべ", "ほぼ"
	db "カガ", "キギ", "クグ", "ケゲ", "コゴ"
	db "サザ", "シジ", "スズ", "セゼ", "ソゾ"
	db "タダ", "チヂ", "ツヅ", "テデ", "トド"
	db "ハバ", "ヒビ", "フブ", "へべ", "ホボ"
	db $ff

Handakutens: ; 68d6 (1:68d6)
	db "はぱ", "ひぴ", "ふぷ", "へぺ", "ほぽ"
	db "ハパ", "ヒピ", "フプ", "へぺ", "ホポ"
	db $ff

; calculates the length of the string at wcf4b and stores it in c
CalcStringLength: ; 68eb (1:68eb)
	ld hl, wcf4b
	ld c, $0
.asm_68f0
	ld a, [hl]
	cp $50
	ret z
	inc hl
	inc c
	jr .asm_68f0

PrintNamingText: ; 68f8 (1:68f8)
	hlCoord 0, 1
	ld a, [wd07d]
	ld de, YourTextString
	and a
	jr z, .notNickname
	ld de, RivalsTextString
	dec a
	jr z, .notNickname
	ld a, [wcf91]
	ld [wcd5d], a
	push af
	callba Func_71882
	pop af
	ld [wd11e], a
	call GetMonName
	hlCoord 4, 1
	call PlaceString
	ld hl, $1
	add hl, bc
	ld [hl], $c9
	hlCoord 1, 3
	ld de, NicknameTextString
	jr .placeString
.notNickname
	call PlaceString
	ld l, c
	ld h, b
	ld de, NameTextString
.placeString
	jp PlaceString

YourTextString: ; 693f (1:693f)
	db "YOUR @"

RivalsTextString: ; 6945 (1:6945)
	db "RIVAL's @"

NameTextString: ; 694d (1:694d)
	db "NAME?@"

NicknameTextString: ; 6953 (1:6953)
	db "NICKNAME?@"
