Music_DancingHall:
	musicheader 3, 1, Music_DancingHall_Ch1
	musicheader 1, 2, Music_DancingHall_Ch2
	musicheader 1, 3, Music_DancingHall_Ch3

	db $3

Music_DancingHall_Ch1:
	tempo 208
	volume $77
	stereopanning $f
	notetype $6, $b7
	note __, 3
	dutycycle $0
Music_DancingHall_branch_ef9d3:
	notetype $c, $b7
	callchannel Music_DancingHall_branch_efa17
	note __, 16
	callchannel Music_DancingHall_branch_efa17
	note __, 16
	note __, 16
	note __, 16
	intensity $b1
	octave 2
	note B_, 1
	octave 3
	note D_, 1
	note F_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note F_, 2
	notetype $8, $b1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 3
	note B_, 3
	note A_, 3
	notetype $c, $b1
	note B_, 1
	note A_, 1
	note D_, 1
	note E_, 1
	octave 4
	note F_, 2
	notetype $8, $b1
	octave 3
	note B_, 1
	octave 4
	note D_, 1
	octave 3
	note B_, 1
	notetype $c, $b5
	note A_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note A_, 1
	note __, 1
	note F_, 2
	loopchannel 0, Music_DancingHall_branch_ef9d3

Music_DancingHall_branch_efa17:
	octave 3
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 4
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 3
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	endchannel

Music_DancingHall_Ch2:
	stereopanning $f0
	notetype $6, $a1
	dutycycle $0
	vibrato $10, $24
	note __, 3
Music_DancingHall_branch_efa37:
	notetype $6, $a2
	callchannel Music_DancingHall_branch_efa7a
	callchannel Music_DancingHall_branch_efa7a
	intensity $a7
	octave 2
	note D_, 16
	note F_, 16
	notetype $c, $a7
	note E_, 16
	octave 3
	note F_, 1
	note A_, 1
	note B_, 1
	octave 4
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 2
	notetype $8, $a7
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 3
	note D_, 3
	notetype $c, $a7
	note E_, 1
	note D_, 1
	octave 3
	note A_, 1
	note B_, 1
	octave 4
	note A_, 2
	notetype $8, $a7
	note F_, 1
	note A_, 1
	note F_, 1
	notetype $c, $a7
	note E_, 1
	note __, 1
	note F_, 1
	note F_, 1
	note E_, 1
	note __, 1
	note D_, 2
	loopchannel 0, Music_DancingHall_branch_efa37

Music_DancingHall_branch_efa7a:
	intensity $a1
	octave 4
	note E_, 4
	octave 2
	note E_, 4
	octave 4
	note E_, 4
	octave 2
	note E_, 4
	octave 4
	note B_, 4
	note A_, 4
	note F_, 4
	note A_, 4
	intensity $33
	note D_, 1
	note F_, 1
	intensity $63
	note D_, 1
	note F_, 1
	intensity $93
	note D_, 1
	note F_, 1
	intensity $c3
	note D_, 1
	note F_, 1
	intensity $e3
	note D_, 1
	note F_, 1
	intensity $a3
	note D_, 1
	note F_, 1
	intensity $83
	note D_, 1
	note F_, 1
	intensity $53
	note D_, 1
	note F_, 1
	intensity $73
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	intensity $a3
	octave 3
	note B_, 1
	octave 4
	note E_, 1
	intensity $b3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	intensity $c3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	intensity $d3
	octave 3
	note E_, 1
	note B_, 1
	intensity $e3
	note E_, 1
	note B_, 1
	intensity $f3
	note A_, 1
	octave 4
	note D_, 1
	intensity $f3
	octave 3
	note A_, 1
	octave 4
	note D_, 1
	endchannel

Music_DancingHall_Ch3:
	stereopanning $ff
	vibrato $16, $24
	notetype $6, $10
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
Music_DancingHall_branch_efae3:
	note E_, 13
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 16
	intensity $14
	octave 3
	note F_, 16
	note E_, 14
	intensity $10
	octave 6
	note E_, 1
	note F_, 1
	note E_, 13
	note D_, 1
	note E_, 1
	note A_, 1
	note B_, 16
	intensity $14
	octave 3
	note F_, 16
	note E_, 16
	intensity $13
	octave 4
	note F_, 2
	note A_, 2
	note B_, 2
	octave 5
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note A_, 2
	note A#, 1
	note B_, 3
	notetype $8, $13
	note A_, 1
	note B_, 1
	note A_, 1
	note F_, 3
	note D_, 3
	notetype $c, $13
	note E_, 1
	note D_, 1
	octave 4
	note A_, 1
	note B_, 1
	octave 5
	note A_, 2
	notetype $8, $13
	note F_, 1
	note A_, 1
	note F_, 1
	notetype $6, $13
	note D#, 1
	note E_, 3
	note D_, 4
	octave 4
	note B_, 4
	octave 5
	note D_, 4
	intensity $14
	octave 3
	note D_, 16
	note F_, 16
	note E_, 16
	note E_, 13
	intensity $10
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
	loopchannel 0, Music_DancingHall_branch_efae3
