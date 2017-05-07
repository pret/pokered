Music_PkmnHealed:
	dbw $80, Music_PkmnHealed_Ch1
	dbw $01, Music_PkmnHealed_Ch2
	dbw $02, Music_PkmnHealed_Ch3

Music_PkmnHealed_Ch1: ; 9ba3 (2:5ba3)
	ftempo 144
	volume 119
	fdutycycle 2
	
	notetype 12, 129
	note __, 2
	unknownmusic0xe0 0, $4C
	note B_, 2
	unknownmusic0xe0 0, $55
	note B_, 2
	unknownmusic0xe0 0, $45
	note E_, 2
	note __, 4
	unknownmusic0xe0 0, $3C
	note E_, 4
	unknownmusic0xe0 0, $4C
	note B_, 4
	endchannel


Music_PkmnHealed_Ch2: ; 9bc4 (2:5bc4)
	fdutycycle 2
	notetype 12, 195
	octave 4
	note B_, 4
	note B_, 4
	note B_, 2
	note G#, 2
	notetype 12, 196
	octave 5
	note E_, 8
	endchannel


Music_PkmnHealed_Ch3: ; 9bd2 (2:5bd2)
	notetype 12, 16
	octave 4
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note G#, 2
	note E_, 6
	note __, 2
	endchannel
; 0x9bde