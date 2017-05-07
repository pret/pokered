Music_TCGClub2:
	db $80
	dw Music_TCGClub2_Ch1
	db $01
	dw Music_TCGClub2_Ch2
	db $02
	dw Music_TCGClub2_Ch3

Music_TCGClub2_Ch1: 
	notetype0 6
	dutycycle 2
	notetype2 6
.MainLoop
	octave 4
.Loop1
	notetype1 7
	note G_, 4
	note E_, 4
	note C_, 4
	notetype1 7
	notetype2 0
	note F#, 4
	notetype2 6
	note F#, 16
	notetype1 7
	note G_, 4
	note A_, 4
	note B_, 4
	notetype1 7
	notetype2 0
	note F#, 4
	notetype2 6
	note F#, 16
	loopchannel 8, .Loop1
	notetype1 7
	note G_, 4
	note D_, 4
	dec_octave
	note B_, 4
	inc_octave
	notetype1 7
	notetype2 0
	note B_, 4
	notetype2 6
	note B_, 16
	notetype1 7
	note G_, 4
	note D_, 4
	note C_, 4
	notetype1 7
	notetype2 0
	note B_, 4
	notetype2 6
	note B_, 16
	dec_octave
	notetype1 7
	note F#, 4
	dec_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	dec_octave
	note C_, 4
	dec_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	dec_octave
	note D_, 4
	dec_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	note A_, 3
	notetype0 1
	note A_, 3
	inc_octave
	notetype1 7
	note __, 4
	note D_, 5
	notetype0 6
	notetype2 0
	note D_, 15
	notetype2 6
	note D_, 16
	loopchannel 0, .MainLoop


Music_TCGClub2_Ch2: 
	notetype0 6
	dutycycle 2
	notetype2 6
.MainLoop
	octave 2
.Loop1
	notetype1 7
	note C_, 4
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	notetype1 7
	notetype2 0
	note D_, 4
	notetype2 6
	note D_, 16
	dec_octave
	dec_octave
	notetype1 7
	note C_, 4
	note G_, 4
	inc_octave
	inc_octave
	note C_, 4
	notetype1 7
	notetype2 0
	note D_, 4
	notetype2 6
	note D_, 16
	dec_octave
	dec_octave
	loopchannel 8, .Loop1
	dec_octave
	notetype1 7
	note B_, 4
	inc_octave
	note G_, 4
	inc_octave
	note G_, 4
	inc_octave
	notetype1 7
	notetype2 0
	note G_, 4
	notetype2 6
	note G_, 16
	dec_octave
	dec_octave
	dec_octave
	notetype1 7
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	note A_, 4
	inc_octave
	notetype1 7
	notetype2 0
	note C_, 4
	notetype2 6
	note C_, 16
	dec_octave
	dec_octave
	notetype1 7
	note D_, 4
	octave 2
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note G_, 4
	dec_octave
	dec_octave
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note G_, 4
	inc_octave
	note C_, 4
	note E_, 4
	note F#, 4
	dec_octave
	dec_octave
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note F#, 4
	note A_, 4
	inc_octave
	note D_, 4
	note E_, 3
	notetype0 1
	note E_, 3
	dec_octave
	notetype1 7
	note A_, 8
	inc_octave
	notetype1 7
	note F#, 7
	notetype0 6
	notetype2 0
	note F#, 14
	notetype2 6
	note F#, 16
	loopchannel 0, .MainLoop


Music_TCGClub2_Ch3: 
	notetype0 6
	notetype1 1
	notetype2 10
	vibrato 35, $33
.MainLoop
	notetype1 3
	note __, 2
	octave 5
	note G_, 4
	note E_, 4
	note C_, 4
	note F#, 2
	note __, 2
	note __, 16
	note G_, 4
	note A_, 4
	note B_, 4
	note F#, 2
	note __, 2
	note __, 14
	notetype1 2
	callchannel Branch_fa1cf
	octave 5
	note G_, 8
	callchannel Branch_fa1cf
	notetype1 1
	octave 4
	note G_, 8
	callchannel Branch_fa1f3
	octave 4
	note G_, 16
	note G_, 12
	note __, 16
	note __, 8
	note E_, 8
	callchannel Branch_fa1f3
	octave 4
	note G_, 16
	note G_, 12
	note G_, 16
	note G_, 8
	note __, 4
	note A_, 2
	note G_, 2
	note F#, 16
	note F#, 12
	note __, 4
	note F#, 1
	note G_, 15
	note G_, 12
	note __, 4
	note G#, 1
	note A_, 15
	note A_, 16
	note __, 16
	note __, 16
	loopchannel 0, .MainLoop

Branch_fa1cf:
	octave 6
	note C#, 1
	note D_, 15
	note D_, 12
	note C_, 2
	dec_octave
	note B_, 2
	note G_, 16
	note G_, 8
	note __, 4
	note E_, 4
	note B_, 4
	inc_octave
	note C_, 4
	dec_octave
	note B_, 4
	note A_, 16
	note A_, 8
	note A_, 16
	note __, 4
	endchannel

Branch_fa1f3:
	octave 5
	note C#, 1
	note D_, 15
	note D_, 4
	note E_, 4
	dec_octave
	note B_, 4
	inc_octave
	note C_, 4
	note D_, 16
	note D_, 8
	note __, 4
	note C_, 2
	dec_octave
	note B_, 2
	inc_octave
	note C_, 2
	dec_octave
	note B_, 2
	endchannel

