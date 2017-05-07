Music_TCGMatchStart1:
	db $00
	dw Music_TCGMatchStart1_Ch1

Music_TCGMatchStart1_Ch1: 
	notetype0 1
	notetype2 8
.Loop1
	dutycycle 2
	notetype1 15
	octave 3
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	octave 3
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	octave 4
	dutycycle 1
	note C_, 1
	inc_octave
	note C_, 1
	dec_octave
	note G_, 1
	inc_octave
	note G_, 1
	octave 4
	note D_, 1
	inc_octave
	note D_, 1
	dec_octave
	note A_, 1
	inc_octave
	note A_, 1
	loopchannel 3, .Loop1
	octave 4
	notetype1 6
	note E_, 1
	inc_octave
	note E_, 1
	octave 4
	notetype1 2
	dec_octave
	note B_, 1
	inc_octave
	note B_, 1
	endchannel

