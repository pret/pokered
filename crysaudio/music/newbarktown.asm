Music_NewBarkTown:
	musicheader 3, 1, Music_NewBarkTown_Ch1
	musicheader 1, 2, Music_NewBarkTown_Ch2
	musicheader 1, 3, Music_NewBarkTown_Ch3

	db $3

Music_NewBarkTown_Ch1:
	tempo 187
	volume $77
	stereopanning $f
	vibrato $12, $23
	notetype $c, $87
	note __, 4
Music_NewBarkTown_branch_eb2eb:
	dutycycle $0
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note G_, 2
	note F#, 2
	dutycycle $2
	intensity $82
	note E_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 2
	note B_, 1
	note A_, 1
	note G_, 1
	dutycycle $0
	intensity $87
	callchannel Music_NewBarkTown_branch_eb349
	octave 3
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	note __, 1
	octave 3
	note E_, 2
	dutycycle $2
	intensity $82
	note C#, 1
	note __, 1
	octave 2
	note A_, 1
	octave 3
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 4
	note C#, 1
	note E_, 1
	note A_, 1
	dutycycle $1
	intensity $5e
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	callchannel Music_NewBarkTown_branch_eb37c
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note B_, 2
	intensity $87
	loopchannel 0, Music_NewBarkTown_branch_eb2eb

Music_NewBarkTown_branch_eb349:
	octave 3
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A_, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note A#, 2
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 2
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 4
	note C_, 2
	octave 3
	note D_, 1
	note __, 1
	octave 2
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 3
	note G_, 2
	octave 2
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 3
	note E_, 2
	octave 2
	note B_, 1
	note __, 1
	endchannel

Music_NewBarkTown_branch_eb37c:
	octave 2
	note G_, 2
	note B_, 2
	octave 3
	note D_, 2
	note F#, 4
	note G_, 4
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note C#, 2
	note E_, 2
	note G_, 4
	note A_, 4
	note E_, 2
	endchannel

Music_NewBarkTown_Ch2:
	stereopanning $ff
	vibrato $12, $23
	notetype $6, $a7
	note __, 8
Music_NewBarkTown_branch_eb396:
	dutycycle $2
	notetype $6, $a7
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3bf
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 6
	note A_, 6
	intensity $77
	octave 6
	note D_, 4
	note C#, 16
	callchannel Music_NewBarkTown_branch_eb3f2
	intensity $87
	octave 5
	note B_, 6
	note A_, 6
	intensity $77
	octave 6
	note D_, 4
	note E_, 16
	loopchannel 0, Music_NewBarkTown_branch_eb396

Music_NewBarkTown_branch_eb3bf:
	octave 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	note A#, 2
	note __, 2
	note D_, 4
	note __, 8
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 2
	note __, 2
	note D_, 8
	octave 3
	note C_, 2
	note __, 2
	octave 2
	note G_, 4
	note __, 8
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 1
	note G#, 2
	note __, 2
	note G#, 8
	octave 2
	note D_, 2
	note __, 2
	note A_, 4
	note __, 8
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 1
	note A_, 2
	note __, 2
	note A_, 8
	octave 2
	note C#, 4
	endchannel

Music_NewBarkTown_branch_eb3f2:
	notetype $6, $97
	dutycycle $2
	octave 4
	note B_, 12
	note A_, 12
	note G_, 8
	notetype $c, $97
	note E_, 16
	endchannel

Music_NewBarkTown_Ch3:
	stereopanning $f0
	notetype $c, $10
	octave 5
	note D_, 2
	note E_, 2
Music_NewBarkTown_branch_eb408:
	vibrato $16, $23
	note F#, 4
	note A_, 4
	note G_, 2
	note F#, 2
	note E_, 2
	note G_, 2
	note F#, 6
	note D_, 2
	octave 4
	note A_, 6
	note G_, 1
	note A_, 1
	note B_, 4
	octave 5
	note D_, 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note E_, 6
	note F#, 2
	note E_, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 4
	note A_, 4
	note A#, 2
	note A_, 2
	note G_, 2
	note A#, 2
	note A_, 6
	octave 6
	note C#, 2
	note D_, 6
	octave 5
	note E_, 1
	note F#, 1
	note G_, 6
	note A_, 2
	note B_, 8
	note A_, 6
	note G_, 1
	note F#, 1
	note E_, 4
	note __, 4
	intensity $25
	vibrato $12, $53
	octave 2
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 16
	note G_, 16
	note A_, 14
	intensity $10
	vibrato $16, $23
	octave 5
	note D_, 1
	note E_, 1
	loopchannel 0, Music_NewBarkTown_branch_eb408
