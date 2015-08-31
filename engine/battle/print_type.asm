; [wd0b5] = pokemon ID
; hl = dest addr
PrintMonType: ; 27d6b (9:7d6b)
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [wMonHType1]
	call PrintType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	pop hl
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 2
	add hl, bc

; a = type
; hl = dest addr
PrintType: ; 27d89 (9:7d89)
	push hl
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text: ; 27d8c (9:7d8c)
	ld a, " "
	ld bc, $13
	add hl, bc
	ld bc, $6
	jp FillMemory

PrintMoveType: ; 27d98 (9:7d98)
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
; fall through

PrintType_: ; 27d9f (9:7d9f)
	add a
	ld hl, TypeNames
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "text/type_names.asm"
