PlayArmoredMewtwoCry3::
	ld de, SFX_Armored_Mewtwo_Cry3_Ch8
	ld hl, wChannelCommandPointers + CHAN8 * 2
	jr Audio3_OverwriteChannelPointer

Audio3_RemapChannel1::
	ld hl, wChannelCommandPointers + CHAN1 * 2
	jr Audio3_OverwriteChannelPointer

Audio3_RemapChannel2::
	ld hl, wChannelCommandPointers + CHAN2 * 2
	jr Audio3_OverwriteChannelPointer

Audio3_RemapChannel3::
	ld hl, wChannelCommandPointers + CHAN3 * 2
	jr Audio3_OverwriteChannelPointer

Audio3_RemapChannel4::
	ld hl, wChannelCommandPointers + CHAN4 * 2
	jr Audio3_OverwriteChannelPointer

Audio3_RemapChannel5::
	ld hl, wChannelCommandPointers + CHAN5 * 2
	; fall through
Audio3_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ret



