Music_TCGImakuni:
	db $C0
	dw Music_TCGImakuni_Ch1
	db $01
	dw Music_TCGImakuni_Ch2
	db $02
	dw Music_TCGImakuni_Ch3
	db $03
	dw Music_TCGImakuni_Ch4

Music_TCGImakuni_Ch1: 
	notetype0 3
	vibrato 20, $33
	notetype2 8
	dutycycle 2
	notetype1 10
.MainLoop
.Loop1
	note __, 10
	loopchannel 16, .Loop1
	callchannel Branch_fadf9
	octave 4
	note D_, 15
	dec_octave
	note B_, 7
	note __, 8
	note G_, 7
	note __, 8
	notetype0 9
	note F_, 10
	notetype0 1
	note F_, 7
	note __, 8
	notetype0 9
	note __, 10
	callchannel Branch_fadf9
	callchannel Branch_fae1d
	notetype0 1
	octave 4
	note E_, 7
	note __, 15
	note E_, 3
	note C_, 2
	note E_, 3
	note C_, 15
	dec_octave
	note G#, 15
	note A_, 7
	note __, 8
	notetype0 3
	note __, 15
	notetype0 1
	note __, 15
	note __, 15
	inc_octave
	note E_, 7
	note __, 8
	note F#, 7
	note __, 8
	note G_, 15
	note G_, 7
	note F#, 3
	note G_, 2
	note F#, 3
	note E_, 7
	note __, 8
	note D#, 7
	note __, 8
	note E_, 15
	note C_, 7
	note __, 8
	dec_octave
	note G#, 7
	note __, 8
	notetype0 7
	note F#, 15
	notetype0 9
	note __, 10
	callchannel Branch_fadf9
	callchannel Branch_fae1d
	dec_octave
	notetype0 1
	note F_, 7
	note __, 8
	note B_, 7
	inc_octave
	note C_, 8
	dec_octave
	note G#, 7
	note A_, 8
	note F_, 7
	note __, 8
	note B_, 7
	inc_octave
	note C_, 8
	dec_octave
	note G#, 7
	note A_, 8
	notetype0 3
	note F_, 10
	notetype0 1
	note D#, 7
	note __, 8
	note A_, 7
	note A#, 8
	note F#, 7
	note G_, 8
	note D#, 7
	note __, 8
	note A_, 7
	note A#, 8
	note F#, 7
	note G_, 8
	notetype0 3
	note D#, 10
	notetype0 1
.Loop2
	note D_, 7
	dec_octave
	note A_, 8
	note D_, 7
	note A_, 8
	note D_, 7
	note A_, 8
	inc_octave
	loopchannel 4, .Loop2
	note D_, 7
	dec_octave
	note A_, 8
	note D_, 7
	note A_, 8
	vibrato 5, $33
	notetype0 3
	note D_, 10
	vibrato 20, $33
	loopchannel 0, .MainLoop

Branch_fadf9:
	notetype0 1
	octave 4
	note C#, 7
	note __, 15
	note C#, 3
	note D_, 2
	note C#, 3
	dec_octave
	note A#, 15
	note B_, 15
	inc_octave
	note D_, 7
	note __, 8
	notetype0 5
	note __, 9
	notetype0 1
	note __, 15
	note __, 15
	note D_, 7
	note __, 8
	note E_, 7
	note __, 8
	note F_, 15
	note F_, 7
	note E_, 3
	note F_, 2
	note E_, 3
	note D_, 7
	note __, 8
	note C#, 7
	note __, 8
	endchannel

Branch_fae1d:
	octave 4
	note D_, 7
	note __, 8
	dec_octave
	note G_, 7
	note __, 8
	inc_octave
	note G_, 7
	note __, 8
	notetype0 9
	note F_, 10
	notetype0 1
	note F_, 7
	note __, 8
	notetype0 9
	note __, 10
	endchannel


Music_TCGImakuni_Ch2: 
	vibrato 0, $33
	notetype2 8
	dutycycle 1
	notetype1 10
.Loop1
	callchannel Branch_faea5
	loopchannel 6, .Loop1
.Loop2
	rept 2
	notetype0 3
	note __, 10
	notetype0 1
	note C_, 7
	note __, 8
	endr
	note __, 15
	note C_, 7
	note __, 8
	notetype0 3
	note __, 10
	notetype0 1
	note C_, 7
	note __, 8
	note __, 15
	notetype0 3
	note __, 10
	vibrato 8, $33
	note C_, 10
	vibrato 0, $33
	loopchannel 2, .Loop2
.Loop3
	callchannel Branch_faea5
	loopchannel 2, .Loop3
	notetype0 1
	octave 2
	note F_, 15
	note F_, 7
	inc_octave
	note F_, 8
	note D#, 7
	note __, 8
	note __, 15
	note G#, 7
	note A_, 8
	note F_, 7
	note D#, 8
	notetype0 3
	note __, 10
	notetype0 1
	dec_octave
	note D#, 15
	note D#, 7
	inc_octave
	note D#, 8
	note C#, 7
	note __, 8
	note __, 15
	note F#, 7
	note G_, 8
	note D#, 7
	note C#, 8
	notetype0 3
	note __, 10
	notetype0 1
.Loop4
	note D_, 7
	note __, 8
	rept 2
	note __, 15
	endr
	loopchannel 4, .Loop4
	note D_, 7
	note __, 8
	note __, 15
	vibrato 5, $33
	note D_, 15
	note D_, 7
	note __, 8
	vibrato 0, $33
	loopchannel 0, Music_TCGImakuni_Ch2

Branch_faea5:
	octave 3
	notetype0 6
	note __, 10
	notetype0 1
	rept 2
	note __, 15
	note C#, 7
	note __, 8
	endr
	vibrato 8, $33
	notetype0 9
	note __, 10
	notetype0 3
	note C#, 10
	vibrato 0, $33
	endchannel


Music_TCGImakuni_Ch3: 
	notetype1 1
	notetype2 11
	vibrato 0, $33
.MainLoop
	callchannel Branch_faf7d
	vibrato 8, $33
	notetype0 1
	note D_, 15
	note D_, 7
	inc_octave
	vibrato 0, $33
	note G_, 3
	dec_octave
	note G_, 2
	dec_octave
	note G_, 3
	callchannel Branch_faf7d
	vibrato 8, $33
	note D_, 10
	vibrato 0, $33
.Loop1
	callchannel Branch_faf7d
	vibrato 8, $33
	note D_, 10
	vibrato 0, $33
	loopchannel 4, .Loop1
.Loop2
	octave 3
	notetype0 3
	note C_, 5
	note __, 5
	inc_octave
	notetype0 1
	note E_, 7
	note __, 8
	dec_octave
	notetype0 3
	note G#, 5
	note A_, 5
	inc_octave
	notetype0 1
	note D#, 7
	note __, 8
	note __, 15
	note D#, 7
	note __, 8
	notetype0 3
	note __, 5
	dec_octave
	note C_, 5
	inc_octave
	notetype0 1
	note E_, 7
	note __, 8
	dec_octave
	notetype0 3
	note G#, 5
	note A_, 5
	note __, 5
	inc_octave
	vibrato 8, $33
	note D#, 10
	vibrato 0, $33
	loopchannel 2, .Loop2
.Loop3
	callchannel Branch_faf7d
	vibrato 8, $33
	note D_, 10
	vibrato 0, $33
	loopchannel 2, .Loop3
	notetype0 1
	octave 2
	note F_, 15
	note F_, 7
	inc_octave
	note F_, 8
	note D#, 7
	note __, 8
	note F_, 7
	note __, 8
	note G#, 7
	note A_, 8
	note F_, 7
	note D#, 8
	vibrato 5, $33
	notetype0 3
	note F_, 10
	vibrato 0, $33
	notetype0 1
	dec_octave
	note D#, 15
	note D#, 7
	inc_octave
	note D#, 8
	note C#, 7
	note __, 8
	note D#, 7
	note __, 8
	note F#, 7
	note G_, 8
	note D#, 7
	note C#, 8
	vibrato 5, $33
	notetype0 3
	note D#, 10
	vibrato 0, $33
	notetype0 1
.Loop4
	octave 4
	note C_, 7
	note __, 8
	octave 2
	note D_, 7
	note __, 8
	note D_, 7
	note __, 8
	loopchannel 4, .Loop4
	octave 4
	note C_, 7
	note __, 8
	octave 2
	note D_, 7
	note __, 8
	octave 4
	vibrato 5, $33
	note C_, 15
	note C_, 7
	inc_octave
	vibrato 0, $33
	note G_, 3
	dec_octave
	note G_, 2
	dec_octave
	note G_, 3
	notetype0 8
	loopchannel 0, .MainLoop

Branch_faf7d:
	notetype0 3
	octave 2
	note G_, 5
	note __, 5
	inc_octave
	notetype0 1
	note G_, 7
	note __, 8
	notetype0 3
	note C#, 5
	note D_, 5
	inc_octave
	notetype0 1
	note D_, 7
	note __, 8
	note __, 15
	note D_, 7
	note __, 8
	notetype0 3
	note __, 5
	octave 2
	note G_, 5
	inc_octave
	notetype0 1
	note G_, 7
	note __, 8
	notetype0 3
	note C#, 5
	note D_, 5
	note __, 5
	inc_octave
	endchannel


Music_TCGImakuni_Ch4: 
	togglenoise $06
.MainLoop
	notetype 1
	octave 1
.Loop1
	note C_, 15
	note D#, 7
	note C_, 8
	note C#, 15
	note C_, 15
	note D#, 7
	note D#, 8
	note E_, 15
	note D#, 7
	note D#, 8
	note E_, 15
	note D#, 15
	note C_, 15
	note C#, 15
	note E_, 15
	note C_, 7
	note D#, 8
	note C#, 15
	note C#, 15
	note D#, 7
	note C#, 8
	loopchannel 10, .Loop1
.Loop2
	notetype 11
	note F_, 2
	notetype 1
	note C#, 8
	note C#, 15
	note C#, 15
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	notetype 3
	note F_, 10
	loopchannel 2, .Loop2
	notetype 1
	note C#, 15
	note D#, 7
	note C#, 8
	note E_, 15
	note C#, 15
	note D#, 7
	note C#, 8
	note E_, 15
	note C#, 15
	note D#, 7
	note C#, 8
	note E_, 15
	note C#, 15
	note D#, 7
	note C#, 8
	note E_, 15
	note C#, 15
	note D#, 4
	note D#, 4
	note C#, 7
	note C#, 15
	note C#, 15
	loopchannel 0, .MainLoop

