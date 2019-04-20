Music_LakeOfRageRocketRadio:
	musicheader 3, 1, Music_LakeOfRageRocketRadio_Ch1
	musicheader 1, 2, Music_LakeOfRageRocketRadio_Ch2
	musicheader 1, 3, Music_LakeOfRageRocketRadio_Ch3

Music_LakeOfRageRocketRadio_Ch1:
	tempo 160
	volume $77
	dutycycle $1
	tone $1118
	vibrato $0, $f0
	stereopanning $f0
Music_LakeOfRageRocketRadio_branch_ef5c9:
	notetype $c, $a7
	octave 7
	note G_, 4
	note F#, 4
	note G_, 4
	note F#, 4
	note __, 16
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9

Music_LakeOfRageRocketRadio_Ch2:
	dutycycle $1
	vibrato $13, $e8
	notetype $c, $a7
	note __, 2
	stereopanning $f
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9

Music_LakeOfRageRocketRadio_Ch3:
	notetype $c, $26
	vibrato $10, $44
	note __, 4
	loopchannel 0, Music_LakeOfRageRocketRadio_branch_ef5c9
