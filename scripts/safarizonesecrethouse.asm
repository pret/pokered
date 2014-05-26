SafariZoneSecretHouseScript: ; 4a317 (12:6317)
	jp EnableAutoTextBoxDrawing

SafariZoneSecretHouseTextPointers: ; 4a31a (12:631a)
	dw SafariZoneSecretHouseText1

SafariZoneSecretHouseText1: ; 4a31c (12:631c)
	db $08 ; asm
	ld a, [wd857]
	bit 0, a
	jr nz, .asm_20a9b ; 0x4a322
	ld hl, SafariZoneSecretHouseText_4a350
	call PrintText
	ld bc, (HM_03 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM03Text
	call PrintText
	ld hl, wd857
	set 0, [hl]
	jr .asm_8f1fc ; 0x4a33d
.BagFull
	ld hl, HM03NoRoomText
	call PrintText
	jr .asm_8f1fc ; 0x4a345
.asm_20a9b ; 0x4a347
	ld hl, HM03ExplanationText
	call PrintText
.asm_8f1fc ; 0x4a34d
	jp TextScriptEnd

SafariZoneSecretHouseText_4a350: ; 4a350 (12:6350)
	TX_FAR _SecretHouseText_4a350
	db "@"

ReceivedHM03Text: ; 4a355 (12:6355)
	TX_FAR _ReceivedHM03Text
	db $0B, "@"

HM03ExplanationText: ; 4a35b (12:635b)
	TX_FAR _HM03ExplanationText
	db "@"

HM03NoRoomText: ; 4a360 (12:6360)
	TX_FAR _HM03NoRoomText
	db "@"
