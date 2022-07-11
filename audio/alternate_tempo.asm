; an alternate start for MeetRival which has a different first measure
Music_RivalAlternateStart::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_Ch1_AlternateStart
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_Ch2_AlternateStart
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_Ch3_AlternateStart

Audio1_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

; an alternate tempo for MeetRival which is slightly slower
Music_RivalAlternateTempo::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_Ch1_AlternateTempo
	jp Audio1_OverwriteChannelPointer

; applies both the alternate start and alternate tempo
Music_RivalAlternateStartAndTempo::
	call Music_RivalAlternateStart
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_Ch1_AlternateStartAndTempo
	jp Audio1_OverwriteChannelPointer

; an alternate tempo for Cities1 which is used for the Hall of Fame room
Music_Cities1AlternateTempo::
	ld a, 10
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, $ff ; stop playing music after the fade-out is finished
	ld [wAudioFadeOutControl], a
	ld c, 100
	call DelayFrames ; wait for the fade-out to finish
	ld c, BANK(Music_Cities1)
	ld a, MUSIC_CITIES1
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_Cities1_Ch1_AlternateTempo
	jp Audio1_OverwriteChannelPointer
