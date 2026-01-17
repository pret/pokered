PrintMonName1Text:
	ld hl, MonName1Text
	jp PrintText

; this function wastes time calling DetermineExclamationPointTextNum
; and choosing between Used1Text and Used2Text, even though
; those text strings are identical and both continue at PrintInsteadText
; this likely had to do with Japanese grammar that got translated,
; but the functionality didn't get removed
MonName1Text:
	text_far _MonName1Text
	text_asm
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerUsedMove
	jr z, .playerTurn
	ld a, [wEnemyMoveNum]
	ld hl, wEnemyUsedMove
.playerTurn
	ld [hl], a
	ld [wMoveGrammar], a
	call DetermineExclamationPointTextNum
	ld a, [wMonIsDisobedient]
	and a
	ld hl, Used2Text
	ret nz
	ld a, [wMoveGrammar]
	cp 3
	ld hl, Used2Text
	ret c
	ld hl, Used1Text
	ret

Used1Text:
	text_far _Used1Text
	text_asm
	jr PrintInsteadText

Used2Text:
	text_far _Used2Text
	text_asm
	; fall through

PrintInsteadText:
	ld a, [wMonIsDisobedient]
	and a
	jr z, PrintMoveName
	ld hl, InsteadText
	ret

InsteadText:
	text_far _InsteadText
	text_asm
	; fall through

PrintMoveName:
	ld hl, _PrintMoveName
	ret

_PrintMoveName:
	text_far _MoveNameText
	text_asm
	ld hl, ExclamationPointPointerTable
	ld a, [wMoveGrammar]
	add a
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

ExclamationPointPointerTable:
	dw ExclamationPoint1Text
	dw ExclamationPoint2Text
	dw ExclamationPoint3Text
	dw ExclamationPoint4Text
	dw ExclamationPoint5Text

ExclamationPoint1Text:
	text_far _ExclamationPoint1Text
	text_end

ExclamationPoint2Text:
	text_far _ExclamationPoint2Text
	text_end

ExclamationPoint3Text:
	text_far _ExclamationPoint3Text
	text_end

ExclamationPoint4Text:
	text_far _ExclamationPoint4Text
	text_end

ExclamationPoint5Text:
	text_far _ExclamationPoint5Text
	text_end

; this function does nothing useful
; if the move being used is in set [1-4] from ExclamationPointMoveSets,
; use ExclamationPoint[1-4]Text
; otherwise, use ExclamationPoint5Text
; but all five text strings are identical
; this likely had to do with Japanese grammar that got translated,
; but the functionality didn't get removed
DetermineExclamationPointTextNum:
	push bc
	ld a, [wMoveGrammar] ; move ID
	ld c, a
	ld b, $0
	ld hl, ExclamationPointMoveSets
.loop
	ld a, [hli]
	cp $ff
	jr z, .done
	cp c
	jr z, .done
	and a
	jr nz, .loop
	inc b
	jr .loop
.done
	ld a, b
	ld [wMoveGrammar], a
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"
