Music_MobileAdapterMenu:
	musicheader 3, 1, Music_MobileAdapterMenu_Ch1
	musicheader 1, 2, Music_MobileAdapterMenu_Ch2
	musicheader 1, 3, Music_MobileAdapterMenu_Ch3

Music_MobileAdapterMenu_Ch1:
	tempo 168
	volume $77
	tone $0001
	stereopanning $f
	dutycycle $2
	notetype $c, $66
	note __, 2
Music_MobileAdapterMenu_branch_178038:
	callchannel Music_MobileAdapterMenu_branch_178057
	callchannel Music_MobileAdapterMenu_branch_178076
	octave 3
	note F#, 4
	note B_, 4
	note F#, 2
	note B_, 1
	note __, 1
	note D#, 4
	callchannel Music_MobileAdapterMenu_branch_178076
	octave 3
	note F#, 2
	octave 2
	note B_, 2
	octave 3
	note D#, 3
	note E_, 1
	note D#, 8
	callchannel Music_MobileAdapterMenu_branch_178057
	loopchannel 0, Music_MobileAdapterMenu_branch_178038

Music_MobileAdapterMenu_branch_178057:
	octave 3
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note F#, 4
	note E_, 8
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note D#, 4
	note G#, 7
	octave 4
	note E_, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	note F#, 4
	note A_, 2
	note E_, 2
	note A_, 3
	note A_, 1
	note G#, 8
	endchannel

Music_MobileAdapterMenu_branch_178076:
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note C#, 3
	octave 3
	note B_, 1
	note A_, 2
	octave 4
	note E_, 1
	note __, 1
	note C#, 4
	endchannel

Music_MobileAdapterMenu_Ch2:
	stereopanning $f0
	notetype $c, $84
	dutycycle $2
	octave 4
	note E_, 1
	note G#, 1
Music_MobileAdapterMenu_branch_17808e:
	callchannel Music_MobileAdapterMenu_branch_1780ae
	note E_, 8
	callchannel Music_MobileAdapterMenu_branch_1780d7
	note D#, 2
	note C#, 2
	note D#, 3
	note E_, 1
	note F#, 8
	callchannel Music_MobileAdapterMenu_branch_1780d7
	note D#, 2
	note E_, 2
	note F#, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	callchannel Music_MobileAdapterMenu_branch_1780ae
	note E_, 6
	note E_, 1
	note G#, 1
	loopchannel 0, Music_MobileAdapterMenu_branch_17808e

Music_MobileAdapterMenu_branch_1780ae:
	octave 4
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 3
	note G#, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	note D#, 2
	note E_, 3
	note G#, 1
	note F#, 6
	note E_, 1
	note G#, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 3
	note G#, 1
	note F#, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 3
	note B_, 4
	octave 4
	note C#, 2
	octave 3
	note B_, 2
	octave 4
	note C#, 3
	note D#, 1
	endchannel

Music_MobileAdapterMenu_branch_1780d7:
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 3
	note F#, 1
	note E_, 2
	note A_, 1
	note __, 1
	note E_, 4
	endchannel

Music_MobileAdapterMenu_Ch3:
	vibrato $8, $34
	notetype $c, $25
	note __, 2
Music_MobileAdapterMenu_branch_1780e9:
	callchannel Music_MobileAdapterMenu_branch_178119
	octave 2
	note B_, 1
	note G#, 1
	callchannel Music_MobileAdapterMenu_branch_178146
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 1
	note D#, 1
	note F#, 2
	note D#, 1
	note __, 1
	octave 2
	note B_, 2
	note F#, 1
	note G#, 1
	callchannel Music_MobileAdapterMenu_branch_178146
	octave 2
	note B_, 2
	note __, 2
	octave 3
	note F#, 2
	note __, 1
	note D#, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note F#, 4
	callchannel Music_MobileAdapterMenu_branch_178119
	note __, 2
	loopchannel 0, Music_MobileAdapterMenu_branch_1780e9

Music_MobileAdapterMenu_branch_178119:
	octave 3
	note E_, 2
	note __, 2
	note B_, 2
	note __, 1
	note G#, 1
	note D#, 1
	note __, 1
	note B_, 1
	note __, 1
	note D#, 4
	note C#, 2
	note __, 2
	note A_, 2
	note __, 1
	note F#, 1
	octave 2
	note B_, 1
	note __, 1
	octave 3
	note D#, 1
	note __, 1
	note F#, 4
	note E_, 2
	note __, 2
	note B_, 2
	note __, 1
	note G#, 1
	note D#, 1
	note __, 1
	note B_, 1
	note __, 1
	note D#, 4
	note C#, 2
	note __, 2
	note A_, 2
	note __, 1
	note C#, 1
	note E_, 3
	intensity $35
	note E_, 3
	intensity $25
	endchannel

Music_MobileAdapterMenu_branch_178146:
	note A_, 2
	note __, 2
	octave 3
	note A_, 2
	note __, 1
	note C#, 1
	note A_, 2
	octave 4
	note C#, 1
	note __, 1
	octave 3
	note A_, 4
	endchannel
