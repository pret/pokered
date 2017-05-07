Music_NationalPark: ; f54e8
	dbw $c0, Music_NationalPark_Ch1
	dbw $01, Music_NationalPark_Ch2
	dbw $02, Music_NationalPark_Ch3
	dbw $03, Music_NationalPark_Ch4
; f54f4

Music_NationalPark_Ch1: ; f54f4
	tempo 192
	volume $77
	stereopanning $f
	vibrato $18, $24
	dutycycle $1
	notetype $c, $77
	note __, 2
Music_NationalPark_branch_f5504: ; f5504
	callchannel Music_NationalPark_branch_f554a
	callchannel Music_NationalPark_branch_f554a
	notetype $6, $67
	callchannel Music_NationalPark_branch_f563a
	notetype $c, $77
	note __, 16
	octave 2
	note A#, 1
	octave 3
	note D_, 1
	note F_, 1
	note G#, 1
	note D_, 1
	note F_, 1
	note A#, 1
	notetype $6, $67
	octave 4
	note D_, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 1
	note __, 3
	note D_, 1
	note __, 3
	note D_, 1
	note __, 1
	callchannel Music_NationalPark_branch_f563a
	intensity $77
	octave 3
	note E_, 1
	note F_, 5
	note D#, 4
	note __, 2
	note C_, 12
	note F_, 8
	note C#, 1
	intensity $98
	note D_, 16
	intensity $77
	note D_, 7
	notetype $c, $77
	note __, 4
	loopchannel 0, Music_NationalPark_branch_f5504
; f554a

Music_NationalPark_branch_f554a: ; f554a
	octave 2
	note G#, 6
	octave 3
	note F_, 2
	intensity $47
	note F_, 1
	note G#, 1
	intensity $57
	note F_, 1
	note G#, 1
	intensity $77
	note F_, 1
	note G#, 1
	intensity $97
	note F_, 1
	note G#, 1
	intensity $77
	octave 2
	note A_, 6
	octave 3
	note F#, 2
	intensity $47
	note F#, 1
	note A_, 1
	intensity $57
	note F#, 1
	note A_, 1
	intensity $77
	note F#, 1
	note A_, 1
	intensity $97
	note F#, 1
	note A_, 1
	intensity $77
	octave 2
	note G#, 6
	octave 3
	note F_, 2
	intensity $47
	octave 4
	note C_, 1
	note C#, 1
	intensity $57
	note C_, 1
	note C#, 1
	intensity $77
	note C_, 1
	note C#, 1
	intensity $97
	note C_, 1
	note C#, 1
	intensity $77
	octave 2
	note A_, 6
	octave 3
	note C#, 2
	intensity $47
	octave 4
	note C#, 1
	note D#, 1
	intensity $57
	note C#, 1
	note D#, 1
	intensity $77
	note C#, 1
	note D#, 1
	intensity $97
	note C#, 1
	note D#, 1
	intensity $77
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	intensity $47
	octave 4
	note C#, 1
	note D#, 1
	intensity $57
	note C#, 1
	note D#, 1
	intensity $77
	note C#, 1
	note D#, 1
	intensity $97
	note C#, 1
	note D#, 1
	intensity $77
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	intensity $57
	octave 4
	note F_, 1
	note D#, 1
	intensity $67
	note D_, 1
	note D#, 1
	intensity $77
	note F_, 1
	note F#, 1
	intensity $97
	note G#, 1
	note A#, 1
	intensity $77
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	octave 4
	note C#, 2
	octave 3
	note A_, 2
	intensity $47
	octave 4
	note C#, 1
	note D#, 1
	intensity $57
	note C#, 1
	note D#, 1
	intensity $77
	note C#, 1
	note D#, 1
	intensity $97
	note C#, 1
	note D#, 1
	intensity $77
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note C_, 2
	octave 3
	note G#, 2
	octave 4
	note D#, 2
	note C_, 2
	note D#, 2
	note C_, 2
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	octave 4
	note D_, 2
	octave 3
	note A#, 2
	endchannel
; f563a

Music_NationalPark_branch_f563a: ; f563a
	note __, 16
	note __, 3
	octave 4
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 2
	note __, 4
	note __, 16
	note __, 3
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 2
	note __, 4
	endchannel
; f5652

Music_NationalPark_Ch2: ; f5652
	vibrato $14, $24
	dutycycle $1
	notetype $c, $a7
	note __, 2
	stereopanning $f0
Music_NationalPark_branch_f565d: ; f565d
	notetype $c, $a7
	callchannel Music_NationalPark_branch_f56b8
	octave 3
	note D_, 8
	callchannel Music_NationalPark_branch_f56b8
	note __, 2
	intensity $a7
	octave 4
	note G#, 2
	note F#, 2
	note F_, 2
	notetype $6, $a7
	callchannel Music_NationalPark_branch_f56f5
	octave 3
	note B_, 1
	octave 4
	note C_, 5
	octave 3
	note G#, 4
	note __, 2
	octave 4
	note A#, 8
	note G#, 2
	note __, 2
	note F#, 2
	note __, 2
	note G#, 4
	note E_, 1
	note F_, 14
	intensity $87
	note G_, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 3
	note G#, 1
	note __, 3
	note G#, 1
	note __, 1
	intensity $a7
	callchannel Music_NationalPark_branch_f56f5
	octave 3
	note B_, 1
	octave 4
	note C_, 5
	octave 3
	note G#, 4
	note __, 2
	note A#, 12
	octave 4
	note C_, 8
	octave 3
	note A_, 1
	vibrato $0, $0
	intensity $b8
	note A#, 16
	vibrato $14, $24
	intensity $b7
	note A#, 11
	octave 2
	note D#, 2
	note D_, 2
	loopchannel 0, Music_NationalPark_branch_f565d
; f56b8

Music_NationalPark_branch_f56b8: ; f56b8
	octave 2
	note C#, 6
	note G#, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note A_, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note G#, 2
	octave 3
	note C#, 8
	octave 2
	note C#, 6
	note A_, 2
	octave 3
	note F#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A_, 8
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note G#, 8
	octave 1
	note A#, 6
	octave 2
	note F_, 2
	octave 3
	note D_, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A#, 8
	octave 1
	note F#, 6
	octave 2
	note C#, 2
	note A_, 8
	octave 1
	note F_, 6
	octave 2
	note C_, 2
	note G#, 8
	octave 1
	note A#, 6
	octave 2
	note F_, 2
	endchannel
; f56f5

Music_NationalPark_branch_f56f5: ; f56f5
	octave 4
	note E_, 1
	note F_, 5
	note F#, 4
	note __, 2
	note C#, 7
	intensity $87
	octave 5
	note E_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 2
	intensity $a7
	octave 3
	note A#, 2
	octave 4
	note C#, 2
	octave 4
	note E_, 1
	note F_, 5
	note F#, 4
	note __, 2
	note D#, 7
	intensity $87
	octave 5
	note D_, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 2
	intensity $a7
	octave 4
	note D_, 2
	note C#, 2
	endchannel
; f5723

Music_NationalPark_Ch3: ; f5723
	vibrato $16, $24
	notetype $c, $11
	octave 4
	note G#, 1
	note A#, 1
	stereopanning $ff
Music_NationalPark_branch_f572e: ; f572e
	callchannel Music_NationalPark_branch_f5756
	octave 5
	note A#, 14
	octave 4
	note G#, 1
	note A#, 1
	callchannel Music_NationalPark_branch_f5756
	octave 5
	note A#, 8
	octave 4
	note D_, 8
	intensity $15
	callchannel Music_NationalPark_branch_f578f
	octave 4
	note D_, 1
	octave 3
	note F_, 3
	callchannel Music_NationalPark_branch_f578f
	octave 4
	note D_, 1
	octave 3
	note F_, 1
	intensity $11
	octave 4
	note G#, 1
	note A#, 1
	loopchannel 0, Music_NationalPark_branch_f572e
; f5756

Music_NationalPark_branch_f5756: ; f5756
	octave 5
	note C_, 16
	note C#, 14
	note G#, 1
	note A#, 1
	octave 6
	note C_, 16
	note C#, 10
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A#, 10
	octave 6
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A_, 9
	octave 6
	note D_, 1
	octave 6
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note G#, 4
	octave 6
	note G#, 4
	note D#, 2
	note F_, 14
	note D_, 1
	note D#, 1
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A#, 10
	octave 6
	note F_, 2
	note D#, 2
	note C#, 2
	octave 5
	note A_, 10
	octave 6
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note G#, 4
	note A#, 4
	octave 6
	note C_, 2
	endchannel
; f578f

Music_NationalPark_branch_f578f: ; f578f
	octave 2
	note F#, 3
	octave 3
	note C#, 2
	note __, 1
	note A#, 4
	note C#, 1
	note __, 1
	note A#, 1
	note C#, 3
	octave 2
	note F#, 3
	octave 3
	note C#, 2
	note __, 1
	note A_, 4
	note C#, 1
	note __, 1
	note A_, 1
	note C#, 3
	octave 2
	note F_, 3
	octave 3
	note C_, 2
	note __, 1
	note G#, 4
	note C_, 1
	note __, 1
	note G#, 1
	note C_, 3
	octave 2
	note A#, 3
	octave 3
	note F_, 2
	note __, 1
	octave 4
	note D_, 4
	octave 3
	note F_, 1
	note __, 1
	endchannel
; f57b8

Music_NationalPark_Ch4: ; f57b8
	togglenoise $3
	notetype $c
	note __, 2
Music_NationalPark_branch_f57bd: ; f57bd
	note __, 16
	loopchannel 23, Music_NationalPark_branch_f57bd
	note __, 8
	note A#, 2
	note D_, 2
	note A#, 1
	note D_, 1
	note B_, 2
Music_NationalPark_branch_f57c8: ; f57c8
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note B_, 2
	loopchannel 7, Music_NationalPark_branch_f57c8
	note A#, 2
	note G_, 1
	note G_, 1
	note D_, 2
	note G_, 1
	note G_, 1
	note A#, 2
	note D#, 1
	note D#, 1
	note D_, 1
	note D_, 1
	note A#, 1
	note D#, 1
	loopchannel 0, Music_NationalPark_branch_f57bd
; f57e8


