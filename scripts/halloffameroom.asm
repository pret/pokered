HallofFameRoomScript: ; 5a49e (16:649e)
	call EnableAutoTextBoxDrawing
	ld hl, HallofFameRoomScriptPointers
	ld a, [W_HALLOFFAMEROOMCURSCRIPT]
	jp CallFunctionInTable

HallofFameRoomScript_5a4aa: ; 5a4aa (16:64aa)
	xor a
	ld [wJoyIgnore], a
	ld [W_HALLOFFAMEROOMCURSCRIPT], a
	ret

HallofFameRoomScriptPointers: ; 5a4b2 (16:64b2)
	dw HallofFameRoomScript0
	dw HallofFameRoomScript1
	dw HallofFameRoomScript2
	dw HallofFameRoomScript3

HallofFameRoomScript3: ; 5a4ba (16:64ba)
	ret

HallofFameRoomScript2: ; 5a4bb (16:64bb)
	call Delay3
	ld a, [$d358]
	push af
	xor a
	ld [wJoyIgnore], a
	ld a, $55
	call Predef
	pop af
	ld [$d358], a
	ld hl, W_FLAGS_D733
	res 1, [hl]
	inc hl
	set 0, [hl]
	xor a
	ld hl, W_LORELEICURSCRIPT
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [W_LANCECURSCRIPT], a
	ld [W_HALLOFFAMEROOMCURSCRIPT], a
	ld hl, $d863
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	xor a
	ld [W_HALLOFFAMEROOMCURSCRIPT], a
	ld a, PALLET_TOWN
	ld [wLastBlackoutMap], a
	callba SaveSAVtoSRAM
	ld b, 5
.asm_5a4ff
	ld c, 600 / 5
	call DelayFrames
	dec b
	jr nz, .asm_5a4ff ; 0x5a505 $f8
	call WaitForTextScrollButtonPress
	jp Init

HallofFameRoomScript0: ; 5a50d (16:650d)
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, $ccd3
	ld de, RLEMovement5a528
	call DecodeRLEList
	dec a
	ld [$cd38], a
	call Func_3486
	ld a, $1
	ld [W_HALLOFFAMEROOMCURSCRIPT], a
	ret

RLEMovement5a528: ; 5a528 (16:6528)
	db $40,$5
	db $ff

HallofFameRoomScript1: ; 5a52b (16:652b)
	ld a, [$cd38]
	and a
	ret nz
	ld a, $1
	ld [$d528], a
	ld a, $1
	ld [$ff8c], a
	call SetSpriteMovementBytesToFF
	ld a, $8
	ld [$ff8d], a
	call Func_34a6
	call Delay3
	xor a
	ld [wJoyIgnore], a
	inc a
	ld [$d528], a
	ld a, $1
	ld [$ff8c], a
	call DisplayTextID
	ld a, $ff
	ld [wJoyIgnore], a
	ld a, $8
	ld [$cc4d], a
	ld a, $11
	call Predef
	ld a, $2
	ld [W_HALLOFFAMEROOMCURSCRIPT], a
	ret

HallofFameRoomTextPointers: ; 5a56a (16:656a)
	dw HallofFameRoomText1

HallofFameRoomText1: ; 5a56c (16:656c)
	TX_FAR _HallofFameRoomText1
	db "@"
