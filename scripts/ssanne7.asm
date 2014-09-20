SSAnne7Script: ; 61895 (18:5895)
	call SSAnne7Script_6189b
	jp EnableAutoTextBoxDrawing

SSAnne7Script_6189b: ; 6189b (18:589b)
	ld a, [wd803]
	bit 1, a
	ret nz
	ld hl, wd72d
	set 5, [hl]
	ret

SSAnne7TextPointers: ; 618a7 (18:58a7)
	dw SSAnne7Text1
	dw SSAnne7Text2
	dw SSAnne7Text3

SSAnne7Text1: ; 618ad (18:58ad)
	db $08 ; asm
	ld a, [wd803]
	bit 0, a
	jr nz, .asm_797c4 ; 0x618b3
	ld hl, SSAnne7RubText
	call PrintText
	ld hl, ReceivingHM01Text
	call PrintText
	ld bc, (HM_01 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM01Text
	call PrintText
	ld hl, wd803
	set 0, [hl]
	jr .asm_0faf5 ; 0x618d4
.BagFull
	ld hl, HM01NoRoomText
	call PrintText
	ld hl, wd72d
	set 5, [hl]
	jr .asm_0faf5 ; 0x618e1
.asm_797c4 ; 0x618e3
	ld hl, SSAnne7Text_61932
	call PrintText
.asm_0faf5 ; 0x618e9
	jp TextScriptEnd

SSAnne7RubText: ; 618ec (18:58ec)
	TX_FAR _SSAnne7RubText
	db $8
	ld a, [wc0ef]
	cp $1f
	ld [wc0f0], a
	jr nz, .asm_61908 ; 0x618f9 $d
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld a, Bank(Func_9876)
	ld [wc0ef], a
.asm_61908
	ld a, MUSIC_PKMN_HEALED
	ld [wc0ee], a
	call PlaySound
.asm_61910
	ld a, [wc026]
	cp MUSIC_PKMN_HEALED
	jr z, .asm_61910 ; 0x61915 $f9
	call PlayDefaultMusic
	ld hl, wd803
	set 1, [hl]
	ld hl, wd72d
	res 5, [hl]
	jp TextScriptEnd

ReceivingHM01Text: ; 61927 (18:5927)
	TX_FAR _ReceivingHM01Text
	db "@"

ReceivedHM01Text: ; 6192c (18:592c)
	TX_FAR _ReceivedHM01Text
	db $11, "@"

SSAnne7Text_61932: ; 61932 (18:5932)
	TX_FAR _SSAnne7Text_61932
	db "@"

HM01NoRoomText: ; 61937 (18:5937)
	TX_FAR _HM01NoRoomText
	db "@"

SSAnne7Text2: ; 6193c (18:593c)
	TX_FAR _SSAnne7Text2
	db "@"

SSAnne7Text3: ; 61941 (18:5941)
	TX_FAR _SSAnne7Text3
	db "@"
