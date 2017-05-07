Music_TCGBoosterPack:
	db $80
	dw Music_TCGBoosterPack_Ch1
	db $01
	dw Music_TCGBoosterPack_Ch2
	db $02
	dw Music_TCGBoosterPack_Ch3

Music_TCGBoosterPack_Ch1: 
	vibrato 20, $33
	notetype2 8
	octave 4
	dutycycle 1
	notetype0 1
	notetype1 10
	note D#, 5
	notetype1 3
	note D#, 1
	notetype1 10
	note G_, 5
	notetype1 3
	note G_, 1
	notetype1 10
	note A#, 5
	notetype1 3
	note A#, 2
	notetype1 10
	note F_, 5
	notetype1 3
	note F_, 1
	notetype1 10
	note A_, 5
	notetype1 3
	note A_, 1
	inc_octave
	notetype1 10
	note C_, 5
	notetype1 3
	note C_, 2
	dec_octave
	notetype1 10
	note B_, 16
	note B_, 16
	note B_, 6
	notetype1 3
	note B_, 9
	endchannel


Music_TCGBoosterPack_Ch2: 
	vibrato 20, $33
	notetype2 8
	octave 3
	dutycycle 1
	notetype0 1
	notetype1 9
	note A#, 5
	notetype1 2
	note A#, 1
	inc_octave
	notetype1 9
	note D#, 5
	notetype1 2
	note D#, 1
	notetype1 9
	note G_, 5
	notetype1 2
	note G_, 2
	notetype1 9
	note C_, 5
	notetype1 2
	note C_, 1
	notetype1 9
	note F_, 5
	notetype1 2
	note F_, 1
	notetype1 9
	note A_, 5
	notetype1 2
	note A_, 2
	notetype1 9
	note G_, 16
	note G_, 16
	note G_, 6
	notetype1 2
	note G_, 9
	endchannel


Music_TCGBoosterPack_Ch3: 
	notetype2 11
	notetype1 1
	octave 2
	notetype0 1
	note D#, 6
	note A#, 6
	inc_octave
	note D#, 7
	dec_octave
	note F_, 6
	inc_octave
	note C_, 6
	note F_, 7
	dec_octave
	note G_, 16
	note G_, 16
	note G_, 6
	endchannel

