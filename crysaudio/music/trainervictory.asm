Music_TrainerVictory:
	musicheader 3, 1, Music_TrainerVictory_Ch1
	musicheader 1, 2, Music_TrainerVictory_Ch2
	musicheader 1, 3, Music_TrainerVictory_Ch3

Music_TrainerVictory_Ch1:
	tempo 120
	volume $77
	dutycycle $2
	tone $0001
	notetype $8, $b1
	octave 4
	note E_, 2
	note E_, 2
	note E_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	intensity $b6
	note A_, 12
	stereopanning $f
Music_TrainerVictory_branch_ebecd:
	intensity $72
	callchannel Music_TrainerVictory_branch_ebf11
	intensity $51
	note C#, 2
	note E_, 2
	note F#, 2
	note A_, 2
	note B_, 2
	octave 4
	note C#, 2
	intensity $72
	octave 3
	note A_, 2
	note __, 2
	octave 4
	note C#, 2
	note E_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebecd
	callchannel Music_TrainerVictory_branch_ebf11
	note A_, 2
	note __, 2
	note F_, 2
	note A_, 6
	note A#, 2
	note __, 2
	note G_, 2
	note A#, 6
Music_TrainerVictory_branch_ebef2:
	intensity $72
	octave 4
	note D_, 2
	note C#, 2
	octave 3
	note A_, 2
	loopchannel 3, Music_TrainerVictory_branch_ebef2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 2
Music_TrainerVictory_branch_ebf01:
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	loopchannel 3, Music_TrainerVictory_branch_ebf01
	note E_, 2
	note F#, 2
	note G_, 2
	loopchannel 0, Music_TrainerVictory_branch_ebecd

Music_TrainerVictory_branch_ebf11:
	octave 3
	note F#, 2
	note __, 2
	note D_, 2
	note F#, 6
	note G_, 2
	note __, 2
	note E_, 2
	note G_, 6
	endchannel

Music_TrainerVictory_Ch2:
	vibrato $12, $34
	dutycycle $3
	notetype $8, $d1
	octave 4
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note B_, 2
	octave 5
	note C#, 2
	intensity $d6
	note D_, 12
	stereopanning $f0
Music_TrainerVictory_branch_ebf30:
	notetype $8, $82
	callchannel Music_TrainerVictory_branch_ebf56
	note F#, 2
	note __, 2
	note G_, 2
	note A_, 6
	note E_, 2
	note __, 2
	note F#, 2
	note G_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebf30
	callchannel Music_TrainerVictory_branch_ebf56
	note F_, 2
	note __, 2
	note C_, 2
	note F_, 6
	note G_, 2
	note __, 2
	note D_, 2
	note G_, 6
	notetype $c, $88
	note F#, 16
	note E_, 16
	loopchannel 0, Music_TrainerVictory_branch_ebf30

Music_TrainerVictory_branch_ebf56:
	octave 4
	note D_, 2
	note __, 2
	octave 3
	note A_, 2
	octave 4
	note D_, 6
	note E_, 2
	note __, 2
	octave 3
	note B_, 2
	octave 4
	note E_, 6
	endchannel

Music_TrainerVictory_Ch3:
	notetype $8, $25
	octave 3
	note G_, 6
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 6
	note D_, 2
	note C#, 2
	octave 2
	note B_, 2
Music_TrainerVictory_branch_ebf74:
	callchannel Music_TrainerVictory_branch_ebfb1
	octave 3
	note C#, 2
	note __, 2
	note C#, 2
	note A_, 2
	note F#, 2
	note C#, 2
	octave 2
	note A_, 2
	note __, 2
	octave 3
	note A_, 1
	note __, 1
	note A_, 6
	loopchannel 2, Music_TrainerVictory_branch_ebf74
	callchannel Music_TrainerVictory_branch_ebfb1
	octave 3
	note C_, 2
	note __, 2
	note C_, 2
	note A_, 2
	note F_, 2
	note C_, 2
	note D_, 2
	note __, 2
	note D_, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	note G_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 4
	note D_, 12
	octave 3
	note A_, 2
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	octave 3
	note D_, 2
	note E_, 2
	note A_, 12
	note G_, 2
	note E_, 2
	note C#, 2
	loopchannel 0, Music_TrainerVictory_branch_ebf74

Music_TrainerVictory_branch_ebfb1:
	octave 2
	note A_, 2
	note __, 2
	note A_, 2
	octave 3
	note F#, 2
	note D_, 2
	octave 2
	note A_, 2
	note B_, 2
	note __, 2
	note B_, 2
	octave 3
	note G_, 2
	note E_, 2
	octave 2
	note B_, 2
	endchannel
