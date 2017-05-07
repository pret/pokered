Music_TCGClub1:
	db $C0
	dw Music_TCGClub1_Ch1
	db $01
	dw Music_TCGClub1_Ch2
	db $02
	dw Music_TCGClub1_Ch3
	db $03
	dw Music_TCGClub1_Ch4

Music_TCGClub1_Ch1: 
	notetype0 5
	vibrato 20, $33
	notetype2 8
	octave 3
	dutycycle 0
	notetype1 9
	notetype2 8
	note C#, 2
	dec_octave
	note A_, 2
	inc_octave
	note C#, 2
	note A_, 2
	dutycycle 2
	notetype1 7
	inc_octave
	notetype0 1
	note C#, 8
	notetype1 2
	note C#, 2
	notetype1 6
	note A_, 4
	notetype1 7
	note A_, 4
	notetype1 2
	note A_, 2
	dec_octave
	dutycycle 0
	notetype1 9
	notetype0 5
	note C#, 2
	dec_octave
	note A#, 2
	inc_octave
	note C#, 2
	note A#, 2
	dutycycle 2
	notetype1 7
	inc_octave
	notetype0 1
	note C#, 8
	notetype1 2
	note C#, 2
	notetype0 5
	notetype1 8
	dec_octave
	note B_, 1
	inc_octave
	note C_, 1
	vibrato 10, $33
	note C#, 4
	dec_octave
	vibrato 20, $33
	note A_, 2
	inc_octave
	note C#, 4
	dec_octave
	note B_, 2
	notetype1 2
	note B_, 2
	note __, 2
	dutycycle 0
	notetype1 9
	notetype2 8
	note E_, 6
	note __, 2
.MainLoop
	dutycycle 0
	notetype1 10
	octave 3
	note __, 6
	note A_, 4
	note E_, 2
	note A_, 4
	note B_, 2
	inc_octave
	note C_, 4
	note C#, 8
	notetype1 4
	note C#, 4
	notetype1 10
	note C#, 2
	note D_, 4
	note E_, 2
	notetype1 4
	note E_, 2
	note __, 2
	notetype1 10
	note D#, 1
	note E_, 7
	note D_, 6
	dec_octave
	note A_, 4
	note F#, 2
	notetype1 4
	note F#, 2
	note __, 2
	inc_octave
	notetype1 10
	note C_, 1
	note C#, 3
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 2
	note C_, 4
	dec_octave
	note B_, 6
	notetype1 9
	note D_, 4
	note __, 2
	dec_octave
	note A_, 2
	dutycycle 2
	notetype1 5
	inc_octave
	inc_octave
	inc_octave
	note C_, 1
	note C#, 5
	dec_octave
	dec_octave
	dutycycle 0
	notetype1 10
	note A_, 4
	note E_, 2
	note A_, 4
	note B_, 2
	inc_octave
	note C_, 4
	note C#, 6
	dec_octave
	dec_octave
	notetype1 9
	note A#, 1
	note __, 5
	inc_octave
	inc_octave
	notetype1 10
	note C#, 2
	note D_, 4
	note E_, 2
	notetype1 4
	note E_, 2
	note __, 2
	notetype1 10
	note D#, 1
	note E_, 7
	note D_, 6
	dec_octave
	note A_, 4
	note F#, 2
	notetype1 4
	note F#, 2
	note __, 2
	notetype1 10
	inc_octave
	note C_, 1
	note C#, 3
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 2
	note C_, 4
	dec_octave
	note B_, 8
	notetype1 4
	note B_, 4
	notetype1 10
	note E_, 2
	note F_, 1
	note F#, 5
	note A_, 6
	note B_, 4
	note A_, 2
	notetype1 4
	note A_, 2
	note __, 2
	notetype1 10
	note E_, 1
	note F_, 7
	note A_, 6
	note B_, 4
	note A_, 2
	notetype1 4
	note A_, 2
	note __, 2
	inc_octave
	notetype1 10
	note C_, 1
	note C#, 5
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 4
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 4
	note C_, 2
	note C#, 4
	dec_octave
	note F#, 2
	notetype1 4
	note F#, 2
	note __, 2
	inc_octave
	notetype1 10
	note D#, 1
	note E_, 5
	note D_, 6
	note C#, 4
	notetype1 4
	note C#, 2
	notetype1 10
	note C_, 1
	note C#, 7
	dec_octave
	note A_, 4
	note F#, 2
	note A_, 4
	note F#, 2
	notetype1 4
	note F#, 2
	note __, 2
	notetype1 10
	inc_octave
	note C_, 1
	note C#, 5
	note D_, 1
	note C#, 1
	dec_octave
	note A_, 4
	note F#, 2
	note A_, 4
	note F#, 2
	notetype1 4
	note F#, 2
	note __, 2
	inc_octave
	notetype1 10
	note C_, 1
	note C#, 5
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 4
	notetype1 4
	note C#, 2
	notetype1 10
	note C#, 4
	dec_octave
	note A_, 2
	inc_octave
	note C#, 4
	dec_octave
	note B_, 14
	dutycycle 2
	notetype1 6
	note G#, 2
	note B_, 1
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 6
	note E_, 1
	notetype1 3
	note E_, 1
	notetype1 6
	note G#, 1
	notetype1 3
	note G#, 1
	notetype1 6
	note B_, 1
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 6
	note E_, 1
	notetype1 3
	note E_, 1
	loopchannel 0, .MainLoop


Music_TCGClub1_Ch2: 
	notetype0 5
	vibrato 20, $33
	notetype2 7
	octave 2
	dutycycle 0
	notetype1 9
	notetype2 8
	note A_, 2
	note E_, 2
	note A_, 2
	inc_octave
	note C#, 2
	dutycycle 2
	notetype1 5
	notetype0 1
	note A_, 8
	note __, 2
	inc_octave
	note C#, 8
	note __, 2
	notetype0 5
	dutycycle 0
	notetype1 9
	dec_octave
	dec_octave
	note A#, 2
	note E_, 2
	note A#, 2
	inc_octave
	note C#, 2
	dutycycle 2
	notetype1 5
	notetype0 1
	note A#, 8
	note __, 2
	dec_octave
	notetype0 5
	dutycycle 0
	notetype1 9
	note G_, 1
	note G#, 1
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	note F#, 2
	note G#, 3
	note __, 3
	notetype1 9
	note B_, 6
	note __, 2
.MainLoop
	octave 2
	note __, 4
	inc_octave
	notetype1 9
	note C#, 5
	note __, 7
	note C#, 4
	note __, 2
	note C#, 2
	note __, 4
	dec_octave
	note A#, 2
	dutycycle 2
	notetype1 5
	octave 5
	note C#, 1
	note D_, 3
	note C#, 2
	dec_octave
	note A#, 4
	dec_octave
	dutycycle 0
	notetype1 9
	note E_, 4
	note __, 2
	dutycycle 2
	notetype1 5
	octave 5
	note C_, 1
	note C#, 5
	dutycycle 0
	notetype1 9
	octave 3
	note D_, 2
	dutycycle 2
	notetype1 5
	inc_octave
	note A_, 4
	note F#, 2
	note E_, 4
	note D_, 2
	note __, 4
	note E_, 4
	note __, 2
	note E_, 2
	note __, 4
	note E_, 2
	note F#, 4
	note A_, 2
	note B_, 4
	note A_, 2
	note __, 2
	dutycycle 0
	notetype1 9
	note __, 2
	dec_octave
	note C#, 2
	notetype1 6
	note C#, 4
	notetype1 3
	note C#, 4
	note __, 2
	notetype1 9
	note C#, 2
	notetype1 6
	note D#, 4
	note E_, 6
	notetype1 3
	note E_, 2
	inc_octave
	inc_octave
	dutycycle 2
	notetype1 5
	note C#, 1
	note D_, 3
	note C#, 2
	dec_octave
	note A#, 4
	note F#, 2
	note __, 4
	inc_octave
	note C_, 1
	note C#, 5
	dec_octave
	dec_octave
	dutycycle 0
	notetype1 9
	note D_, 2
	dutycycle 2
	notetype1 5
	inc_octave
	note A_, 4
	note F#, 2
	note E_, 4
	note D_, 2
	note __, 4
	note D#, 1
	note E_, 3
	note __, 2
	note E_, 2
	note D#, 4
	note D_, 6
	dec_octave
	dutycycle 0
	notetype1 9
	note D_, 4
	note __, 2
	dec_octave
	note A_, 2
	note __, 4
	note A_, 2
	dutycycle 2
	notetype1 5
	inc_octave
	inc_octave
	note F_, 1
	note F#, 3
	note D_, 2
	note C#, 4
	dec_octave
	dutycycle 0
	notetype1 9
	note D_, 4
	note __, 2
	dec_octave
	note A_, 2
	note __, 4
	note A_, 2
	inc_octave
	inc_octave
	dutycycle 2
	notetype1 5
	note E_, 1
	note F_, 3
	note D_, 2
	note C#, 4
	dec_octave
	dutycycle 0
	notetype1 9
	note D_, 4
	note __, 2
	dec_octave
	note A_, 2
	note __, 4
	note B_, 2
	inc_octave
	dutycycle 2
	notetype1 5
	note E_, 4
	note G#, 2
	note B_, 4
	inc_octave
	note E_, 2
	note __, 4
	dec_octave
	dutycycle 0
	notetype1 6
	note A#, 2
	notetype1 3
	note A#, 2
	note __, 2
	inc_octave
	notetype1 6
	note C_, 1
	note C#, 5
	dec_octave
	note B_, 6
	note A#, 4
	note __, 2
	note G#, 1
	note A_, 5
	notetype1 9
	note D_, 2
	notetype1 6
	note F#, 4
	note D_, 2
	note F#, 4
	dec_octave
	notetype1 9
	note A_, 4
	note __, 2
	notetype1 6
	inc_octave
	note G#, 1
	note A_, 5
	notetype1 9
	note D_, 2
	notetype1 6
	note F#, 4
	note D_, 2
	note F#, 4
	dec_octave
	notetype1 9
	note A_, 4
	note __, 2
	inc_octave
	notetype1 6
	note G#, 1
	note A_, 5
	notetype1 9
	note D_, 2
	notetype1 6
	note A_, 4
	note __, 2
	note A_, 4
	dec_octave
	notetype1 9
	note A_, 2
	inc_octave
	notetype1 6
	note A_, 4
	note G#, 12
	dec_octave
	notetype1 9
	note A_, 4
	note __, 2
	note B_, 4
	note __, 2
	inc_octave
	note D_, 2
	loopchannel 0, .MainLoop


Music_TCGClub1_Ch3: 
	notetype0 5
	notetype1 1
	notetype2 11
	octave 2
	note A_, 2
	note __, 2
	note E_, 2
	note A_, 2
	note __, 4
	note A#, 2
	note __, 2
	note E_, 2
	note A#, 2
	note __, 4
	note B_, 2
	note B_, 2
	note F#, 2
	note F_, 2
	inc_octave
	note D_, 2
	dec_octave
	note E_, 2
	note __, 4
	inc_octave
	note E_, 6
	dec_octave
	note E_, 2
.MainLoop
	octave 2
	note A_, 4
	inc_octave
	note A_, 2
	dec_octave
	note C#, 6
	note E_, 4
	inc_octave
	note A_, 2
	dec_octave
	note F_, 4
	inc_octave
	note A#, 2
	dec_octave
	note F#, 4
	inc_octave
	note F#, 2
	note C#, 6
	dec_octave
	note A#, 4
	inc_octave
	inc_octave
	note C#, 2
	dec_octave
	dec_octave
	note F#, 6
	callchannel Branch_fa01a
	octave 2
	note A_, 4
	inc_octave
	note A_, 2
	dec_octave
	note C#, 6
	note E_, 4
	inc_octave
	note A_, 2
	dec_octave
	note F_, 4
	inc_octave
	inc_octave
	note C#, 2
	dec_octave
	dec_octave
	note F#, 4
	inc_octave
	note F#, 2
	note C#, 6
	dec_octave
	note A#, 4
	inc_octave
	inc_octave
	note E_, 2
	dec_octave
	dec_octave
	note F#, 6
	callchannel Branch_fa01a
	octave 2
	note D_, 4
	inc_octave
	note F#, 2
	dec_octave
	note D_, 4
	note __, 2
	note D_, 4
	inc_octave
	note A_, 2
	dec_octave
	note D_, 4
	inc_octave
	note F#, 2
	dec_octave
	note D_, 4
	inc_octave
	note F_, 2
	dec_octave
	note D_, 4
	note __, 2
	note D_, 4
	inc_octave
	note A_, 2
	dec_octave
	note D_, 4
	inc_octave
	note F_, 2
	dec_octave
	note C#, 4
	inc_octave
	note E_, 2
	dec_octave
	note C#, 6
	note E_, 4
	inc_octave
	inc_octave
	note E_, 2
	dec_octave
	dec_octave
	note F_, 6
	note F#, 4
	inc_octave
	note A#, 2
	note C#, 6
	dec_octave
	note A#, 4
	inc_octave
	note F#, 2
	dec_octave
	note F#, 6
	note B_, 4
	inc_octave
	note A_, 2
	dec_octave
	note F#, 6
	note A_, 4
	inc_octave
	note F#, 2
	dec_octave
	note A#, 4
	inc_octave
	inc_octave
	note D_, 2
	dec_octave
	dec_octave
	note B_, 4
	inc_octave
	note A_, 2
	dec_octave
	note F#, 6
	note D_, 4
	inc_octave
	note F#, 2
	dec_octave
	note F#, 6
	note E_, 4
	inc_octave
	note A_, 2
	dec_octave
	note E_, 6
	note E_, 4
	inc_octave
	note F#, 2
	dec_octave
	note E_, 4
	inc_octave
	note F#, 2
	note E_, 4
	note G#, 2
	dec_octave
	note E_, 4
	inc_octave
	note F#, 2
	dec_octave
	note F#, 4
	inc_octave
	note G#, 2
	dec_octave
	note G#, 4
	inc_octave
	note B_, 2
	loopchannel 0, .MainLoop

Branch_fa01a:
	octave 2
	note B_, 4
	inc_octave
	note A_, 2
	dec_octave
	note C#, 6
	note D_, 4
	inc_octave
	note F#, 2
	dec_octave
	note D#, 6
	note E_, 4
	inc_octave
	note B_, 2
	dec_octave
	note B_, 6
	note G#, 4
	inc_octave
	note B_, 2
	dec_octave
	note E_, 4
	inc_octave
	note E_, 2
	endchannel


Music_TCGClub1_Ch4: 
	togglenoise $06
	notetype 5
	octave 1
	note C_, 2
	note __, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note C_, 2
	note __, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note C#, 4
	note D_, 1
	note D_, 1
	note C#, 4
	note C#, 2
	note __, 4
	note D_, 1
	note D_, 1
	note C#, 4
	note C#, 2
.MainLoop
	callchannel Branch_fa06f
	note C_, 4
.Loop1
	note C#, 2
	loopchannel 4, .Loop1
	callchannel Branch_fa06f
	note C_, 4
	note D_, 1
	note D_, 1
	note C#, 4
	note C#, 2
	loopchannel 0, .MainLoop

Branch_fa06f:
.Loop2
	note C_, 4
	note D#, 2
	note C#, 4
	note D#, 2
	loopchannel 15, .Loop2
	endchannel

