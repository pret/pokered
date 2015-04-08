MistEffect_: ; 33f2b (c:7f2b)
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .mistEffect
	ld hl, W_ENEMYBATTSTATUS2
.mistEffect
	bit ProtectedByMist, [hl] ; is mon protected by mist?
	jr nz, .mistAlreadyInUse
	set ProtectedByMist, [hl] ; mon is now protected by mist
	callab PlayCurrentMoveAnimation
	ld hl, ShroudedInMistText
	jp PrintText
.mistAlreadyInUse
	ld hl, PrintButItFailedText_
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch

ShroudedInMistText: ; 33f52 (c:7f52)
	TX_FAR _ShroudedInMistText
	db "@"
