Music_Route12:
	musicheader 4, 1, Music_Route12_Ch1
	musicheader 1, 2, Music_Route12_Ch2
	musicheader 1, 3, Music_Route12_Ch3
	musicheader 1, 4, Music_Route12_Ch4

Music_Route12_Ch1:
	tempo 148
	volume $77
	vibrato $12, $34
	tone $0001
	stereopanning $f
	dutycycle $3
	notetype $c, $98
	octave 3
	note G#, 1
	note __, 2
	note A_, 1
	note G#, 8
	octave 2
	note B_, 1
	octave 3
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note __, 2
	note E_, 1
	intensity $97
	note D#, 12
Music_Route12_branch_ec535:
	dutycycle $2
	intensity $96
	callchannel Music_Route12_branch_ec5b1
	callchannel Music_Route12_branch_ec5bf
	callchannel Music_Route12_branch_ec5b1
	note E_, 1
	note __, 2
	note F#, 1
	note E_, 4
	note B_, 4
	octave 4
	note D#, 4
	callchannel Music_Route12_branch_ec5b1
	callchannel Music_Route12_branch_ec5bf
	callchannel Music_Route12_branch_ec5b1
	intensity $92
	octave 4
	note E_, 1
	octave 3
	note B_, 1
	note G#, 1
	note E_, 1
	octave 4
	note D#, 1
	octave 3
	note B_, 1
	note G#, 1
	note D#, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note F_, 1
	note G#, 1
	note B_, 1
	dutycycle $3
	intensity $7f
	octave 4
	note C#, 3
	octave 3
	note B_, 3
	note A_, 1
	note __, 1
	note A_, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 1
	octave 3
	note B_, 1
	note A_, 4
	note G#, 2
	note F#, 2
	note G#, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note B_, 3
	note A_, 3
	note G#, 1
	note __, 1
	note G#, 4
	note B_, 2
	note A_, 2
	note B_, 1
	note A_, 1
	note G#, 4
	note F#, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note E_, 2
	note D#, 3
	note F#, 3
	note D#, 2
	note E_, 8
	note F#, 8
	note D#, 4
	note F#, 4
Music_Route12_branch_ec59b:
	intensity $97
	note G#, 1
	note A_, 1
	note B_, 4
	octave 2
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F#, 1
	note G#, 4
	loopchannel 2, Music_Route12_branch_ec59b
	loopchannel 0, Music_Route12_branch_ec535

Music_Route12_branch_ec5b1:
	octave 3
	note G#, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	octave 3
	note D#, 1
	note E_, 4
	note G#, 4
	endchannel

Music_Route12_branch_ec5bf:
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 1
	note G#, 1
	note A_, 4
	note F#, 4
	endchannel

Music_Route12_Ch2:
	dutycycle $3
	vibrato $12, $34
	notetype $c, $b8
	octave 4
	note E_, 1
	note __, 2
	note F#, 1
	note E_, 12
	octave 3
	note B_, 1
	note __, 2
	octave 4
	note C_, 1
	intensity $b7
	octave 3
	note B_, 8
	note D#, 1
	note F#, 1
	note B_, 1
	octave 4
	note D#, 1
Music_Route12_branch_ec5e5:
	dutycycle $3
	intensity $b7
	callchannel Music_Route12_branch_ec647
	note F#, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note G#, 2
	note __, 1
	note E_, 1
	octave 3
	note B_, 12
	dutycycle $2
	octave 2
	note B_, 1
	note __, 2
	octave 3
	note C_, 1
	octave 2
	note B_, 4
	octave 3
	note D#, 4
	note F#, 4
	dutycycle $3
	callchannel Music_Route12_branch_ec647
	note A_, 1
	octave 5
	note C#, 1
	octave 4
	note B_, 1
	note A_, 1
	note B_, 2
	note __, 1
	note A_, 1
	intensity $b8
	note G#, 6
	intensity $b7
	note G#, 6
	intensity $6f
	note G#, 16
	dutycycle $2
	intensity $a8
	note A_, 3
	note G#, 3
	note F#, 1
	note __, 1
	note F#, 8
	intensity $a7
	note F#, 10
	note __, 2
	note F#, 4
	intensity $a8
	note G#, 3
	note F#, 3
	note E_, 1
	note __, 1
	note E_, 8
	intensity $a7
	note E_, 10
	note __, 2
	note E_, 4
	note F#, 3
	note D#, 3
	octave 3
	note B_, 2
	intensity $a8
	octave 4
	note B_, 8
	note B_, 8
	note A_, 8
	note G#, 1
	note F#, 1
	note E_, 14
	note E_, 10
	intensity $a4
	note E_, 6
	loopchannel 0, Music_Route12_branch_ec5e5

Music_Route12_branch_ec647:
	octave 4
	note E_, 6
	intensity $b1
	octave 3
	note B_, 1
	note B_, 1
	intensity $b7
	note B_, 4
	octave 4
	note B_, 4
	note A_, 4
	note G#, 4
	note F#, 4
	endchannel

Music_Route12_Ch3:
	vibrato $12, $54
	notetype $c, $16
	octave 3
	note G#, 2
	note __, 4
	note G#, 1
	note A_, 1
	note B_, 2
	note __, 2
	note E_, 4
	note D#, 2
	note __, 4
	note D#, 1
	note E_, 1
	note F#, 2
	note __, 2
	note D#, 4
Music_Route12_branch_ec66c:
	callchannel Music_Route12_branch_ec6b4
	note F#, 1
	note __, 1
	note E_, 1
	note __, 3
	note D#, 1
	note E_, 1
	note F#, 4
	octave 2
	note B_, 4
	callchannel Music_Route12_branch_ec6b4
	note E_, 1
	note __, 1
	note B_, 1
	note __, 3
	octave 2
	note B_, 1
	octave 3
	note C#, 1
	note D_, 4
	note F_, 4
	note F#, 13
	note __, 1
	note F#, 1
	note G#, 1
	note A_, 5
	note __, 1
	note A_, 1
	note B_, 1
	octave 4
	note C_, 4
	octave 3
	note F#, 4
	note E_, 14
	note G#, 1
	note A_, 1
	note B_, 6
	note E_, 1
	note F#, 1
	note G_, 4
	note E_, 4
	octave 2
	note B_, 5
	note __, 1
	note B_, 1
	octave 3
	note D#, 1
	note F#, 8
	note E_, 8
	note F#, 4
	note D#, 4
Music_Route12_branch_ec6a3:
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 3
	note __, 1
	loopchannel 2, Music_Route12_branch_ec6a3
	loopchannel 0, Music_Route12_branch_ec66c

Music_Route12_branch_ec6b4:
	octave 3
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note E_, 1
	note F#, 4
	note D_, 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 3
	note E_, 1
	note F#, 1
	note G#, 4
	note E_, 4
	endchannel

Music_Route12_Ch4:
	togglenoise $4
	stereopanning $f0
	notetype $c
	note B_, 10
	note C#, 1
	note C#, 1
	note D_, 4
	note B_, 6
	note C#, 1
	note C#, 1
	note D_, 4
	notetype $6
	callchannel Music_Route12_branch_ec717
Music_Route12_branch_ec6e1:
	note D_, 4
	note D_, 8
	note C#, 2
	note C#, 2
	note D_, 8
	callchannel Music_Route12_branch_ec717
	loopchannel 8, Music_Route12_branch_ec6e1
Music_Route12_branch_ec6ed:
	notetype $c
	note B_, 10
	note D_, 1
	note D_, 1
	note D_, 6
	note C#, 1
	note C#, 1
	note D_, 6
	note C#, 1
	note C#, 1
	note D_, 4
	loopchannel 2, Music_Route12_branch_ec6ed
	note B_, 16
	notetype $6
	callchannel Music_Route12_branch_ec717
	callchannel Music_Route12_branch_ec717
	note B_, 16
Music_Route12_branch_ec707:
	note D_, 4
	note D_, 8
	note C#, 2
	note C#, 2
	note D_, 8
	callchannel Music_Route12_branch_ec717
	loopchannel 2, Music_Route12_branch_ec707
	loopchannel 0, Music_Route12_branch_ec6e1

Music_Route12_branch_ec717:
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	note C#, 1
	endchannel
