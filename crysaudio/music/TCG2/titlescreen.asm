Music_TCG2TitleScreen:
	db $C0
	dw Music_TCG2TitleScreen_Ch1
	db $01
	dw Music_TCG2TitleScreen_Ch2
	db $02
	dw Music_TCG2TitleScreen_Ch3
	db $03
	dw Music_TCG2TitleScreen_Ch4

Music_TCG2TitleScreen_Ch2: 
	notetype1 10
	octave 3
	notetype0 1
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note F#, 4
	vibrato 0, $33
.Loop1
	note G_, 16
	note G_, 14
	note G_, 15
	rept 3
	note G_, 4
	note G_, 1
	endr
	loopchannel 4, .Loop1
.Loop2
	note G_, 3
	note A_, 4
	note G_, 4
	note A_, 4
	loopchannel 8, .Loop2
	notetype0 10
	note G_, 3
	octave 2
	notetype2 4
	dutycycle 2
	note F_, 3
	note E_, 3
	octave 3
	notetype2 8
	notetype0 1
	note G_, 8
	note G_, 7
	note __, 8
	note F_, 5
	note F_, 2
	notetype0 5
	note E_, 3
	note E_, 3
	note G_, 3
	note G_, 3
	inc_octave
	vibrato 15, $33
	note D_, 6
	note D_, 3
	notetype0 1
	note C_, 7
	note C_, 8
	dec_octave
	vibrato 30, $33
	notetype0 10
	note G_, 6
	note G_, 3
	notetype0 1
	note E_, 8
	note E_, 15
	note G_, 5
	note G_, 2
	note G_, 15
	note G_, 15
	note G_, 15
	note F_, 8
	note F_, 7
	note F_, 15
	note E_, 5
	note F_, 5
	note E_, 5
	note D_, 7
	note F_, 8
	note C_, 7
	note D_, 8
	note D_, 15
	note D_, 16
	note D_, 16
	note D_, 16
	note D_, 12
	note D_, 15
	note G_, 8
	note G_, 7
	note __, 8
	note F_, 5
	note F_, 2
	notetype0 5
	note E_, 3
	note E_, 3
	note G_, 3
	note G_, 3
	inc_octave
	vibrato 15, $33
	note D_, 6
	note D_, 3
	notetype0 1
	note E_, 8
	note E_, 7
	dec_octave
	vibrato 30, $33
	notetype0 10
	note G_, 6
	notetype0 5
	note G_, 3
	note E_, 3
	note F_, 3
	notetype0 1
	note G_, 8
	note G_, 7
	note G#, 15
	note G#, 8
	note G#, 7
	inc_octave
	note C_, 15
	note C_, 8
	note C_, 7
	vibrato 15, $33
	note D_, 15
	note D_, 15
	note D_, 15
	note C_, 8
	note C_, 7
	note F#, 4
	vibrato 25, $33
	note G_, 11
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note F_, 8
	note G_, 7
	note C_, 15
	note D_, 8
	note D_, 7
	vibrato 26, $33
	octave 4
	note D_, 4
	note D#, 11
	note D#, 15
	note D#, 15
	note D#, 15
	note D#, 15
	note D#, 15
	note F_, 8
	note F_, 15
	note D#, 5
	note D#, 2
	note D_, 8
	note D#, 3
	note D_, 4
	note D_, 4
	note D#, 4
	dec_octave
	note A#, 4
	inc_octave
	note D_, 3
	dec_octave
	vibrato 15, $33
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G#, 8
	note G#, 15
	note A#, 5
	note G#, 2
	inc_octave
	note C_, 8
	dec_octave
	note A#, 7
	inc_octave
	note C_, 8
	note G_, 5
	note C_, 2
	note G_, 15
	note G_, 15
	note G_, 15
	note F_, 8
	note G_, 7
	note A#, 7
	note G_, 3
	note D#, 7
	note A#, 3
	note C_, 7
	note D#, 3
	note D_, 8
	note D#, 4
	note D_, 3
	note D_, 4
	note D#, 4
	dec_octave
	note A#, 4
	inc_octave
	note D_, 3
	dec_octave
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G#, 5
	note G_, 3
	note A#, 5
	note G#, 2
	inc_octave
	note C_, 15
	note C_, 15
	note C_, 8
	note G_, 4
	note G_, 3
	note D#, 4
	note G_, 4
	note C_, 4
	note D#, 3
	dec_octave
	note B_, 15
	inc_octave
	note C_, 8
	note F#, 4
	note G_, 15
	note G_, 3
	note F_, 8
	note G_, 7
	note D_, 7
	note D_, 3
	note D#, 7
	note D_, 3
	note F_, 7
	note D#, 3
	note D_, 7
	note F_, 3
	note A#, 7
	note D_, 3
	note F_, 7
	note A#, 3
	note D#, 15
	note D#, 8
	note C_, 15
	note D_, 3
	note C_, 4
	note D#, 4
	note D_, 4
	note F_, 3
	note D#, 4
	note G_, 15
	note G_, 16
	note G_, 14
	note F_, 8
	note G_, 7
	note G_, 15
	note F_, 8
	note A_, 3
	note A#, 12
	note G#, 3
	note A#, 4
	note D#, 4
	note A#, 4
	note G#, 3
	note D#, 4
	notetype0 5
	note G_, 12
	note G_, 6
	note G_, 3
	octave 4
	note G_, 1
	note A_, 1
	note B_, 1
	notetype0 1
	vibrato 20, $33
	inc_octave
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note B_, 8
	inc_octave
	note C_, 15
	dec_octave
	note A_, 5
	note B_, 2
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note E_, 5
	note G_, 3
	note G_, 5
	note E_, 2
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 15
	note G_, 8
	note A_, 7
	note F_, 8
	note G_, 7
	note A_, 8
	note F_, 7
	note G_, 8
	note A_, 3
	note G_, 4
	note G_, 4
	note A_, 4
	note E_, 3
	note G_, 4
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	notetype2 8
	octave 3
	note D_, 8
	note D_, 7
	octave 4
	note D_, 5
	note C_, 3
	note E_, 5
	note D_, 2
	note F_, 15
	note F_, 15
	note F_, 15
	note F_, 15
	note F_, 8
	note F_, 7
	note E_, 8
	note F_, 7
	note D_, 8
	note E_, 7
	note F_, 8
	note D_, 7
	note E_, 8
	note F_, 15
	dec_octave
	note G_, 5
	inc_octave
	note E_, 2
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note A_, 5
	inc_octave
	note C_, 3
	note C_, 5
	dec_octave
	note A_, 2
	inc_octave
	vibrato 0, $33
	note D_, 16
	note D_, 14
	note D_, 15
	note D_, 8
	note E_, 7
	note D_, 15
	note D_, 8
	dec_octave
	note A_, 16
	note A_, 7
	inc_octave
	note C_, 8
	dec_octave
	note A_, 7
	inc_octave
	note C_, 16
	note C_, 14
	note C_, 15
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 3
	note A_, 4
	note B_, 16
	note B_, 14
	note B_, 15
	inc_octave
	note C_, 8
	dec_octave
	note B_, 7
	inc_octave
	vibrato 30, $33
	note C_, 16
	note C_, 14
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 10
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 16
	note C_, 12
	note C_, 12
	endchannel


Music_TCG2TitleScreen_Ch1: 
	notetype1 10
	octave 3
	notetype0 1
	note __, 2
	note G_, 3
	note A_, 4
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 3
	note E_, 4
	note F_, 3
	note F#, 2
	vibrato 0, $33
	note D_, 16
	note D_, 14
	note D_, 15
.Loop1
	note D_, 4
	note D_, 1
	loopchannel 3, .Loop1
	note C_, 16
	note C_, 14
	note C_, 15
.Loop2
	note C_, 4
	note C_, 1
	loopchannel 3, .Loop2
	dec_octave
	note B_, 16
	note B_, 14
	note B_, 15
.Loop3
	note B_, 4
	note B_, 1
	loopchannel 3, .Loop3
	note A_, 16
	note A_, 14
	note A_, 15
.Loop4
	note A_, 4
	note A_, 1
	loopchannel 3, .Loop4
	vibrato 28, $33
	notetype0 10
	note G_, 12
	note G_, 3
	note __, 3
	note __, 3
	notetype0 1
	octave 2
	octave 2
	notetype2 8
	notetype0 1
	note B_, 8
	note B_, 7
	note __, 8
	inc_octave
	note D_, 5
	note D_, 2
	notetype0 5
	note C_, 3
	note C_, 3
	note E_, 3
	note E_, 3
	vibrato 15, $33
	note G_, 6
	note G_, 3
	notetype0 1
	note G_, 8
	note G_, 7
	note E_, 15
	octave 3
	note E_, 8
	inc_octave
	note C_, 7
	note D_, 8
	note C_, 7
	note C_, 8
	note D_, 7
.Loop5
	note G_, 4
	note A_, 4
	note G_, 3
	note A_, 4
	loopchannel 2, .Loop5
	notetype0 1
	octave 3
	note C_, 8
	note C_, 7
	note __, 8
	note D_, 5
	note C_, 2
	vibrato 0, $33
	note F_, 15
	note F_, 15
	note F_, 15
	note C_, 8
	note C_, 7
	note C_, 15
	dec_octave
	note A_, 8
	inc_octave
	note C_, 7
	dec_octave
	note F_, 8
	note A_, 7
	note E_, 8
	note F_, 7
	note F_, 8
	octave 2
	note A_, 7
	note B_, 4
	note A_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 3
	inc_octave
	note D_, 8
	note F_, 4
	note D_, 3
	note A_, 4
	note F_, 4
	inc_octave
	note C_, 4
	dec_octave
	note A_, 3
	note B_, 15
	note A_, 5
	note B_, 5
	note A_, 5
	note E_, 8
	note A_, 7
	note D_, 8
	note E_, 7
	octave 3
	notetype0 5
	note C_, 3
	note C_, 3
	note E_, 3
	note E_, 3
	vibrato 15, $33
	note G_, 6
	note G_, 3
	notetype0 1
	note G_, 8
	note G_, 7
	note E_, 15
	octave 3
	note E_, 8
	inc_octave
	note C_, 7
	note D_, 8
	note C_, 7
	note C_, 8
	note D_, 7
	note G_, 4
	note A_, 4
	note G_, 3
	note A_, 4
	notetype0 1
	octave 3
	note C_, 15
	note D_, 15
	note E_, 8
	note E_, 7
	note F_, 15
	octave 3
	note C_, 8
	note F_, 7
	note G#, 8
	note F_, 7
	note F_, 8
	note G#, 7
	octave 3
	notetype0 1
	note G#, 16
	note G#, 14
	note G#, 15
	note F_, 8
	note F_, 7
	inc_octave
	note D#, 15
	octave 3
	note F_, 8
	note G#, 7
	inc_octave
	note C_, 8
	note C_, 7
	dec_octave
	note G#, 8
	inc_octave
	note C_, 7
	note D_, 4
	note D#, 4
	dec_octave
	note F_, 7
	note G#, 4
	note F_, 4
	inc_octave
	note C_, 4
	dec_octave
	note F_, 3
	inc_octave
	note F_, 3
	note C_, 2
	dec_octave
	note G#, 3
	inc_octave
	note C_, 2
	note C_, 3
	dec_octave
	note G#, 2
	inc_octave
	note F_, 3
	note C_, 2
	note G#, 3
	note F_, 2
	inc_octave
	note C_, 3
	dec_octave
	note G#, 2
	notetype1 3
	note C_, 3
	dec_octave
	note G#, 3
	note __, 2
	notetype0 1
	octave 3
	note G#, 3
	note G#, 4
	inc_octave
	note C_, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note C_, 4
	note D#, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note D#, 4
	note G_, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note G_, 8
	dec_octave
	note G#, 4
	note G#, 4
	note G#, 3
	inc_octave
	note C_, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note C_, 4
	note D#, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note D#, 4
	note G_, 4
	dec_octave
	note G#, 4
	note G#, 3
	inc_octave
	note G_, 4
	note G_, 4
	dec_octave
	note G#, 4
	note D_, 4
	note D_, 3
	note G_, 4
	note D_, 4
	note D_, 3
	note G_, 4
	note A#, 4
	note D_, 4
	note D_, 3
	note A#, 4
	inc_octave
	note D_, 4
	dec_octave
	note D_, 4
	note D_, 3
	inc_octave
	note D_, 8
	dec_octave
	note D_, 4
	note D_, 4
	note D_, 3
	note G_, 4
	note D_, 4
	note D_, 3
	note G_, 4
	note A#, 4
	note D_, 4
	note D_, 3
	note A#, 4
	inc_octave
	note D_, 4
	dec_octave
	note D_, 4
	note D_, 3
	inc_octave
	note D_, 4
	note D_, 4
	dec_octave
	note D_, 4
	note F_, 3
	note F_, 4
	note G#, 4
	note F_, 4
	note F_, 3
	note G#, 4
	inc_octave
	note C_, 4
	dec_octave
	note F_, 4
	note F_, 3
	inc_octave
	note C_, 4
	note D#, 4
	dec_octave
	note F_, 4
	note F_, 3
	inc_octave
	note D#, 8
	dec_octave
	note F_, 4
	note F_, 4
	note F_, 3
	note G#, 4
	note F_, 4
	note F_, 3
	note G#, 4
	inc_octave
	note C_, 4
	dec_octave
	note F_, 4
	note F_, 3
	inc_octave
	note C_, 4
	note D#, 4
	dec_octave
	note F_, 4
	note F_, 3
	inc_octave
	note D#, 4
	note D#, 4
	dec_octave
	note F_, 4
	note D#, 4
	note D#, 3
	note G_, 4
	note D#, 4
	note D#, 3
	note G_, 4
	note A#, 4
	note D#, 4
	note D#, 3
	note A#, 4
	inc_octave
	note D_, 4
	dec_octave
	note D#, 4
	note D#, 3
	inc_octave
	note D_, 8
	dec_octave
	note D#, 4
	note D#, 4
	note D#, 3
	note G_, 4
	note D#, 4
	note D#, 3
	note G_, 4
	note A#, 4
	note D#, 4
	note E_, 3
	note A#, 4
	inc_octave
	note C_, 4
	dec_octave
	note E_, 4
	note E_, 3
	inc_octave
	note C_, 4
	octave 3
	note D#, 8
	note D#, 7
	note C_, 5
	note D#, 5
	note G#, 5
	inc_octave
	note C_, 8
	dec_octave
	note G#, 7
	note G#, 5
	inc_octave
	note C_, 5
	note D#, 5
	note F#, 15
	note D#, 8
	note F#, 7
	dec_octave
	note B_, 8
	inc_octave
	note D#, 7
	dec_octave
	note G#, 8
	note B_, 7
	note A#, 15
	note A#, 8
	note F_, 7
	note A#, 8
	note F_, 5
	note F#, 2
	note A#, 8
	note F_, 5
	note A#, 2
	vibrato 8, $33
	note G_, 8
	note G_, 15
	note G_, 7
	note C_, 8
	note C_, 15
	note C_, 7
	note F_, 8
	note C_, 7
	note C_, 5
	note F_, 5
	note A_, 5
	inc_octave
	note C_, 8
	dec_octave
	note A_, 7
	note F_, 5
	note A_, 5
	inc_octave
	note C_, 5
	note F_, 15
	note C_, 8
	note C_, 7
	dec_octave
	note A_, 8
	inc_octave
	note C_, 7
	dec_octave
	note F_, 8
	note A_, 7
	note G_, 8
	note F_, 7
	note D_, 5
	note G_, 5
	note B_, 5
	inc_octave
	note D_, 8
	dec_octave
	note B_, 7
	note B_, 5
	inc_octave
	note D_, 5
	note G_, 5
	note B_, 8
	note B_, 15
	note B_, 7
	dec_octave
	dec_octave
	dec_octave
	note B_, 3
	inc_octave
	note D_, 4
	note G_, 4
	note B_, 4
	inc_octave
	note F_, 3
	note B_, 4
	inc_octave
	note D_, 4
	note E_, 4
.Loop6
	octave 4
	notetype2 8
	note E_, 16
	note E_, 14
	notetype2 8
	octave 3
	note C_, 8
	note C_, 7
	dec_octave
	notetype2 8
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	rept 2
	note E_, 8
	note E_, 7
	endr
	inc_octave
	notetype2 8
	note C_, 8
	note C_, 7
	note __, 8
	octave 4
	notetype2 8
	note E_, 5
	note E_, 2
	loopchannel 2, .Loop6
	octave 4
	notetype2 8
	note E_, 16
	note E_, 14
	notetype2 8
	octave 3
	note C_, 8
	note C_, 7
	dec_octave
	notetype2 8
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	note F_, 8
	note F_, 7
	octave 4
	notetype2 8
	note E_, 8
	note E_, 7
	octave 3
	notetype2 8
	note C_, 8
	note C_, 7
	octave 4
	notetype2 8
	note D_, 5
	note D_, 3
	note C_, 5
	note D_, 2
	note D_, 8
	note C_, 4
	note __, 11
	dec_octave
	note G_, 4
	inc_octave
	note D_, 3
	dec_octave
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	dec_octave
	note B_, 3
	inc_octave
	note C_, 4
	note D_, 4
	note E_, 4
	note F_, 3
	note G_, 4
	note A_, 4
	note B_, 4
	vibrato 30, $33
	inc_octave
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note G#, 8
	inc_octave
	note C_, 7
	dec_octave
	note F_, 8
	note A#, 7
	inc_octave
	note C_, 8
	note F_, 7
	note C_, 8
	note C_, 15
	dec_octave
	note E_, 5
	inc_octave
	note C_, 2
	dec_octave
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note E_, 5
	note G_, 3
	note G_, 5
	note E_, 2
	note F#, 16
	note F#, 14
	note F#, 15
	note F#, 5
	note F#, 3
	note F#, 5
	note F#, 2
	note F#, 15
	note F#, 8
	note F#, 16
	note F#, 4
	note F#, 3
	note F#, 8
	note F#, 7
	note F_, 16
	note F_, 14
	note F_, 15
	note F_, 8
	note F_, 7
	note F_, 16
	note F_, 14
	note F_, 15
	note F_, 8
	note F_, 7
	note F_, 16
	note F_, 14
	note F_, 15
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	note F_, 15
	note F_, 5
	note D_, 15
	note F_, 5
	note F_, 15
	note D_, 5
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 16
	note E_, 10
	note E_, 12
	endchannel


Music_TCG2TitleScreen_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	notetype0 1
	note __, 14
	note __, 14
	notetype0 5
	octave 3
	note D_, 9
	note D_, 1
	note D_, 1
	note D_, 1
	note C_, 9
	note C_, 1
	note C_, 1
	note C_, 1
	dec_octave
	note B_, 9
	note B_, 1
	note B_, 1
	note B_, 1
	note A_, 9
	note A_, 1
	note A_, 1
	note A_, 1
	notetype0 10
	note G_, 12
	note G_, 3
	note F_, 3
	note E_, 3
	note D_, 3
	notetype0 5
	octave 3
	note C_, 6
	note C_, 6
	dec_octave
	note B_, 6
	note B_, 6
	note A_, 6
	note A_, 6
	note G_, 6
	note G_, 6
	note F_, 6
	note F_, 6
	note E_, 6
	note E_, 6
	note D_, 6
	note D_, 6
	note G_, 6
	note A_, 3
	note B_, 3
	inc_octave
	note C_, 6
	note C_, 6
	dec_octave
	note B_, 6
	note B_, 6
	note A_, 6
	note A_, 6
	note G_, 6
	note G_, 6
	note F_, 6
	note F_, 6
	note F_, 6
	note F_, 6
	note A#, 6
	note A#, 6
	note A#, 6
	note A_, 6
	notetype0 5
	note G#, 3
	note G#, 6
	notetype0 1
	note G#, 7
	note G#, 8
	notetype0 5
	note G#, 3
	note G#, 6
	note G#, 3
	note G_, 3
	note G_, 6
	notetype0 1
	note G_, 7
	note G_, 8
	notetype0 5
	note G_, 3
	note G_, 6
	note G_, 3
	note F_, 3
	note F_, 6
	notetype0 1
	note F_, 7
	note F_, 8
	notetype0 5
	note A#, 3
	note A#, 6
	note E_, 3
	note D#, 3
	note D#, 6
	notetype0 1
	note D#, 7
	note D#, 8
	notetype0 5
	note D#, 3
	note D#, 3
	note E_, 6
	note F_, 6
	note F_, 6
	note G#, 6
	note G#, 6
	note G_, 6
	note G_, 6
	note C_, 6
	note C_, 6
	note D_, 6
	note D_, 6
	note D_, 6
	note D_, 6
	note G_, 6
	note G_, 6
	note G_, 6
	note G_, 6
	notetype0 5
	octave 2
.Loop1
	notetype0 5
	note A_, 3
	note A_, 3
	callchannel Branch_1ea254
	notetype0 1
	note A_, 7
	note A_, 8
	loopchannel 2, .Loop1
.Loop2
	notetype0 5
	note G_, 3
	note G_, 3
	callchannel Branch_1ea254
	notetype0 1
	note G_, 7
	note G_, 8
	loopchannel 2, .Loop2
.Loop3
	notetype0 5
	note F_, 3
	note F_, 3
	callchannel Branch_1ea254
	notetype0 1
	note F_, 7
	note F_, 8
	loopchannel 2, .Loop3
	notetype0 5
	note E_, 3
	note E_, 3
	callchannel Branch_1ea254
	notetype0 1
	note E_, 7
	note E_, 8
	notetype0 5
	note E_, 3
	note E_, 3
	callchannel Branch_1ea26d
	notetype0 1
	note E_, 7
	note E_, 8
	notetype0 5
	octave 2
	note G#, 6
	note G#, 6
	note G#, 6
	note G#, 6
	note G_, 6
	note G_, 6
	note G_, 6
	note G_, 6
	note F#, 6
	note F#, 6
	note F#, 6
	note F#, 6
	note G_, 6
	note G_, 6
	note G_, 6
	note G_, 6
	inc_octave
	note C_, 3
	dec_octave
	note G_, 3
	inc_octave
	note C_, 3
	dec_octave
	note G_, 3
	inc_octave
	note C_, 4
	dec_octave
	note G_, 4
	note G_, 4
	notetype0 10
	note C_, 12
	endchannel

Branch_1ea254:
	notetype0 1
	octave 4
	notetype1 1
	note E_, 8
	notetype1 3
	note E_, 7
	notetype1 1
	octave 2
	endchannel

Branch_1ea26d:
	notetype0 1
	octave 4
	notetype1 1
	note G_, 8
	notetype1 3
	note G_, 7
	notetype1 1
	octave 2
	endchannel


Music_TCG2TitleScreen_Ch4: 
	togglenoise $06
	octave 1
	notetype 1
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 3
	note D_, 4
	notetype 5
.Loop1
	note F_, 9
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 4, .Loop1
	notetype 1
	note D_, 5
.Loop2
	note D_, 5
	loopchannel 23, .Loop2
	notetype 10
	note F_, 12
	notetype 1
.Loop3
	note C#, 15
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	loopchannel 15, .Loop3
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
.Loop4
	note C#, 15
	note C#, 15
	note E_, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	loopchannel 7, .Loop4
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
.Loop5
	note C#, 15
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	loopchannel 7, .Loop5
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
.Loop6
	note C#, 15
	note C#, 16
	note C#, 14
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	loopchannel 8, .Loop6
.Loop7
	note C#, 15
	note C#, 15
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	loopchannel 8, .Loop7
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note C#, 15
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note D_, 4
	note C#, 5
	notetype 5
	note C#, 4
	note C#, 4
	note F_, 12
	endchannel

