MistEffect_: ; 33f2b (c:7f2b)
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [$fff3]
	and a
	jr z, .asm_33f36
	ld hl, W_ENEMYBATTSTATUS2
.asm_33f36
	bit ProtectedByMist, [hl] ; is mon protected by mist?
	jr nz, .asm_33f4a
	set ProtectedByMist, [hl] ; mon is now protected by mist
	callab PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.asm_33f4a
	ld hl, PrintButItFailedText_
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch

ShroudedInMistText: ; 33f52 (c:7f52)
	TX_FAR _ShroudedInMistText
	db "@"
