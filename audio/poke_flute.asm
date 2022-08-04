Music_PokeFluteInBattle::
	; begin playing the "caught mon" sound effect
	ld a, SFX_CAUGHT_MON
	call PlaySoundWaitForCurrent
	; then immediately overwrite the channel pointers
	ld hl, wChannelCommandPointers + Ch5 * 2
	ld de, SFX_Pokeflute_Ch5
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Pokeflute_Ch6
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Pokeflute_Ch7
	; fallthrough

Audio2_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

;;;;;;;; shinpokerednote: FIXED: "poof!" sound effect of forgetting a move now works in battle
Music_LearnMovePoofInBattle::
	; begin playing the "caught mon" sound effect
	ld a, SFX_CAUGHT_MON
	call PlaySoundWaitForCurrent
	; then immediately overwrite the channel pointers
	ld hl, wChannelCommandPointers + Ch5 * 2
	ld de, SFX_Swap_2_Ch5
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Swap_2_Ch6
	call Audio2_OverwriteChannelPointer
	ld de, SFX_Swap_2_Ch7
	jr Audio2_OverwriteChannelPointer
;;;;;;;; It was broken because SFX_SWAP didn't exist in the 2nd audio engine but did in 1 and 3. So we're manually running one located in this bank now.
