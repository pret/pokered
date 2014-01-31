MuseumF1Script: ; 5c0f7 (17:40f7)
	ld a, $1
	ld [$cf0c], a
	xor a
	ld [$cc3c], a
	ld hl, MuseumF1ScriptPointers
	ld a, [W_MUSEUMF1CURSCRIPT]
	jp CallFunctionInTable

MuseumF1ScriptPointers: ; 5c109 (17:4109)
	dw MuseumF1Script0
	dw MuseumF1Script1

MuseumF1Script0: ; 5c10d (17:410d)
	ld a, [$d361]
	cp $4
	ret nz
	ld a, [$d362]
	cp $9
	jr z, .asm_5c120 ; 0x5c118 $6
	ld a, [$d362]
	cp $a
	ret nz
.asm_5c120
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld a, $1
	ld [$ff00+$8c], a
	jp DisplayTextID

MuseumF1Script1: ; 5c12a (17:412a)
	ret

MuseumF1TextPointers: ; 5c12b (17:412b)
	dw MuseumF1Text1
	dw MuseumF1Text2
	dw MuseumF1Text3
	dw MuseumF1Text4
	dw MuseumF1Text5

MuseumF1Text1: ; 5c135 (17:4135)
	db $8
	ld a, [$d361]
	cp $4
	jr nz, asm_8774b ; 0x5c13b $a
	ld a, [$d362]
	cp $d
	jp z, Func_5c1f9
	jr asm_b8709 ; 0x5c145 $1c
asm_8774b: ; 5c147 (17:4147)
	cp $3
	jr nz, asm_d49e7 ; 0x5c149 $8
	ld a, [$d362]
	cp $c
	jp z, Func_5c1f9
asm_d49e7: ; 5c153 (17:4153)
	ld a, [$d754]
	bit 0, a
	jr nz, asm_31a16 ; 0x5c158 $10
	ld hl, UnnamedText_5c23d
	call PrintText
	jp asm_d1145
asm_b8709: ; 5c163 (17:4163)
	ld a, [$d754]
	bit 0, a
	jr z, asm_3ded4 ; 0x5c168 $9
asm_31a16: ; 5c16a (17:416a)
	ld hl, UnnamedText_5c242
	call PrintText
	jp asm_d1145
asm_3ded4: ; 5c173 (17:4173)
	ld a, $13
	ld [$d125], a
	call DisplayTextBoxID
	xor a
	ld [H_CURRENTPRESSEDBUTTONS], a
	ld hl, UnnamedText_5c21f
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, asm_de133 ; 0x5c18b $4d
	xor a
	ld [$ff00+$9f], a
	ld [$ff00+$a0], a
	ld a, $50
	ld [$ff00+$a1], a
	call HasEnoughMoney
	jr nc, asm_0f3e3 ; 0x5c199 $9
	ld hl, UnnamedText_5c229
	call PrintText
	jp asm_de133
asm_0f3e3: ; 5c1a4 (17:41a4)
	ld hl, UnnamedText_5c224
	call PrintText
	ld hl, $d754
	set 0, [hl]
	xor a
	ld [$cd3d], a
	ld [$cd3e], a
	ld a, $50
	ld [$cd3f], a
	ld hl, $cd3f
	ld de, $d349
	ld c, $3
	ld a, $c
	call Predef
	ld a, $13
	ld [$d125], a
	call DisplayTextBoxID
	ld a, $b2
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jr asm_0b094 ; 0x5c1d8 $18
asm_de133: ; 5c1da (17:41da)
	ld hl, UnnamedText_5c21a ; $421a
	call PrintText
	ld a, $1
	ld [$cd38], a
	ld a, $80
	ld [$ccd3], a
	call Func_3486
	call UpdateSprites
	jr asm_d1145 ; 0x5c1f0 $25
asm_0b094: ; 5c1f2 (17:41f2)
	ld a, $1
	ld [W_MUSEUMF1CURSCRIPT], a
	jr asm_d1145 ; 0x5c1f7 $1e

Func_5c1f9: ; 5c1f9 (17:41f9)
	ld hl, UnnamedText_5c22e
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	cp $0
	jr nz, asm_d1144
	ld hl, UnnamedText_5c233
	call PrintText
	jr asm_d1145 ; 0x5c20f $6
asm_d1144: ; 5c211 (17:4211)
	ld hl, UnnamedText_5c238
	call PrintText
asm_d1145: ; 5c217 (17:4217)
	jp TextScriptEnd

UnnamedText_5c21a: ; 5c21a (17:421a)
	TX_FAR _UnnamedText_5c21a
	db "@"

UnnamedText_5c21f: ; 5c21f (17:421f)
	TX_FAR _UnnamedText_5c21f
	db "@"

UnnamedText_5c224: ; 5c224 (17:4224)
	TX_FAR _UnnamedText_5c224
	db "@"

UnnamedText_5c229: ; 5c229 (17:4229)
	TX_FAR _UnnamedText_5c229
	db "@"

UnnamedText_5c22e: ; 5c22e (17:422e)
	TX_FAR _UnnamedText_5c22e
	db "@"

UnnamedText_5c233: ; 5c233 (17:4233)
	TX_FAR _UnnamedText_5c233
	db "@"

UnnamedText_5c238: ; 5c238 (17:4238)
	TX_FAR _UnnamedText_5c238
	db "@"

UnnamedText_5c23d: ; 5c23d (17:423d)
	TX_FAR _UnnamedText_5c23d
	db "@"

UnnamedText_5c242: ; 5c242 (17:4242)
	TX_FAR _UnnamedText_5c242
	db "@"

MuseumF1Text2: ; 5c247 (17:4247)
	db $08 ; asm
	ld hl, UnnamedText_5c251
	call PrintText
	jp TextScriptEnd

UnnamedText_5c251: ; 5c251 (17:4251)
	TX_FAR _UnnamedText_5c251
	db "@"

MuseumF1Text3: ; 5c256 (17:4256)
	db $08 ; asm
	ld a, [$d754]
	bit 1, a
	jr nz, .asm_16599 ; 0x5c25c
	ld hl, UnnamedText_5c28e
	call PrintText
	ld bc, (OLD_AMBER << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, $d754
	set 1, [hl]
	ld a, $34
	ld [$cc4d], a
	ld a, $11
	call Predef
	ld hl, ReceivedOldAmberText
	jr .asm_52e0f ; 0x5c27e
.BagFull
	ld hl, UnnamedText_5c29e
	jr .asm_52e0f ; 0x5c283
.asm_16599 ; 0x5c285
	ld hl, UnnamedText_5c299
.asm_52e0f ; 0x5c288
	call PrintText
	jp TextScriptEnd

UnnamedText_5c28e: ; 5c28e (17:428e)
	TX_FAR _UnnamedText_5c28e
	db "@"

ReceivedOldAmberText: ; 5c293 (17:4293)
	TX_FAR _ReceivedOldAmberText ; 0x96790
	db $0B, "@"

UnnamedText_5c299: ; 5c299 (17:4299)
	TX_FAR _UnnamedText_5c299
	db "@"

UnnamedText_5c29e: ; 5c29e (17:429e)
	TX_FAR _UnnamedText_5c29e
	db "@"

MuseumF1Text4: ; 5c2a3 (17:42a3)
	db $08 ; asm
	ld hl, UnnamedText_5c2ad
	call PrintText
	jp TextScriptEnd

UnnamedText_5c2ad: ; 5c2ad (17:42ad)
	TX_FAR _UnnamedText_5c2ad
	db "@"

MuseumF1Text5: ; 5c2b2 (17:42b2)
	db $08 ; asm
	ld hl, UnnamedText_5c2bc
	call PrintText
	jp TextScriptEnd

UnnamedText_5c2bc: ; 5c2bc (17:42bc)
	TX_FAR _UnnamedText_5c2bc
	db "@"
	
