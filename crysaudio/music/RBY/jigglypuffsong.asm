Music_JigglypuffSong:
	dbw $40, Music_JigglypuffSong_Ch1
	dbw $01, Music_JigglypuffSong_Ch2

Music_JigglypuffSong_Ch1: ; 7fb7d (1f:7b7d)
	ftempo 144
	volume 119
	vibrato 8, 36
	dutycycle 2
	unknownmusic0xde 165
	
	notetype 13, 103
	octave 4
	note E_, 8
	notetype 12, 103
	note B_, 2
	note G#, 6
	note F#, 8
	note G#, 2
	note A_, 6
	note G#, 8
	note F#, 4
	note G#, 4
	note E_, 10
	endchannel


Music_JigglypuffSong_Ch2: ; 7fb9a (1f:7b9a)
	vibrato 5, 21
	dutycycle 2
	unknownmusic0xde 10
	notetype 12, 167
	octave 4
	note E_, 8
	note B_, 2
	note G#, 6
	note F#, 8
	note G#, 2
	note A_, 6
	note G#, 8
	note F#, 4
	note G#, 4
	note E_, 10
	endchannel
; 0x7fbaf