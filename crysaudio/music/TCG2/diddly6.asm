Music_TCG2Diddly6:
	db $C0
	dw Music_TCG2Diddly6_Ch1
	db $01
	dw Music_TCG2Diddly6_Ch2
	db $02
	dw Music_TCG2Diddly6_Ch3
	db $03
	dw Music_TCG2Diddly6_Ch4

Music_TCG2Diddly6_Ch2: 
	notetype1 10
	notetype0 1
	octave 3
	note F_, 2
	note G_, 3
	note A_, 2
	note B_, 3
	inc_octave
	note C_, 2
	note D_, 3
	note E_, 2
	note F_, 3
	note G_, 16
	note G_, 14
	note G_, 11
	note A#, 16
	note A#, 5
	note A#, 10
	note G_, 6
	note A#, 4
	note A_, 16
	note A_, 14
	note A_, 11
	inc_octave
	note C_, 16
	note C_, 14
	note C_, 11
	dec_octave
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 13
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 7
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 16
	note B_, 2
	notetype0 2
	note B_, 10
	endchannel


Music_TCG2Diddly6_Ch1: 
	notetype1 10
	notetype0 1
	octave 3
	note C_, 2
	note D_, 3
	note E_, 2
	note F_, 3
	note G_, 2
	note A_, 3
	note B_, 2
	inc_octave
	note C_, 3
	dec_octave
	note G_, 6
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 6
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D#, 5
	dec_octave
	note A#, 5
	inc_octave
	note G_, 5
	dec_octave
	note A_, 6
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 5
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 6
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	dec_octave
	note A_, 5
	inc_octave
	note F_, 5
	note C_, 5
	note A_, 5
	octave 4
	note D_, 6
	octave 4
	note G_, 5
	note D_, 5
	note B_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note D_, 5
	note B_, 5
	dec_octave
	note B_, 6
	inc_octave
	note G_, 5
	dec_octave
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note D_, 5
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 6
	inc_octave
	note G_, 5
	note D_, 5
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 5
	inc_octave
	note G_, 5
	note D_, 6
	note B_, 5
	note G_, 5
	inc_octave
	note D_, 5
	dec_octave
	note B_, 5
	note G_, 5
	note B_, 5
	inc_octave
	note D_, 5
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 2
	notetype0 2
	note G_, 10
	endchannel


Music_TCG2Diddly6_Ch3: 
	notetype1 10
	notetype2 15
	notetype1 1
	notetype0 1
	note __, 10
	note __, 10
	octave 2
	note D#, 16
	note D#, 16
	note D#, 16
	note D#, 16
	note D#, 16
	note D#, 2
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 2
.Loop1
	notetype0 7
	note G_, 3
	notetype0 10
	note D_, 2
	loopchannel 4, .Loop1
	notetype0 1
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 16
	note G_, 2
	notetype0 2
	note G_, 10
	endchannel


Music_TCG2Diddly6_Ch4: 
	togglenoise $06
	octave 1
	notetype 1
	note __, 10
	note __, 10
	note C#, 6
.Loop1
	note D_, 5
	loopchannel 7, .Loop1
.Loop2
	note D_, 6
	rept 7
	note D_, 5
	endr
	loopchannel 3, .Loop2
.Loop3
	notetype 7
	note C#, 3
	notetype 10
	note C#, 2
	loopchannel 4, .Loop3
	notetype 7
	note F_, 12
	endchannel

