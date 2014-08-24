CableClubNPC: ; 71c5 (1:71c5)
	ld hl, CableClubNPCText1
	call PrintText
	ld a, [wd74b]
	bit 5, a
	jp nz, Func_71e1
	ld c, $3c
	call DelayFrames
	ld hl, CableClubNPCText6
	call PrintText
	jp Func_7298

Func_71e1: ; 71e1 (1:71e1)
	ld a, $1
	ld [wMenuJoypadPollCount], a
	ld a, $5a
	ld [wcc47], a
.asm_71eb
	ld a, [$ffaa]
	cp $2
	jr z, .asm_721a ; 0x71ef $29
	cp $1
	jr z, .asm_721a ; 0x71f3 $25
	ld a, $ff
	ld [$ffaa], a
	ld a, $2
	ld [rSB], a
	xor a
	ld [$ffad], a
	ld a, $80
	ld [$ff02], a
	ld a, [wcc47]
	dec a
	ld [wcc47], a
	jr z, .asm_7287 ; 0x720b $7a
	ld a, $1
	ld [rSB], a
	ld a, $81
	ld [$ff02], a
	call DelayFrame
	jr .asm_71eb ; 0x7218 $d1
.asm_721a
	call Func_22ed
	call DelayFrame
	call Func_22ed
	ld c, $32
	call DelayFrames
	ld hl, CableClubNPCText2
	call PrintText
	xor a
	ld [wMenuJoypadPollCount], a
	call YesNoChoice
	ld a, $1
	ld [wMenuJoypadPollCount], a
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_728f ; 0x723e $4f
	callab SaveSAVtoSRAM
	call WaitForSoundToFinish
	ld a, (SFX_02_5d - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	ld hl, CableClubNPCText3
	call PrintText
	ld hl, wcc47
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
	ld [$ffa9], a
	ld [wcc42], a
	call Func_227f
	ld hl, wcc47
	ld a, [hli]
	inc a
	jr nz, Func_72a8 ; 0x726b $3b
	ld a, [hl]
	inc a
	jr nz, Func_72a8 ; 0x726f $37
	ld b, $a
.asm_7273
	call DelayFrame
	call Func_22ed
	dec b
	jr nz, .asm_7273 ; 0x727a $f7
	call Func_72d7
	ld hl, CableClubNPCText4
	call PrintText
	jr Func_7298 ; 0x7285 $11
.asm_7287
	ld hl, CableClubNPCText7
	call PrintText
	jr Func_7298 ; 0x728d $9
.asm_728f
	call Func_72d7
	ld hl, CableClubNPCText5
	call PrintText
	; fall through

Func_7298: ; 7298 (1:7298)
	xor a
	ld hl, wcc47
	ld [hli], a
	ld [hl], a
	ld hl, wd72e
	res 6, [hl]
	xor a
	ld [wMenuJoypadPollCount], a
	ret

Func_72a8: ; 72a8 (1:72a8)
	xor a
	ld [hld], a
	ld [hl], a
	ld hl, LinkMenu
	ld b, BANK(LinkMenu)
	jp Bankswitch

CableClubNPCText7: ; 72b3 (1:72b3)
	TX_FAR _CableClubNPCText7
	db "@"

CableClubNPCText1: ; 72b8 (1:72b8)
	TX_FAR _CableClubNPCText1
	db "@"

CableClubNPCText2: ; 72bd (1:72bd)
	TX_FAR _CableClubNPCText2
	db "@"

CableClubNPCText3: ; 72c2 (1:72c2)
	TX_FAR _CableClubNPCText3
	db $a, "@"

CableClubNPCText4: ; 72c8 (1:72c8)
	TX_FAR _CableClubNPCText4
	db "@"

CableClubNPCText5: ; 72cd (1:72cd)
	TX_FAR _CableClubNPCText5
	db "@"

CableClubNPCText6: ; 72d2 (1:72d2)
	TX_FAR _CableClubNPCText6
	db "@"

Func_72d7: ; 72d7 (1:72d7)
	call Delay3
	ld a, $ff
	ld [$ffaa], a
	ld a, $2
	ld [rSB], a
	xor a
	ld [$ffad], a
	ld a, $80
	ld [$ff02], a
	ret
