FuchsiaHouse2Script: ; 750b5 (1d:50b5)
	jp EnableAutoTextBoxDrawing

FuchsiaHouse2TextPointers: ; 750b8 (1d:50b8)
	dw FuchsiaHouse2Text1
	dw Predef5CText
	dw BoulderText
	dw FuchsiaHouse2Text4
	dw FuchsiaHouse2Text5

FuchsiaHouse2Text1: ; 750c2 (1d:50c2)
	db $08 ; asm
	ld a, [wd78e]
	bit 0, a
	jr nz, .subtract ; 0x750c8
	ld b,GOLD_TEETH
	call IsItemInBag
	jr nz, .asm_3f30f ; 0x750cf
	ld a, [wd78e]
	bit 1, a
	jr nz, .asm_60cba ; 0x750d6
	ld hl, WardenGibberishText1
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, WardenGibberishText3
	jr nz, .asm_61238 ; 0x750e8
	ld hl, WardenGibberishText2
.asm_61238 ; 0x750ed
	call PrintText
	jr .asm_52039 ; 0x750f0
.asm_3f30f ; 0x750f2
	ld hl, WardenTeethText1
	call PrintText
	ld a, GOLD_TEETH
	ldh [$db], a
	callba RemoveItemByID
	ld hl, wd78e
	set 1, [hl]
.asm_60cba ; 0x75109
	ld hl, WardenThankYouText
	call PrintText
	ld bc,(HM_04 << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedHM04Text
	call PrintText
	ld hl, wd78e
	set 0, [hl]
	jr .asm_52039 ; 0x75122
.subtract ; 0x75124
	ld hl, HM04ExplanationText
	call PrintText
	jr .asm_52039 ; 0x7512a
.BagFull
	ld hl, HM04NoRoomText
	call PrintText
.asm_52039 ; 0x75132
	jp TextScriptEnd

WardenGibberishText1: ; 75135 (1d:5135)
	TX_FAR _WardenGibberishText1
	db "@"

WardenGibberishText2: ; 7513a (1d:513a)
	TX_FAR _WardenGibberishText2
	db "@"

WardenGibberishText3: ; 7513f (1d:513f)
	TX_FAR _WardenGibberishText3
	db "@"

WardenTeethText1: ; 75144 (1d:5144)
	TX_FAR _WardenTeethText1
	db $0b

WardenTeethText2: ; 75149 (1d:5149)
	TX_FAR _WardenTeethText2
	db "@"

WardenThankYouText: ; 7514e (1d:514e)
	TX_FAR _WardenThankYouText
	db "@"

ReceivedHM04Text: ; 75153 (1d:5153)
	TX_FAR _ReceivedHM04Text
	db $0B, "@"

HM04ExplanationText: ; 75159 (1d:5159)
	TX_FAR _HM04ExplanationText
	db "@"

HM04NoRoomText: ; 7515e (1d:515e)
	TX_FAR _HM04NoRoomText
	db "@"

FuchsiaHouse2Text5: ; 75163 (1d:5163)
FuchsiaHouse2Text4: ; 75163 (1d:5163)
	db $08 ; asm
	ldh a, [$8c]
	cp $4
	ld hl, FuchsiaHouse2Text_7517b
	jr nz, .asm_4c9a2 ; 0x7516b
	ld hl, FuchsiaHouse2Text_75176
.asm_4c9a2 ; 0x75170
	call PrintText
	jp TextScriptEnd

FuchsiaHouse2Text_75176: ; 75176 (1d:5176)
	TX_FAR _FuchsiaHouse2Text_75176
	db "@"

FuchsiaHouse2Text_7517b: ; 7517b (1d:517b)
	TX_FAR _FuchsiaHouse2Text_7517b
	db "@"
