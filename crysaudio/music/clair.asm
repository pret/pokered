Music_Clair:
	musicheader 4, 1, Music_Clair_Ch1
	musicheader 1, 2, Music_Clair_Ch2
	musicheader 1, 3, Music_Clair_Ch3
	musicheader 1, 4, Music_Clair_Ch4

Music_Clair_Ch1:
	tempo 136
	volume $77
	tone $0001
	vibrato $12, $34
	stereopanning $f
	notetype $c, $93
	dutycycle $3
Music_Clair_branch_1faab:
	octave 4
	note F_, 1
	note F#, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	loopchannel 2, Music_Clair_branch_1faab
	octave 3
	note B_, 1
	note __, 1
	note G#, 1
	dutycycle $2
	intensity $92
	octave 5
	note F_, 1
	note G_, 4
	intensity $a7
	dutycycle $3
	octave 3
	note D#, 4
	note F_, 4
	note G_, 4
Music_Clair_branch_1fac9:
	intensity $93
	callchannel Music_Clair_branch_1fb12
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D#, 2
	octave 2
	note G_, 1
	note A#, 1
	octave 3
	note C#, 2
	octave 2
	note A#, 1
	note G_, 1
	callchannel Music_Clair_branch_1fb12
	note D#, 1
	note C#, 1
	note D#, 2
	octave 4
	note A#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 1
	octave 5
	note D#, 1
	callchannel Music_Clair_branch_1fb2e
	dutycycle $3
	note G#, 3
	note F_, 2
	note __, 1
	note A#, 4
	dutycycle $2
	note D#, 1
	note C#, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 5
	note D#, 1
	callchannel Music_Clair_branch_1fb2e
	dutycycle $3
	note D#, 3
	note C#, 2
	note __, 1
	octave 3
	note B_, 4
	dutycycle $2
	note G#, 1
	note C#, 1
	note D#, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	loopchannel 0, Music_Clair_branch_1fac9

Music_Clair_branch_1fb12:
	dutycycle $3
	stereopanning $ff
	octave 3
	note B_, 1
	note __, 2
	note G#, 5
	dutycycle $2
	stereopanning $f
	octave 2
	note B_, 2
	note G#, 1
	note B_, 1
	octave 3
	note D#, 1
	note __, 1
	note D#, 1
	note F#, 1
	note F_, 1
	note C#, 1
	note __, 1
	note F_, 1
	note C#, 1
	note __, 1
	endchannel

Music_Clair_branch_1fb2e:
	octave 4
	note F#, 1
	note D#, 1
	note __, 1
	note F#, 1
	note D#, 1
	note __, 1
	octave 3
	note D#, 1
	note G#, 1
	note B_, 2
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note __, 1
	note D#, 1
	note F#, 1
	endchannel

Music_Clair_Ch2:
	dutycycle $3
	vibrato $12, $34
	notetype $6, $b7
Music_Clair_branch_1fb49:
	octave 3
	note A#, 2
	note B_, 2
	note A#, 2
	note __, 2
	note G#, 2
	note __, 2
	loopchannel 2, Music_Clair_branch_1fb49
	note F_, 2
	note __, 2
	note C#, 2
	note __, 2
	intensity $82
	note D#, 2
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	intensity $92
	note G_, 2
	octave 4
	note C#, 2
	note D#, 2
	octave 3
	note A#, 2
	intensity $b2
	octave 4
	note C#, 2
	note D#, 2
	note G_, 2
	note D#, 2
	intensity $c2
	note C#, 2
	note D#, 2
	note G_, 2
	note A#, 2
	intensity $b7
Music_Clair_branch_1fb77:
	callchannel Music_Clair_branch_1fba6
	note F#, 2
	note __, 4
	note D#, 12
	note __, 2
	note D#, 4
	note C#, 4
	octave 3
	note B_, 3
	note A#, 1
	note B_, 6
	octave 4
	note C#, 4
	note __, 2
	octave 3
	note A#, 16
	note __, 4
	pitchoffset 0, CC
	callchannel Music_Clair_branch_1fba6
	pitchoffset 0, C_
	octave 5
	note F#, 2
	note __, 4
	note D#, 12
	note __, 2
	octave 4
	note G#, 4
	note A#, 4
	note B_, 3
	octave 5
	note C_, 1
	note C#, 6
	octave 4
	note A#, 4
	note __, 2
	note G#, 16
	note __, 4
	loopchannel 0, Music_Clair_branch_1fb77

Music_Clair_branch_1fba6:
	octave 4
	note F#, 2
	note __, 4
	note D#, 12
	note __, 2
	octave 3
	note G#, 4
	note A#, 4
	note B_, 3
	octave 4
	note C_, 1
	note C#, 6
	octave 3
	note B_, 4
	note __, 2
	octave 4
	note D#, 16
	note __, 4
	endchannel

Music_Clair_Ch3:
	notetype $c, $14
	pitchoffset 0, CC
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note C#, 2
	note __, 4
	octave 2
	note G#, 1
	note B_, 1
	octave 3
	note D#, 2
	note __, 2
	octave 2
	note A#, 4
	note G#, 4
	note G_, 4
Music_Clair_branch_1fbd1:
	callchannel Music_Clair_branch_1fc3c
	octave 2
	note C#, 2
	note __, 1
	note G#, 2
	note __, 1
	note C#, 2
	note __, 2
	note D#, 2
	note A#, 2
	note D#, 2
	callchannel Music_Clair_branch_1fc3c
	octave 2
	note G#, 2
	note __, 1
	note C#, 2
	note __, 1
	note D#, 2
	note __, 2
	note D#, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A#, 1
	octave 1
	note G#, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 1
	note G#, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note G#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	octave 2
	note C#, 2
	note __, 1
	note G#, 2
	note __, 1
	note C#, 2
	octave 3
	note D#, 1
	note __, 1
	octave 2
	note D#, 1
	octave 3
	note A#, 1
	octave 2
	note A#, 2
	octave 3
	note G_, 1
	octave 2
	note D#, 1
	octave 1
	note G#, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 1
	note G#, 2
	octave 3
	note F#, 1
	note __, 1
	octave 1
	note G#, 1
	octave 3
	note D#, 1
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	octave 2
	note D#, 2
	note __, 1
	note G_, 2
	note __, 1
	note G#, 2
	octave 2
	note B_, 1
	note __, 1
	octave 1
	note G#, 1
	octave 2
	note A#, 1
	note D#, 2
	note G#, 1
	octave 1
	note G#, 1
	loopchannel 0, Music_Clair_branch_1fbd1

Music_Clair_branch_1fc3c:
	octave 1
	note G#, 2
	note __, 1
	octave 2
	note D#, 2
	note __, 1
	octave 1
	note G#, 2
	note __, 2
	note G#, 2
	octave 2
	note D#, 2
	octave 1
	note G#, 2
	endchannel

Music_Clair_Ch4:
	togglenoise $3
	notetype $c
	stereopanning $f0
	note B_, 8
	note B_, 8
	note B_, 6
	stereopanning $ff
	note D#, 1
	note D#, 1
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 2
	note D_, 1
	note D_, 1
Music_Clair_branch_1fc5e:
	stereopanning $ff
	callchannel Music_Clair_branch_1fc6e
	note G_, 1
	stereopanning $ff
	callchannel Music_Clair_branch_1fc6e
	note F#, 1
	loopchannel 0, Music_Clair_branch_1fc5e

Music_Clair_branch_1fc6e:
	note D#, 2
	stereopanning $f0
	note G_, 2
	stereopanning $ff
	note D_, 2
	stereopanning $f0
	note G_, 1
	note G_, 1
	note G_, 2
	stereopanning $ff
	note D#, 1
	stereopanning $f0
	note G_, 1
	stereopanning $ff
	note D_, 2
	stereopanning $f0
	note G_, 1
	endchannel
