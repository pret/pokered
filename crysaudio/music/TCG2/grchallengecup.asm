Music_TCG2GRChallengeCup:
	db $C0
	dw Music_TCG2GRChallengeCup_Ch1
	db $01
	dw Music_TCG2GRChallengeCup_Ch2
	db $02
	dw Music_TCG2GRChallengeCup_Ch3
	db $03
	dw Music_TCG2GRChallengeCup_Ch4

Music_TCG2GRChallengeCup_Ch2: 
	notetype1 10
	notetype0 1
	octave 4
	vibrato 24, $33
	note C_, 4
	note C#, 4
	note D_, 4
	note D#, 4
	note E_, 15
	note E_, 15
	note E_, 8
	note E_, 7
	note E_, 5
	note E_, 3
	note F_, 5
	note E_, 2
	note G_, 15
	note G_, 5
	note F_, 15
	note F_, 5
	note D_, 15
	note D_, 5
	note E_, 15
	note E_, 15
	note E_, 8
	note E_, 7
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
	note E_, 15
	note E_, 8
	note E_, 7
	note A_, 5
	note E_, 5
	note E_, 5
	note A_, 5
	note A_, 5
	note E_, 5
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
	notetype1 2
	notetype0 6
	note A_, 10
	notetype0 1
	note A_, 15
	note A_, 10
	notetype1 10
	note A_, 5
	note A_, 15
	note A_, 15
.Loop1
	octave 2
	notetype2 8
	note E_, 5
	note E_, 10
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note E_, 15
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	loopchannel 2, .Loop1
.MainLoop
.Loop2
	octave 2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	note F_, 15
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	loopchannel 2, .Loop2
.Loop3
	octave 2
	notetype2 8
	note F#, 5
	note F#, 10
	note F#, 5
	note F#, 3
	note F#, 5
	note F#, 2
	note F#, 15
	note F#, 5
	note F#, 3
	note F#, 5
	note F#, 2
	loopchannel 2, .Loop3
	octave 2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	note F_, 15
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	octave 2
	notetype2 8
	note F_, 5
	note F_, 10
	note F_, 5
	note F_, 3
	note F_, 5
	note F_, 2
	vibrato 15, $33
	octave 3
	note E_, 15
	note E_, 8
	note E_, 5
	note E_, 2
	inc_octave
	vibrato 30, $33
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 8
	note E_, 7
	dec_octave
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
	vibrato 15, $33
	note D_, 15
	note D_, 15
	note D_, 15
	note C_, 8
	note D_, 7
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note A_, 8
	note B_, 7
	inc_octave
	note C_, 15
	note C_, 15
	note C_, 15
	vibrato 0, $33
	note C_, 8
	note C_, 7
	dec_octave
	note B_, 15
	note A_, 8
	note B_, 7
	note G_, 8
	note A_, 7
	note B_, 8
	note G_, 7
	vibrato 30, $33
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 15
	note E_, 15
	note E_, 8
	note E_, 5
	note E_, 2
	inc_octave
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 8
	note E_, 7
	dec_octave
	note A_, 15
	note B_, 15
	inc_octave
	note C_, 15
	vibrato 15, $33
	note D_, 15
	note D_, 15
	note D_, 15
	note C_, 8
	note D_, 7
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note A_, 8
	note B_, 7
	vibrato 0, $33
	inc_octave
	note C_, 15
	note C_, 8
	note C_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	note D_, 15
	note D_, 5
	note G_, 15
	note G_, 5
	note D_, 15
	note D_, 5
	vibrato 15, $33
	note F_, 15
	note F_, 15
	note F_, 15
	note E_, 8
	note F_, 7
	note E_, 15
	note E_, 15
	note E_, 15
	note F_, 8
	note G_, 7
	note A_, 15
	note A_, 15
	note A_, 15
	note A_, 8
	note A_, 7
	note A_, 15
	note G_, 8
	note A_, 7
	note F_, 8
	note G_, 7
	note A_, 8
	note F_, 7
	note G_, 15
	note G_, 8
	note C_, 5
	note G_, 2
	vibrato 0, $33
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 15
	note D_, 8
	note E_, 7
	vibrato 15, $33
	note F_, 15
	note F_, 15
	note F_, 15
	note F_, 8
	note F_, 7
	note F_, 15
	note E_, 8
	note F_, 7
	note D_, 8
	note E_, 7
	note F_, 8
	note D_, 7
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	dec_octave
	note A_, 8
	note B_, 7
	inc_octave
	note C_, 15
	note C_, 15
	note C_, 15
	note C_, 8
	note C_, 7
	note D_, 15
	note C_, 8
	note D_, 7
	dec_octave
	note B_, 8
	inc_octave
	note C_, 7
	dec_octave
	note A_, 8
	note B_, 7
	note G_, 15
	note G_, 15
	inc_octave
	note G_, 15
	note G_, 15
	note G_, 15
	note G_, 15
	note F_, 15
	note F_, 8
	note E_, 5
	note F_, 2
	note E_, 15
	note E_, 15
	note E_, 8
	note F_, 7
	note E_, 5
	note F_, 3
	note C_, 5
	note E_, 2
	dec_octave
	note A_, 15
	note A_, 5
	inc_octave
	note C_, 15
	note D_, 5
	note D_, 15
	note D_, 5
	note C_, 15
	note C_, 15
	note C_, 15
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	note A_, 3
	note B_, 15
	note B_, 15
	note B_, 15
	inc_octave
	note C_, 8
	note D_, 7
	vibrato 30, $33
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	note E_, 15
	loopchannel 0, .MainLoop


Music_TCG2GRChallengeCup_Ch1: 
	notetype1 10
	notetype0 1
	octave 3
	vibrato 24, $33
	note G_, 4
	note G#, 4
	note A_, 4
	note A#, 4
	inc_octave
	note C#, 15
	note C#, 15
	note C#, 8
	note C#, 7
	note C#, 5
	note C#, 3
	note C#, 5
	note C#, 2
	note D_, 15
	note D_, 5
	note D_, 15
	note D_, 5
	dec_octave
	note A#, 15
	note A#, 5
	inc_octave
	note C#, 15
	note C#, 15
	note C#, 8
	note C#, 7
	note C#, 5
	note C#, 3
	note C#, 5
	note C#, 2
	dec_octave
	note B_, 15
	note B_, 5
	note G_, 15
	note G_, 5
	note B_, 15
	note B_, 5
	inc_octave
	note C_, 15
	note C_, 8
	note C_, 7
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note C_, 5
	note D_, 15
	note D_, 5
	dec_octave
	note B_, 15
	note B_, 5
	inc_octave
	note D_, 15
	note D_, 5
	notetype1 2
	notetype0 6
	note C#, 10
	notetype0 1
	note C#, 15
	note C#, 10
	notetype1 9
	note C#, 5
	note C#, 15
	note C#, 15
.Loop1
	octave 1
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	inc_octave
	note B_, 15
	dec_octave
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	loopchannel 2, .Loop1
.MainLoop
.Loop2
	octave 1
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	inc_octave
	note B_, 15
	dec_octave
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	loopchannel 5, .Loop2
	octave 1
	notetype2 8
	note A_, 5
	note A_, 10
	note A_, 5
	note A_, 3
	note A_, 5
	note A_, 2
	inc_octave
	note B_, 15
	note B_, 8
	dec_octave
	notetype1 8
	octave 2
	note A_, 5
	note __, 2
	inc_octave
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note __, 15
	note __, 15
	note E_, 15
	callchannel Branch_1f3140
	note G_, 15
	note F#, 15
	note F#, 15
	callchannel Branch_1f3140
	note F#, 8
	note __, 7
	note F#, 15
	note F#, 15
	callchannel Branch_1f3140
	note F#, 5
	note __, 3
	note F#, 5
	note __, 2
	note F_, 15
	note F_, 15
	callchannel Branch_1f3140
	note F_, 8
	note __, 7
	note D_, 15
	note C_, 8
	note __, 7
	callchannel Branch_1f3140
	note D_, 8
	note __, 7
	note E_, 15
	note E_, 15
	callchannel Branch_1f3140
	note __, 15
	note __, 8
	callchannel Branch_1f3150
	note __, 15
	dec_octave
	note A_, 15
	note __, 8
	note A_, 7
	inc_octave
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note __, 15
	note __, 15
	note E_, 15
	callchannel Branch_1f3140
	note G_, 15
	note F#, 15
	note F#, 15
	callchannel Branch_1f3140
	note F#, 8
	note __, 7
	note F#, 15
	note F#, 15
	callchannel Branch_1f3140
	note F#, 5
	note __, 3
	note F#, 5
	note __, 2
	note F_, 15
	note F_, 8
	note __, 7
	callchannel Branch_1f3140
	note __, 8
	note __, 7
	note B_, 15
	note __, 5
	note B_, 10
	callchannel Branch_1f3140
	note __, 15
	inc_octave
	note C_, 15
	note C_, 15
	callchannel Branch_1f3140
	octave 3
	note G_, 8
	note F_, 7
	note G_, 15
	note G_, 15
	callchannel Branch_1f3140
	note A_, 8
	note A#, 7
	inc_octave
	note C_, 15
	note C_, 15
	callchannel Branch_1f3140
	octave 4
	note C_, 8
	note __, 7
	dec_octave
	note B_, 15
	note B_, 8
	note __, 7
	callchannel Branch_1f3140
	octave 4
	note D_, 8
	note __, 7
	note C_, 15
	note __, 8
	dec_octave
	note G_, 5
	note __, 2
	note G_, 15
	note G_, 15
	note G_, 8
	callchannel Branch_1f3150
	note __, 8
	note __, 7
	callchannel Branch_1f3140
	octave 3
	note F_, 8
	note G_, 7
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note A_, 8
	note __, 7
	note G#, 13
	note __, 2
	note G#, 8
	note __, 7
	callchannel Branch_1f3140
	note G#, 8
	note __, 7
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note __, 15
	note __, 8
	callchannel Branch_1f3150
	note __, 15
	callchannel Branch_1f3140
	note E_, 8
	note G_, 7
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note A_, 8
	note __, 7
	note B_, 15
	note A_, 5
	note __, 10
	callchannel Branch_1f3140
	note F_, 8
	note __, 7
	note E_, 15
	note E_, 15
	inc_octave
	notetype1 6
	note D_, 15
	note D_, 15
	notetype1 6
	note C#, 15
	note C#, 15
	callchannel Branch_1f3140
	note __, 8
	dec_octave
	note G_, 5
	note __, 2
	note A_, 15
	note A_, 15
	callchannel Branch_1f3140
	note A_, 8
	note F_, 7
	note D_, 15
	note __, 5
	note F_, 10
	callchannel Branch_1f3140
	note __, 15
	note G_, 15
	note G_, 15
	callchannel Branch_1f3140
	note G_, 4
	note D_, 4
	note C_, 4
	note D_, 3
	note D_, 15
	note D_, 15
	note __, 15
	note G#, 8
	note B_, 7
	note A_, 15
	note A_, 15
	octave 2
	note B_, 15
	notetype2 8
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note E_, 5
	note E_, 10
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	note B_, 15
	note E_, 5
	note E_, 3
	note E_, 5
	note E_, 2
	loopchannel 0, .MainLoop

Branch_1f3140:
	octave 2
	note E_, 15
	octave 3
	endchannel

Branch_1f3150:
	octave 2
	note G_, 4
	note G_, 3
	notetype1 8
	octave 3
	endchannel


Music_TCG2GRChallengeCup_Ch3: 
	notetype1 10
	notetype0 1
	notetype2 11
	notetype1 1
	octave 5
	note __, 16
	octave 2
	note A_, 15
	note A_, 15
	note A_, 8
	note __, 7
	note A_, 5
	note __, 3
	note A_, 5
	note __, 2
	note A#, 15
	note __, 5
	note A#, 15
	note __, 5
	note A#, 15
	note __, 5
	note A_, 15
	note A_, 15
	note A_, 8
	note __, 7
	note A_, 5
	note __, 3
	note A_, 5
	note __, 2
	note G_, 15
	note __, 5
	note G_, 15
	note __, 5
	note G_, 15
	note __, 5
	note F_, 15
	note F_, 15
	note F_, 8
	note __, 7
	note F_, 5
	note __, 3
	note F_, 5
	note __, 2
	note G_, 15
	note __, 5
	note G_, 15
	note __, 5
	note G_, 15
	note __, 5
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 10
	note __, 16
	note __, 14
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
.MainLoop
	octave 2
.Loop1
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	octave 2
	note A_, 8
	note A_, 7
	loopchannel 3, .Loop1
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 8
	octave 4
	note C_, 4
	note __, 3
	octave 2
	note F#, 15
	note G_, 15
	note G#, 15
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note B_, 15
	note B_, 8
	note B_, 7
	callchannel Branch_1f333b
	note B_, 8
	note B_, 7
	inc_octave
	note C_, 15
	note C_, 8
	note C_, 7
	callchannel Branch_1f333b
	octave 3
	note C_, 8
	dec_octave
	note G_, 7
	note C_, 8
	inc_octave
	inc_octave
	note E_, 4
	note __, 3
	dec_octave
	dec_octave
	note C_, 8
	note C_, 7
	note D_, 15
	note E_, 15
	note F_, 15
	note F_, 8
	note F_, 7
	callchannel Branch_1f333b
	note F_, 8
	note F_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	callchannel Branch_1f333b
	note F_, 8
	note F_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	callchannel Branch_1f333b
	note E_, 8
	note E_, 7
	note E_, 8
	inc_octave
	inc_octave
	note C_, 4
	note __, 3
	dec_octave
	dec_octave
	note E_, 8
	note E_, 7
	callchannel Branch_1f333b
	note E_, 8
	note E_, 7
	note D_, 15
	note D_, 8
	note D_, 7
	callchannel Branch_1f333b
	note D_, 8
	note D_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	callchannel Branch_1f333b
	note E_, 8
	note E_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note G_, 8
	inc_octave
	inc_octave
	note C_, 4
	note __, 3
	dec_octave
	dec_octave
	note G_, 8
	note G_, 7
	callchannel Branch_1f333b
	note G_, 8
	note G_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	callchannel Branch_1f333b
	note F_, 8
	note F_, 7
	note F_, 15
	note F_, 8
	note F_, 7
	callchannel Branch_1f333b
	note F_, 8
	note F_, 7
	note E_, 15
	note E_, 8
	note E_, 7
	callchannel Branch_1f333b
	note E_, 8
	note E_, 7
	note D#, 8
	inc_octave
	inc_octave
	note C#, 4
	note __, 3
	dec_octave
	dec_octave
	note D#, 8
	note D#, 7
	callchannel Branch_1f333b
	note D#, 8
	note D#, 7
	note D_, 15
	note D_, 8
	note D_, 7
	callchannel Branch_1f333b
	note D_, 8
	note D_, 7
	note D_, 15
	note D_, 8
	note D_, 7
	callchannel Branch_1f333b
	note D_, 8
	note D_, 7
	note G_, 15
	note G_, 8
	note G_, 7
	callchannel Branch_1f333b
	inc_octave
	note D_, 8
	note D_, 7
	note G_, 15
	dec_octave
	note G_, 15
	note G#, 15
	inc_octave
	note G#, 15
	dec_octave
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	note A_, 15
	note A_, 8
	note A_, 7
	callchannel Branch_1f333b
	note A_, 8
	note A_, 7
	loopchannel 0, .MainLoop

Branch_1f333b:
	octave 3
	notetype1 2
	note A_, 15
	notetype1 1
	octave 2
	endchannel


Music_TCG2GRChallengeCup_Ch4: 
	togglenoise $06
	notetype 1
	octave 1
	note __, 16
.Loop1
	note C#, 16
	note __, 16
	note __, 13
	note C#, 5
	note C#, 5
	note C#, 5
	note C#, 16
	note __, 4
	note C#, 16
	note __, 4
	note C#, 16
	note __, 4
	loopchannel 3, .Loop1
	notetype 5
	note F_, 16
	notetype 1
	note __, 10
	note C#, 8
	note C_, 15
	note C#, 7
	callchannel Branch_1f33e9
.MainLoop
	callchannel Branch_1f33fd
	callchannel Branch_1f33e9
	note C_, 8
	note C#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 4
	note C#, 3
	note C#, 8
	note C#, 7
	note D#, 8
	note C#, 4
	note C#, 3
	note C#, 8
	note C#, 7
	note C#, 8
	note E_, 7
	callchannel Branch_1f33e9
	callchannel Branch_1f33fd
	callchannel Branch_1f33e9
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note C#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note C_, 7
	note E_, 8
	note C#, 7
	callchannel Branch_1f33e9
	callchannel Branch_1f33fd
	callchannel Branch_1f33e9
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note C#, 7
	note D#, 8
	note C#, 4
	note C#, 3
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
.Loop2
	callchannel Branch_1f33e9
	callchannel Branch_1f33fd
	loopchannel 3, .Loop2
	callchannel Branch_1f33e9
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note C#, 4
	note C#, 3
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	note C#, 8
	note C#, 7
	callchannel Branch_1f33e9
	loopchannel 0, .MainLoop

Branch_1f33e9:
	octave 1
	notetype 1
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note D#, 7
	note D#, 8
	note C_, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note E_, 7
	endchannel

Branch_1f33fd:
	octave 1
	notetype 1
	note C_, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note D#, 8
	note D#, 7
	note C_, 8
	note C#, 7
	note D#, 8
	note D#, 7
	note C#, 8
	note D#, 7
	note E_, 8
	note C#, 7
	endchannel

