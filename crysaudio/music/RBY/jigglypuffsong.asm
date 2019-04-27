Music_JigglypuffSong::
	musicheader 2, 1, Music_JigglypuffSong_Ch0
	musicheader 1, 2, Music_JigglypuffSong_Ch1

Music_JigglypuffSong_Ch0::
	tempo 144
	volume $77
	vibrato 8, $24
	dutycycle 2
	sound_duty 1, 1, 2, 2
	;toggleperfectpitch
	notetype 13, $67
	octave 4
	note E_, 8
	notetype 12, $67
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


Music_JigglypuffSong_Ch1::
	vibrato 5, $15
	dutycycle 2
	sound_duty 2, 2, 0, 0
	notetype 12, $a7
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
