SSAnne7Script: ; 61895 (18:5895)
	call SSAnne7Script_6189b
	jp EnableAutoTextBoxDrawing

SSAnne7Script_6189b: ; 6189b (18:589b)
	CheckEvent EVENT_RUBBED_CAPTAINS_BACK
	ret nz
	ld hl, wd72d
	set 5, [hl]
	ret

SSAnne7TextPointers: ; 618a7 (18:58a7)
	dw SSAnne7Text1
	dw SSAnne7Text2
	dw SSAnne7Text3

SSAnne7Text1: ; 618ad (18:58ad)
	TX_ASM
	CheckEvent EVENT_GOT_HM01
	jr nz, .asm_797c4
	ld hl, SSAnne7RubText
	call PrintText
	ld hl, ReceivingHM01Text
	call PrintText
	lb bc, HM_01, 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM01Text
	call PrintText
	SetEvent EVENT_GOT_HM01
	jr .asm_0faf5
.BagFull
	ld hl, HM01NoRoomText
	call PrintText
	ld hl, wd72d
	set 5, [hl]
	jr .asm_0faf5
.asm_797c4
	ld hl, SSAnne7Text_61932
	call PrintText
.asm_0faf5
	jp TextScriptEnd

SSAnne7RubText: ; 618ec (18:58ec)
	TX_FAR _SSAnne7RubText
	TX_ASM
	ld a, [wc0ef]
	cp BANK(Audio3_UpdateMusic)
	ld [wc0f0], a
	jr nz, .asm_61908
	ld a, $ff
	ld [wc0ee], a
	call PlaySound
	ld a, Bank(Music_PkmnHealed)
	ld [wc0ef], a
.asm_61908
	ld a, MUSIC_PKMN_HEALED
	ld [wc0ee], a
	call PlaySound
.asm_61910
	ld a, [wc026]
	cp MUSIC_PKMN_HEALED
	jr z, .asm_61910
	call PlayDefaultMusic
	SetEvent EVENT_RUBBED_CAPTAINS_BACK
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
