Music_TCGChallengeHall:
	db $C0
	dw Music_TCGChallengeHall_Ch1
	db $01
	dw Music_TCGChallengeHall_Ch2
	db $02
	dw Music_TCGChallengeHall_Ch3
	db $03
	dw Music_TCGChallengeHall_Ch4

Music_TCGChallengeHall_Ch1: 
	vibrato 15, $33
	notetype2 7
	octave 3
	dutycycle 2
	notetype1 8
	notetype2 8
	notetype0 1
	note A_, 7
	note G#, 4
	notetype1 1
	note G#, 4
	notetype1 8
	note A_, 4
	notetype1 1
	note A_, 3
	notetype1 8
	note B_, 4
	notetype1 1
	note B_, 4
	inc_octave
	notetype1 8
	note C#, 7
	note C_, 4
	notetype1 1
	note C_, 4
	notetype1 8
	note C#, 4
	notetype1 1
	note C#, 3
	notetype1 8
	note D_, 4
	notetype1 1
	note D_, 4
	notetype1 8
	note E_, 7
	note D#, 4
	notetype1 1
	note D#, 4
	notetype1 8
	note E_, 4
	notetype1 1
	note E_, 3
	notetype1 8
	note F#, 4
	notetype1 1
	note F#, 4
	notetype1 8
	note G#, 4
	notetype1 1
	note G#, 3
	notetype1 8
	note A_, 8
	note B_, 7
	inc_octave
	note C#, 4
	note D_, 4
.MainLoop
	notetype1 7
	notetype0 1
	octave 5
.Loop1
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	loopchannel 8, .Loop1
	dutycycle 1
	notetype1 8
	dec_octave
	dec_octave
	dec_octave
	note B_, 7
	notetype1 2
	note B_, 8
	dec_octave
	notetype1 8
	note B_, 7
	note B_, 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	notetype1 8
	note B_, 15
	inc_octave
	note D_, 15
	note E_, 15
	inc_octave
	dutycycle 0
	notetype1 10
	callchannel Branch_f9848
	notetype1 10
	note D_, 8
	notetype0 10
	note C#, 6
	note C#, 6
	notetype1 3
	notetype0 1
	note C#, 15
	dutycycle 1
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	note __, 15
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	note __, 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	note __, 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	dutycycle 0
	notetype1 10
	callchannel Branch_f9848
	notetype1 10
	note C#, 8
	dec_octave
	notetype0 10
	note A_, 6
	note A_, 6
	notetype1 3
	notetype0 1
	note A_, 15
	dutycycle 1
	notetype1 8
	inc_octave
	note C#, 7
	notetype1 2
	note C#, 8
	note __, 15
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	note __, 15
	notetype1 8
	note C#, 15
	note D_, 15
	note E_, 15
	notetype1 2
	note E_, 15
	dutycycle 0
	notetype1 10
	note F#, 7
	note F_, 7
	notetype1 3
	note F_, 1
	notetype1 10
	note F#, 7
	note F_, 8
	note F#, 7
	note G#, 7
	notetype1 3
	note G#, 1
	notetype1 10
	notetype0 10
	note A_, 3
	notetype0 1
	note A_, 15
	dec_octave
	dutycycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	dutycycle 0
	notetype1 10
	note __, 15
	inc_octave
	note E_, 7
	note D#, 7
	notetype1 3
	note D#, 1
	notetype1 10
	note E_, 7
	note D#, 8
	note E_, 7
	note G#, 7
	notetype1 3
	note G#, 1
	notetype1 10
	notetype0 9
	note A_, 5
	notetype0 1
	dec_octave
	dutycycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	dutycycle 0
	notetype1 10
	note __, 15
	inc_octave
	note D_, 7
	note C#, 8
	note D_, 7
	notetype1 3
	note D_, 8
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 8
	notetype1 10
	note G#, 15
	note G#, 7
	notetype1 3
	note G#, 8
	notetype1 10
	note F#, 15
	notetype1 3
	note F#, 7
	notetype1 10
	note G#, 8
	notetype0 10
	note E_, 6
	notetype0 1
	notetype1 3
	note E_, 15
	notetype1 10
	note C#, 15
	note D_, 15
	note E_, 15
	notetype1 3
	note E_, 15
	notetype1 10
	note F#, 7
	note F_, 7
	notetype1 3
	note F_, 1
	notetype1 10
	note F#, 7
	note F_, 8
	note F#, 6
	notetype1 3
	note F#, 1
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 2
	notetype1 10
	notetype0 10
	note A_, 3
	notetype0 1
	note G#, 15
	dec_octave
	dutycycle 1
	notetype1 8
	note B_, 7
	inc_octave
	dutycycle 0
	notetype1 10
	note F#, 6
	notetype1 3
	note F#, 2
	notetype1 10
	note E_, 15
	notetype1 3
	note E_, 15
	notetype1 10
	note B_, 15
	dutycycle 1
	notetype1 8
	dec_octave
	note B_, 7
	inc_octave
	dutycycle 0
	notetype1 10
	note G#, 6
	notetype1 3
	note G#, 2
	notetype1 10
	notetype0 10
	note A_, 3
	notetype0 1
	notetype1 3
	note A_, 15
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 1
	inc_octave
	notetype1 10
	note C#, 6
	notetype1 3
	note C#, 2
	notetype1 10
	notetype0 10
	note D_, 3
	notetype0 1
	notetype1 3
	note D_, 15
	dec_octave
	notetype1 10
	note F#, 6
	notetype1 3
	note F#, 1
	notetype1 10
	note B_, 6
	notetype1 3
	note B_, 2
	notetype1 10
	note A_, 15
	notetype1 3
	note A_, 15
	notetype1 10
	note G#, 11
	notetype1 3
	note G#, 4
	note __, 7
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 1
	notetype1 10
	notetype0 10
	note A_, 6
	dutycycle 2
	notetype1 7
	notetype0 1
	inc_octave
	note C#, 7
	note C_, 8
	note C#, 7
	note D_, 8
	note E_, 5
	note F#, 5
	note G#, 5
	note A_, 4
	note B_, 4
	inc_octave
	note C#, 4
	note D_, 3
	loopchannel 0, .MainLoop

Branch_f9848:
	note C#, 15
	notetype1 3
	note C#, 15
	notetype1 10
	note E_, 15
	notetype1 3
	note E_, 7
	notetype1 10
	note C#, 8
	note D_, 15
	notetype1 3
	note D_, 15
	notetype1 10
	note F#, 15
	notetype1 3
	note F#, 7
	notetype1 10
	note D_, 8
	note E_, 7
	notetype1 3
	note E_, 8
	notetype1 10
	note A_, 15
	note G#, 7
	notetype1 3
	note G#, 8
	notetype1 10
	note F#, 7
	notetype1 3
	note F#, 8
	notetype1 10
	note E_, 15
	note D_, 7
	notetype1 3
	note D_, 8
	dec_octave
	notetype1 10
	note B_, 15
	notetype1 3
	note B_, 7
	inc_octave
	endchannel


Music_TCGChallengeHall_Ch2: 
	vibrato 15, $33
	notetype2 7
	octave 3
	notetype0 10
.Loop1
	note __, 6
	loopchannel 2, .Loop1
.MainLoop
	dutycycle 1
	notetype1 9
	notetype2 8
	notetype0 10
	note E_, 6
	note E_, 6
	notetype0 1
	note E_, 7
	notetype1 2
	note E_, 8
	dec_octave
	notetype1 8
	note E_, 7
	note E_, 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	notetype1 8
	note E_, 15
	note F#, 15
	note G#, 15
	callchannel Branch_f9a28
	note B_, 8
	notetype0 10
	note A_, 6
	note A_, 6
	notetype0 1
	note __, 15
	dutycycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	note __, 15
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	note __, 15
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	note __, 15
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	callchannel Branch_f9a28
	note G#, 8
	notetype0 10
	note E_, 6
	note E_, 6
	notetype0 1
	note __, 15
	dutycycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	note __, 15
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	note __, 15
	notetype1 8
	note A_, 15
	note B_, 15
	inc_octave
	note C#, 15
	notetype1 2
	note C#, 15
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	note __, 15
	dec_octave
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	note __, 15
	inc_octave
	notetype1 8
	note D_, 7
	dutycycle 2
	notetype1 6
	inc_octave
	note D_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 6
.Loop2
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	loopchannel 4, .Loop2
	notetype1 2
	note F#, 5
	note __, 10
	dec_octave
	dec_octave
	dutycycle 1
	notetype1 8
	note C#, 7
	inc_octave
	dutycycle 2
	notetype1 6
	note E_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note C#, 7
	notetype1 2
	note C#, 8
	notetype1 5
.Loop3
	note D_, 4
	note E_, 3
	note D_, 4
	note E_, 4
	loopchannel 4, .Loop3
	dec_octave
	note B_, 15
	inc_octave
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 5
	note C#, 15
	dutycycle 1
	notetype1 8
	octave 2
	note B_, 7
	inc_octave
	inc_octave
	dutycycle 2
	notetype1 5
	note B_, 8
	inc_octave
	notetype0 10
	note C#, 6
	notetype1 2
	notetype0 1
	note C#, 15
	dutycycle 0
	notetype1 7
	octave 2
	note E_, 15
	note F#, 15
	note A#, 15
	note __, 15
	dutycycle 1
	notetype1 8
	inc_octave
	note D_, 7
	notetype1 2
	note D_, 8
	note __, 15
	dec_octave
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	note __, 15
	inc_octave
	notetype1 8
	note D_, 7
	inc_octave
	dutycycle 2
	notetype1 6
	note D_, 8
	note A_, 7
	notetype1 2
	note A_, 8
	inc_octave
	notetype1 6
	note D_, 7
	notetype1 2
	note D_, 8
	notetype1 6
.Loop4
	note E_, 4
	note F#, 3
	note E_, 4
	note F#, 4
	loopchannel 2, .Loop4
	dutycycle 0
	notetype1 7
	dec_octave
	dec_octave
	note F_, 15
	note __, 7
	note F_, 6
	note __, 2
	notetype0 10
	note F#, 3
	notetype0 1
	note __, 15
	dutycycle 1
	notetype1 8
	note C#, 7
	dutycycle 0
	notetype1 7
	note E_, 6
	note __, 2
	notetype0 10
	note F#, 3
	notetype0 1
	note __, 15
	dec_octave
	dutycycle 1
	notetype1 8
	note B_, 7
	inc_octave
	dutycycle 0
	notetype1 7
	note D_, 6
	note __, 2
	note E_, 15
	dutycycle 1
	notetype1 8
	note E_, 7
	notetype1 2
	note E_, 8
	dutycycle 0
	notetype1 7
	note D_, 11
	note __, 4
	dutycycle 1
	notetype1 8
	dec_octave
	note B_, 7
	inc_octave
	dutycycle 0
	notetype1 7
	note D_, 6
	note __, 2
	note C#, 15
	dutycycle 1
	notetype1 8
	notetype2 7
	note C#, 5
	note C#, 5
	note C#, 5
	notetype2 8
	note C#, 7
	notetype1 2
	note C#, 8
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	dutycycle 0
	notetype1 10
	note A_, 7
	notetype1 3
	note A_, 8
	note __, 15
	notetype0 10
	note __, 3
	loopchannel 0, .MainLoop

Branch_f9a28:
	dutycycle 0
	notetype1 7
	note A_, 15
	dutycycle 1
	notetype1 8
	note A_, 7
	notetype1 2
	note A_, 8
	dutycycle 0
	notetype1 7
	inc_octave
	note C#, 15
	dec_octave
	dutycycle 1
	notetype1 8
	note A_, 7
	dutycycle 0
	notetype1 7
	note A_, 8
	note B_, 15
	dutycycle 1
	notetype1 8
	note B_, 7
	notetype1 2
	note B_, 8
	dutycycle 0
	notetype1 7
	inc_octave
	note D_, 15
	dec_octave
	dutycycle 1
	notetype1 8
	note B_, 7
	dutycycle 0
	notetype1 7
	note B_, 8
	inc_octave
	note C#, 7
	notetype1 3
	note C#, 8
	dutycycle 1
	notetype1 8
	note C#, 7
	notetype1 2
	note C#, 8
	dutycycle 0
	notetype1 7
	note E_, 7
	note __, 8
	note E_, 7
	note __, 8
	notetype1 7
	note D_, 15
	dutycycle 1
	notetype1 8
	note D_, 7
	notetype1 2
	note D_, 8
	dec_octave
	dutycycle 0
	notetype1 7
	note G#, 15
	inc_octave
	dutycycle 1
	notetype1 8
	note D_, 7
	dec_octave
	dutycycle 0
	notetype1 7
	endchannel


Music_TCGChallengeHall_Ch3: 
	notetype1 1
	notetype2 11
	notetype0 10
.Loop1
	note __, 6
	loopchannel 2, .Loop1
.MainLoop
	octave 2
	note E_, 6
	note E_, 6
	notetype0 1
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note E_, 7
	note E_, 8
	note E_, 7
	note __, 8
	note E_, 7
	note __, 8
	note E_, 7
	note __, 8
	note E_, 15
	note F#, 15
	note G#, 15
	callchannel Branch_f9b7d
	callchannel Branch_f9b92
.Loop2
	callchannel Branch_f9b7d
	loopchannel 3, .Loop2
	callchannel Branch_f9b92
	callchannel Branch_f9b7d
	note A_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note A_, 7
	note __, 8
	note A_, 15
	note B_, 15
	inc_octave
	note C#, 15
	dec_octave
.Loop3
	note D_, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note A_, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	loopchannel 2, .Loop3
	note C#, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note A_, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note C#, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note A_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note B_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note F#, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note G#, 15
	inc_octave
	note G#, 7
	note __, 8
	dec_octave
	note A_, 15
	inc_octave
	inc_octave
	note C#, 7
	note __, 8
	dec_octave
	dec_octave
	note G_, 15
	inc_octave
	inc_octave
	note C#, 7
	note __, 8
	dec_octave
	dec_octave
	note F#, 7
	note __, 8
	note F#, 15
	note G#, 15
	note A#, 15
	note B_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note C#, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	note D_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note D#, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note F_, 15
	inc_octave
	note G#, 7
	note __, 8
	dec_octave
	note F#, 15
	inc_octave
	inc_octave
	note C#, 7
	note __, 8
	dec_octave
	dec_octave
	note C#, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note B_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note F#, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note G#, 15
	inc_octave
	note G#, 7
	note __, 8
	dec_octave
	note A_, 7
	note __, 8
	note A_, 5
	note A_, 5
	note A_, 5
	note A_, 7
	note __, 8
	note A_, 7
	note __, 8
	note A_, 7
	note __, 8
	note __, 15
	notetype0 10
	note __, 3
	loopchannel 0, .MainLoop

Branch_f9b7d:
	note A_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note E_, 7
	note __, 8
	dec_octave
	note A_, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note F#, 7
	note __, 8
	dec_octave
	endchannel

Branch_f9b92:
	note A_, 15
	inc_octave
	note A_, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	inc_octave
	note C#, 7
	note __, 8
	dec_octave
	dec_octave
	note A_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	note E_, 15
	inc_octave
	note B_, 7
	note __, 8
	dec_octave
	endchannel


Music_TCGChallengeHall_Ch4: 
	togglenoise $06
	notetype 1
	notetype 10
.Loop1
	note __, 6
	loopchannel 2, .Loop1
.MainLoop
	notetype 1
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 4
.Loop2
	note D_, 4
	note D_, 3
	note D_, 4
	note D_, 4
	loopchannel 7, .Loop2
	note C#, 15
	note C#, 7
	note C#, 8
	note C#, 15
	note C#, 15
	note C#, 15
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note C#, 15
	note C#, 15
.Loop3
	note C_, 15
	note C#, 15
	note C_, 15
	note C#, 15
	note C_, 15
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note C_, 15
	note C#, 15
	loopchannel 15, .Loop3
	note C_, 15
	note C#, 4
	note D_, 3
	note D_, 4
	note D_, 4
	note C#, 15
	note C#, 15
	notetype 10
	note C#, 3
	note __, 3
	loopchannel 0, .MainLoop

