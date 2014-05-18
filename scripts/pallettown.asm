PalletTownScript: ; 18e5b (6:4e5b)
	ld a,[$D74B]
	bit 4,a
	jr z,.next
	ld hl,$D747
	set 6,[hl]
.next
	call EnableAutoTextBoxDrawing
	ld hl,PalletTownScriptPointers
	ld a,[W_PALLETTOWNCURSCRIPT]
	jp CallFunctionInTable

PalletTownScriptPointers: ; 18e73 (6:4e73)
	dw PalletTownScript0
	dw PalletTownScript1
	dw PalletTownScript2
	dw PalletTownScript3
	dw PalletTownScript4
	dw PalletTownScript5
	dw PalletTownScript6

PalletTownScript0: ; 18e81 (6:4e81)
	ld a,[$D747]
	bit 0,a
	ret nz
	ld a,[W_YCOORD]
	cp 1 ; is player near north exit?
	ret nz
	xor a
	ld [H_CURRENTPRESSEDBUTTONS],a
	ld a,4
	ld [$D528],a
	ld a,$FF
	call PlaySound ; stop music
	ld a, BANK(Music_MeetProfOak)
	ld c,a ; song bank
	ld a, MUSIC_MEET_PROF_OAK ; “oak appears” music
	call PlayMusic ; plays music
	ld a,$FC
	ld [wJoypadForbiddenButtonsMask],a
	ld hl,$D74B
	set 7,[hl]

	; trigger the next script
	ld a,1
	ld [W_PALLETTOWNCURSCRIPT],a
	ret

PalletTownScript1: ; 18eb2 (6:4eb2)
	xor a
	ld [$CF0D],a
	ld a,1
	ld [$FF8C],a
	call DisplayTextID
	ld a,$FF
	ld [wJoypadForbiddenButtonsMask],a
	ld a,0
	ld [$CC4D],a
	ld a,$15
	call Predef

	; trigger the next script
	ld a,2
	ld [W_PALLETTOWNCURSCRIPT],a
	ret

PalletTownScript2: ; 18ed2 (6:4ed2)
	ld a,1
	ld [$FF8C],a
	ld a,4
	ld [$FF8D],a
	call Func_34a6
	call Delay3
	ld a,1
	ld [W_YCOORD],a
	ld a,1
	ld [$FF9B],a
	ld a,1
	swap a
	ld [$FF95],a
	ld a,$22
	call Predef
	ld hl,$FF95
	dec [hl]
	ld a,$20
	call Predef ; load Oak’s movement into $CC97
	ld de,$CC97
	ld a,1 ; oak
	ld [$FF8C],a
	call MoveSprite
	ld a,$FF
	ld [wJoypadForbiddenButtonsMask],a

	; trigger the next script
	ld a,3
	ld [W_PALLETTOWNCURSCRIPT],a
	ret

PalletTownScript3: ; 18f12 (6:4f12)
	ld a,[$D730]
	bit 0,a
	ret nz
	xor a
	ld [$C109],a
	ld a,1
	ld [$CF0D],a
	ld a,$FC
	ld [wJoypadForbiddenButtonsMask],a
	ld a,1
	ld [$FF8C],a
	call DisplayTextID
	ld a,$FF
	ld [wJoypadForbiddenButtonsMask],a
	ld a,1
	ld [$CF13],a
	xor a
	ld [$CF10],a
	ld a,1
	ld [$CC57],a
	ld a,[H_LOADEDROMBANK]
	ld [$CC58],a

	; trigger the next script
	ld a,4
	ld [W_PALLETTOWNCURSCRIPT],a
	ret

PalletTownScript4: ; 18f4b (6:4f4b)
	ld a,[$CC57]
	and a
	ret nz

	; trigger the next script
	ld a,5
	ld [W_PALLETTOWNCURSCRIPT],a
	ret

PalletTownScript5: ; 18f56 (6:4f56)
	ld a,[$D74A]
	bit 2,a
	jr nz,.next
	and 3
	cp 3
	jr nz,.next
	ld hl,$D74A
	set 2,[hl]
	ld a,$27
	ld [$CC4D],a
	ld a,$11
	call Predef
	ld a,$28
	ld [$CC4D],a
	ld a,$15
	jp Predef
.next
	ld a,[$D74B]
	bit 4,a
	ret z
	ld hl,$D74B
	set 6,[hl]
PalletTownScript6: ; 18f87 (6:4f87)
	ret

PalletTownTextPointers: ; 18f88 (6:4f88)
	dw PalletTownText1
	dw PalletTownText2
	dw PalletTownText3
	dw PalletTownText4
	dw PalletTownText5
	dw PalletTownText6
	dw PalletTownText7

PalletTownText1: ; 18f96 (6:4f96)
	db 8
	ld a,[$CF0D]
	and a
	jr nz,.next
	ld a,1
	ld [$CC3C],a
	ld hl,OakAppearsText
	jr .done
.next
	ld hl,OakWalksUpText
.done
	call PrintText
	jp TextScriptEnd

OakAppearsText: ; 18fb0 (6:4fb0)
	TX_FAR _OakAppearsText
	db 8
	ld c,10
	call DelayFrames
	xor a
	ld [$CD4F],a
	ld [$CD50],a
	ld a,$4C
	call Predef ; display ! over head
	ld a,4
	ld [$D528],a
	jp TextScriptEnd

OakWalksUpText: ; 18fce (6:4fce)
	TX_FAR _OakWalksUpText
	db "@"

PalletTownText2: ; 0x18fd3 girl
	TX_FAR _PalletTownText2
	db "@"

PalletTownText3: ; 0x18fd8 fat man
	TX_FAR _PalletTownText3
	db "@"

PalletTownText4: ; 0x18fdd sign by lab
	TX_FAR _PalletTownText4
	db "@"

PalletTownText5: ; 0x18fe2 sign by fence
	TX_FAR _PalletTownText5
	db "@"

PalletTownText6: ; 0x18fe7 sign by Red’s house
	TX_FAR _PalletTownText6
	db "@"

PalletTownText7: ; 0x18fec sign by Blue’s house
	TX_FAR _PalletTownText7
	db "@"
