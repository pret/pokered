Music_TCG2Fort4:
	db $C0
	dw Music_TCG2Fort4_Ch1
	db $01
	dw Music_TCG2Fort4_Ch2
	db $02
	dw Music_TCG2Fort4_Ch3
	db $03
	dw Music_TCG2Fort4_Ch4

Music_TCG2Fort4_Ch2: 
	notetype1 10
	notetype0 1
	octave 2
	note C_, 16
.MainLoop
	notetype0 1
	octave 2
	notetype0 4
	notetype2 7
.Loop1
	note D_, 1
	note D_, 3
	note __, 4
	inc_octave
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	dec_octave
	note D_, 1
	note D_, 3
	note __, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note __, 4
	note C_, 1
	note C_, 3
	loopchannel 4, .Loop1
	dutycycle 1
	octave 3
	notetype2 8
	notetype0 8
	notetype1 2
	note E_, 14
	notetype1 11
	vibrato 1, $33
	note E_, 2
	note E_, 6
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note E_, 4
	note E_, 2
	notetype1 1
	note D_, 10
	notetype1 11
	note D_, 14
	note D_, 2
	notetype1 11
	note D_, 4
	note D_, 2
	notetype1 2
	note G_, 10
	notetype1 11
	note G_, 6
	note G_, 2
	note F_, 3
	note C_, 3
	note F_, 2
	vibrato 40, $33
	notetype0 1
	note E_, 4
	notetype0 8
	notetype0 1
	note F_, 4
	notetype0 8
	note E_, 5
	note E_, 10
	note E_, 12
	note E_, 4
	notetype1 2
	note E_, 14
	notetype1 11
	vibrato 1, $33
	note E_, 2
	note E_, 6
	note E_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 4
	note A_, 2
	notetype1 1
	note G_, 10
	notetype1 11
	note G_, 14
	note G_, 2
	vibrato 0, $33
	notetype1 1
	note A_, 4
	note A_, 2
	notetype1 11
	note G_, 6
	note D_, 2
	note D_, 2
	notetype1 1
	note G_, 6
	note G_, 2
	note F_, 4
	notetype1 11
	note G_, 3
	notetype0 4
	note F_, 1
	note G_, 1
	notetype0 8
	vibrato 0, $33
	notetype1 1
	note F_, 7
	notetype1 11
	vibrato 1, $33
	note F_, 8
	vibrato 0, $33
	notetype0 4
	note E_, 1
	note F_, 1
	notetype0 8
	vibrato 48, $33
	note E_, 8
	notetype1 1
	note F_, 4
	notetype1 11
	note G_, 4
	notetype1 1
	note A_, 6
	notetype1 11
	note A_, 2
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 1
	inc_octave
	note C_, 6
	notetype1 11
	note C_, 2
	dec_octave
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 12
	note A_, 1
	note A_, 1
	note __, 2
	notetype0 1
	octave 3
	notetype0 4
	notetype2 7
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	dec_octave
	note D_, 1
	note D_, 3
	note __, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note __, 4
	note C_, 1
	note C_, 3
.Loop2
	note D_, 1
	note D_, 3
	note __, 4
	inc_octave
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	dec_octave
	note D_, 1
	note D_, 3
	note __, 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note __, 4
	note C_, 1
	note C_, 3
	loopchannel 3, .Loop2
	dutycycle 1
	octave 3
	notetype2 8
	vibrato 0, $33
	notetype0 8
.Loop3
	notetype1 1
	note A_, 6
	notetype1 11
	note A_, 2
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 1
	inc_octave
	note C_, 6
	notetype1 11
	note C_, 2
	dec_octave
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	loopchannel 2, .Loop3
	notetype1 8
	notetype0 1
	note A_, 4
	notetype0 8
	notetype0 1
	notetype1 9
	note A#, 4
	notetype0 8
	vibrato 40, $33
	notetype1 8
	note A_, 15
	note A_, 16
	note A_, 16
	note A_, 8
	note A_, 1
	dec_octave
	notetype0 1
	notetype1 12
	note A#, 8
	inc_octave
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
	note G_, 5
	note G_, 3
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
	loopchannel 0, .MainLoop


Music_TCG2Fort4_Ch1: 
	notetype1 10
	notetype1 15
	dutycycle 2
	vibrato 0, $33
	notetype0 1
	octave 3
	note G_, 5
	note G_, 5
	note G_, 6
	notetype0 8
	note G_, 4
	note __, 12
.MainLoop
	notetype0 8
	note __, 16
	note __, 16
	note __, 16
	notetype0 4
	octave 4
	note __, 1
	note __, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note G#, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note G#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G#, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note G#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G#, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note G#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G#, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note G#, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note G#, 1
.Loop1
	note __, 1
	note F_, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
	loopchannel 2, .Loop1
	note __, 1
	note F_, 1
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
.Loop2
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	note __, 1
	dec_octave
	note A_, 1
	note A_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note D_, 1
	note E_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note E_, 1
	note A_, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note A_, 1
	loopchannel 3, .Loop2
	note __, 1
	dec_octave
	note A_, 1
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
	note __, 1
	note F_, 1
	dec_octave
	note G_, 1
	note __, 1
	inc_octave
	note D#, 1
	dec_octave
	note G_, 1
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note D#, 1
	note F_, 1
	note A#, 1
	note D#, 1
	note F_, 1
	note A#, 1
.Loop3
	note __, 1
	note F_, 1
	dec_octave
	note B_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note B_, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	dec_octave
	note B_, 1
	note __, 1
	inc_octave
	note D_, 1
	dec_octave
	note B_, 1
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	dec_octave
	note B_, 1
	inc_octave
	note D_, 1
	note F_, 1
	note A_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	loopchannel 2, .Loop3
	note __, 1
	note F_, 1
	dec_octave
	note A#, 1
	note __, 1
	inc_octave
	note C#, 1
	dec_octave
	note A#, 1
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	dec_octave
	note A#, 1
	note __, 1
	inc_octave
	note C#, 1
	dec_octave
	note A#, 1
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A#, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	note C#, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
	note A_, 1
	note __, 1
	note F_, 1
	dec_octave
	note A_, 1
	note __, 1
	inc_octave
	note C#, 1
	dec_octave
	note A_, 1
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	dec_octave
	note A_, 1
	inc_octave
	note C#, 1
	note F_, 1
	note A_, 1
	note C#, 1
	note F_, 1
	note A_, 1
	dutycycle 1
	octave 3
	notetype2 8
	notetype0 8
	octave 3
	notetype1 1
	note F_, 6
	notetype1 11
	note F_, 2
	notetype1 1
	note D_, 6
	notetype1 11
	note D_, 2
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 1
	note D_, 6
	notetype1 11
	note D_, 2
	notetype1 12
	note E_, 1
	note E_, 1
	note __, 1
	notetype1 15
	dutycycle 2
	vibrato 0, $33
	notetype0 1
	octave 3
	note G_, 4
	note G_, 4
	notetype0 8
	note G_, 4
	note __, 4
	inc_octave
	note C_, 4
	dec_octave
.Loop4
	notetype0 8
	note __, 3
	notetype0 1
	octave 3
	note G_, 4
	note G_, 4
	notetype0 8
	note G_, 4
	inc_octave
	note __, 4
	note C_, 4
	dec_octave
	loopchannel 3, .Loop4
	dutycycle 1
	octave 3
	notetype2 8
	notetype0 8
	octave 3
	notetype1 1
	note D#, 6
	notetype1 11
	note D#, 2
	notetype1 1
	note C#, 6
	notetype1 11
	note C#, 2
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 1
	note C#, 6
	callchannel Branch_1f1c7c
	dutycycle 1
	octave 3
	notetype2 8
	notetype0 8
	octave 3
	notetype1 1
	note E_, 6
	notetype1 11
	note E_, 2
	notetype1 1
	note D_, 6
	notetype1 11
	note D_, 2
	notetype1 1
	note G_, 6
	notetype1 11
	note G_, 2
	notetype1 1
	note D_, 6
	notetype1 11
	note D_, 2
	octave 3
	notetype0 1
	note E_, 4
	note F_, 4
	notetype0 8
	note E_, 5
	callchannel Branch_1f1c69
	octave 3
	note E_, 2
	note D_, 1
	note D_, 1
	callchannel Branch_1f1c97
	octave 3
	note E_, 1
	note E_, 2
	note F_, 6
	callchannel Branch_1f1c69
	octave 3
	note F_, 2
	note G_, 1
	note G_, 1
	callchannel Branch_1f1c97
	octave 3
	note F_, 1
	note F_, 2
	notetype0 1
	note E_, 4
	note F_, 4
	notetype0 8
	note E_, 5
	callchannel Branch_1f1c69
	octave 3
	note E_, 2
	dec_octave
	note B_, 1
	note B_, 1
	callchannel Branch_1f1c97
	octave 3
	note D_, 1
	note D_, 2
	notetype0 1
	note C#, 4
	note D_, 4
	notetype0 8
	note C#, 7
	note C#, 1
	notetype0 1
	octave 2
	note G_, 8
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
	note E_, 5
	note E_, 3
	note G_, 5
	note G_, 3
	note A#, 5
	note A#, 3
	inc_octave
	note C#, 5
	note C#, 3
	notetype0 8
	note __, 16
	loopchannel 0, .MainLoop

Branch_1f1c69:
	notetype1 15
	dutycycle 2
	vibrato 0, $33
	notetype0 1
	octave 3
	note G_, 16
	notetype0 8
	endchannel

Branch_1f1c7c:
	notetype1 15
	dutycycle 2
	vibrato 0, $33
	notetype0 1
	octave 3
	note G_, 5
	note G_, 5
	note G_, 6
	notetype0 8
	endchannel

Branch_1f1c97:
	notetype1 15
	dutycycle 2
	vibrato 0, $33
	notetype0 1
	octave 4
	note G_, 8
	notetype0 8
	endchannel


Music_TCG2Fort4_Ch3: 
	notetype1 10
	notetype2 11
	notetype1 1
	notetype0 1
	octave 2
	note C_, 16
.MainLoop
	callchannel Branch_1f1ff8
.Loop1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	loopchannel 2, .Loop1
.Loop2
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G#, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G#, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G#, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G#, 4
	note __, 4
	note D_, 4
	note __, 4
	note G#, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	loopchannel 2, .Loop2
.Loop3
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	inc_octave
	note D#, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	inc_octave
	note D#, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	loopchannel 2, .Loop3
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note G#, 4
	note A_, 4
	inc_octave
	note C_, 8
	dec_octave
	note G_, 8
	note A_, 8
	note F_, 8
	note G_, 8
	note C_, 8
.Loop4
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note A_, 4
	note __, 4
	note D_, 4
	note __, 4
	note A_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	loopchannel 2, .Loop4
.Loop5
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	inc_octave
	note D#, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	inc_octave
	note D#, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	note D#, 4
	note __, 4
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	loopchannel 2, .Loop5
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note C_, 16
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note D_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	inc_octave
	note D_, 4
	note __, 4
	dec_octave
	note G_, 4
	note __, 4
	note D_, 4
	note __, 4
	note G_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note G_, 16
	note A_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note F_, 4
	note __, 4
	note C#, 4
	note __, 4
	inc_octave
	note C#, 4
	note __, 4
	dec_octave
	note F_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note A_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note F_, 4
	note __, 4
	note C#, 4
	note __, 4
	inc_octave
	note C#, 4
	note __, 4
	dec_octave
	note F_, 4
	note __, 4
	note C#, 4
	note __, 4
	note F_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note G_, 16
	note A_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note E_, 4
	note __, 4
	note C#, 4
	note __, 4
	inc_octave
	note C#, 4
	note __, 4
	dec_octave
	note E_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note A_, 16
	inc_octave
	inc_octave
	inc_octave
	notetype1 2
	note E_, 4
	note __, 4
	note C#, 4
	note __, 4
	inc_octave
	note C#, 4
	note __, 4
	dec_octave
	note E_, 4
	note __, 4
	note C#, 4
	note __, 4
	note E_, 4
	note __, 4
	dec_octave
	dec_octave
	dec_octave
	notetype1 1
	note G_, 8
	note A_, 8
	vibrato 48, $33
	note A_, 4
	note A_, 4
	note A_, 4
	note A_, 4
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	note A#, 16
	callchannel Branch_1f1ff8
	vibrato 48, $33
	notetype0 8
	note D#, 16
	note D#, 16
	note E_, 16
	note E_, 16
	notetype0 1
	note A_, 16
	note __, 16
	inc_octave
	note A_, 16
	dec_octave
	note A_, 16
	note __, 16
	note __, 16
	note __, 16
	note E_, 16
	note A#, 16
	note __, 16
	inc_octave
	inc_octave
	note D_, 16
	dec_octave
	dec_octave
	note A#, 16
	note __, 16
	note __, 16
	note __, 16
	note G_, 16
	note A_, 16
	note __, 16
	inc_octave
	note A_, 16
	dec_octave
	note A_, 16
	note __, 16
	note __, 16
	note __, 16
	note G_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note A_, 16
	note __, 8
	note A_, 8
	inc_octave
	note E_, 4
	note __, 4
	note G_, 4
	note __, 4
	note A_, 4
	note __, 4
	note E_, 4
	note __, 4
	note G_, 4
	note __, 4
	note A_, 4
	note __, 4
	loopchannel 0, .MainLoop

Branch_1f1ff8:
	octave 2
.Loop6
	note D_, 8
	note __, 8
	note __, 16
	inc_octave
	inc_octave
	note F_, 5
	note __, 3
	notetype1 2
	note F_, 5
	note __, 3
	notetype1 1
	dec_octave
	dec_octave
	note D_, 16
	note __, 16
	inc_octave
	note A_, 5
	note __, 3
	notetype1 2
	note A_, 5
	note __, 3
	notetype1 1
	dec_octave
	note __, 16
	note C_, 16
	loopchannel 3, .Loop6
	note D_, 16
	note __, 16
	inc_octave
	inc_octave
	note F_, 5
	note __, 3
	notetype1 2
	note F_, 5
	note __, 3
	notetype1 1
	dec_octave
	dec_octave
	note D_, 16
	note __, 16
	inc_octave
	note A_, 5
	note __, 3
	notetype1 2
	note A_, 5
	note __, 3
	notetype1 1
	dec_octave
	note __, 16
	note C_, 8
	note C#, 8
	endchannel


Music_TCG2Fort4_Ch4: 
	togglenoise $06
	notetype 8
	note __, 2
.MainLoop
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note C#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note C#, 1
	note C#, 1
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note D#, 2
	note C#, 2
	note C#, 1
	note C#, 1
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	callchannel Branch_1f2131
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note G_, 16
	note __, 16
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note C#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note C#, 1
	note C#, 1
	note G_, 16
	note __, 16
	note G_, 16
	note __, 16
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note C#, 2
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note C#, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note C#, 2
	note G_, 9
	notetype 1
	note C#, 4
	note C#, 4
	notetype 8
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	loopchannel 0, .MainLoop

Branch_1f2131:
	note C_, 2
	note D#, 1
	note F#, 1
	note A_, 2
	note C_, 2
	note D#, 1
	note F#, 1
	note D#, 2
	note F#, 2
	note E_, 2
	endchannel

