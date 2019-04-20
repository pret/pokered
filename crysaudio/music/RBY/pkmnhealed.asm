Music_PkmnHealed:
	dbw $80, Music_PkmnHealed_Ch1
	dbw $01, Music_PkmnHealed_Ch2
	dbw $02, Music_PkmnHealed_Ch3

Music_PkmnHealed_Ch1: ; 9ba3 (2:5ba3)
	tempo 144
	volume 119
	dutycycle 2
	
	notetype 12, 129
	note __, 2
	slidepitchto 1, 4, B_
	note B_, 2
	slidepitchto 1, 5, E_
	note B_, 2
	slidepitchto 1, 4, E_
	note E_, 2
	note __, 4
	slidepitchto 1, 3, B_
	note E_, 4
	slidepitchto 1, 4, B_
	note B_, 4
	endchannel


Music_PkmnHealed_Ch2: ; 9bc4 (2:5bc4)
	dutycycle 2
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