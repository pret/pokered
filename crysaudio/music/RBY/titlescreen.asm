Music_RBYTitleScreen:
	dbw $C0, Music_RBYTitleScreen_Ch1
	dbw $01, Music_RBYTitleScreen_Ch2
	dbw $02, Music_RBYTitleScreen_Ch3
	dbw $03, Music_RBYTitleScreen_Ch4

Music_RBYTitleScreen_Ch1: ; 7e4c0 (1f:64c0)
	ftempo 144
	volume 119
	vibrato 9, 52
	dutycycle 3
	notetype 12, 193
	octave 2
	note E_, 1
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	octave 2
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 4
	note G_, 4
	note G_, 4
	notetype 8, 193
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note F#, 2

Music_RBYTitleScreen_branch_7e4e2:
	callchannel Music_RBYTitleScreen_branch_7e541
	callchannel Music_RBYTitleScreen_branch_7e54a
	callchannel Music_RBYTitleScreen_branch_7e541
	octave 3
	note C_, 8
	notetype 8, 198
	note E_, 4
	note E_, 4
	note C_, 4
	notetype 12, 198
	octave 2
	note B_, 8
	notetype 8, 231
	octave 3
	note F_, 4
	note E_, 4
	note C_, 4
	notetype 12, 231
	note D_, 10
	notetype 12, 198
	octave 2
	note B_, 2
	octave 3
	note C_, 2
	note D_, 2
	callchannel Music_RBYTitleScreen_branch_7e541
	callchannel Music_RBYTitleScreen_branch_7e54a
	callchannel Music_RBYTitleScreen_branch_7e541
	note C_, 6
	note C_, 6
	note E_, 4
	note D_, 6
	note F_, 2
	note G_, 2
	note D_, 4
	note G_, 2
	note G_, 6
	note A_, 4
	note F_, 2
	note A_, 2
	octave 4
	note C_, 2
	octave 3
	note D_, 12
	note E_, 4
	note F_, 8
	note G_, 4
	note F_, 4
	note E_, 12
	note F_, 4
	note G_, 8
	notetype 12, 182
	octave 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e55c
	notetype 8, 180
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e55c
	notetype 8, 178
	octave 3
	note E_, 4
	note E_, 4
	note C#, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e4e2

Music_RBYTitleScreen_branch_7e541:
	notetype 12, 198
	octave 3
	note D_, 6
	octave 2
	note B_, 2
	octave 3
	note D_, 8
	endchannel

Music_RBYTitleScreen_branch_7e54a:
	note C_, 6
	note F_, 6
	note C_, 4
	note D_, 8
	notetype 12, 231
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype 8, 198
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	endchannel

Music_RBYTitleScreen_branch_7e55c:
	notetype 12, 193
	note D_, 1
	note __, 1
	octave 2
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	endchannel


Music_RBYTitleScreen_Ch2: ; 7e578 (1f:6578)
	vibrato 16, 70
	dutycycle 1
	notetype 12, 225
	octave 2
	note G_, 1
	note B_, 1
	octave 3
	note D_, 1
	note F#, 1
	note G_, 4
	note G_, 6
	note G_, 1
	note G_, 1
	note G_, 4
	note G_, 4
	note G_, 4
	notetype 8, 225
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F#, 2

Music_RBYTitleScreen_branch_7e594:
	vibrato 16, 70
	callchannel Music_RBYTitleScreen_branch_7e622
	octave 2
	note A_, 4
	note F_, 4
	callchannel Music_RBYTitleScreen_branch_7e62c
	octave 2
	note A_, 8
	note B_, 16
	callchannel Music_RBYTitleScreen_branch_7e622
	octave 2
	note A_, 6
	note F_, 2
	notetype 8, 231
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	notetype 12, 231
	note D_, 8
	notetype 12, 149
	octave 2
	note D_, 6
	note D_, 1
	note F#, 1
	note G_, 16
	callchannel Music_RBYTitleScreen_branch_7e622
	octave 2
	note A_, 2
	note F_, 6
	callchannel Music_RBYTitleScreen_branch_7e62c
	octave 3
	note C_, 2
	octave 2
	note A_, 6
	note B_, 6
	note G_, 2
	note F_, 8
	callchannel Music_RBYTitleScreen_branch_7e622
	notetype 8, 149
	octave 2
	note G_, 4
	note F_, 5
	note A_, 3
	notetype 8, 230
	octave 4
	note F_, 4
	note E_, 4
	note F_, 4
	notetype 12, 231
	note G_, 6
	note A#, 2
	note G_, 8
	vibrato 16, 38
	dutycycle 3
	notetype 12, 11
	note G_, 8
	notetype 12, 231
	note A_, 8
	dutycycle 1
	notetype 12, 231
	note A#, 6
	note F_, 2
	note F_, 8
	octave 3
	note D_, 8
	octave 4
	note A#, 4
	note B_, 4
	octave 5
	note C_, 6
	octave 4
	note G_, 2
	note G_, 8
	octave 3
	note E_, 8
	notetype 12, 215
	octave 5
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e636
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	notetype 8, 229
	octave 5
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e636
	note D_, 1
	note __, 2
	note D_, 1
	note __, 3
	note D_, 1
	notetype 8, 227
	octave 5
	note C_, 4
	note C_, 4
	octave 4
	note B_, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e594

Music_RBYTitleScreen_branch_7e622:
	notetype 12, 231
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	notetype 12, 149
	endchannel

Music_RBYTitleScreen_branch_7e62c:
	notetype 12, 231
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype 12, 149
	endchannel

Music_RBYTitleScreen_branch_7e636:
	notetype 12, 225
	note D_, 1
	note __, 2
	octave 4
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	endchannel


Music_RBYTitleScreen_Ch3: ; 7e643 (1f:6643)
	notetype 12, 16
	octave 3
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 5
	note G_, 1
	note G_, 1
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	note G_, 1
	note __, 3
	notetype 8, 16
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note A_, 2

Music_RBYTitleScreen_branch_7e65e:
	callchannel Music_RBYTitleScreen_branch_7e6c9
	callchannel Music_RBYTitleScreen_branch_7e6d0

Music_RBYTitleScreen_branch_7e664:
	callchannel Music_RBYTitleScreen_branch_7e6c9
	callchannel Music_RBYTitleScreen_branch_7e6c9
	callchannel Music_RBYTitleScreen_branch_7e6c9
	callchannel Music_RBYTitleScreen_branch_7e6d0
	loopchannel 3, Music_RBYTitleScreen_branch_7e664
	callchannel Music_RBYTitleScreen_branch_7e6c9
	note G_, 6
	note D_, 3
	note A_, 6
	note F_, 3
	note A_, 3
	note F_, 3
	callchannel Music_RBYTitleScreen_branch_7e6d7
	note A#, 3
	note F_, 3
	callchannel Music_RBYTitleScreen_branch_7e6d7
	note B_, 3
	note G_, 3
	callchannel Music_RBYTitleScreen_branch_7e6dc
	octave 4
	note C_, 3
	octave 3
	note G_, 3
	callchannel Music_RBYTitleScreen_branch_7e6dc
	octave 4
	note C#, 3
	octave 3
	note A_, 3
	callchannel Music_RBYTitleScreen_branch_7e6e5
	notetype 3, 16
	octave 5
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	note __, 16
	octave 6
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	octave 5
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	note __, 8
	notetype 8, 16
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e6e5
	octave 6
	notetype 3, 16
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	note __, 16
	octave 5
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 4
	notetype 8, 16
	octave 4
	note __, 9
	note C_, 4
	note C_, 4
	octave 3
	note B_, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e65e

Music_RBYTitleScreen_branch_7e6c9:
	note G_, 6
	note D_, 3
	note G_, 6
	note D_, 3
	note G_, 3
	note D_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6d0:
	note F_, 6
	note C_, 3
	note F_, 6
	note C_, 3
	note F_, 3
	note C_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6d7:
	note A#, 6
	note F_, 3
	note A#, 6
	note F_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6dc:
	octave 4
	note C_, 6
	octave 3
	note G_, 3
	octave 4
	note C_, 6
	octave 3
	note G_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6e5:
	notetype 12, 16
	octave 4
	note D_, 1
	note __, 5
	endchannel


Music_RBYTitleScreen_Ch4: ; 7e6eb (1f:66eb)
	notetype 6
	togglenoise 0
	note __, 4
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	notetype 12
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note C#, 1
	note C#, 1
	note __, 3
	note C#, 1
	note __, 3
	note C#, 1
	note __, 3
	notetype 8
	note D_, 2
	note D#, 2
	note C#, 2
	note D_, 2
	note C#, 2
	note C_, 2

Music_RBYTitleScreen_branch_7e716:
	notetype 12
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 3
	callchannel Music_RBYTitleScreen_branch_7e834
	callchannel Music_RBYTitleScreen_branch_7e834
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note C#, 1
	callchannel Music_RBYTitleScreen_branch_7e842
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	callchannel Music_RBYTitleScreen_branch_7e842
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	notetype 6
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	notetype 12
	callchannel Music_RBYTitleScreen_branch_7e834
	callchannel Music_RBYTitleScreen_branch_7e842
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 3
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 1
	note D_, 1
	note C#, 1
	callchannel Music_RBYTitleScreen_branch_7e834
	callchannel Music_RBYTitleScreen_branch_7e842
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 3
	note D_, 1
	note __, 5
	note C#, 1
	note D#, 1
	note C#, 1
	note __, 1
	notetype 6
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	notetype 12
	note C_, 1
	note __, 3
	note C#, 1
	note __, 5
	note D_, 1
	note C#, 1
	note C_, 1
	note __, 3
	note C#, 1
	note __, 3
	note D_, 1
	note __, 5
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 3
	note C#, 1
	note __, 3
	note D_, 1
	note __, 5
	note C#, 1
	note D_, 1
	note D#, 1
	note __, 1
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 3
	note D_, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 3
	note E_, 1
	note __, 5
	note C#, 1
	note __, 3
	note D_, 1
	note C#, 1
	note C_, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	notetype 8
	note C#, 4
	note D_, 4
	note C_, 4
	notetype 12
	note E_, 1
	note __, 5
	note C#, 1
	note __, 3
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note C#, 1
	notetype 8
	note C#, 4
	note D_, 4
	note C#, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e716

Music_RBYTitleScreen_branch_7e834:
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 3
	endchannel

Music_RBYTitleScreen_branch_7e842:
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 3
	endchannel
; 0x7e850