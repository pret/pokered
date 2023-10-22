; PureRGBnote: CHANGED: this function was modified in order to facilitate remapping types of pokemon to their original ones.
; [wd0b5] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	push hl
	call GetMonHeader
	ld a, [wMonHType1]
	ld d, a
	ld a, [wMonHType2]
	ld e, a
	callfar TryRemapTypingNoWramChange
	pop hl
	ld a, d
	push de
	call PrintType
	pop de
	pop hl
	ld a, e
	cp d
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 2
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	push hl
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text:
	ld a, " "
	ld bc, $13
	add hl, bc
	ld bc, $6
	jp FillMemory

PrintMoveType:
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
; fall through

PrintType_:
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

INCLUDE "data/types/names.asm"

; PureRGBnote: ADDED: version of this subroutine that can be called from other banks
; de = destination address
; wPlayerMoveType = type
FarPrintType:
	ld h, d
	ld l, e
	ld a, [wPlayerMoveType]
	jp PrintType
