Music_PokeFluteInBattle::
	; begin playing the "caught mon" sound effect
	ld a, SFX_CAUGHT_MON
	call PlaySoundWaitForCurrent
	; then immediately overwrite the channel pointers
	ld hl, wChannelCommandPointers + CHAN5 * 2
	ld de, SFX_Pokeflute_Ch5
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Pokeflute_Ch6
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Pokeflute_Ch7

Audio2_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret
