Music_MainMenu:
	musicheader 4, 1, Music_MainMenu_Ch1
	musicheader 1, 2, Music_MainMenu_Ch2
	musicheader 1, 3, Music_MainMenu_Ch3
	musicheader 1, 4, Music_MainMenu_Ch4

Music_MainMenu_Ch1:
	tempo 160
	volume $77
	dutycycle $3
	tone $0001
	vibrato $10, $15
	stereopanning $f0
	notetype $c, $f
	octave 3
	note D_, 8
Music_MainMenu_branch_f791d:
	notetype $c, $92
	octave 3
	note C#, 6
	note C#, 1
	note C#, 1
	note C#, 2
	note C#, 2
	note C#, 4
	loopchannel 2, Music_MainMenu_branch_f791d
	note D#, 6
	note D#, 1
	note D#, 1
	note D#, 2
	note D#, 2
	note D#, 4
	octave 2
	note B_, 6
	note B_, 1
	note B_, 1
	note B_, 2
	note B_, 2
	notetype $c, $94
	octave 3
	note C_, 4
	loopchannel 0, Music_MainMenu_branch_f791d

Music_MainMenu_Ch2:
	dutycycle $3
	stereopanning $f
	notetype $c, $f
	octave 3
	note G_, 8
Music_MainMenu_branch_f7949:
	notetype $c, $a2
	note F#, 6
	note F#, 1
	note F#, 1
	note F#, 2
	note F#, 2
	note F#, 4
	loopchannel 2, Music_MainMenu_branch_f7949
	note G#, 6
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 4
	note E_, 6
	note E_, 1
	note E_, 1
	note E_, 2
	note E_, 2
	notetype $c, $a4
	note F_, 4
	loopchannel 0, Music_MainMenu_branch_f7949

Music_MainMenu_Ch3:
	stereopanning $f0
	notetype $c, $25
	note __, 8
Music_MainMenu_branch_f796f:
	octave 2
	note F#, 1
	note __, 5
	note F#, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 3
	loopchannel 2, Music_MainMenu_branch_f796f
	note G#, 1
	note __, 5
	note G#, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 3
	note E_, 1
	note __, 5
	note E_, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 3
	loopchannel 0, Music_MainMenu_branch_f796f

Music_MainMenu_Ch4:
	stereopanning $f
	togglenoise $3
	notetype $c
	note __, 8
	note __, 16
	note __, 16
	note __, 16
	note __, 12
	note D_, 1
	note D_, 1
	note D_, 1
	note D_, 1
Music_MainMenu_branch_f79a5:
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D_, 4
	note D_, 6
	note D_, 1
	note D_, 1
	note D_, 2
	note D_, 2
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	loopchannel 0, Music_MainMenu_branch_f79a5
