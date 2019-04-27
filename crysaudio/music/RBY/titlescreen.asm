Music_RBYTitleScreen::
	musicheader 4, 1, Music_RBYTitleScreen_Ch0
	musicheader 1, 2, Music_RBYTitleScreen_Ch1
	musicheader 1, 3, Music_RBYTitleScreen_Ch2
	musicheader 1, 4, Music_RBYTitleScreen_Ch3

Music_RBYTitleScreen_Ch0::
	tempo 144
	volume $77
	vibrato 9, $34
	dutycycle 3
	notetype 12, $c1
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
	notetype 8, $c1
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note A_, 2
	note F#, 2

Music_RBYTitleScreen_branch_7e4e2::
	callchannel Music_RBYTitleScreen_branch_7e541
	callchannel Music_RBYTitleScreen_branch_7e54a
	callchannel Music_RBYTitleScreen_branch_7e541
	octave 3
	note C_, 8
	notetype 8, $c6
	note E_, 4
	note E_, 4
	note C_, 4
	notetype 12, $c6
	octave 2
	note B_, 8
	notetype 8, $e7
	octave 3
	note F_, 4
	note E_, 4
	note C_, 4
	notetype 12, $e7
	note D_, 10
	notetype 12, $c6
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
	notetype 12, $b6
	octave 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e55c
	notetype 8, $b4
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e55c
	notetype 8, $b2
	octave 3
	note E_, 4
	note E_, 4
	note C#, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e4e2

Music_RBYTitleScreen_branch_7e541::
	notetype 12, $c6
	octave 3
	note D_, 6
	octave 2
	note B_, 2
	octave 3
	note D_, 8
	endchannel

Music_RBYTitleScreen_branch_7e54a::
	note C_, 6
	note F_, 6
	note C_, 4
	note D_, 8
	notetype 12, $e7
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype 8, $c6
	note C_, 4
	octave 2
	note B_, 4
	octave 3
	note C_, 4
	endchannel

Music_RBYTitleScreen_branch_7e55c::
	notetype 12, $c1
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


Music_RBYTitleScreen_Ch1::
	vibrato 16, $46
	dutycycle 1
	notetype 12, $e1
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
	notetype 8, $e1
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F#, 2

Music_RBYTitleScreen_branch_7e594::
	vibrato 16, $46
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
	notetype 8, $e7
	octave 4
	note C_, 4
	octave 3
	note B_, 4
	octave 4
	note C_, 4
	notetype 12, $e7
	note D_, 8
	notetype 12, $95
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
	notetype 8, $95
	octave 2
	note G_, 4
	note F_, 5
	note A_, 3
	notetype 8, $e6
	octave 4
	note F_, 4
	note E_, 4
	note F_, 4
	notetype 12, $e7
	note G_, 6
	note A#, 2
	note G_, 8
	vibrato 16, $26
	dutycycle 3
	notetype 12, $0b
	note G_, 8
	notetype 12, $e7
	note A_, 8
	dutycycle 1
	notetype 12, $e7
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
	notetype 12, $d7
	octave 5
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e636
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	notetype 8, $e5
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
	notetype 8, $e3
	octave 5
	note C_, 4
	note C_, 4
	octave 4
	note B_, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e594

Music_RBYTitleScreen_branch_7e622::
	notetype 12, $e7
	octave 3
	note G_, 6
	note B_, 2
	octave 4
	note D_, 8
	notetype 12, $95
	endchannel

Music_RBYTitleScreen_branch_7e62c::
	notetype 12, $e7
	octave 4
	note F_, 6
	note E_, 1
	note D#, 1
	note D_, 8
	notetype 12, $95
	endchannel

Music_RBYTitleScreen_branch_7e636::
	notetype 12, $e1
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


Music_RBYTitleScreen_Ch2::
	notetype 12, $10
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
	notetype 8, $10
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note F_, 2
	note A_, 2

Music_RBYTitleScreen_branch_7e65e::
	callchannel Music_RBYTitleScreen_branch_7e6c9
	callchannel Music_RBYTitleScreen_branch_7e6d0

Music_RBYTitleScreen_branch_7e664::
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
	octave 5
	;slidepitchto 1, 3, C#
	;note D_, 4
	;note __, 4
	notetype 3, $10 ; XXX
	note D_, 1 ; XXX
	note C#, 1 ; XXX
	note C_, 1 ; XXX
	octave 4 ; XXX
	note B_, 1 ; XXX
	note A#, 1 ; XXX
	note A_, 1 ; XXX
	note G#, 1 ; XXX
	note G_, 1 ; XXX
	note F#, 1 ; XXX
	note F_, 1 ; XXX
	note E_, 1 ; XXX
	note D#, 1 ; XXX
	note D_, 4 ; XXX
	note __, 16 ; XXX
	octave 6
	;slidepitchto 1, 2, C#
	;note D_, 4
	note D_, 1 ; XXX
	note C#, 1 ; XXX
	note C_, 1 ; XXX
	octave 5 ; XXX
	note B_, 1 ; XXX
	note A#, 1 ; XXX
	note A_, 1 ; XXX
	note G#, 1 ; XXX
	note G_, 1 ; XXX
	note F#, 1 ; XXX
	note F_, 1 ; XXX
	note E_, 1 ; XXX
	note D#, 1 ; XXX
	note D_, 4 ; XXX
	octave 5
	;slidepitchto 1, 3, C#
	;note D_, 4
	;note __, 2
	note D_, 1 ; XXX
	note C#, 1 ; XXX
	note C_, 1 ; XXX
	octave 4 ; XXX
	note B_, 1 ; XXX
	note A#, 1 ; XXX
	note A_, 1 ; XXX
	note G#, 1 ; XXX
	note G_, 1 ; XXX
	note F#, 1 ; XXX
	note F_, 1 ; XXX
	note E_, 1 ; XXX
	note D#, 1 ; XXX
	note D_, 4 ; XXX
	note __, 8 ; XXX
	notetype 8, $10
	octave 4
	note C_, 4
	note C_, 4
	note C#, 4
	callchannel Music_RBYTitleScreen_branch_7e6e5
	octave 6
	;slidepitchto 1, 2, C#
	;note D_, 4
	;note __, 4
	notetype 3, $10 ; XXX
	note D_, 1 ; XXX
	note C#, 1 ; XXX
	note C_, 1 ; XXX
	octave 5 ; XXX
	note B_, 1 ; XXX
	note A#, 1 ; XXX
	note A_, 1 ; XXX
	note G#, 1 ; XXX
	note G_, 1 ; XXX
	note F#, 1 ; XXX
	note F_, 1 ; XXX
	note E_, 1 ; XXX
	note D#, 1 ; XXX
	note D_, 4 ; XXX
	note __, 16 ; XXX
	octave 5
	;slidepitchto 1, 3, C#
	;note D_, 4
	;note __, 6
	note D_, 1 ; XXX
	note C#, 1 ; XXX
	note C_, 1 ; XXX
	octave 4 ; XXX
	note B_, 1 ; XXX
	note A#, 1 ; XXX
	note A_, 1 ; XXX
	note G#, 1 ; XXX
	note G_, 1 ; XXX
	note F#, 1 ; XXX
	note F_, 1 ; XXX
	note E_, 1 ; XXX
	note D#, 1 ; XXX
	note D_, 4 ; XXX
	note __, 12 ; XXX
	note __, 12 ; XXX
	notetype 8, $10
	octave 4
	note C_, 4
	note C_, 4
	octave 3
	note B_, 4
	loopchannel 0, Music_RBYTitleScreen_branch_7e65e

Music_RBYTitleScreen_branch_7e6c9::
	note G_, 6
	note D_, 3
	note G_, 6
	note D_, 3
	note G_, 3
	note D_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6d0::
	note F_, 6
	note C_, 3
	note F_, 6
	note C_, 3
	note F_, 3
	note C_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6d7::
	note A#, 6
	note F_, 3
	note A#, 6
	note F_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6dc::
	octave 4
	note C_, 6
	octave 3
	note G_, 3
	octave 4
	note C_, 6
	octave 3
	note G_, 3
	endchannel

Music_RBYTitleScreen_branch_7e6e5::
	notetype 12, $10
	octave 4
	note D_, 1
	note __, 5
	endchannel


Music_RBYTitleScreen_Ch3::
	togglenoise 0
	notetype 6
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

Music_RBYTitleScreen_branch_7e716::
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

Music_RBYTitleScreen_branch_7e834::
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 3
	endchannel

Music_RBYTitleScreen_branch_7e842::
	note C#, 1
	note __, 3
	note C#, 1
	note __, 5
	note D_, 1
	note C#, 1
	note C#, 1
	note __, 3
	endchannel
