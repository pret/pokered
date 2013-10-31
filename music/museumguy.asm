Music_MuseumGuy_Ch1: ; adae (2:6dae)
	tempo 0, 128
	stereopanning 119
	duty 2
	togglecall
	notetype 12, 11, 1
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note D#, 2
	octave 2
	note B_, 4
	note B_, 1
	octave 3
	note D#, 1
	note E_, 1
	note G#, 1
	note B_, 10
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6

Music_MuseumGuy_branch_add6:
	callchannel Music_MuseumGuy_branch_ade7
	callchannel Music_MuseumGuy_branch_adec
	callchannel Music_MuseumGuy_branch_ade7
	note E_, 4
	note E_, 4
	note E_, 2
	note E_, 6
	loopchannel 0, Music_MuseumGuy_branch_add6

Music_MuseumGuy_branch_ade7:
	note E_, 2
	note E_, 6
	note F#, 2
	note F#, 6
	endchannel

Music_MuseumGuy_branch_adec:
	note E_, 2
	note E_, 6
	note D_, 2
	note D_, 6
	endchannel


Music_MuseumGuy_Ch2: ; adf1 (2:6df1)
	duty 2
	notetype 12, 12, 1
	octave 4
	note E_, 2
	note D_, 2
	note C#, 2
	note D_, 2
	note C#, 2
	octave 3
	note B_, 2
	note A_, 2
	note G#, 2
	note E_, 4
	note E_, 1
	note G#, 1
	note B_, 1
	octave 4
	note D#, 1
	note E_, 8
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 4
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note C#, 2
	octave 3
	note B_, 4
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 2
	note F#, 2
	note A_, 2
	note A_, 2
	note G#, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 2
	note A_, 2
	note A_, 4

Music_MuseumGuy_branch_ae26:
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, 8, 1
	note E_, 1
	notetype 12, 12, 1
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, 9, 1
	note A_, 1
	notetype 12, 12, 1
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	note E_, 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 3
	note B_, 1
	note B_, 3
	notetype 12, 10, 1
	note G#, 1
	notetype 12, 12, 1
	note A_, 2
	octave 4
	note C#, 2
	note E_, 3
	notetype 12, 9, 1
	note E_, 1
	notetype 12, 12, 1
	note D_, 2
	note F#, 2
	note A_, 3
	notetype 12, 8, 1
	note A_, 1
	notetype 12, 12, 1
	note G#, 2
	note E_, 1
	notetype 12, 8, 1
	note E_, 1
	notetype 12, 12, 1
	note F#, 2
	notetype 12, 8, 1
	note F#, 1
	notetype 12, 12, 1
	note G#, 1
	note A_, 2
	note A_, 2
	note A_, 4
	loopchannel 0, Music_MuseumGuy_branch_ae26


Music_MuseumGuy_Ch3: ; ae6e (2:6e6e)
	notetype 12, 1, 0
	rest 16
	octave 4
	note E_, 1
	rest 3
	note E_, 1
	rest 3
	note E_, 1
	rest 9
	callchannel Music_MuseumGuy_branch_aeb8
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	note G#, 1
	rest 1
	note G#, 1
	rest 5
	callchannel Music_MuseumGuy_branch_aeb8
	note B_, 1
	rest 3
	note G#, 1
	rest 3
	note A_, 1
	rest 1
	note A_, 1
	rest 3

Music_MuseumGuy_branch_ae8e:
	callchannel Music_MuseumGuy_branch_aec1
	rest 3
	octave 6
	note E_, 1
	rest 1
	octave 5
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	note B_, 1
	rest 1
	note G#, 1
	rest 1
	note G#, 1
	rest 3
	callchannel Music_MuseumGuy_branch_aec1
	rest 1
	octave 6
	note E_, 1
	rest 1
	note D_, 1
	rest 1
	octave 5
	note B_, 1
	rest 1
	note A_, 1
	rest 1
	note G#, 1
	rest 3
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	loopchannel 0, Music_MuseumGuy_branch_ae8e

Music_MuseumGuy_branch_aeb8:
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	note A_, 1
	rest 1
	note A_, 1
	rest 5
	endchannel

Music_MuseumGuy_branch_aec1:
	octave 6
	note C#, 1
	rest 1
	octave 5
	note A_, 1
	rest 1
	note A_, 1
	rest 3
	octave 6
	note F#, 1
	rest 1
	octave 5
	note A_, 1
	rest 1
	note A_, 1
	endchannel


Music_MuseumGuy_Ch4: ; aed1 (2:6ed1)
	dspeed 12
	rest 16
	rest 16
	rest 16
	rest 16
	rest 16
	rest 14
	dspeed 6
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3

Music_MuseumGuy_branch_aee1:
	dnote 4, mutedsnare2
	dnote 6, mutedsnare2
	dnote 2, mutedsnare2
	dnote 2, mutedsnare2
	dnote 2, mutedsnare2
	dnote 4, mutedsnare2
	dnote 2, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 6, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 4, mutedsnare2
	dnote 6, mutedsnare2
	dnote 2, mutedsnare2
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 2, mutedsnare2
	dnote 2, mutedsnare2
	dnote 2, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 6, mutedsnare2
	dnote 2, mutedsnare2
	dnote 4, mutedsnare2
	dnote 4, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 2, mutedsnare2
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 2, mutedsnare2
	dnote 4, mutedsnare2
	dnote 4, mutedsnare2
	dnote 2, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 2, mutedsnare2
	dnote 2, mutedsnare2
	dnote 4, mutedsnare2
	dnote 2, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	dnote 6, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 4, mutedsnare2
	dnote 4, mutedsnare2
	dnote 1, mutedsnare4
	dnote 1, mutedsnare4
	dnote 1, mutedsnare3
	dnote 1, mutedsnare3
	loopchannel 0, Music_MuseumGuy_branch_aee1
; 0xaf59