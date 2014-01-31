NameRaterScript: ; 1da12 (7:5a12)
	jp EnableAutoTextBoxDrawing
	
Func_1da15: ; 1da15 (7:5a15)
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	ret

Func_1da20: ; 1da20 (7:5a20)
	ld hl, W_PARTYMON1OT
	ld bc, $000b
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, W_PLAYERNAME
	ld c, $b
	call .asm_1da47
	jr c, .asm_1da52 ; 0x1da34 $1c
	ld hl, $d177
	ld bc, $002c
	ld a, [wWhichPokemon]
	call AddNTimes
	ld de, $d359
	ld c, $2
.asm_1da47
	ld a, [de]
	cp [hl]
	jr nz, .asm_1da52 ; 0x1da49 $7
	inc hl
	inc de
	dec c
	jr nz, .asm_1da47 ; 0x1da4e $f7
	and a
	ret
.asm_1da52
	scf
	ret

NameRaterTextPointers: ; 1da54 (7:5a54)
	dw NameRaterText1

NameRaterText1: ; 1da56 (7:5a56)
	db $8
	call SaveScreenTilesToBuffer2
	ld hl, UnnamedText_1dab3
	call Func_1da15
	jr nz, .asm_1daae ; 0x1da60 $4c
	ld hl, UnnamedText_1dab8
	call PrintText
	xor a
	ld [$d07d], a
	ld [$cfcb], a
	ld [$cc35], a
	call DisplayPartyMenu
	push af
	call GBPalWhiteOutWithDelay3
	call Func_3dbe
	call LoadGBPal
	pop af
	jr c, .asm_1daae ; 0x1da80 $2c
	call GetPartyMonName2
	call Func_1da20
	ld hl, UnnamedText_1dad1
	jr c, .asm_1daa8 ; 0x1da8b $1b
	ld hl, UnnamedText_1dabd
	call Func_1da15
	jr nz, .asm_1daae ; 0x1da93 $19
	ld hl, UnnamedText_1dac2
	call PrintText
	ld b, BANK(Func_655c)
	ld hl, Func_655c
	call Bankswitch
	jr c, .asm_1daae ; 0x1daa3 $9
	ld hl, UnnamedText_1dac7
.asm_1daa8
	call PrintText
	jp TextScriptEnd
.asm_1daae
	ld hl, UnnamedText_1dacc
	jr .asm_1daa8 ; 0x1dab1 $f5

UnnamedText_1dab3: ; 1dab3 (7:5ab3)
	TX_FAR _UnnamedText_1dab3
	db "@"

UnnamedText_1dab8: ; 1dab8 (7:5ab8)
	TX_FAR _UnnamedText_1dab8
	db "@"

UnnamedText_1dabd: ; 1dabd (7:5abd)
	TX_FAR _UnnamedText_1dabd
	db "@"

UnnamedText_1dac2: ; 1dac2 (7:5ac2)
	TX_FAR _UnnamedText_1dac2
	db "@"

UnnamedText_1dac7: ; 1dac7 (7:5ac7)
	TX_FAR _UnnamedText_1dac7
	db "@"

UnnamedText_1dacc: ; 1dacc (7:5acc)
	TX_FAR _UnnamedText_1dacc
	db "@"

UnnamedText_1dad1: ; 1dad1 (7:5ad1)
	TX_FAR _UnnamedText_1dad1
	db "@"


