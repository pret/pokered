; Music Data
; The start and stop of these byte ranges were based off the theory they're lined
; consecutively (Right up against each other).

;INCBIN "baserom.gbc",$82FD,$9ba3 - $82FD
; 82FD

UnknSong_md_82fd:
		mus_note noteD, note16
		mus_note noteRst, note8

		mus_note noteD#, note4

	mus_end

UnknSong_md_8301:
		mus_note noteD, note16; 8301
		mus_note noteB, note8
		mus_note noteD#, note4

	mus_end

UnknSong_md_8305:
		mus_note noteD, note16
		mus_note noteA#, note8; 8306
		mus_note noteD#, note4

	mus_end

UnknSong_md_8309:
		mus_note noteD, note16
		mus_note noteG#, note8
		mus_note noteD#, note4; 830B

	mus_end

UnknSong_md_830d:
		mus_note noteD, note2
		mus_note noteG#, note4_16
		mus_note noteD#, note2
		mus_note noteD, note4_8_16; 8310
		mus_note noteG#, note4_16
		mus_note noteD#, note4_8_16
		mus_note noteD, note4_8
		mus_note noteG#, note4
		mus_note noteD#, note4_8; 8315
		mus_note noteD, note4_16
		mus_note noteG#, note4
		mus_note noteD#, note4_16
		mus_note noteD, note4
		mus_note noteG#, note8_16; 831A
		mus_note noteD#, note4
		mus_note noteD, note8_16
		mus_note noteG#, note8
		mus_note noteD#, note8_16

	mus_end; 831F

UnknSong_md_8320:
		mus_note noteD, note16
		mus_note noteF, note8
		mus_note noteD, note2_8_16

	mus_end

UnknSong_md_8324:
		mus_note noteD, note8; 8324
		mus_note noteE, note8
		mus_note noteD, note2_4
		mus_note noteD, note16
		mus_note noteF#, note8
		mus_note noteD, note2_8_16; 8329

	mus_end

UnknSong_md_832b:
		mus_note noteD, note16
		mus_note noteG#, note8
		mus_note noteC#, note16

	mus_end; 832E

UnknSong_md_832f:
		mus_note noteD, note16
		mus_note noteG#, note8_16
		mus_note noteD, note4

	mus_end

UnknSong_md_8333:
		mus_note noteD, note16; 8333
		mus_note noteG#, note8_16
		mus_note noteD, note4_8

	mus_end

UnknSong_md_8337:
		mus_note noteD, note16
		mus_note noteG#, note8_16; 8338
		mus_note noteD, note4_8_16

	mus_end

UnknSong_md_833b:
		mus_note noteD, note16
		mus_note noteA#, note8
		mus_note noteC#, note16; 833D

	mus_end

UnknSong_md_833f:
		mus_note noteD, note16
		mus_note noteA#, note8_16
		mus_note noteC#, note8

	mus_end; 8342

UnknSong_md_8343:
		mus_note noteD, note16
		mus_note noteA#, note8_16
		mus_note noteF, note16

	mus_end

UnknSong_md_8347:
		mus_note noteD, note16; 8347
		mus_note noteA#, note8
		mus_note noteC#, note2_16
		mus_note noteD, note16
		mus_note noteD#, note8
		mus_note noteD#, note4; 834C

	mus_end

UnknSong_md_834e:
		mus_note noteD, note8_16
		mus_note noteA, note8
		mus_note noteD, note2_16
		mus_note noteD, note16; 8351
		mus_note noteG, note8
		mus_note noteC#, note2_16

	mus_end

UnknSong_md_8355:
		mus_note noteD, note16
		mus_note noteA, note8; 8356
		mus_note noteD, note8_16

	mus_end

UnknSong_md_8359:
		mus_note noteD, note16
		mus_note noteG, note8
		mus_note noteD, note8_16; 835B

	mus_end

UnknSong_md_835d:
		mus_note noteD, note16
		mus_note noteF#, note8
		mus_note noteD, note8_16

	mus_end; 8360

UnknSong_md_8361:
		mus_note noteG, note4
		mus_note noteE, note4
		mus_note noteG#, note4
		mus_note noteE, note4
		mus_note noteA, note4; 8365
		mus_note noteE, note4
		mus_note noteA#, note4
		mus_note noteE, note4
		mus_note noteB, note4
		mus_note noteE, note4; 836A
		mus_note noteRst, note4

		mus_note noteE, note4
		mus_note noteRst, note4

		mus_note noteE, note4
		mus_note noteRst, note4; 836F

		mus_note noteE, note4
		mus_note noteRst, note4

		mus_note noteE, note4
		mus_note noteC, note8_16
		mus_note noteE, note4_8_16; 8374
		mus_note noteG#, note2_8_16
		mus_note noteRst, note2_4_8_16

	mus_end

UnknSong_md_8378:
	mus_jump 237, $CBDC
		mus_note noteA#, note2_8; 837C
		mus_note noteG#, note2
		mus_note noteF#, note4_8
		mus_note noteE, note4_16
		mus_note noteD#, note4
		mus_note noteD, note8_16; 8381
		mus_note noteC#, note8
		mus_note noteC, note8_16
		mus_note noteE, note4_8_16
		mus_note noteG#, note2_8_16
		mus_note noteRst, note2_4_8_16; 8386

	db $ef
	mus_end

UnknSong_md_8389:
	mus_jump 238, $CBDD
		mus_note noteA#, note2_8
		mus_note noteG#, note2; 838E
		mus_note noteF#, note4_8
		mus_note noteE, note4
		mus_note noteD, note8_16
		mus_note noteC#, note8
		mus_note noteC#, note4; 8393
		mus_note noteF#, note2_8
		mus_note noteB, note2_4_8

	db $ee
	db $ee
	mus_end; 8398

UnknSong_md_8399:
	mus_end

UnknSong_md_839a:
	mus_tempo 222, 255
	mus_end

UnknSong_md_839e:
	db $ee
	db $ee; 839F
	db $db

		mus_note noteA, note4_8_16
		mus_note noteD#, note8
		mus_note noteC, note8_16
		mus_note noteE, note4_8_16; 83A4
		mus_note noteG#, note2_8_16
		mus_note noteRst, note2_4_8

	db $ef
	mus_jump 222, $EEFF
	mus_vel 11, 10; 83AD
		mus_note noteA, note2_16
		mus_note noteG, note4_8_16
		mus_note noteF, note4_16
		mus_note noteD#, note8_16
		mus_note noteC#, note16; 83B2
		mus_note noteC, note8
		mus_note noteD, note4
		mus_note noteE, note4_8
		mus_note noteF#, note2
		mus_note noteG#, note2_8_16; 83B7
		mus_note noteRst, note2_4_8

	db $ee
	db $f7

		mus_note noteG, note1

	db $ee; 83BC
	mus_vel 10, 8
		mus_note noteG, note4_8_16
		mus_note noteF, note4_16
		mus_note noteD#, note8_16
		mus_note noteC#, note16; 83C2
		mus_note noteD, note8

	mus_octave oct5
		mus_note noteD#, note4
		mus_note noteD, note2_16

	mus_octave oct6; 83C7
		mus_note noteD, note8_16

	mus_end

UnknSong_md_83ca:
	mus_mod 16, 1, 4
	mus_vel 1, 0

	mus_octave oct4; 83CF
		mus_note noteE, note8
		mus_note noteF, note8
		mus_note noteG, note4
		mus_note noteA, note8
		mus_note noteG, note8; 83D4

	mus_octave oct5
		mus_note noteC, note4
		mus_note noteC, note8
		mus_note noteD, note8
		mus_note noteC, note8; 83D9

	mus_octave oct4
		mus_note noteG, note8
		mus_note noteA, note8
		mus_note noteF, note8
		mus_note noteG, note2; 83DE
		mus_note noteRst, note2_4

	mus_end

UnknSong_md_83e1:
		mus_note noteD, note8_16

	db $f7

		mus_note noteD, note4_16; 83E3
		mus_note noteD, note8_16

	db $f7

		mus_note noteD#, note4_16
		mus_note noteD, note4_16

	db $f7; 83E8

		mus_note noteE, note4_16
		mus_note noteD, note2_16

	db $f4

		mus_note noteF, note4_8
		mus_note noteD, note2_16; 83ED

	db $f1

		mus_note noteE, note4_16

	mus_end

UnknSong_md_83f1:
		mus_note noteD, note2_8

	db $f1; 83F2

		mus_note noteE, note4_16
		mus_note noteD, note2_16

	db $d1

		mus_note noteE, note4

	mus_end; 83F7

UnknSong_md_83f8:
	mus_duty duty50
		mus_note noteD, note2_16

	mus_octave oct6
		mus_note noteE, note16
		mus_note noteC, note2; 83FD

	mus_end

UnknSong_md_83ff:
	mus_duty duty50
		mus_note noteD, note8_16
		mus_note noteC, note2_16
		mus_note noteC, note16; 8403
		mus_note noteC, note16
		mus_note noteD, note2_16
		mus_note noteB, note8
		mus_note noteE, note8
		mus_note noteC, note2; 8408

	mus_end

UnknSong_md_840a:
	mus_duty duty50
		mus_note noteC#, note16
		mus_note noteD#, note2_8_16
		mus_note noteD, note4_16; 840E

	db $f2

		mus_note noteC, note16
		mus_note noteC, note8_16
		mus_note noteC#, note16
		mus_note noteD, note8_16; 8413
		mus_note noteD, note2_16

	mus_octave oct5
		mus_note noteC, note16
		mus_note noteC, note8_16
		mus_note noteC#, note16; 8418
		mus_note noteC, note2_16

	mus_end

UnknSong_md_841b:
	mus_duty duty50
		mus_note noteD, note4_16

	db $f1; 841E

		mus_note noteG#, note16
		mus_note noteC, note2

	mus_end

UnknSong_md_8422:
	mus_duty duty50
		mus_note noteD, note8; 8424
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note4_16
		mus_note noteA#, note8; 8429
		mus_note noteF#, note8
		mus_note noteC, note2

	mus_end

UnknSong_md_842d:
	mus_duty duty50
		mus_note noteD, note4_16; 842F

	mus_octave oct6
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note2_16

	db $f2; 8434

	mus_octave oct7
		mus_note noteC, note2

	mus_end

UnknSong_md_8438:
	mus_duty duty50
		mus_note noteD, note8; 843A
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note4_16
		mus_note noteA, note8; 843F
		mus_note noteRst, note8

		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteA#, note8_16
		mus_note noteA#, note8; 8444
		mus_note noteC, note2

	mus_end

UnknSong_md_8447:
	mus_duty duty50
		mus_note noteC#, note16
		mus_note noteF, note2_8_16; 844A
		mus_note noteD, note1

	db $f1

		mus_note noteC, note16
		mus_note noteC, note4
		mus_note noteC#, note16; 844F
		mus_note noteC, note2_16

	mus_end

UnknSong_md_8452:
		mus_note noteD, note8_16

	db $f1

		mus_note noteF, note4_16; 8454
		mus_note noteD, note2_4_16
		mus_note noteG, note8
		mus_note noteD, note4
		mus_note noteD, note8_16
		mus_note noteB, note8; 8459
		mus_note noteF, note4_16
		mus_note noteD, note2_4_16
		mus_note noteF#, note8
		mus_note noteD, note4
		mus_note noteD, note4_8_16; 845E
		mus_note noteE, note8
		mus_note noteF, note4_16

	mus_end

UnknSong_md_8462:
	mus_duty duty50
		mus_note noteD, note16; 8464
		mus_note noteA, note8
		mus_note noteRst, note16

		mus_note noteC, note2
		mus_note noteD, note16
		mus_note noteG#, note8; 8469

	db $d0

		mus_note noteC, note2
		mus_note noteD, note16
		mus_note noteA, note8
		mus_note noteRst, note16; 846E

		mus_note noteC, note2
		mus_note noteD, note2_4_16
		mus_note noteA#, note8

	db $d0

		mus_note noteC, note2; 8473

	mus_end

UnknSong_md_8475:
	mus_duty duty50
		mus_note noteD, note4_16

	db $f4

		mus_note noteC, note16; 8479
		mus_note noteC, note2
		mus_note noteD, note8_16

	mus_octave oct3
		mus_note noteC, note16
		mus_note noteC, note4_8_16; 847E
		mus_note noteD, note8_16

	mus_octave oct3
		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16; 8483

	mus_octave oct3
		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note8_16

	mus_octave oct3; 8488
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note8_16

	mus_octave oct3
		mus_note noteA#, note16; 848D
		mus_note noteC, note2
		mus_note noteD, note1

	db $f2

	mus_octave oct7
		mus_note noteC, note2; 8492

	mus_end

UnknSong_md_8494:
	mus_duty duty50
		mus_note noteD, note4_16
		mus_note noteC, note2_16
		mus_note noteC, note16; 8498
		mus_note noteC, note16
		mus_note noteD, note8_16

	db $d4

		mus_note noteC, note8
		mus_note noteC, note2; 849D
		mus_note noteD, note8_16
		mus_note noteRst, note4_16

		mus_note noteC, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16; 84A2
		mus_note noteRst, note4_16

		mus_note noteG#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16
		mus_note noteRst, note4_16; 84A7

		mus_note noteRst, note8

		mus_note noteC, note4_8_16
		mus_note noteD, note8_16
		mus_note noteRst, note4_16

		mus_note noteC, note8; 84AC
		mus_note noteC, note2
		mus_note noteD, note8_16
		mus_note noteRst, note4_16

		mus_note noteA#, note8
		mus_note noteC, note2; 84B1
		mus_note noteD, note1

	db $d2

	mus_octave oct6
		mus_note noteC, note2

	mus_end; 84B6

UnknSong_md_84b7:
	mus_duty duty50
		mus_note noteC#, note16
		mus_note noteC#, note2
		mus_note noteD, note1

	mus_volume 240; 84BD
		mus_note noteC, note4_16
		mus_note noteD, note1

	db $f2

		mus_note noteF, note16
		mus_note noteC, note4_8_16; 84C2
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_84c6:
	mus_duty duty12_5
		mus_note noteC#, note16; 84C8
		mus_note noteC#, note4_16
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8_16; 84CD

	mus_jump 4, $44C6
		mus_note noteD, note1

	db $f3

		mus_note noteC, note16
		mus_note noteC, note4_8_16; 84D5
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_84d9:
	mus_duty duty50
		mus_note noteC#, note16; 84DB
		mus_note noteC#, note4_16
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8_16; 84E0
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8_16
		mus_note noteC#, note16; 84E5
		mus_note noteC#, note2
		mus_note noteD, note1

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8_16; 84EA
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_84ee:
	mus_duty duty50
		mus_note noteC#, note16; 84F0
		mus_note noteC#, note4_8
		mus_note noteD, note1

	mus_volume 240
		mus_note noteC, note4_16
		mus_note noteD, note1; 84F6

	db $f2

		mus_note noteF, note16
		mus_note noteC, note4_8_16
		mus_note noteC#, note16
		mus_note noteC, note2_16; 84FB

	mus_end

UnknSong_md_84fd:
	mus_duty duty50
		mus_note noteD, note1

	db $f2

		mus_note noteRst, note16; 8501

		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16; 8506
		mus_note noteD, note4
		mus_note noteA#, note8
		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note4; 850B
		mus_note noteA#, note8
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note4
		mus_note noteA#, note8; 8510
		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note4
		mus_note noteA#, note8
		mus_note noteC, note16; 8515
		mus_note noteC, note2
		mus_note noteD, note4
		mus_note noteA#, note8
		mus_note noteG#, note16
		mus_note noteC, note2; 851A
		mus_note noteD, note4
		mus_note noteA#, note8
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note4; 851F
		mus_note noteA#, note8
		mus_note noteRst, note16

		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteA#, note8; 8524
		mus_note noteC, note16
		mus_note noteC, note2

	mus_end

UnknSong_md_8528:
	mus_duty duty50
		mus_note noteD, note4_16; 852A

	mus_volume 0
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16

	mus_volume 0
		mus_note noteC, note4_16; 8531
		mus_note noteD, note4_16

	mus_volume 0
		mus_note noteC, note8_16
		mus_note noteD, note8
		mus_note noteC, note16; 8537
		mus_note noteC, note16
		mus_note noteC, note16

	mus_end

UnknSong_md_853b:
	mus_duty duty50
		mus_note noteD, note4_8_16; 853D

	mus_volume 0
		mus_note noteC, note2
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16; 8543
		mus_note noteC, note16
		mus_note noteD, note4_8_16

	mus_volume 0
		mus_note noteC, note2
		mus_note noteD, note8; 8549
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16

	mus_end

UnknSong_md_854e:
	mus_duty duty25; 854F
		mus_note noteC#, note16
		mus_note noteC#, note2
		mus_note noteD, note1

	db $d7

		mus_note noteC, note16; 8554
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteB, note2
		mus_note noteG#, note16
		mus_note noteC, note4_8; 8559
		mus_note noteD, note1
		mus_note noteG#, note2
		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteD, note1; 855E
		mus_note noteE, note2
		mus_note noteG#, note16
		mus_note noteC, note4_16
		mus_note noteD, note1
		mus_note noteC#, note2; 8563
		mus_note noteC, note16
		mus_note noteC, note4_16
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end; 8568

UnknSong_md_8569:
	mus_duty duty50
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16; 856E
		mus_note noteD, note8_16

	db $f1

		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note8; 8573
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note4_16

	db $f1; 8578

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16; 857D
		mus_note noteC, note16

	mus_end

UnknSong_md_8580:
	mus_duty duty50
		mus_note noteC#, note16
		mus_note noteD, note2_4_16; 8583
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteC#, note16; 8588
		mus_note noteD, note8_16
		mus_note noteD, note8_16

	db $f1

		mus_note noteC, note16
		mus_note noteC, note4_8; 858D
		mus_note noteC#, note16
		mus_note noteC, note2_16
		mus_note noteD, note8
		mus_note noteC, note16
		mus_note noteC, note16; 8592
		mus_note noteC, note16

	mus_end

UnknSong_md_8595:
	mus_duty duty25
		mus_note noteC#, note16
		mus_note noteC#, note2; 8598
		mus_note noteD, note1

	db $d7

		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteD, note1; 859D
		mus_note noteB, note2
		mus_note noteG#, note16
		mus_note noteC, note4_8
		mus_note noteD, note1
		mus_note noteG#, note2; 85A2
		mus_note noteC, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteE, note2
		mus_note noteG#, note16; 85A7
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteC#, note2
		mus_note noteC, note16
		mus_note noteC, note2; 85AC
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_85b0:
	mus_duty duty25
		mus_note noteC#, note16; 85B2
		mus_note noteC#, note2
		mus_note noteD, note1

	db $d7

		mus_note noteC, note16
		mus_note noteC, note2; 85B7
		mus_note noteD, note1
		mus_note noteB, note2
		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note1; 85BC
		mus_note noteG#, note2
		mus_note noteC, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteE, note2; 85C1
		mus_note noteG#, note16
		mus_note noteC, note4_8
		mus_note noteD, note1
		mus_note noteC#, note2
		mus_note noteC, note16; 85C6
		mus_note noteC, note4_8
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_85cb:
	mus_duty duty25; 85CC
		mus_note noteC#, note16
		mus_note noteC#, note4_8_16
		mus_note noteD, note1

	db $d2

		mus_note noteC, note16; 85D1
		mus_note noteC, note4_8
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_85d6:
	mus_duty duty50; 85D7
		mus_note noteC#, note16
		mus_note noteA, note4_8
		mus_note noteD, note1

	db $f2

		mus_note noteC, note16; 85DC
		mus_note noteC, note4_16
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end

UnknSong_md_85e1:
		mus_note noteD, note8_16; 85E1

	db $f1

		mus_note noteD#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16; 85E6
		mus_note noteD, note8_16

	db $f1

		mus_note noteD, note8_16
		mus_note noteD, note8
		mus_note noteC, note16; 85EB
		mus_note noteC, note16

	mus_end

UnknSong_md_85ee:
		mus_note noteD, note8_16

	db $f1

		mus_note noteC#, note8_16; 85F0
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note8_16
		mus_note noteA#, note8; 85F5
		mus_note noteC#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note8_16; 85FA

	db $d1

		mus_note noteC#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16; 85FF
		mus_note noteD, note8_16
		mus_note noteG#, note8
		mus_note noteC#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16; 8604
		mus_note noteC, note16
		mus_note noteD, note8_16
		mus_note noteB, note8
		mus_note noteC#, note8_16
		mus_note noteD, note8_16; 8609
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note8_16
		mus_note noteF#, note8
		mus_note noteC#, note8_16; 860E
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note8_16
		mus_note noteA, note8; 8613
		mus_note noteC#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note8_16; 8618
		mus_note noteE, note8
		mus_note noteC#, note8_16
		mus_note noteD, note8_16
		mus_note noteC, note16
		mus_note noteC, note16; 861D

	mus_end

UnknSong_md_861f:
	mus_duty duty75
		mus_note noteC#, note16
		mus_note noteF, note2_8_16
		mus_note noteD, note4_16; 8623

	mus_volume 0
		mus_note noteC, note4_8
		mus_note noteC#, note16
		mus_note noteC, note2_16
		mus_note noteD, note4_16; 8629
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note1

	mus_volume 0; 862F
		mus_note noteC, note4_8
		mus_note noteD, note8
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16; 8634

	mus_end

UnknSong_md_8636:
	mus_duty duty75
		mus_note noteD, note4_16

	mus_volume 1
		mus_note noteC, note4_16; 863B
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note1; 8640

	mus_volume 1
		mus_note noteC, note4_16
		mus_note noteD, note8
		mus_note noteC, note16
		mus_note noteC, note16; 8646
		mus_note noteC, note16

	mus_end

UnknSong_md_8649:
	mus_duty duty12_5
		mus_note noteC#, note16
		mus_note noteC#, note2; 864C
		mus_note noteD, note1

	db $d2

		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteC#, note16; 8651
		mus_note noteC, note2_16

	mus_end

UnknSong_md_8654:
		mus_note noteD, note4_16
		mus_note noteA#, note8_16
		mus_note noteD, note4; 8656
		mus_note noteD, note2_16

	db $f1

		mus_note noteD#, note4_16
		mus_note noteD, note1
		mus_note noteC, note16; 865B
		mus_note noteC, note16
		mus_note noteD, note8_16

	db $f7

		mus_note noteD, note4_16
		mus_note noteD, note8_16; 8660

	db $f7

		mus_note noteD#, note4_16
		mus_note noteD, note4_16

	db $f7

		mus_note noteE, note4_16; 8665
		mus_note noteD, note2_16

	db $f4

		mus_note noteF, note4_8
		mus_note noteD, note2_16

	db $f1; 866A

		mus_note noteE, note4_16

	mus_end

UnknSong_md_866d:
	mus_duty duty50
		mus_note noteD, note1

	mus_volume 0; 8671
		mus_note noteC, note4_8
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16; 8676
		mus_note noteD, note1

	mus_volume 0
		mus_note noteC, note4_8
		mus_note noteD, note1

	mus_volume 0; 867D
		mus_note noteC, note4_8
		mus_note noteD, note1

	mus_volume 0
		mus_note noteC, note4_8
		mus_note noteD, note1; 8683

	mus_volume 0
		mus_note noteC, note4_8
		mus_note noteD, note1

	db $f2

		mus_note noteC, note16; 8689
		mus_note noteC, note4_8

	mus_end

UnknSong_md_868c:
	mus_duty duty75
		mus_note noteD, note1

	mus_volume 130; 8690
		mus_note noteC, note4_16
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteC, note16; 8695
		mus_note noteD, note1

	mus_volume 130
		mus_note noteC, note4_16
		mus_note noteD, note1

	mus_volume 130; 869C
		mus_note noteC, note4_16
		mus_note noteD, note1

	mus_volume 130
		mus_note noteC, note4_16
		mus_note noteD, note1; 86A2

	mus_volume 130
		mus_note noteC, note4_16
		mus_note noteD, note1

	db $f2

		mus_note noteG#, note8_16; 86A8
		mus_note noteC, note4_16

	mus_end

UnknSong_md_86ab:
	mus_duty duty25
		mus_note noteC#, note16
		mus_note noteD#, note2_8_16; 86AE
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteC#, note16; 86B3
		mus_note noteD, note8_16
		mus_note noteD, note4_16

	mus_octave oct5
		mus_note noteC, note16
		mus_note noteC, note4_8; 86B8
		mus_note noteC#, note16
		mus_note noteD#, note2_8_16
		mus_note noteD, note4_16

	db $f2

		mus_note noteC, note16; 86BD
		mus_note noteC, note2
		mus_note noteC#, note16
		mus_note noteD, note8_16
		mus_note noteD, note1

	mus_octave oct5; 86C2
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteC#, note16
		mus_note noteC, note2_16

	mus_end; 86C7

UnknSong_md_86c8:
	mus_duty duty50
		mus_note noteD, note1

	db $f3

		mus_note noteD#, note16
		mus_note noteC, note2; 86CD
		mus_note noteD, note2_16
		mus_note noteF#, note4_8
		mus_note noteD#, note16
		mus_note noteC, note2
		mus_note noteD, note1; 86D2

	db $f4

		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteG, note4_16; 86D7
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteE, note4_16
		mus_note noteC, note16; 86DC
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteD, note4_16
		mus_note noteC, note16
		mus_note noteC, note2; 86E1

	mus_end

UnknSong_md_86e3:
	db $fc
	mus_volume 47

	mus_octave oct7
		mus_note noteG#, note16; 86E7
		mus_note noteC, note2
		mus_note noteD, note1

	mus_volume 132
		mus_note noteC, note2
		mus_note noteD, note1; 86ED
		mus_note noteRst, note4

	mus_octave oct7
		mus_note noteC, note4_8
		mus_note noteD, note1
		mus_note noteRst, note4_16; 86F2

		mus_note noteC, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_8_16
		mus_note noteF#, note2_4_16
		mus_note noteG#, note16; 86F7
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteG, note8
		mus_note noteG#, note4_16
		mus_note noteC, note2; 86FC

	mus_end

UnknSong_md_86fe:
	db $fc

		mus_note noteC, note4_8
		mus_note noteD, note1
		mus_note noteA#, note16; 8701
		mus_note noteE, note8
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteB, note16
		mus_note noteE, note4; 8706
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteA, note4
		mus_note noteB, note8
		mus_note noteC, note4_8; 870B
		mus_note noteD, note1
		mus_note noteA, note4_16
		mus_note noteRst, note8

		mus_note noteC, note4_8
		mus_note noteD, note2_8_16; 8710
		mus_note noteE, note2_4_16
		mus_note noteE, note8
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteD#, note8; 8715
		mus_note noteE, note4_8_16
		mus_note noteC, note2

	mus_end

UnknSong_md_8719:
		mus_note noteD, note8_16

	db $f2; 871A

		mus_note noteE, note2_4_16
		mus_note noteD, note4_8_16

	mus_octave oct7
		mus_note noteD#, note2_8_16
		mus_note noteD, note1; 871F

	db $d0

		mus_note noteD#, note2_8_16
		mus_note noteD, note2_16

	db $d0

		mus_note noteD, note2_4_16; 8724
		mus_note noteD, note4_8_16

	mus_octave oct1
		mus_note noteE, note2_4_16
		mus_note noteD, note2_4_16
		mus_note noteG, note2_4_8; 8729
		mus_note noteE, note2_4_16
		mus_note noteD, note1

	db $d3

		mus_note noteE, note2_4_16

	mus_end; 872E

UnknSong_md_872f:
	db $fc
	mus_volume 47
	db $f7

		mus_note noteA#, note16
		mus_note noteC, note2; 8734
		mus_note noteD, note4_8_16

	mus_octave oct1
		mus_note noteA#, note4
		mus_note noteC, note2
		mus_note noteD, note2_8_16; 8739

	db $f4

		mus_note noteA#, note16
		mus_note noteC, note2

	db $fc

		mus_note noteA#, note4_8; 873E
		mus_note noteD, note2_8_16

	db $f6
	db $d8

		mus_note noteC, note2
		mus_note noteD, note4_16; 8743

	mus_octave oct4
	db $d7

		mus_note noteC, note2
		mus_note noteD, note1

	db $f2; 8748
	db $d8

		mus_note noteC, note2

	mus_end

UnknSong_md_874c:
	db $fc

		mus_note noteC, note4_8; 874D
		mus_note noteD, note8_16
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note1; 8752
		mus_note noteA#, note2
		mus_note noteA#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteG#, note4_8_16; 8757
		mus_note noteA#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_8_16
		mus_note noteG, note4_16
		mus_note noteA#, note8; 875C
		mus_note noteC, note4_8_16

	db $fc

		mus_note noteF, note1
		mus_note noteD, note2_8_16
		mus_note noteG, note4_8_16; 8761

	db $d6

		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteG#, note4

	db $d9; 8766

		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteA#, note8_16

	db $d7

		mus_note noteC, note4_8_16; 876B

	mus_end

UnknSong_md_876d:
		mus_note noteD, note8_16

	db $f2

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16; 8770

	mus_octave oct3
		mus_note noteD#, note2_4_8_16
		mus_note noteD, note1

	db $d7

		mus_note noteD#, note2_4_16; 8775
		mus_note noteD, note4_8_16
		mus_note noteRst, note4_8

		mus_note noteD#, note2_4
		mus_note noteD, note4_8_16

	mus_octave oct3; 877A
		mus_note noteD#, note2_4_8
		mus_note noteD, note2_16
		mus_note noteB, note4_8_16
		mus_note noteD#, note2_4_16
		mus_note noteD, note4_8_16; 877F

	db $d4

		mus_note noteD#, note2_4_8
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteD#, note2_4; 8784

	mus_end

UnknSong_md_8786:
	db $fc
	mus_volume 47
	db $f7

		mus_note noteRst, note16; 878A

		mus_note noteC, note2
		mus_note noteD, note4_8_16

	mus_octave oct3
		mus_note noteRst, note8

		mus_note noteC, note2; 878F
		mus_note noteD, note2_8_16

	db $f6

		mus_note noteRst, note16

		mus_note noteC, note2
		mus_note noteD, note4_16; 8794

	db $d3

		mus_note noteRst, note8_16

		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteRst, note8; 8799

		mus_note noteRst, note16

		mus_note noteC, note2

	mus_end

UnknSong_md_879d:
	db $fc

		mus_note noteF, note1; 879E
		mus_note noteD, note1
		mus_note noteA, note2
		mus_note noteG#, note8
		mus_note noteC, note2
		mus_note noteD, note4_8_16; 87A3
		mus_note noteG#, note4_16
		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note2_8_16
		mus_note noteA, note4_8_16; 87A8
		mus_note noteG#, note8
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteG#, note4
		mus_note noteG#, note8; 87AD
		mus_note noteC, note2

	mus_end

UnknSong_md_87b0:
		mus_note noteD, note4

	db $f2

		mus_note noteD#, note2_4_16; 87B2
		mus_note noteD, note2_4_8

	mus_octave oct1
		mus_note noteD, note2_4_16
		mus_note noteD, note1

	db $d7; 87B7

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteD, note2_4_16

	mus_end; 87BC

UnknSong_md_87bd:
	db $fc
	mus_volume 47
	db $f7

		mus_note noteG#, note16
		mus_note noteC, note4_8_16; 87C2
		mus_note noteD, note2_8_16

	mus_octave oct1
		mus_note noteG#, note4_16
		mus_note noteC, note4_8_16
		mus_note noteD, note1; 87C7

	db $d7

		mus_note noteA, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16

	db $d5; 87CC

		mus_note noteA, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteRst, note4_16

		mus_note noteG#, note2_16; 87D1
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8

	db $d3

		mus_note noteG, note16
		mus_note noteC, note4_8_16; 87D6
		mus_note noteD, note4_16

	db $d3

		mus_note noteF#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16; 87DB
		mus_note noteRst, note8

		mus_note noteE, note16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_87e0:
	db $fc; 87E0

		mus_note noteC, note4_8
		mus_note noteD, note1
		mus_note noteB, note2
		mus_note noteE, note8
		mus_note noteC, note4_8_16; 87E5
		mus_note noteD, note2_8_16
		mus_note noteA, note4_8_16
		mus_note noteE, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note1; 87EA
		mus_note noteA#, note2
		mus_note noteF, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteA#, note4_8; 87EF
		mus_note noteF, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteA, note4_16
		mus_note noteE, note2; 87F4
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8
		mus_note noteA#, note4
		mus_note noteD#, note8
		mus_note noteC, note4_8_16; 87F9
		mus_note noteD, note4_16
		mus_note noteA, note4
		mus_note noteD, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16; 87FE
		mus_note noteG, note8
		mus_note noteC, note8
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8803:
		mus_note noteD, note1; 8803

	mus_octave oct3
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_8_16
		mus_note noteRst, note2

		mus_note noteE, note2_4_16; 8808
		mus_note noteD, note2_8_16
		mus_note noteRst, note2

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_4_16
		mus_note noteB, note2; 880D
		mus_note noteE, note2_4_16
		mus_note noteD, note1
		mus_note noteA#, note8_16
		mus_note noteF, note2_4_16

	mus_end; 8812

UnknSong_md_8813:
	db $fc
	mus_volume 38
	db $f7

		mus_note noteA#, note16
		mus_note noteC, note2; 8818
		mus_note noteD, note2_16

	mus_octave oct1
		mus_note noteA#, note4_16
		mus_note noteC, note2
		mus_note noteD, note4_16; 881D

	db $d6

		mus_note noteA#, note16
		mus_note noteC, note2
		mus_note noteD, note1

	db $d3; 8822

		mus_note noteD, note16
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteRst, note4

		mus_note noteD, note4; 8827
		mus_note noteC, note2
		mus_note noteD, note8_16
		mus_note noteRst, note8_16

		mus_note noteD, note2_16
		mus_note noteC, note2; 882C
		mus_note noteD, note2_16
		mus_note noteB, note8
		mus_note noteD#, note16
		mus_note noteC, note2

	mus_end; 8831

UnknSong_md_8832:
	db $fc

		mus_note noteC, note2_8_16
		mus_note noteD, note4_16
		mus_note noteC, note2_16
		mus_note noteC, note16; 8836
		mus_note noteC, note16
		mus_note noteD, note4_8_16
		mus_note noteA#, note2
		mus_note noteE, note8
		mus_note noteC, note2; 883B
		mus_note noteD, note2_16
		mus_note noteG#, note4_8_16
		mus_note noteE, note4
		mus_note noteC, note2
		mus_note noteD, note4_16; 8840
		mus_note noteG, note4_8_16
		mus_note noteE, note8
		mus_note noteC, note2
		mus_note noteD, note2_4_8
		mus_note noteG#, note4; 8845
		mus_note noteRst, note8_16

		mus_note noteC, note4_8_16
		mus_note noteD, note2
		mus_note noteG, note4
		mus_note noteRst, note8; 884A

		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteG#, note8_16
		mus_note noteRst, note2_4_16

		mus_note noteC, note4_8_16; 884F
		mus_note noteD, note2_16
		mus_note noteG, note8

	db $d8

		mus_note noteC, note4_8_16

	mus_end; 8854

UnknSong_md_8855:
		mus_note noteD, note8_16

	db $f2

		mus_note noteE, note2_4_16
		mus_note noteD, note4_8_16

	mus_octave oct1; 8859
		mus_note noteD#, note2_8_16
		mus_note noteD, note4_16

	db $d7

		mus_note noteD#, note2_8_16
		mus_note noteD, note4_8_16; 885E

	db $d6

		mus_note noteD, note2_4_16
		mus_note noteD, note2_16

	mus_octave oct2
		mus_note noteD#, note2_4_16; 8863
		mus_note noteD, note2_4_16

	db $d2

		mus_note noteD#, note2_4_8
		mus_note noteD, note2_16

	db $d1; 8868

		mus_note noteD, note2_4_16

	mus_end

UnknSong_md_886b:
	db $fc

		mus_note noteA#, note4_8
		mus_note noteD, note4_8_16; 886D

	db $f4

		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note1

	mus_octave oct4; 8872
		mus_note noteD#, note16
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $f4

		mus_note noteE, note16; 8877
		mus_note noteC, note2
		mus_note noteD, note4_8
		mus_note noteB, note4
		mus_note noteE, note2_16
		mus_note noteC, note2; 887C
		mus_note noteD, note2_16

	db $d1

		mus_note noteF, note16
		mus_note noteC, note2

	mus_end; 8881

UnknSong_md_8882:
	db $fc

		mus_note noteG, note2
		mus_note noteD, note4_8_16
		mus_note noteRst, note4

		mus_note noteC#, note8_16; 8886
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteB, note4
		mus_note noteC, note4_16
		mus_note noteC, note2; 888B
		mus_note noteD, note4
		mus_note noteRst, note4

		mus_note noteC#, note8_16
		mus_note noteC, note2
		mus_note noteD, note4_16; 8890
		mus_note noteRst, note4

		mus_note noteD, note8
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteB, note8; 8895
		mus_note noteD#, note8_16
		mus_note noteC, note2

	mus_end

UnknSong_md_8899:
		mus_note noteD, note2_16

	db $d6; 889A

		mus_note noteD, note2_4_16
		mus_note noteD, note2_4_16
		mus_note noteRst, note4_8_16

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_8_16; 889F
		mus_note noteB, note4_8_16
		mus_note noteD, note2_4_16
		mus_note noteD, note2_16
		mus_note noteA, note8
		mus_note noteC#, note2_4_16; 88A4

	mus_end

UnknSong_md_88a6:
	db $fc
	mus_volume 36
	db $f7

		mus_note noteC, note2_16; 88AA
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16

	mus_octave oct1
		mus_note noteC, note16
		mus_note noteC, note4_8_16; 88AF
		mus_note noteD, note4_8_16

	db $d7
	mus_volume 5
		mus_note noteD, note4_8_16
		mus_note noteRst, note4_16; 88B5

	mus_octave oct7
		mus_note noteC, note4_8
		mus_note noteD, note4_8

	db $d3

		mus_note noteRst, note16; 88BA

		mus_note noteC, note4_8
		mus_note noteD, note4_16

	db $d3

		mus_note noteA#, note16
		mus_note noteC, note4_8; 88BF
		mus_note noteD, note2_16

	mus_octave oct6
		mus_note noteG#, note16
		mus_note noteC, note4_8

	mus_end; 88C4

UnknSong_md_88c5:
	db $fc

		mus_note noteC, note2_8_16
		mus_note noteD, note4_16
		mus_note noteRst, note2

		mus_note noteC, note4_16; 88C9
		mus_note noteC, note4_8
		mus_note noteD, note4_8_16
		mus_note noteA#, note4_8_16
		mus_note noteC, note8_16
		mus_note noteC, note4_8; 88CE
		mus_note noteD, note4_8_16
		mus_note noteA, note2

	db $f1

		mus_note noteC, note4_16
		mus_note noteD, note4_16; 88D3
		mus_note noteB, note4_16

	mus_octave oct6
		mus_note noteC, note4_16
		mus_note noteD, note4_8
		mus_note noteA#, note4; 88D8
		mus_note noteRst, note8_16

		mus_note noteC, note4_16
		mus_note noteD, note4_16
		mus_note noteB, note4
		mus_note noteA#, note4; 88DD
		mus_note noteC, note4_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteG#, note8_16
		mus_note noteC, note4_16; 88E2

	mus_end

UnknSong_md_88e4:
		mus_note noteD, note2_4_16

	mus_octave oct3
		mus_note noteE, note2_4_16
		mus_note noteD, note2_8_16; 88E7
		mus_note noteRst, note2

		mus_note noteF, note2_4_16
		mus_note noteD, note2_4_16
		mus_note noteB, note4_8_16
		mus_note noteE, note2_4_16; 88EC
		mus_note noteD, note1
		mus_note noteA#, note8_16
		mus_note noteF, note2_4_16

	mus_end

UnknSong_md_88f1:
	db $fc; 88F1
	db $f1

		mus_note noteD, note4_16

	db $f7

		mus_note noteRst, note16

		mus_note noteC, note2; 88F6
		mus_note noteD, note2_4_16

	mus_octave oct1
		mus_note noteRst, note8_16

		mus_note noteC, note2
		mus_note noteD, note4_8_16; 88FB
		mus_note noteB, note4_8
		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteRst, note4_16; 8900

		mus_note noteG, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteB, note4_8
		mus_note noteF#, note16; 8905
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteE, note16
		mus_note noteC, note4_8_16; 890A

	mus_end

UnknSong_md_890c:
	db $fc

		mus_note noteRst, note2_4_16

		mus_note noteD, note4
		mus_note noteRst, note2; 890F

		mus_note noteG#, note8
		mus_note noteC, note2
		mus_note noteD, note2_4_16
		mus_note noteB, note4_8_16
		mus_note noteG#, note16; 8914
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteA#, note4_8
		mus_note noteE, note8
		mus_note noteC, note4_8_16; 8919
		mus_note noteD, note4_16
		mus_note noteRst, note4_16

		mus_note noteD#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16; 891E
		mus_note noteB, note4_8
		mus_note noteD, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteA#, note8; 8923
		mus_note noteC, note8_16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8927:
		mus_note noteD, note4

	mus_octave oct3; 8928
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_4_16

	db $d6

		mus_note noteD, note2_4_16
		mus_note noteD, note4_16; 892D

	mus_octave oct3
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16
		mus_note noteB, note2
		mus_note noteF, note2_4_16; 8932
		mus_note noteD, note1
		mus_note noteRst, note8_16

		mus_note noteF, note2_4_8

	mus_end

UnknSong_md_8937:
	db $fc; 8937

		mus_note noteRst, note2_8

		mus_note noteD, note2_16

	db $f7

		mus_note noteG#, note16
		mus_note noteC, note4_8_16; 893C
		mus_note noteD, note8_16

	db $f7

		mus_note noteF#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note8; 8941

	mus_octave oct0
		mus_note noteE, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note8

	mus_octave oct0; 8946
		mus_note noteD, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note1

	db $d1

		mus_note noteC, note16; 894B
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteRst, note2

		mus_note noteE, note16
		mus_note noteC, note2; 8950
		mus_note noteD, note4_16
		mus_note noteA#, note2
		mus_note noteD#, note16
		mus_note noteC, note2
		mus_note noteD, note1; 8955
		mus_note noteA, note8
		mus_note noteD, note16
		mus_note noteC, note2

	mus_end

UnknSong_md_895a:
	db $fc; 895A

		mus_note noteG, note2_8
		mus_note noteD, note2_8_16

	mus_octave oct0
		mus_note noteG#, note8_16
		mus_note noteC, note4_8_16; 895F
		mus_note noteD, note8_16

	mus_octave oct0
		mus_note noteF#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note8; 8964

	db $d7

		mus_note noteE, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note8

	db $d7; 8969

		mus_note noteD, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteRst, note8

		mus_note noteC, note8_16; 896E
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteB, note2
		mus_note noteE, note8_16
		mus_note noteC, note2; 8973
		mus_note noteD, note8_16
		mus_note noteA, note2
		mus_note noteD#, note8_16
		mus_note noteC, note2
		mus_note noteD, note1; 8978
		mus_note noteG#, note8
		mus_note noteD, note8_16
		mus_note noteC, note2

	mus_end

UnknSong_md_897d:
		mus_note noteD, note4_16; 897D
		mus_note noteG, note4_16
		mus_note noteD, note8
		mus_note noteD, note4_16
		mus_note noteG, note4_16
		mus_note noteC#, note16; 8982
		mus_note noteD, note4_16
		mus_note noteG, note8
		mus_note noteD, note16

	mus_end

UnknSong_md_8987:
	db $fc; 8987
	db $f5

		mus_note noteD, note4_16

	db $f3

		mus_note noteC#, note2_16
		mus_note noteC, note2; 898C
		mus_note noteD, note1

	mus_octave oct2
		mus_note noteA, note2_16
		mus_note noteC, note2
		mus_note noteD, note2_16; 8991
		mus_note noteA, note8
		mus_note noteF, note2_16
		mus_note noteC, note2

	mus_end

UnknSong_md_8996:
	db $fc; 8996

		mus_note noteA#, note16
		mus_note noteD, note4_8
		mus_note noteB, note4
		mus_note noteC, note2_16
		mus_note noteC, note2; 899B
		mus_note noteD, note1
		mus_note noteRst, note4_8

		mus_note noteG#, note2_16
		mus_note noteC, note2
		mus_note noteD, note2_16; 89A0
		mus_note noteG, note8
		mus_note noteE, note2_16
		mus_note noteC, note2

	mus_end

UnknSong_md_89a5:
		mus_note noteD, note4; 89A5
		mus_note noteA#, note8
		mus_note noteC#, note2_4_16
		mus_note noteD, note2_4_8_16
		mus_note noteA, note4_16
		mus_note noteD, note2_4_16; 89AA
		mus_note noteD, note2_16
		mus_note noteG#, note8
		mus_note noteC#, note2_4_16

	mus_end

UnknSong_md_89af:
	db $fc; 89AF

		mus_note noteA#, note4_8
		mus_note noteD, note4_16

	mus_octave oct6
		mus_note noteC, note16
		mus_note noteC, note2; 89B4
		mus_note noteD, note4_16

	db $f2

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note8_16; 89B9
		mus_note noteA, note8_16
		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note2_16

	mus_octave oct6; 89BE
		mus_note noteC, note16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_89c2:
	db $fc

		mus_note noteC, note2_8_16; 89C3
		mus_note noteD, note4_16
		mus_note noteB, note8

	mus_octave oct6
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 89C8
		mus_note noteRst, note8_16

	mus_octave oct6
		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteF#, note8_16; 89CD
		mus_note noteG#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteB, note8

	mus_octave oct6; 89D2
		mus_note noteC, note4_8

	mus_end

UnknSong_md_89d5:
		mus_note noteD, note8_16
		mus_note noteF#, note8
		mus_note noteD#, note8_16; 89D7
		mus_note noteD, note8_16
		mus_note noteF#, note8
		mus_note noteD, note8
		mus_note noteD, note2_16
		mus_note noteF#, note8; 89DC
		mus_note noteC#, note8

	mus_end

UnknSong_md_89df:
	db $fc
	db $fa

		mus_note noteD, note4_8_16; 89E1
		mus_note noteG#, note4
		mus_note noteE, note2
		mus_note noteC, note8_16
		mus_note noteD, note1
		mus_note noteF#, note8_16; 89E6
		mus_note noteD, note4_8_16
		mus_note noteC, note8_16
		mus_note noteD, note4_16
		mus_note noteF, note8_16
		mus_note noteE, note4_8; 89EB
		mus_note noteC, note8_16
		mus_note noteD, note2_8
		mus_note noteF#, note4
		mus_note noteC, note4_8_16
		mus_note noteC, note8_16; 89F0
		mus_note noteD, note1
		mus_note noteG#, note8_16
		mus_note noteD, note4_8
		mus_note noteC, note8_16
		mus_note noteD, note1; 89F5
		mus_note noteE, note8_16
		mus_note noteC, note2
		mus_note noteC, note8_16

	mus_end

UnknSong_md_89fa:
		mus_note noteD, note2_16; 89FA

	db $d4

		mus_note noteG#, note2_4_16
		mus_note noteD, note4_16

	mus_octave oct5
		mus_note noteA, note2_4_16; 89FF
		mus_note noteD, note1
		mus_note noteRst, note4_8_16

		mus_note noteG#, note2_4_16
		mus_note noteD, note2_16

	mus_octave oct3; 8A04
		mus_note noteA#, note2_4_16
		mus_note noteD, note1

	db $d7

		mus_note noteA, note2_4_16
		mus_note noteD, note1; 8A09

	db $f2

		mus_note noteA#, note2_4_16

	mus_end

UnknSong_md_8a0d:
	db $fc
	mus_volume 36; 8A0F
	db $f3

	mus_octave oct7
		mus_note noteC, note4_8_16
		mus_note noteD, note1

	mus_octave oct3; 8A14
		mus_note noteE, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteD, note16; 8A19
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8a1c:
	db $fc

		mus_note noteC, note2_8_16
		mus_note noteD, note4; 8A1E
		mus_note noteRst, note4

		mus_note noteG#, note4
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_8_16
		mus_note noteB, note4_16; 8A23
		mus_note noteC, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteC, note8; 8A28
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8a2b:
		mus_note noteD, note4_16

	db $d3

		mus_note noteF, note2_4_16; 8A2D
		mus_note noteD, note1

	mus_octave oct1
		mus_note noteE, note2_4_16
		mus_note noteD, note2_16
		mus_note noteB, note8; 8A32
		mus_note noteF, note2_4_16

	mus_end

UnknSong_md_8a35:
	db $fc

		mus_note noteC, note2_8_16
		mus_note noteD, note4_8_16; 8A37

	mus_octave oct5
		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteD, note4_8_16

	mus_octave oct4; 8A3C
		mus_note noteG#, note16
		mus_note noteC, note4_8
		mus_note noteD, note4_8_16

	db $d3

		mus_note noteG, note16; 8A41
		mus_note noteC, note4_8
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteF#, note16
		mus_note noteC, note4_8; 8A46

	mus_end

UnknSong_md_8a48:
	db $fc
	db $f5

		mus_note noteD, note4_8_16

	mus_octave oct5; 8A4B
		mus_note noteG#, note8_16
		mus_note noteC, note4_16
		mus_note noteD, note4_8_16

	db $d3

		mus_note noteC, note8; 8A50
		mus_note noteC, note4_8
		mus_note noteD, note4_8_16
		mus_note noteB, note8_16

	mus_octave oct5
		mus_note noteC, note4_16; 8A55
		mus_note noteD, note2_16
		mus_note noteG#, note8
		mus_note noteRst, note8

		mus_note noteC, note4_16

	mus_end; 8A5A

UnknSong_md_8a5b:
	db $fc

		mus_note noteRst, note2_4_16

		mus_note noteD, note4_16

	db $f1

		mus_note noteC, note16; 8A5F
		mus_note noteC, note2
		mus_note noteD, note4_16

	mus_octave oct6
		mus_note noteG#, note16
		mus_note noteC, note2; 8A64
		mus_note noteD, note4_16

	db $d1

		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note4_16; 8A69

	mus_octave oct6
		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $f1; 8A6E

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $d1

		mus_note noteC, note16; 8A73
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $f1

		mus_note noteC, note8
		mus_note noteC, note2; 8A78
		mus_note noteD, note4_16

	db $d1

		mus_note noteG#, note8_16
		mus_note noteC, note2
		mus_note noteD, note4_16; 8A7D
		mus_note noteRst, note8

		mus_note noteE, note8_16
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteB, note8; 8A82
		mus_note noteE, note8
		mus_note noteC, note2

	mus_end

UnknSong_md_8a86:
	db $fc

		mus_note noteE, note4_16; 8A87
		mus_note noteD, note2_4_16
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note4_16; 8A8C

	db $f1

		mus_note noteC, note8
		mus_note noteC, note2
		mus_note noteD, note4_16

	mus_octave oct6; 8A91
		mus_note noteG#, note8_16
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $d1

		mus_note noteE, note8; 8A96
		mus_note noteC, note2
		mus_note noteD, note4_16

	mus_octave oct6
		mus_note noteE, note8
		mus_note noteC, note2; 8A9B
		mus_note noteD, note4_16

	db $f1

		mus_note noteG#, note8_16
		mus_note noteC, note2
		mus_note noteD, note2_16; 8AA0

	db $d1

		mus_note noteC, note8
		mus_note noteC, note2

	mus_end

UnknSong_md_8aa5:
		mus_note noteD, note1; 8AA5
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteD, note4_16
		mus_note noteC, note2_16
		mus_note noteC, note16; 8AAA
		mus_note noteD, note4_16

	db $d1

		mus_note noteE, note2_4_16
		mus_note noteD, note4_16
		mus_note noteB, note8; 8AAF
		mus_note noteD, note2_4_16
		mus_note noteD, note4_16

	db $d1

		mus_note noteD#, note2_4_16
		mus_note noteD, note4_16; 8AB4
		mus_note noteB, note8
		mus_note noteD#, note2_4_16
		mus_note noteD, note4_16
		mus_note noteRst, note8

		mus_note noteD, note2_4_16; 8AB9
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteE, note2_4_16

	mus_end

UnknSong_md_8abe:
	db $fc; 8ABE

		mus_note noteRst, note2_4_16

		mus_note noteD, note2_16

	db $f5

		mus_note noteC, note16
		mus_note noteC, note4_8_16; 8AC3
		mus_note noteD, note8_16

	db $d2

		mus_note noteD#, note2_16
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16; 8AC8
		mus_note noteRst, note8_16

		mus_note noteD#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16
		mus_note noteRst, note8_16; 8ACD

		mus_note noteD, note2_16
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16
		mus_note noteB, note8_16
		mus_note noteD, note16; 8AD2
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16
		mus_note noteB, note8_16
		mus_note noteC#, note16
		mus_note noteC, note4_8_16; 8AD7
		mus_note noteD, note8_16
		mus_note noteA#, note8_16
		mus_note noteC#, note2_16
		mus_note noteC, note4_8_16
		mus_note noteD, note8_16; 8ADC
		mus_note noteB, note8_16
		mus_note noteC#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8; 8AE1

		mus_note noteD, note16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8ae5:
	db $fc

		mus_note noteE, note4_16; 8AE6
		mus_note noteD, note2_4_16
		mus_note noteRst, note4

		mus_note noteRst, note16

		mus_note noteC, note4_8
		mus_note noteD, note4; 8AEB
		mus_note noteB, note8

	db $f9

		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteA#, note8; 8AF0

	db $f1

		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteA#, note8

	db $e9; 8AF5

		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteA, note8

	mus_octave oct6
		mus_note noteC, note4_8; 8AFA
		mus_note noteD, note8_16
		mus_note noteA, note8

	db $d9

		mus_note noteC, note4_8
		mus_note noteD, note8_16; 8AFF
		mus_note noteG#, note8

	db $d1

		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteA, note8; 8B04

	db $d9

		mus_note noteC, note4_8
		mus_note noteD, note2_16
		mus_note noteA, note8

	mus_octave oct6; 8B09
		mus_note noteC, note4_8

	mus_end

UnknSong_md_8b0c:
	mus_duty duty12_5
		mus_note noteD, note2_16

	db $f5; 8B0F

		mus_note noteG#, note16
		mus_note noteC, note4_16
		mus_note noteD, note8_16

	mus_octave oct6

	mus_octave oct7; 8B14
		mus_note noteC, note4_8
		mus_note noteD, note2_16

	db $d1
	mus_vel 0, 5
	mus_end; 8B1A

UnknSong_md_8b1b:
	db $fc

		mus_note noteA#, note4_8
		mus_note noteD, note2
		mus_note noteA, note4_8
		mus_note noteE, note8; 8B1F
		mus_note noteC, note4_16
		mus_note noteD, note8_16
		mus_note noteG#, note8
		mus_note noteD, note8
		mus_note noteC, note4_8; 8B24
		mus_note noteD, note2_16
		mus_note noteF#, note8
		mus_note noteC#, note2_8_16
		mus_note noteC, note4_8

	mus_end; 8B29

UnknSong_md_8b2a:
	db $fc

		mus_note noteG#, note2_16
		mus_note noteD, note4_8

	db $f2

		mus_note noteF, note16; 8B2E
		mus_note noteC, note4_8_16
		mus_note noteD, note2_8

	db $d1

		mus_note noteF#, note16
		mus_note noteC, note4_8_16; 8B33
		mus_note noteD, note4_8

	mus_octave oct5
		mus_note noteC#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_8; 8B38
		mus_note noteRst, note8

		mus_note noteD, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8

	db $f2; 8B3D

		mus_note noteC#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16

	db $d1

		mus_note noteD, note16; 8B42
		mus_note noteC, note4_8_16

	mus_jump 2, $4B2A
	mus_end

UnknSong_md_8b49:
	db $fc

		mus_note noteE, note16; 8B4A
		mus_note noteD, note4_16
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note4_8; 8B4F

	db $f2

		mus_note noteF, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_8

	db $d1; 8B54

		mus_note noteF#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8

	mus_octave oct5
		mus_note noteC#, note4_16; 8B59
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteD, note4_16
		mus_note noteC, note4_8_16; 8B5E
		mus_note noteD, note4_8

	db $f2

		mus_note noteC#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_16; 8B63

	db $d1

		mus_note noteD, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8

	mus_octave oct5; 8B68
		mus_note noteC#, note4_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteD, note4_16; 8B6D
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8

	db $f2

		mus_note noteC#, note8
		mus_note noteC, note4_8_16; 8B72
		mus_note noteD, note4_16

	db $d1

		mus_note noteD, note8
		mus_note noteC, note4_8_16

	mus_end; 8B77

UnknSong_md_8b78:
		mus_note noteD, note4_8_16

	db $d2

		mus_note noteC#, note2_4_16
		mus_note noteD, note2_8
		mus_note noteB, note8; 8B7C
		mus_note noteD, note2_4_16
		mus_note noteD, note2_16
		mus_note noteRst, note8_16

		mus_note noteD, note2_4_16
		mus_note noteD, note2_8; 8B81
		mus_note noteB, note8
		mus_note noteD#, note2_4_16
		mus_note noteD, note4_8_16
		mus_note noteRst, note8_16

		mus_note noteD, note2_4_16; 8B86
		mus_note noteD, note2_8
		mus_note noteA#, note8_16
		mus_note noteD#, note2_4_16
		mus_note noteD, note2
		mus_note noteRst, note8_16; 8B8B

		mus_note noteD, note2_4_16
		mus_note noteD, note4_8
		mus_note noteA#, note8
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_8; 8B90
		mus_note noteRst, note8_16

		mus_note noteD, note2_4_16
		mus_note noteD, note4_16
		mus_note noteA#, note8
		mus_note noteD#, note2_4_16; 8B95

	mus_end

UnknSong_md_8b97:
	db $fc

		mus_note noteA#, note16
		mus_note noteD, note4_16

	db $f3; 8B9A

		mus_note noteC, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16

	db $d5

		mus_note noteF#, note16; 8B9F
		mus_note noteC, note2
		mus_note noteD, note4

	mus_octave oct5
		mus_note noteD, note16
		mus_note noteC, note2; 8BA4
		mus_note noteD, note2_16

	db $d1

		mus_note noteC#, note16
		mus_note noteC, note2

	mus_end; 8BA9

UnknSong_md_8baa:
	db $fc

		mus_note noteF, note2_8_16
		mus_note noteD, note4_8
		mus_note noteB, note4

	db $f1; 8BAE

		mus_note noteC, note4_8_16
		mus_note noteD, note2
		mus_note noteRst, note4_8

		mus_note noteF, note8_16
		mus_note noteC, note2; 8BB3
		mus_note noteD, note4
		mus_note noteA#, note8_16
		mus_note noteC#, note8
		mus_note noteC, note2
		mus_note noteD, note2_16; 8BB8
		mus_note noteB, note8
		mus_note noteC, note8
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8bbd:
		mus_note noteD, note4; 8BBD
		mus_note noteA#, note8_16
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_4_16
		mus_note noteA, note4_16
		mus_note noteD, note2_4_16; 8BC2
		mus_note noteD, note4
		mus_note noteG#, note8_16
		mus_note noteC#, note2_4_16
		mus_note noteD, note2_16
		mus_note noteG, note8; 8BC7
		mus_note noteD, note2_4_16

	mus_end

UnknSong_md_8bca:
	db $fc
	mus_volume 40
	db $f7; 8BCD

	mus_octave oct7
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16

	mus_octave oct1

	mus_octave oct2; 8BD2
		mus_note noteC, note4_8_16
		mus_note noteD, note4

	db $f4

	mus_octave oct7
		mus_note noteC, note4_8_16; 8BD7
		mus_note noteD, note4

	db $f6
	db $d0

		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8BDC

	mus_octave oct4
		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note4_16

	db $f2; 8BE1

		mus_note noteB, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteA#, note8_16
		mus_note noteRst, note2_16; 8BE6

		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8be9:
	db $fc

		mus_note noteC, note4_8
		mus_note noteD, note4; 8BEB
		mus_note noteC, note2_16
		mus_note noteC, note16
		mus_note noteC, note16
		mus_note noteD, note2_16
		mus_note noteA#, note2; 8BF0
		mus_note noteA#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteG#, note4_8_16
		mus_note noteA#, note4; 8BF5
		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteG, note4_16
		mus_note noteA#, note8
		mus_note noteC, note4_8_16; 8BFA
		mus_note noteD, note4
		mus_note noteG, note4_8_16
		mus_note noteA, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8BFF
		mus_note noteG#, note4
		mus_note noteG#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteA#, note8_16; 8C04
		mus_note noteG, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note1
		mus_note noteG, note8_16
		mus_note noteG#, note2_8; 8C09
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8c0c:
		mus_note noteD, note8_16

	db $f2

		mus_note noteD#, note2_4_16; 8C0E
		mus_note noteD, note2_16

	mus_octave oct3
		mus_note noteD#, note2_4_8_16
		mus_note noteD, note2_16

	db $d7; 8C13

		mus_note noteD#, note2_4_16
		mus_note noteD, note4_8
		mus_note noteRst, note4_8

		mus_note noteD#, note2_4
		mus_note noteD, note4; 8C18

	db $d4

		mus_note noteD, note2_4_16
		mus_note noteD, note8_16
		mus_note noteB, note4_8_16
		mus_note noteD#, note2_4_16; 8C1D
		mus_note noteD, note4
		mus_note noteA#, note4_16
		mus_note noteD, note2_4_16
		mus_note noteD, note2_16
		mus_note noteA, note8; 8C22
		mus_note noteD#, note2_4_16

	mus_end

UnknSong_md_8c25:
	db $fc
	mus_volume 47
	db $f6; 8C28

		mus_note noteF#, note4_8
		mus_note noteC, note4_8
		mus_note noteD, note2_8_16

	mus_octave oct3
		mus_note noteG, note2_4_16; 8C2D
		mus_note noteC, note4_8
		mus_note noteD, note4
		mus_note noteRst, note8_16

		mus_note noteF, note2_4_16
		mus_note noteC, note4_8; 8C32
		mus_note noteD, note1
		mus_note noteB, note8_16
		mus_note noteD#, note2_4_16
		mus_note noteC, note4_8

	mus_end; 8C37

UnknSong_md_8c38:
	db $fc

		mus_note noteF, note2_8_16
		mus_note noteD, note2_4_8_16

	db $d6

		mus_note noteC, note4; 8C3C
		mus_note noteC, note4_8
		mus_note noteD, note2_8
		mus_note noteB, note4_16
		mus_note noteC#, note2_4
		mus_note noteC, note4_8; 8C41
		mus_note noteD, note4_16
		mus_note noteA, note8_16

	db $fa

		mus_note noteC, note4_16
		mus_note noteD, note1; 8C46
		mus_note noteA#, note8_16

	db $db

		mus_note noteC, note4_16

	mus_end

UnknSong_md_8c4b:
		mus_note noteD, note2_4_16; 8C4B

	mus_octave oct1
		mus_note noteE, note2_4_16
		mus_note noteD, note2_4

	db $d7

		mus_note noteF, note2_4_16; 8C50
		mus_note noteD, note1
		mus_note noteRst, note8_16

		mus_note noteE, note2_4_16

	mus_end

UnknSong_md_8c55:
	db $fc; 8C55
	mus_volume 36
	db $f7

		mus_note noteA#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16; 8C5B

	mus_octave oct1
		mus_note noteA#, note4_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16

	db $d6; 8C60

		mus_note noteA#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_16

	db $d3

		mus_note noteD, note16; 8C65
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note4

		mus_note noteD, note4_16
		mus_note noteC, note4_8_16; 8C6A
		mus_note noteD, note4_16
		mus_note noteRst, note8_16

		mus_note noteD, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16; 8C6F
		mus_note noteB, note8
		mus_note noteC#, note16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8c74:
	db $fc; 8C74

		mus_note noteF, note2_8_16
		mus_note noteD, note4_16

	mus_octave oct0
		mus_note noteC, note8
		mus_note noteC, note4_8_16; 8C79
		mus_note noteD, note2_16

	db $d6

		mus_note noteC, note4
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16; 8C7E
		mus_note noteRst, note4_8_16

		mus_note noteC, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_16
		mus_note noteRst, note4; 8C83

		mus_note noteG#, note8
		mus_note noteC, note4_8
		mus_note noteD, note2_16
		mus_note noteB, note4
		mus_note noteG#, note4; 8C88
		mus_note noteC, note4_8
		mus_note noteD, note4_16
		mus_note noteB, note8_16
		mus_note noteG#, note8_16
		mus_note noteC, note4_8; 8C8D
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteG, note8
		mus_note noteC, note4_8

	mus_end; 8C92

UnknSong_md_8c93:
		mus_note noteD, note2

	db $d6

		mus_note noteF, note2_4_16
		mus_note noteD, note2_16

	mus_octave oct1; 8C97
		mus_note noteE, note2_4_16
		mus_note noteD, note4_16

	db $d4

		mus_note noteF, note2_4_16
		mus_note noteD, note4_16; 8C9C

	db $d4

		mus_note noteE, note2_4_16
		mus_note noteD, note2
		mus_note noteRst, note4

		mus_note noteE, note2_4_16; 8CA1
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteF, note2_4_16

	mus_end

UnknSong_md_8ca6:
	db $fc; 8CA6

		mus_note noteC#, note2_4
		mus_note noteD, note2

	db $d2

		mus_note noteE, note16
		mus_note noteC, note2; 8CAB
		mus_note noteD, note1

	mus_octave oct2
		mus_note noteF#, note16
		mus_note noteC, note2
		mus_note noteD, note1; 8CB0
		mus_note noteRst, note8

		mus_note noteD#, note16
		mus_note noteC, note2

	mus_end

UnknSong_md_8cb5:
	db $fc; 8CB5

		mus_note noteG#, note8
		mus_note noteD, note8_16
		mus_note noteRst, note8_16

		mus_note noteC, note8
		mus_note noteC, note2; 8CBA
		mus_note noteD, note4_16
		mus_note noteRst, note8_16

		mus_note noteC, note2_16
		mus_note noteC, note2
		mus_note noteD, note1; 8CBF

	db $d7

		mus_note noteE, note8
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteA#, note8_16; 8CC4
		mus_note noteC, note8
		mus_note noteC, note2

	mus_end

UnknSong_md_8cc8:
	db $fc
	mus_volume 47; 8CCA
	db $d7

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note4_16

	mus_octave oct1; 8CCF
		mus_note noteA#, note16
		mus_note noteC, note2
		mus_note noteD, note1

	db $d2

		mus_note noteE, note16; 8CD4
		mus_note noteC, note2

	mus_end

UnknSong_md_8cd7:
	db $fc

		mus_note noteF, note2_8_16
		mus_note noteD, note1; 8CD9
		mus_note noteRst, note2

		mus_note noteF, note4
		mus_note noteC, note2
		mus_note noteD, note4_8
		mus_note noteB, note4_8_16; 8CDE
		mus_note noteG, note8_16
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteRst, note8_16

		mus_note noteC#, note8; 8CE3
		mus_note noteC, note2

	mus_end

UnknSong_md_8ce6:
		mus_note noteD, note2_4_8

	db $f6

		mus_note noteE, note2_4_16; 8CE8
		mus_note noteD, note4_16

	mus_octave oct1
		mus_note noteD#, note2_4_16
		mus_note noteD, note1

	db $f2; 8CED

		mus_note noteE, note2_4_16

	mus_end

UnknSong_md_8cf0:
	db $fc
	mus_volume 38
	db $f7; 8CF3

		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note1

	mus_octave oct0
		mus_note noteC, note16; 8CF8
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $f4
	mus_volume 6
		mus_note noteD, note4_16; 8CFE

	mus_octave oct3

	mus_octave oct7
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16

	db $d1; 8D03
	db $d0

		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8d07:
	db $fc

		mus_note noteC, note2_8_16; 8D08
		mus_note noteD, note2

	mus_octave oct1
		mus_note noteG#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_8_16; 8D0D

	db $d5

		mus_note noteRst, note8

		mus_note noteC, note4_8_16
		mus_note noteD, note4_16
		mus_note noteRst, note4_16; 8D12

		mus_note noteB, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_16

	db $d4

		mus_note noteA#, note8; 8D17
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteA, note8
		mus_note noteC, note4_8_16; 8D1C

	mus_end

UnknSong_md_8d1e:
		mus_note noteD, note2_8_16
		mus_note noteA#, note4_8_16
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_4_8_16; 8D21
		mus_note noteA, note4_16
		mus_note noteD, note2_4_16
		mus_note noteD, note4_8
		mus_note noteA#, note4
		mus_note noteD#, note2_4_16; 8D26
		mus_note noteD, note2_16
		mus_note noteA, note8
		mus_note noteD, note2_4_16

	mus_end

UnknSong_md_8d2b:
	db $fc; 8D2B

		mus_note noteA#, note4_8
		mus_note noteD, note2_4_16

	db $f2

		mus_note noteE, note16
		mus_note noteC, note4_16; 8D30
		mus_note noteD, note1

	mus_octave oct4
		mus_note noteA#, note16
		mus_note noteC, note4_16
		mus_note noteD, note4_16; 8D35

	db $d2

		mus_note noteA, note16
		mus_note noteC, note4_16
		mus_note noteD, note2_16

	db $d1; 8D3A

		mus_note noteG#, note16
		mus_note noteC, note4_16

	mus_end

UnknSong_md_8d3e:
	db $fc
	db $ee; 8D3F

		mus_note noteD, note2_4

	db $d2

		mus_note noteD#, note2_16
		mus_note noteC, note4_16
		mus_note noteD, note2_4_8_16; 8D44
		mus_note noteRst, note4_8_16

		mus_note noteA, note2_16
		mus_note noteC, note4_16
		mus_note noteD, note4
		mus_note noteB, note8_16; 8D49
		mus_note noteG#, note2_16
		mus_note noteC, note4_16
		mus_note noteD, note2_16
		mus_note noteB, note8
		mus_note noteG, note2_16; 8D4E
		mus_note noteC, note4_16

	mus_end

UnknSong_md_8d51:
		mus_note noteD, note2_8_16

	mus_octave oct1
		mus_note noteF#, note2_4_16; 8D53
		mus_note noteD, note1

	db $d2

		mus_note noteF, note2_4_16
		mus_note noteD, note4
		mus_note noteRst, note8_16; 8D58

		mus_note noteF#, note2_4_16
		mus_note noteD, note2_16

	db $d1

		mus_note noteF, note2_4_16

	mus_end; 8D5D

UnknSong_md_8d5e:
	db $fc

		mus_note noteD#, note4
		mus_note noteD, note1

	db $f6

		mus_note noteRst, note16; 8D62

		mus_note noteC, note4_8
		mus_note noteD, note2_16

	mus_octave oct4
		mus_note noteB, note2_4_16
		mus_note noteC, note4_8; 8D67
		mus_note noteD, note4_8_16

	db $d2
	db $d0

		mus_note noteC, note4_8
		mus_note noteD, note4_8_16; 8D6C
		mus_note noteB, note8_16

	mus_octave oct7
		mus_note noteC, note4_8
		mus_note noteD, note4_8_16
		mus_note noteRst, note8_16; 8D71

	mus_volume 5
		mus_note noteD, note2_16
		mus_note noteB, note8
		mus_note noteC, note16
		mus_note noteC, note4_8_16; 8D77

	mus_end

UnknSong_md_8d79:
	db $fc

		mus_note noteA, note2_8
		mus_note noteD, note2_4_8_16
		mus_note noteRst, note4_8_16; 8D7C

		mus_note noteB, note8
		mus_note noteC, note4_16
		mus_note noteD, note2
		mus_note noteRst, note4

		mus_note noteA#, note2_4_8; 8D81
		mus_note noteC, note4_16
		mus_note noteD, note4_8
		mus_note noteB, note8_16
		mus_note noteRst, note8

		mus_note noteC, note4_16; 8D86
		mus_note noteD, note2_16
		mus_note noteA, note8_16

	db $d1

		mus_note noteC, note4_16
		mus_note noteD, note4_8_16; 8D8B
		mus_note noteA#, note8_16

	mus_octave oct6
		mus_note noteC, note4_16
		mus_note noteD, note2_16
		mus_note noteA, note8; 8D90

	db $f1

		mus_note noteC, note4_16

	mus_end

UnknSong_md_8d94:
		mus_note noteD, note2_8_16

	mus_octave oct1; 8D95
		mus_note noteF, note2_4_16
		mus_note noteD, note2_8_16

	db $d6

		mus_note noteF#, note2_4_16
		mus_note noteD, note4_16; 8D9A
		mus_note noteRst, note8_16

		mus_note noteE, note2_4_16
		mus_note noteD, note4_8_16

	db $d3

		mus_note noteF, note2_4_16; 8D9F
		mus_note noteD, note2_16
		mus_note noteB, note4
		mus_note noteE, note2_4_16
		mus_note noteD, note2_16
		mus_note noteA#, note8; 8DA4
		mus_note noteF, note2_4_16

	mus_end

UnknSong_md_8da7:
	db $fc
	mus_volume 40

	mus_octave oct3; 8DAA
		mus_note noteA, note16
		mus_note noteC, note2
		mus_note noteD, note1

	db $f5

		mus_note noteRst, note16; 8DAF

		mus_note noteC, note2
		mus_note noteD, note2_16

	db $d1
	db $d8

		mus_note noteC, note2; 8DB4

	mus_end

UnknSong_md_8db6:
	db $fc

		mus_note noteA#, note4_8
		mus_note noteD, note2_8_16
		mus_note noteRst, note4_16; 8DB9

		mus_note noteG, note8
		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteB, note4_8_16
		mus_note noteA#, note8_16; 8DBE
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteB, note2
		mus_note noteC, note2; 8DC3

	mus_end

UnknSong_md_8dc5:
		mus_note noteD, note2_16

	mus_octave oct3
		mus_note noteE, note2_4_16
		mus_note noteD, note2_4_8_16; 8DC8
		mus_note noteRst, note4_16

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16

	db $d1

		mus_note noteD, note2_4_16; 8DCD

	mus_end

UnknSong_md_8dcf:
	db $fc
	mus_volume 38
	db $f2

		mus_note noteC, note16; 8DD3
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16

	mus_octave oct5
		mus_note noteE, note16
		mus_note noteC, note4_8_16; 8DD8
		mus_note noteD, note4_8_16

	db $d2

		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16; 8DDD

	mus_octave oct5
		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16

	db $d2; 8DE2

		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteRst, note8_16

		mus_note noteE, note16; 8DE7
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteB, note8_16
		mus_note noteG#, note16
		mus_note noteC, note2; 8DEC
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteRst, note16

		mus_note noteC, note2

	mus_end; 8DF1

UnknSong_md_8df2:
	db $fc

		mus_note noteC#, note8
		mus_note noteD, note4
		mus_note noteC, note2_16
		mus_note noteC, note8; 8DF6
		mus_note noteC, note16
		mus_note noteD, note4_8_16
		mus_note noteRst, note8_16

		mus_note noteRst, note8

		mus_note noteC, note4_8; 8DFB
		mus_note noteD, note4_8_16
		mus_note noteB, note8_16
		mus_note noteC, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16; 8E00
		mus_note noteA#, note8_16
		mus_note noteE, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteB, note8_16; 8E05
		mus_note noteG#, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteA#, note8_16
		mus_note noteRst, note8_16; 8E0A

		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteA, note8_16
		mus_note noteC, note8
		mus_note noteC, note2; 8E0F
		mus_note noteD, note4_8_16
		mus_note noteA#, note8_16
		mus_note noteE, note8_16
		mus_note noteC, note2
		mus_note noteD, note2_16; 8E14
		mus_note noteG#, note8
		mus_note noteG#, note8
		mus_note noteC, note2

	mus_end

UnknSong_md_8e19:
		mus_note noteD, note4_8_16; 8E19
		mus_note noteC, note2_16
		mus_note noteC, note8
		mus_note noteD, note4_8

	mus_octave oct5
		mus_note noteF, note2_4_16; 8E1E
		mus_note noteD, note4_8
		mus_note noteRst, note8_16

		mus_note noteE, note2_4_16
		mus_note noteD, note4_8

	db $d2; 8E23

		mus_note noteD#, note2_4_16
		mus_note noteD, note4_8
		mus_note noteB, note8_16
		mus_note noteD, note2_4_16
		mus_note noteD, note4_8; 8E28
		mus_note noteRst, note8_16

		mus_note noteC#, note2_4_16
		mus_note noteD, note4_8
		mus_note noteA#, note8_16
		mus_note noteC#, note2_4; 8E2D
		mus_note noteD, note4_8
		mus_note noteA, note8_16
		mus_note noteC#, note2_8_16
		mus_note noteD, note2_16
		mus_note noteG#, note8; 8E32
		mus_note noteC#, note2_16

	mus_end

UnknSong_md_8e35:
	db $fc
	mus_volume 36
	db $f3; 8E38

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note1

	mus_octave oct0
		mus_note noteC, note16; 8E3D
		mus_note noteC, note2
		mus_note noteD, note2_16

	db $d3

		mus_note noteC#, note16
		mus_note noteC, note2; 8E42
		mus_note noteD, note4_16
		mus_note noteRst, note8_16

		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note4_16; 8E47

	db $d2
	mus_volume 6
		mus_note noteD, note2_16
		mus_note noteRst, note8

	mus_octave oct7; 8E4D
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8e50:
	db $fc

		mus_note noteF, note2_8_16
		mus_note noteD, note4_8_16; 8E52
		mus_note noteRst, note4

		mus_note noteC, note8
		mus_note noteC, note2
		mus_note noteD, note2_4_8_16
		mus_note noteB, note2; 8E57
		mus_note noteG#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2
		mus_note noteB, note4
		mus_note noteA, note8_16; 8E5C
		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteA#, note8_16
		mus_note noteG#, note8
		mus_note noteC, note4_8_16; 8E61
		mus_note noteD, note4_16
		mus_note noteB, note8_16
		mus_note noteG, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16; 8E66
		mus_note noteA#, note8
		mus_note noteF#, note8
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8e6b:
		mus_note noteD, note4_8_16; 8E6B

	mus_octave oct4
		mus_note noteF, note2_4_16
		mus_note noteD, note2_4_8_16

	db $d6

		mus_note noteE, note2_4_16; 8E70
		mus_note noteD, note4_8_16
		mus_note noteRst, note4_8_16

		mus_note noteD#, note2_4_16
		mus_note noteD, note4
		mus_note noteB, note4; 8E75
		mus_note noteE, note2_4_16
		mus_note noteD, note4
		mus_note noteA#, note8_16
		mus_note noteF, note2_4_16
		mus_note noteD, note2_16; 8E7A
		mus_note noteB, note8
		mus_note noteF#, note2_4_16

	mus_end

UnknSong_md_8e7e:
	db $fc

		mus_note noteC, note1; 8E7F
		mus_note noteD, note1

	db $f7

		mus_note noteC, note16
		mus_note noteC, note4_8
		mus_note noteD, note1; 8E84

	mus_octave oct0
		mus_note noteC, note2_16
		mus_note noteC, note4_8
		mus_note noteD, note2_16
		mus_note noteB, note4_16; 8E89
		mus_note noteG#, note16
		mus_note noteC, note4_16
		mus_note noteD, note1
		mus_note noteA#, note8_16
		mus_note noteF#, note16; 8E8E
		mus_note noteC, note4_16

	mus_end

UnknSong_md_8e91:
	db $fc

		mus_note noteE, note4_16
		mus_note noteD, note2_4_8_16; 8E93

	db $d7

		mus_note noteG#, note8
		mus_note noteC, note4_16
		mus_note noteD, note2_4_8_16
		mus_note noteRst, note2; 8E98

		mus_note noteG#, note2_8
		mus_note noteC, note4_16
		mus_note noteD, note2_8_16
		mus_note noteB, note4_16
		mus_note noteC, note8; 8E9D
		mus_note noteC, note4_16
		mus_note noteD, note1
		mus_note noteRst, note8_16

	mus_octave oct6
		mus_note noteC, note4; 8EA2

	mus_end

UnknSong_md_8ea4:
		mus_note noteD, note2_4_8_16

	db $f7

		mus_note noteG, note2_4_16
		mus_note noteD, note2_4_16; 8EA7

	db $f6

		mus_note noteF#, note2_4_16
		mus_note noteD, note2_8

	mus_octave oct3
		mus_note noteG, note2_4_16; 8EAC
		mus_note noteD, note1

	mus_octave oct5
		mus_note noteF#, note2_4_16

	mus_end

UnknSong_md_8eb1:
	db $fc; 8EB1
	db $f5

		mus_note noteD, note2

	db $d6

	mus_octave oct6
		mus_note noteC, note2; 8EB6
		mus_note noteD, note4_8_16
		mus_note noteRst, note4_8_16

	mus_octave oct5
		mus_note noteC, note2
		mus_note noteD, note2_8; 8EBB

	db $d6

	mus_octave oct6
		mus_note noteC, note2
		mus_note noteD, note2
		mus_note noteRst, note4_8_16; 8EC0

	mus_octave oct7
		mus_note noteC, note2
		mus_note noteD, note4_8
		mus_note noteB, note4_8_16

	mus_octave oct5; 8EC5
		mus_note noteC, note2
		mus_note noteD, note2
		mus_note noteRst, note4_8_16

	mus_octave oct6
		mus_note noteC, note2; 8ECA
		mus_note noteD, note4_8_16
		mus_note noteB, note4_8_16

	mus_octave oct7
		mus_note noteC, note2
		mus_note noteD, note2_16; 8ECF
		mus_note noteA#, note8

	db $df

		mus_note noteC, note2

	mus_end

UnknSong_md_8ed4:
	db $fc; 8ED4

		mus_note noteE, note4_16
		mus_note noteD, note4_8_16
		mus_note noteRst, note4

		mus_note noteRst, note2_8

		mus_note noteC, note2; 8ED9
		mus_note noteD, note4_8_16
		mus_note noteB, note4
		mus_note noteRst, note2

		mus_note noteC, note2
		mus_note noteD, note2_8_16; 8EDE
		mus_note noteRst, note4_16

		mus_note noteRst, note4

		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteB, note4_16; 8EE3
		mus_note noteRst, note2

		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteRst, note4

		mus_note noteRst, note2_8; 8EE8

		mus_note noteC, note2
		mus_note noteD, note1
		mus_note noteA#, note8_16
		mus_note noteRst, note4_8

		mus_note noteC, note2; 8EED

	mus_end

UnknSong_md_8eef:
		mus_note noteD, note2_4_8
		mus_note noteC#, note2_8
		mus_note noteG, note2_4_16
		mus_note noteD, note2_4_8; 8EF2

	db $f7

		mus_note noteG#, note2_4_16
		mus_note noteD, note2_4_16

	db $d6

		mus_note noteG, note2_4_16; 8EF7
		mus_note noteD, note2_16
		mus_note noteRst, note4_16

		mus_note noteF#, note2_4_16
		mus_note noteD, note1
		mus_note noteB, note4; 8EFC
		mus_note noteF, note2_4_16

	mus_end

UnknSong_md_8eff:
	db $fc
	mus_volume 38
	db $f7; 8F02

		mus_note noteE, note16
		mus_note noteC, note2
		mus_note noteD, note2_4_16

	mus_octave oct1
		mus_note noteE, note4_16; 8F07
		mus_note noteC, note2
		mus_note noteD, note4_8_16

	db $d5

		mus_note noteF, note16
		mus_note noteC, note2; 8F0C
		mus_note noteD, note4_16
		mus_note noteRst, note4

		mus_note noteF#, note16
		mus_note noteC, note2
		mus_note noteD, note4; 8F11
		mus_note noteRst, note4

		mus_note noteG#, note16
		mus_note noteC, note2
		mus_note noteD, note2_16

	db $d1; 8F16

		mus_note noteA#, note16
		mus_note noteC, note2

	mus_end

UnknSong_md_8f1a:
	db $fc

		mus_note noteC, note2_8_16; 8F1B
		mus_note noteD, note4_8_16
		mus_note noteRst, note2

		mus_note noteC, note8
		mus_note noteC, note2
		mus_note noteD, note2_4; 8F20
		mus_note noteB, note4_8_16
		mus_note noteC, note8_16
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteA#, note4_8; 8F25
		mus_note noteC#, note8
		mus_note noteC, note2
		mus_note noteD, note4_16
		mus_note noteA, note4
		mus_note noteD, note8; 8F2A
		mus_note noteC, note2
		mus_note noteD, note4
		mus_note noteA#, note4
		mus_note noteE, note8
		mus_note noteC, note2; 8F2F
		mus_note noteD, note2_16
		mus_note noteA, note8
		mus_note noteF#, note8_16
		mus_note noteC, note2

	mus_end; 8F34

UnknSong_md_8f35:
		mus_note noteD, note4

	mus_octave oct5
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16

	db $d6; 8F39

		mus_note noteE, note2_4_16
		mus_note noteD, note4_8

	db $d4

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_4_16; 8F3E
		mus_note noteRst, note2

		mus_note noteE, note2_4_16
		mus_note noteD, note8_16

	mus_octave oct5
		mus_note noteD#, note2_4_16; 8F43
		mus_note noteD, note2_16

	db $d1

		mus_note noteD, note2_4_16

	mus_end

UnknSong_md_8f48:
	db $fc; 8F48
	db $f4

		mus_note noteD, note1

	mus_volume 5
		mus_note noteC, note2
		mus_note noteD, note2_8_16; 8F4E

	mus_octave oct7
		mus_note noteC, note16
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteB, note4_16; 8F53
		mus_note noteC#, note16
		mus_note noteC, note2
		mus_note noteD, note4_16

	db $d3

		mus_note noteC, note16; 8F58
		mus_note noteC, note2
		mus_note noteD, note4_8_16
		mus_note noteB, note8_16
		mus_note noteD, note16
		mus_note noteC, note4_8_16; 8F5D
		mus_note noteD, note2_16
		mus_note noteA#, note8
		mus_note noteD, note4_16
		mus_note noteC, note4_8_16

	mus_end; 8F62

UnknSong_md_8f63:
	db $fc

		mus_note noteD, note8_16
		mus_note noteD, note1
		mus_note noteB, note16
		mus_note noteRst, note4; 8F67

		mus_note noteC, note4_8_16
		mus_note noteD, note2_8_16
		mus_note noteA#, note16
		mus_note noteRst, note8

		mus_note noteC, note4_8_16; 8F6C
		mus_note noteD, note4_8_16
		mus_note noteG#, note4_16

	db $d2

		mus_note noteC, note4_8_16
		mus_note noteD, note4_16; 8F71
		mus_note noteA, note4
		mus_note noteRst, note8

		mus_note noteC, note4_8_16
		mus_note noteD, note4_8_16
		mus_note noteG#, note8_16; 8F76

	mus_octave oct6
		mus_note noteC, note4_8
		mus_note noteD, note2_16
		mus_note noteF#, note8

	db $e8; 8F7B

		mus_note noteC, note4_8

	mus_end

UnknSong_md_8f7e:
		mus_note noteD, note4_8_16

	mus_octave oct1
		mus_note noteE, note2_4_16; 8F80
		mus_note noteD, note1

	db $d6

		mus_note noteD#, note2_4_16
		mus_note noteD, note2_8_16
		mus_note noteRst, note4_8; 8F85

		mus_note noteE, note2_8_16
		mus_note noteD, note8
		mus_note noteB, note8_16
		mus_note noteF, note2_4
		mus_note noteD, note1; 8F8A
		mus_note noteRst, note8_16

		mus_note noteE, note2_4_16

	mus_end

UnknSong_md_8f8e:
	db $fc

		mus_note noteF, note16; 8F8F
		mus_note noteD, note2_8_16

	db $f5

		mus_note noteG#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8F94

	mus_octave oct5
		mus_note noteA#, note16
		mus_note noteC, note4_8_16
		mus_note noteD, note4

	db $f2; 8F99

		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note4

	mus_octave oct5

	mus_octave oct7; 8F9E
		mus_note noteC, note4_8_16
		mus_note noteD, note4

	db $d2

		mus_note noteC, note16
		mus_note noteC, note2; 8FA3
		mus_note noteD, note4
		mus_note noteRst, note8_16

	mus_octave oct7
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8FA8

	db $d2

		mus_note noteRst, note16

		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteRst, note8; 8FAD

		mus_note noteA#, note16
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8fb1:
	db $fc

		mus_note noteC, note1; 8FB2
		mus_note noteD, note2_8

	db $d5

		mus_note noteD#, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8FB7

	db $d2

		mus_note noteF, note8_16
		mus_note noteC, note4_8_16
		mus_note noteD, note4

	mus_octave oct5; 8FBC
		mus_note noteG, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteB, note8_16
		mus_note noteA, note8; 8FC1
		mus_note noteC, note4_8_16
		mus_note noteD, note4
		mus_note noteRst, note8_16

		mus_note noteB, note8_16
		mus_note noteC, note4_8_16; 8FC6
		mus_note noteD, note4
		mus_note noteB, note8_16
		mus_note noteA, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note4; 8FCB
		mus_note noteRst, note8_16

		mus_note noteG, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16
		mus_note noteB, note8; 8FD0
		mus_note noteF, note8
		mus_note noteC, note4_8_16

	mus_end

UnknSong_md_8fd4:
		mus_note noteD, note4_8_16

	mus_octave oct4; 8FD5
		mus_note noteE, note2_4_16
		mus_note noteD, note4_16
		mus_note noteRst, note4

		mus_note noteD#, note2_4_16
		mus_note noteD, note4_8; 8FDA

	db $d4

		mus_note noteD#, note2_4_16
		mus_note noteD, note4_16
		mus_note noteRst, note4_16

		mus_note noteD, note2_4_16; 8FDF
		mus_note noteD, note4_8_16
		mus_note noteB, note4_16
		mus_note noteD#, note2_4_16
		mus_note noteD, note2_16
		mus_note noteRst, note8; 8FE4

		mus_note noteD, note2_4_16

	mus_end

UnknSong_md_8fe7:
	db $fc

		mus_note noteA#, note4_8
		mus_note noteD, note4; 8FE9

	db $f4

		mus_note noteE, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note2_4_8

	db $d6; 8FEE

		mus_note noteD, note8
		mus_note noteC, note2
		mus_note noteD, note2_16

	db $f4

		mus_note noteC#, note2_8; 8FF3
		mus_note noteC, note2
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteC#, note2_8_16
		mus_note noteC, note2; 8FF8

	mus_end

UnknSong_md_8ffa:
	db $fc

		mus_note noteRst, note2_4_16

		mus_note noteD, note4_16

	db $f4; 8FFD

		mus_note noteG#, note16
		mus_note noteC, note4_8
		mus_note noteD, note2_4_8_16

	mus_octave oct1

	mus_octave oct7; 9002
		mus_note noteC, note4_8_16
		mus_note noteD, note2_16

	db $d5
	db $d8

		mus_note noteC, note4_8_16; 9007
		mus_note noteD, note2_16

	db $d1
	mus_vel 0, 6
	mus_end

UnknSong_md_900d:
		mus_note noteD, note4_8; 900D
		mus_note noteRst, note4_16

		mus_note noteE, note4_8_16
		mus_note noteD, note2_4_8
		mus_note noteA#, note4_8
		mus_note noteE, note4_16; 9012
		mus_note noteD, note2_16
		mus_note noteRst, note4_16

		mus_note noteE, note4_8
		mus_note noteD, note2_16
		mus_note noteB, note8; 9017
		mus_note noteE, note4_16

	mus_end

UnknSong_md_901a:
	db $fc
	mus_volume 45
	db $f1; 901D

		mus_note noteC#, note8
		mus_note noteC, note4_8
		mus_note noteD, note2_4_8

	mus_octave oct6
		mus_note noteC#, note4_8; 9022
		mus_note noteC, note4_8
		mus_note noteD, note2_4_8

	mus_octave oct6
		mus_note noteC#, note8
		mus_note noteC, note4_8; 9027
		mus_note noteD, note2_16

	db $d1

		mus_note noteC#, note8
		mus_note noteC, note4_8

	mus_end; 902C

UnknSong_md_902d:
	db $fc

		mus_note noteC#, note4_8
		mus_note noteD, note2_4_16

	mus_octave oct6
		mus_note noteC, note2_4_16; 9031
		mus_note noteC, note4_8
		mus_note noteD, note2_4_16

	db $d1

		mus_note noteC#, note16
		mus_note noteC, note4_8; 9036
		mus_note noteD, note2_4_8_16
		mus_note noteRst, note8

		mus_note noteC, note2_4_16
		mus_note noteC, note4_8
		mus_note noteD, note2_16; 903B
		mus_note noteRst, note8

		mus_note noteC, note2_8_16
		mus_note noteC, note4_8

	mus_end

UnknSong_md_9040:
		mus_note noteD, note2_4_8_16; 9040

	db $f2

		mus_note noteF#, note4_8
		mus_note noteD, note2_4_8

	mus_octave oct5
		mus_note noteF, note4_8; 9045
		mus_note noteD, note2_4_8_16

	db $d2

		mus_note noteF, note4_8_16
		mus_note noteD, note2_16

	db $d1; 904A

		mus_note noteF#, note4_8_16

	mus_end

UnknSong_md_904d:
	db $fc

		mus_note noteC#, note2_4
		mus_note noteD, note4; 904F

	db $f3

		mus_note noteF#, note4_16
		mus_note noteC, note4_8
		mus_note noteD, note8_16

	mus_octave oct5; 9054
		mus_note noteE, note4_16
		mus_note noteC, note4_8
		mus_note noteD, note4_8

	db $d1

		mus_note noteD, note8_16; 9059
		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteB, note8_16
		mus_note noteG#, note4_16
		mus_note noteC, note4_16; 905E
		mus_note noteD, note2_16

	db $d1

		mus_note noteA#, note8_16
		mus_note noteC, note4_16
		mus_note noteD, note4; 9063

	db $f3

		mus_note noteD, note4_16
		mus_note noteC, note4_8
		mus_note noteD, note4_16

	mus_octave oct3; 9068

	mus_octave oct3
		mus_note noteC, note4_16
		mus_note noteD, note2_16

	db $d1

		mus_note noteC, note8_16; 906D
		mus_note noteC, note4_8

	mus_end

UnknSong_md_9070:
	db $fc

		mus_note noteRst, note2_4_16

		mus_note noteD, note4; 9072

	db $d3

		mus_note noteF#, note16
		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteRst, note8_16; 9077

		mus_note noteE, note16
		mus_note noteC, note4_8
		mus_note noteD, note4_8
		mus_note noteRst, note8

		mus_note noteD, note16; 907C
		mus_note noteC, note4_8
		mus_note noteD, note8_16
		mus_note noteA, note8_16
		mus_note noteG#, note16
		mus_note noteC, note4_16; 9081
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteA#, note16
		mus_note noteC, note4_16
		mus_note noteD, note4; 9086

	db $d3

		mus_note noteD, note16
		mus_note noteC, note4_8
		mus_note noteD, note4
		mus_note noteRst, note4_16; 908B

	mus_octave oct7
		mus_note noteC, note4_16
		mus_note noteD, note2_16
		mus_note noteRst, note8

		mus_note noteC, note16; 9090
		mus_note noteC, note4_8

	mus_end

UnknSong_md_9093:
	db $fc

		mus_note noteC#, note8
		mus_note noteD, note8_16; 9095
		mus_note noteD#, note2_4_8
		mus_note noteG#, note8
		mus_note noteC, note4
		mus_note noteD, note2

	db $f5; 909A

		mus_note noteC, note8
		mus_note noteC, note4_8_16
		mus_note noteD, note8
		mus_note noteRst, note8_16

		mus_note noteG#, note8; 909F
		mus_note noteC, note4_16
		mus_note noteD, note2_16
		mus_note noteA, note8
		mus_note noteG#, note8
		mus_note noteC, note4; 90A4

	mus_end

UnknSong_md_90a6:
	db $fc
	db $ee

		mus_note noteD, note8_16
		mus_note noteD#, note2_4_8_16; 90A9
		mus_note noteB, note16
		mus_note noteC, note4_8
		mus_note noteD, note2

	db $d5

		mus_note noteF, note2_4_8; 90AE
		mus_note noteC, note2
		mus_note noteD, note8
		mus_note noteB, note8_16
		mus_note noteB, note16
		mus_note noteC, note4_8_16; 90B3
		mus_note noteD, note2_16
		mus_note noteF#, note8
		mus_note noteB, note16
		mus_note noteC, note4_8

	mus_end; 90B8

UnknSong_md_90b9:
		mus_note noteD, note8_16
		mus_note noteA, note8_16
		mus_note noteE, note2_8
		mus_note noteD, note2
		mus_note noteB, note4_8; 90BD
		mus_note noteD, note2_8
		mus_note noteD, note8
		mus_note noteA#, note8_16
		mus_note noteD#, note2_8
		mus_note noteD, note2_16; 90C2
		mus_note noteA, note8
		mus_note noteE, note2_8

	mus_end

Func_90c6: ; 0x90c6
	xor a
	ld [$cfc7], a
	ld [$d083], a
	dec a
	ld [$c0ee], a
	call PlaySound
	call DelayFrame
	ld c, $8
	ld a, [$d05c]
	and a
	jr z, .asm_90e3 ; 0x90dd $4
	ld a, $ea
	jr .asm_9100 ; 0x90e1 $1d
.asm_90e3
	ld a, [$d059]
	cp $c8
	jr c, .asm_90fe ; 0x90e8 $14
	cp $f3
	jr z, .asm_90fa ; 0x90ec $c
	cp $f7
	jr nz, .asm_90f6 ; 0x90f0 $4
	ld a, $ea
	jr .asm_9100 ; 0x90f4 $a
.asm_90f6
	ld a, $ed
	jr .asm_9100 ; 0x90f8 $6
.asm_90fa
	ld a, $f3
	jr .asm_9100 ; 0x90fc $2
.asm_90fe
	ld a, $f0
.asm_9100
	jp PlayMusic
; 0x9103

Func_9103: ; 0x9103
	ld c, $0
.asm_9105
	ld b, $0
	ld hl, $c026
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_9131 ; 0x910d $22
	ld a, c
	cp $4
	jr nc, .asm_912e ; 0x9112 $1a
	ld a, [$c002]
	and a
	jr z, .asm_912e ; 0x9118 $14
	bit 7, a
	jr nz, .asm_9131 ; 0x911c $13
	set 7, a
	ld [$c002], a
	xor a
	ld [$ff00+$25], a
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
	jr .asm_9131 ; 0x912c $3
.asm_912e
	call Func_9138
.asm_9131
	ld a, c
	inc c
	cp $7
	jr nz, .asm_9105 ; 0x9135 $ce
	ret
; 0x9138

Func_9138: ; 0x9138
	ld b, $0
	ld hl, $c0b6
	add hl, bc
	ld a, [hl]
	cp $1
	jp z, Func_91d0
	dec a
	ld [hl], a
	ld a, c
	cp $4
	jr nc, .asm_9154 ; 0x9149 $9
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_9154 ; 0x9151 $1
	ret
.asm_9154
	ld hl, $c02e
	add hl, bc
	bit 6, [hl]
	jr z, .asm_915f ; 0x915a $3
	call Func_980d
.asm_915f
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_9171 ; 0x9167 $8
	ld hl, $c02e
	add hl, bc
	bit 2, [hl]
	jr nz, .asm_9185 ; 0x916f $14
.asm_9171
	ld hl, $c02e
	add hl, bc
	bit 4, [hl]
	jr z, .asm_917c ; 0x9177 $3
	jp Func_96f9
.asm_917c
	ld hl, $c04e
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_9186 ; 0x9182 $2
	dec [hl]
.asm_9185
	ret
.asm_9186
	ld hl, $c056
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_918f ; 0x918c $1
	ret
.asm_918f
	ld d, a
	ld hl, $c05e
	add hl, bc
	ld a, [hl]
	and $f
	and a
	jr z, .asm_919c ; 0x9198 $2
	dec [hl]
	ret
.asm_919c
	ld a, [hl]
	swap [hl]
	or [hl]
	ld [hl], a
	ld hl, $c066
	add hl, bc
	ld e, [hl]
	ld hl, $c02e
	add hl, bc
	bit 3, [hl]
	jr z, .asm_91bc ; 0x91ac $e
	res 3, [hl]
	ld a, d
	and $f
	ld d, a
	ld a, e
	sub d
	jr nc, .asm_91ba ; 0x91b6 $2
	ld a, $0
.asm_91ba
	jr .asm_91c8 ; 0x91ba $c
.asm_91bc
	set 3, [hl]
	ld a, d
	and $f0
	swap a
	add e
	jr nc, .asm_91c8 ; 0x91c4 $2
	ld a, $ff
.asm_91c8
	ld d, a
	ld b, $3
	call Func_9838
	ld [hl], d
	ret
; 0x91d0

Func_91d0 ; 0x91d0
	ld hl, $c06e
	add hl, bc
	ld a, [hl]
	ld hl, $c04e
	add hl, bc
	ld [hl], a
	ld hl, $c02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	call Func_91e6
	ret
; 0x91e6

Func_91e6 ; 0x91e6
	call Func_9825
	ld d, a
	cp $ff
	jp nz, Func_9274
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 1, [hl]
	jr nz, .asm_9224 ; 0x91f7 $2b
	ld a, c
	cp $3
	jr nc, .asm_9200 ; 0x91fc $2
	jr .asm_923f ; 0x91fe $3f
.asm_9200
	res 2, [hl]
	ld hl, $c036
	add hl, bc
	res 0, [hl]
	cp $6
	jr nz, .asm_9214 ; 0x920a $8
	ld a, $0
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
.asm_9214
	jr nz, .asm_9222 ; 0x9214 $c
	ld a, [$c003]
	and a
	jr z, .asm_9222 ; 0x921a $6
	xor a
	ld [$c003], a
	jr .asm_923f ; 0x9220 $1d
.asm_9222
	jr .asm_9248 ; 0x9222 $24
.asm_9224
	res 1, [hl]
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	push hl
	ld hl, $c016
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	jp Func_91e6
.asm_923f
	ld hl, $5b1f
	add hl, bc
	ld a, [$ff00+$25]
	and [hl]
	ld [$ff00+$25], a
.asm_9248
	ld a, [$c02a]
	cp $14
	jr nc, .asm_9251 ; 0x924d $2
	jr .asm_926e ; 0x924f $1d
.asm_9251
	ld a, [$c02a]
	cp $86
	jr z, .asm_926e ; 0x9256 $16
	jr c, .asm_925c ; 0x9258 $2
	jr .asm_926e ; 0x925a $12
.asm_925c
	ld a, c
	cp $4
	jr z, .asm_9265 ; 0x925f $4
	call Func_96c7
	ret c
.asm_9265
	ld a, [$c005]
	ld [$ff00+$24], a
	xor a
	ld [$c005], a
.asm_926e
	ld hl, $c026
	add hl, bc
	ld [hl], b
	ret
; 0x9274

Func_9274: ; 0x9274
	cp $fd
	jp nz, Func_92a9
	call Func_9825
	push af
	call Func_9825
	ld d, a
	pop af
	ld e, a
	push de
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	push hl
	ld hl, $c016
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hld]
	ld [de], a
	pop de
	ld [hl], e
	inc hl
	ld [hl], d
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 1, [hl]
	jp Func_91e6
; 0x92a9

Func_92a9: ; 0x92a9
	cp $fe
	jp nz, Func_92e4
	call Func_9825
	ld e, a
	and a
	jr z, .asm_92cd ; 0x92b3 $18
	ld b, $0
	ld hl, $c0be
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .asm_92cb ; 0x92bd $c
	ld a, $1
	ld [hl], a
	call Func_9825
	call Func_9825
	jp Func_91e6
.asm_92cb
	inc a
	ld [hl], a
.asm_92cd
	call Func_9825
	push af
	call Func_9825
	ld b, a
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	pop af
	ld [hli], a
	ld [hl], b
	jp Func_91e6
; 0x92e4

Func_92e4: ; 0x92e4
	and $f0
	cp $d0
	jp nz, Func_9323
	ld a, d
	and $f
	ld b, $0
	ld hl, $c0c6
	add hl, bc
	ld [hl], a
	ld a, c
	cp $3
	jr z, .asm_9320 ; 0x92f8 $26
	call Func_9825
	ld d, a
	ld a, c
	cp $2
	jr z, .asm_930c ; 0x9301 $9
	cp $6
	jr nz, .asm_9319 ; 0x9305 $12
	ld hl, $c0e7
	jr .asm_930f ; 0x930a $3
.asm_930c
	ld hl, $c0e6
.asm_930f
	ld a, d
	and $f
	ld [hl], a
	ld a, d
	and $30
	sla a
	ld d, a
.asm_9319
	ld b, $0
	ld hl, $c0de
	add hl, bc
	ld [hl], d
.asm_9320
	jp Func_91e6
; 0x9323

Func_9323: ; 0x9323
	ld a, d
	cp $e8
	jr nz, .asm_9335 ; 0x9326 $d
	ld b, $0
	ld hl, $c02e
	add hl, bc
	ld a, [hl]
	xor $1
	ld [hl], a
	jp Func_91e6
.asm_9335
	cp $ea
	jr nz, .asm_936d ; 0x9337 $34
	call Func_9825
	ld b, $0
	ld hl, $c04e
	add hl, bc
	ld [hl], a
	ld hl, $c06e
	add hl, bc
	ld [hl], a
	call Func_9825
	ld d, a
	and $f0
	swap a
	ld b, $0
	ld hl, $c056
	add hl, bc
	srl a
	ld e, a
	adc b
	swap a
	or e
	ld [hl], a
	ld a, d
	and $f
	ld d, a
	ld hl, $c05e
	add hl, bc
	swap a
	or d
	ld [hl], a
	jp Func_91e6
.asm_936d
	cp $eb
	jr nz, .asm_93a5 ; 0x936f $34
	call Func_9825
	ld b, $0
	ld hl, $c076
	add hl, bc
	ld [hl], a
	call Func_9825
	ld d, a
	and $f0
	swap a
	ld b, a
	ld a, d
	and $f
	call Func_9858
	ld b, $0
	ld hl, $c0a6
	add hl, bc
	ld [hl], d
	ld hl, $c0ae
	add hl, bc
	ld [hl], e
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 4, [hl]
	call Func_9825
	ld d, a
	jp Func_950a
.asm_93a5
	cp $ec
	jr nz, .asm_93ba ; 0x93a7 $11
	call Func_9825
	rrca
	rrca
	and $c0
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld [hl], a
	jp Func_91e6
.asm_93ba
	cp $ed
	jr nz, .asm_93fa ; 0x93bc $3c
	ld a, c
	cp $4
	jr nc, .asm_93de ; 0x93c1 $1b
	call Func_9825
	ld [$c0e8], a
	call Func_9825
	ld [$c0e9], a
	xor a
	ld [$c0ce], a
	ld [$c0cf], a
	ld [$c0d0], a
	ld [$c0d1], a
	jr .asm_93f7 ; 0x93dc $19
.asm_93de
	call Func_9825
	ld [$c0ea], a
	call Func_9825
	ld [$c0eb], a
	xor a
	ld [$c0d2], a
	ld [$c0d3], a
	ld [$c0d4], a
	ld [$c0d5], a
.asm_93f7
	jp Func_91e6
.asm_93fa
	cp $ee
	jr nz, .asm_9407 ; 0x93fc $9
	call Func_9825
	ld [$c004], a
	jp Func_91e6
.asm_9407
	cp $ef
	jr nz, .asm_9426 ; 0x9409 $1b
	call Func_9825
	push bc
	call Func_9876
	pop bc
	ld a, [$c003]
	and a
	jr nz, .asm_9423 ; 0x9417 $a
	ld a, [$c02d]
	ld [$c003], a
	xor a
	ld [$c02d], a
.asm_9423
	jp Func_91e6
.asm_9426
	cp $fc
	jr nz, .asm_9444 ; 0x9428 $1a
	call Func_9825
	ld b, $0
	ld hl, $c046
	add hl, bc
	ld [hl], a
	and $c0
	ld hl, $c03e
	add hl, bc
	ld [hl], a
	ld hl, $c02e
	add hl, bc
	set 6, [hl]
	jp Func_91e6
.asm_9444
	cp $f0
	jr nz, .asm_9450 ; 0x9446 $8
	call Func_9825
	ld [$ff00+$24], a
	jp Func_91e6
.asm_9450
	cp $f8
	jr nz, .asm_945f ; 0x9452 $b
	ld b, $0
	ld hl, $c036
	add hl, bc
	set 0, [hl]
	jp Func_91e6
.asm_945f
	and $f0
	cp $e0
	jr nz, .asm_9472 ; 0x9463 $d
	ld hl, $c0d6
	ld b, $0
	add hl, bc
	ld a, d
	and $f
	ld [hl], a
	jp Func_91e6
.asm_9472
	cp $20
	jr nz, .asm_94bf ; 0x9474 $49
	ld a, c
	cp $3
	jr c, .asm_94bf ; 0x9479 $44
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_94bf ; 0x9483 $3a
	call Func_950a
	ld d, a
	ld b, $0
	ld hl, $c03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
	ld b, $1
	call Func_9838
	ld [hl], d
	call Func_9825
	ld d, a
	ld b, $2
	call Func_9838
	ld [hl], d
	call Func_9825
	ld e, a
	ld a, c
	cp $7
	ld a, $0
	jr z, .asm_94b2 ; 0x94ab $5
	push de
	call Func_9825
	pop de
.asm_94b2
	ld d, a
	push de
	call Func_9629
	call Func_95f8
	pop de
	call Func_964b
	ret
.asm_94bf
	ld a, c
	cp $4
	jr c, .asm_94db ; 0x94c2 $17
	ld a, d
	cp $10
	jr nz, .asm_94db ; 0x94c7 $12
	ld b, $0
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_94db ; 0x94d1 $8
	call Func_9825
	ld [$ff00+$10], a
	jp Func_91e6
.asm_94db
	ld a, c
	cp $3
	jr nz, Func_950a ; 0x94de $2a
	ld a, d
	and $f0
	cp $b0
	jr z, .asm_94f5 ; 0x94e5 $e
	jr nc, Func_950a ; 0x94e7 $21
	swap a
	ld b, a
	ld a, d
	and $f
	ld d, a
	ld a, b
	push de
	push bc
	jr .asm_94fd ; 0x94f3 $8
.asm_94f5
	ld a, d
	and $f
	push af
	push bc
	call Func_9825
.asm_94fd
	ld d, a
	ld a, [$c003]
	and a
	jr nz, .asm_9508 ; 0x9502 $4
	ld a, d
	call Func_9876
.asm_9508
	pop bc
	pop de

Func_950a: ; 0x950a
	ld a, d
	push af
	and $f
	inc a
	ld b, $0
	ld e, a
	ld d, b
	ld hl, $c0c6
	add hl, bc
	ld a, [hl]
	ld l, b
	call Func_9847
	ld a, c
	cp $4
	jr nc, .asm_952b ; 0x951f $a
	ld a, [$c0e8]
	ld d, a
	ld a, [$c0e9]
	ld e, a
	jr .asm_953e ; 0x9529 $13
.asm_952b
	ld d, $1
	ld e, $0
	cp $7
	jr z, .asm_953e ; 0x9531 $b
	call Func_9693
	ld a, [$c0ea]
	ld d, a
	ld a, [$c0eb]
	ld e, a
.asm_953e
	ld a, l
	ld b, $0
	ld hl, $c0ce
	add hl, bc
	ld l, [hl]
	call Func_9847
	ld e, l
	ld d, h
	ld hl, $c0ce
	add hl, bc
	ld [hl], e
	ld a, d
	ld hl, $c0b6
	add hl, bc
	ld [hl], a
	ld hl, $c036
	add hl, bc
	bit 0, [hl]
	jr nz, .asm_9568 ; 0x955c $a
	ld hl, $c02e
	add hl, bc
	bit 2, [hl]
	jr z, .asm_9568 ; 0x9564 $2
	pop hl
	ret
.asm_9568
	pop af
	and $f0
	cp $c0
	jr nz, .asm_959f ; 0x956d $30
	ld a, c
	cp $4
	jr nc, .asm_957c ; 0x9572 $8
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_959e ; 0x957a $22
.asm_957c
	ld a, c
	cp $2
	jr z, .asm_9585 ; 0x957f $4
	cp $6
	jr nz, .asm_9592 ; 0x9583 $d
.asm_9585
	ld b, $0
	ld hl, $5b1f
	add hl, bc
	ld a, [$ff00+$25]
	and [hl]
	ld [$ff00+$25], a
	jr .asm_959e ; 0x9590 $c
.asm_9592
	ld b, $2
	call Func_9838
	ld a, $8
	ld [hli], a
	inc hl
	ld a, $80
	ld [hl], a
.asm_959e
	ret
.asm_959f
	swap a
	ld b, $0
	ld hl, $c0d6
	add hl, bc
	ld b, [hl]
	call Func_9858
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 4, [hl]
	jr z, .asm_95b8 ; 0x95b3 $3
	call Func_978f
.asm_95b8
	push de
	ld a, c
	cp $4
	jr nc, .asm_95cd ; 0x95bc $f
	ld hl, $c02a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_95cb ; 0x95c7 $2
	jr .asm_95cd ; 0x95c9 $2
.asm_95cb
	pop de
	ret
.asm_95cd
	ld b, $0
	ld hl, $c0de
	add hl, bc
	ld d, [hl]
	ld b, $2
	call Func_9838
	ld [hl], d
	call Func_9629
	call Func_95f8
	pop de
	ld b, $0
	ld hl, $c02e
	add hl, bc
	bit 0, [hl]
	jr z, .asm_95ef ; 0x95e9 $4
	inc e
	jr nc, .asm_95ef ; 0x95ec $1
	inc d
.asm_95ef
	ld hl, $c066
	add hl, bc
	ld [hl], e
	call Func_964b
	ret
; 0x95f8

Func_95f8: ; 0x95f8
	ld b, $0
	ld hl, $5b27
	add hl, bc
	ld a, [$ff00+$25]
	or [hl]
	ld d, a
	ld a, c
	cp $7
	jr z, .asm_9613 ; 0x9605 $c
	cp $4
	jr nc, .asm_9625 ; 0x9609 $1a
	ld hl, $c02a
	add hl, bc
	ld a, [hl]
	and a
	jr nz, .asm_9625 ; 0x9611 $12
.asm_9613
	ld a, [$c004]
	ld hl, $5b27
	add hl, bc
	and [hl]
	ld d, a
	ld a, [$ff00+$25]
	ld hl, $5b1f
	add hl, bc
	and [hl]
	or d
	ld d, a
.asm_9625
	ld a, d
	ld [$ff00+$25], a
	ret
; 0x9629

Func_9629: ; 0x9629
	ld b, $0
	ld hl, $c0b6
	add hl, bc
	ld d, [hl]
	ld a, c
	cp $2
	jr z, .asm_9644 ; 0x9633 $f
	cp $6
	jr z, .asm_9644 ; 0x9637 $b
	ld a, d
	and $3f
	ld d, a
	ld hl, $c03e
	add hl, bc
	ld a, [hl]
	or d
	ld d, a
.asm_9644
	ld b, $1
	call Func_9838
	ld [hl], d
	ret
; 0x964b

Func_964b: ; 0x964b
	ld a, c
	cp $2
	jr z, .asm_9654 ; 0x964e $4
	cp $6
	jr nz, .asm_9681 ; 0x9652 $2d
.asm_9654
	push de
	ld de, $c0e6
	cp $2
	jr z, .asm_965f ; 0x965a $3
	ld de, $c0e7
.asm_965f
	ld a, [de]
	add a
	ld d, $0
	ld e, a
	ld hl, $4361
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $ff30
	ld b, $f
	ld a, $0
	ld [$ff00+$1a], a
.asm_9674
	ld a, [de]
	inc de
	ld [hli], a
	ld a, b
	dec b
	and a
	jr nz, .asm_9674 ; 0x967a $f8
	ld a, $80
	ld [$ff00+$1a], a
	pop de
.asm_9681
	ld a, d
	or $80
	and $c7
	ld d, a
	ld b, $3
	call Func_9838
	ld [hl], e
	inc hl
	ld [hl], d
	call Func_96b5
	ret
; 0x9693

Func_9693: ; 0x9693
	call Func_96e5
	jr nc, .asm_96ab ; 0x9696 $13
	ld d, $0
	ld a, [$c0f2]
	add $80
	jr nc, .asm_96a2 ; 0x969f $1
	inc d
.asm_96a2
	ld [$c0eb], a
	ld a, d
	ld [$c0ea], a
	jr .asm_96b4 ; 0x96a9 $9
.asm_96ab
	xor a
	ld [$c0eb], a
	ld a, $1
	ld [$c0ea], a
.asm_96b4
	ret
; 0x96b5

Func_96b5: ; 0x96b5
	call Func_96e5
	jr nc, .asm_96c6 ; 0x96b8 $c
	ld a, [$c0f1]
	add e
	jr nc, .asm_96c1 ; 0x96be $1
	inc d
.asm_96c1
	dec hl
	ld e, a
	ld [hl], e
	inc hl
	ld [hl], d
.asm_96c6
	ret
; 0x96c7

Func_96c7: ; 0x96c7
	call Func_96e5
	jr nc, .asm_96e2 ; 0x96ca $16
	ld hl, $c006
	ld e, c
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hl]
	sub $1
	ld [hl], a
	inc hl
	ld a, [hl]
	sbc $0
	ld [hl], a
	scf
	ret
.asm_96e2
	scf
	ccf
	ret
; 0x96e5

Func_96e5: ; 0x96e5
	ld a, [$c02a]
	cp $14
	jr nc, .asm_96ee ; 0x96ea $2
	jr .asm_96f4 ; 0x96ec $6
.asm_96ee
	cp $86
	jr z, .asm_96f4 ; 0x96f0 $2
	jr c, .asm_96f7 ; 0x96f2 $3
.asm_96f4
	scf
	ccf
	ret
.asm_96f7
	scf
	ret
; 0x96f9

Func_96f9: ; 0x96f9
	ld hl, $c02e
	add hl, bc
	bit 5, [hl]
	jp nz, .asm_9740
	ld hl, $c09e
	add hl, bc
	ld e, [hl]
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c07e
	add hl, bc
	ld l, [hl]
	ld h, b
	add hl, de
	ld d, h
	ld e, l
	ld hl, $c08e
	add hl, bc
	push hl
	ld hl, $c086
	add hl, bc
	ld a, [hl]
	pop hl
	add [hl]
	ld [hl], a
	ld a, $0
	adc e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, $c0a6
	add hl, bc
	ld a, [hl]
	cp d
	jp c, .asm_9786
	jr nz, .asm_9773 ; 0x9733 $3e
	ld hl, $c0ae
	add hl, bc
	ld a, [hl]
	cp e
	jp c, .asm_9786
	jr .asm_9773 ; 0x973e $33
.asm_9740
	ld hl, $c09e
	add hl, bc
	ld a, [hl]
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c07e
	add hl, bc
	ld e, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, $c086
	add hl, bc
	ld a, [hl]
	add a
	ld [hl], a
	ld a, e
	sbc b
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, $c0a6
	add hl, bc
	ld a, d
	cp [hl]
	jr c, .asm_9786 ; 0x9767 $1d
	jr nz, .asm_9773 ; 0x9769 $8
	ld hl, $c0ae
	add hl, bc
	ld a, e
	cp [hl]
	jr c, .asm_9786 ; 0x9771 $13
.asm_9773
	ld hl, $c09e
	add hl, bc
	ld [hl], e
	ld hl, $c096
	add hl, bc
	ld [hl], d
	ld b, $3
	call Func_9838
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
.asm_9786
	ld hl, $c02e
	add hl, bc
	res 4, [hl]
	res 5, [hl]
	ret
; 0x978f

Func_978f: ; 0x978f
	ld hl, $c096
	add hl, bc
	ld [hl], d
	ld hl, $c09e
	add hl, bc
	ld [hl], e
	ld hl, $c0b6
	add hl, bc
	ld a, [hl]
	ld hl, $c076
	add hl, bc
	sub [hl]
	jr nc, .asm_97a7 ; 0x97a3 $2
	ld a, $1
.asm_97a7
	ld [hl], a
	ld hl, $c0ae
	add hl, bc
	ld a, e
	sub [hl]
	ld e, a
	ld a, d
	sbc b
	ld hl, $c0a6
	add hl, bc
	sub [hl]
	jr c, .asm_97c3 ; 0x97b6 $b
	ld d, a
	ld b, $0
	ld hl, $c02e
	add hl, bc
	set 5, [hl]
	jr .asm_97e6 ; 0x97c1 $23
.asm_97c3
	ld hl, $c096
	add hl, bc
	ld d, [hl]
	ld hl, $c09e
	add hl, bc
	ld e, [hl]
	ld hl, $c0ae
	add hl, bc
	ld a, [hl]
	sub e
	ld e, a
	ld a, d
	sbc b
	ld d, a
	ld hl, $c0a6
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld b, $0
	ld hl, $c02e
	add hl, bc
	res 5, [hl]
.asm_97e6
	ld hl, $c076
	add hl, bc
.asm_97ea
	inc b
	ld a, e
	sub [hl]
	ld e, a
	jr nc, .asm_97ea ; 0x97ee $fa
	ld a, d
	and a
	jr z, .asm_97f8 ; 0x97f2 $4
	dec a
	ld d, a
	jr .asm_97ea ; 0x97f6 $f2
.asm_97f8
	ld a, e
	add [hl]
	ld d, b
	ld b, $0
	ld hl, $c07e
	add hl, bc
	ld [hl], d
	ld hl, $c086
	add hl, bc
	ld [hl], a
	ld hl, $c08e
	add hl, bc
	ld [hl], a
	ret
; 0x980d

Func_980d: ; 0x980d
	ld b, $0
	ld hl, $c046
	add hl, bc
	ld a, [hl]
	rlca
	rlca
	ld [hl], a
	and $c0
	ld d, a
	ld b, $1
	call Func_9838
	ld a, [hl]
	and $3f
	or d
	ld [hl], a
	ret
; 0x9825

Func_9825: ; 0x9825
	ld d, $0
	ld a, c
	add a
	ld e, a
	ld hl, $c006
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	ld a, [de]
	inc de
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 0x9838

Func_9838: ; 0x9838
	ld a, c
	ld hl, $5b17
	add l
	jr nc, .asm_9840 ; 0x983d $1
	inc h
.asm_9840
	ld l, a
	ld a, [hl]
	add b
	ld l, a
	ld h, $ff
	ret
; 0x9847

Func_9847: ; 0x9847
	ld h, $0
.asm_9849
	srl a
	jr nc, .asm_984e ; 0x984b $1
	add hl, de
.asm_984e
	sla e
	rl d
	and a
	jr z, .asm_9857 ; 0x9853 $2
	jr .asm_9849 ; 0x9855 $f2
.asm_9857
	ret
; 0x9858

Func_9858: ; 0x9858
	ld h, $0
	ld l, a
	add hl, hl
	ld d, h
	ld e, l
	ld hl, $5b2f
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, b
.asm_9866
	cp $7
	jr z, .asm_9871 ; 0x9868 $7
	sra d
	rr e
	inc a
	jr .asm_9866 ; 0x986f $f5
.asm_9871
	ld a, $8
	add d
	ld d, a
	ret
; 0x9876

Func_9876: ; 0x9876
	ld [$c001], a
	cp $ff
	jp z, Func_9a34
	cp $b9
	jp z, Func_994e
	jp c, Func_994e
	cp $fe
	jr z, .asm_988d ; 0x9888 $3
	jp nc, Func_994e
.asm_988d
	xor a
	ld [$c000], a
	ld [$c003], a
	ld [$c0e9], a
	ld [$c0e6], a
	ld [$c0e7], a
	ld d, $8
	ld hl, $c016
	call Func_9a89
	ld hl, $c006
	call Func_9a89
	ld d, $4
	ld hl, $c026
	call Func_9a89
	ld hl, $c02e
	call Func_9a89
	ld hl, $c03e
	call Func_9a89
	ld hl, $c046
	call Func_9a89
	ld hl, $c04e
	call Func_9a89
	ld hl, $c056
	call Func_9a89
	ld hl, $c05e
	call Func_9a89
	ld hl, $c066
	call Func_9a89
	ld hl, $c06e
	call Func_9a89
	ld hl, $c036
	call Func_9a89
	ld hl, $c076
	call Func_9a89
	ld hl, $c07e
	call Func_9a89
	ld hl, $c086
	call Func_9a89
	ld hl, $c08e
	call Func_9a89
	ld hl, $c096
	call Func_9a89
	ld hl, $c09e
	call Func_9a89
	ld hl, $c0a6
	call Func_9a89
	ld hl, $c0ae
	call Func_9a89
	ld a, $1
	ld hl, $c0be
	call Func_9a89
	ld hl, $c0b6
	call Func_9a89
	ld hl, $c0c6
	call Func_9a89
	ld [$c0e8], a
	ld a, $ff
	ld [$c004], a
	xor a
	ld [$ff00+$24], a
	ld a, $8
	ld [$ff00+$10], a
	ld a, $0
	ld [$ff00+$25], a
	xor a
	ld [$ff00+$1a], a
	ld a, $80
	ld [$ff00+$1a], a
	ld a, $77
	ld [$ff00+$24], a
	jp Func_9a8f
; 0x994e

Func_994e: ; 0x994e
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	ld a, h
	ld [$c0ec], a
	ld a, l
	ld [$c0ed], a
	ld a, [hl]
	and $c0
	rlca
	rlca
	ld c, a
.asm_9967
	ld d, c
	ld a, c
	add a
	add c
	ld c, a
	ld b, $0
	ld a, [$c0ec]
	ld h, a
	ld a, [$c0ed]
	ld l, a
	add hl, bc
	ld c, d
	ld a, [hl]
	and $f
	ld e, a
	ld d, $0
	ld hl, $c026
	add hl, de
	ld a, [hl]
	and a
	jr z, .asm_99a3 ; 0x9984 $1d
	ld a, e
	cp $7
	jr nz, .asm_999a ; 0x9989 $f
	ld a, [$c001]
	cp $14
	jr nc, .asm_9993 ; 0x9990 $1
	ret
.asm_9993
	ld a, [hl]
	cp $14
	jr z, .asm_99a3 ; 0x9996 $b
	jr c, .asm_99a3 ; 0x9998 $9
.asm_999a
	ld a, [$c001]
	cp [hl]
	jr z, .asm_99a3 ; 0x999e $3
	jr c, .asm_99a3 ; 0x99a0 $1
	ret
.asm_99a3
	xor a
	push de
	ld h, d
	ld l, e
	add hl, hl
	ld d, h
	ld e, l
	ld hl, $c016
	add hl, de
	ld [hli], a
	ld [hl], a
	ld hl, $c006
	add hl, de
	ld [hli], a
	ld [hl], a
	pop de
	ld hl, $c026
	add hl, de
	ld [hl], a
	ld hl, $c02e
	add hl, de
	ld [hl], a
	ld hl, $c03e
	add hl, de
	ld [hl], a
	ld hl, $c046
	add hl, de
	ld [hl], a
	ld hl, $c04e
	add hl, de
	ld [hl], a
	ld hl, $c056
	add hl, de
	ld [hl], a
	ld hl, $c05e
	add hl, de
	ld [hl], a
	ld hl, $c066
	add hl, de
	ld [hl], a
	ld hl, $c06e
	add hl, de
	ld [hl], a
	ld hl, $c076
	add hl, de
	ld [hl], a
	ld hl, $c07e
	add hl, de
	ld [hl], a
	ld hl, $c086
	add hl, de
	ld [hl], a
	ld hl, $c08e
	add hl, de
	ld [hl], a
	ld hl, $c096
	add hl, de
	ld [hl], a
	ld hl, $c09e
	add hl, de
	ld [hl], a
	ld hl, $c0a6
	add hl, de
	ld [hl], a
	ld hl, $c0ae
	add hl, de
	ld [hl], a
	ld hl, $c036
	add hl, de
	ld [hl], a
	ld a, $1
	ld hl, $c0be
	add hl, de
	ld [hl], a
	ld hl, $c0b6
	add hl, de
	ld [hl], a
	ld hl, $c0c6
	add hl, de
	ld [hl], a
	ld a, e
	cp $4
	jr nz, .asm_9a2b ; 0x9a25 $4
	ld a, $8
	ld [$ff00+$10], a
.asm_9a2b
	ld a, c
	and a
	jp z, Func_9a8f
	dec c
	jp .asm_9967
; 0x9a34

Func_9a34: ; 0x9a34
	ld a, $80
	ld [$ff00+$26], a
	ld [$ff00+$1a], a
	xor a
	ld [$ff00+$25], a
	ld [$ff00+$1c], a
	ld a, $8
	ld [$ff00+$10], a
	ld [$ff00+$12], a
	ld [$ff00+$17], a
	ld [$ff00+$21], a
	ld a, $40
	ld [$ff00+$14], a
	ld [$ff00+$19], a
	ld [$ff00+$23], a
	ld a, $77
	ld [$ff00+$24], a
	xor a
	ld [$c000], a
	ld [$c003], a
	ld [$c002], a
	ld [$c0e9], a
	ld [$c0eb], a
	ld [$c0e6], a
	ld [$c0e7], a
	ld d, $a0
	ld hl, $c006
	call Func_9a89
	ld a, $1
	ld d, $18
	ld hl, $c0b6
	call Func_9a89
	ld [$c0e8], a
	ld [$c0ea], a
	ld a, $ff
	ld [$c004], a
	ret
; 0x9a89

Func_9a89: ; 0x9a89
	ld b, d
.asm_9a8a
	ld [hli], a
	dec b
	jr nz, .asm_9a8a ; 0x9a8c $fc
	ret
; 0x9a8f

Func_9a8f: ; 0x9a8f
	ld a, [$c001]
	ld l, a
	ld e, a
	ld h, $0
	ld d, h
	add hl, hl
	add hl, de
	ld de, $4000
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c006
	ld a, [de]
	ld b, a
	rlca
	rlca
	and $3
	ld c, a
	ld a, b
	and $f
	ld b, c
	inc b
	inc de
	ld c, $0
.asm_9ab1
	cp c
	jr z, .asm_9ab9 ; 0x9ab2 $5
	inc c
	inc hl
	inc hl
	jr .asm_9ab1 ; 0x9ab7 $f8
.asm_9ab9
	push hl
	push bc
	push af
	ld b, $0
	ld c, a
	ld hl, $c026
	add hl, bc
	ld a, [$c001]
	ld [hl], a
	pop af
	cp $3
	jr c, .asm_9ad2 ; 0x9aca $6
	ld hl, $c02e
	add hl, bc
	set 2, [hl]
.asm_9ad2
	pop bc
	pop hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc c
	dec b
	ld a, b
	and a
	ld a, [de]
	inc de
	jr nz, .asm_9ab1 ; 0x9ae0 $cf
	ld a, [$c001]
	cp $14
	jr nc, .asm_9aeb ; 0x9ae7 $2
	jr .asm_9b15 ; 0x9ae9 $2a
.asm_9aeb
	ld a, [$c001]
	cp $86
	jr z, .asm_9b15 ; 0x9af0 $23
	jr c, .asm_9af6 ; 0x9af2 $2
	jr .asm_9b15 ; 0x9af4 $1f
.asm_9af6
	ld hl, $c02a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld hl, $c012
	ld de, $5b16
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [$c005]
	and a
	jr nz, .asm_9b15 ; 0x9b0a $9
	ld a, [$ff00+$24]
	ld [$c005], a
	ld a, $77
	ld [$ff00+$24], a
.asm_9b15
	ret
; 0x9b16

	mus_end; 9B16

UnknSong_md_9b17:
		mus_note noteC#, note16
		mus_note noteC#, note4_8
		mus_note noteC#, note2_8_16
		mus_note noteC#, note1
		mus_note noteC#, note16; 9B1B
		mus_note noteC#, note4_8
		mus_note noteC#, note2_8_16
		mus_note noteC#, note1

	db $ee
	db $dd; 9B20

		mus_note noteB, note2_4
		mus_note noteG, note2

	db $ee
	db $dd

		mus_note noteB, note2_4; 9B25
		mus_note noteG, note2
		mus_note noteC#, note8
		mus_note noteD, note8_16
		mus_note noteE, note4_16
		mus_note noteG#, note2_16; 9B2A
		mus_note noteC#, note8
		mus_note noteD, note8_16
		mus_note noteE, note4_16
		mus_note noteG#, note2_16
		mus_note noteD, note2_4_16; 9B2F

	db $f8

		mus_note noteA, note2_4_8

	db $f8

		mus_note noteC, note2

	db $f9; 9B34

		mus_note noteF#, note2_4

	db $f9

		mus_note noteRst, note2_8_16

	db $f9

		mus_note noteD, note4; 9B39

	db $fa

		mus_note noteG, note2

	db $fa

		mus_note noteRst, note2

	db $fa; 9B3E

		mus_note noteC#, note8_16

	db $fb

		mus_note noteF, note2_16

	db $fb

		mus_note noteA, note2_4; 9B43

	db $fb
	db $da
	db $fb

Func_9b47: ; 0x9b47
	ld c, $2
	ld a, $de
	call PlayMusic
	ld hl, $c006
	ld de, $71a2
	call Func_9b60
	ld de, $721d
	call Func_9b60
	ld de, $72b5

Func_9b60: ; 0x9b60
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret
; 0x9b65

Func_9b65: ; 0x9b65
	ld c, $2
	ld a, $de
	call PlayMusic
	ld hl, $c006
	ld de, $7119
	jp Func_9b60
; 0x9b75

Func_9b75: ; 0x9b75
	call Func_9b47
	ld hl, $c006
	ld de, $719b
	jp Func_9b60
; 0x9b81

Func_9b81: ; 0x9b81
	ld a, $a
	ld [$cfc8], a
	ld [$cfc9], a
	ld a, $ff
	ld [$cfc7], a
	ld c, $64
	call DelayFrames
	ld c, $2
	ld a, $c3
	call PlayMusic
	ld hl, $c006
	ld de, $6a6f
	jp Func_9b60
; 0x9ba3
 
;Pokemon Healed Music
PkmnHealed_md_1: ;9BA3 - 9BC3
	;Setup
	mus_tempo 0, $90
	mus_volume 119
	mus_duty duty50
	db $E8 ;??
	mus_vel 8, 1

;Music
	;Piece 1
	mus_note noteRst, note8
	db $EB, $00
	mus_note noteE, note2_4
	mus_note noteB, note8
	db $EB, $00
	mus_note noteF, note4_16
	mus_note noteB, note8
	db $EB, $00
	mus_note noteE, note4_16
	mus_note noteE, note8
	mus_note noteRst, note4
	db $EB, $00
	mus_note noteD#, note2_4
	mus_note noteE, note4
	db $EB, $00
	mus_note noteE, note2_4
	mus_note noteB, note4
	
	mus_end ;End

PkmnHealed_md_2: ;9BC4 - 9BD1
;Setup
	mus_duty duty50

;Music
	;Octave Switch
	db dNormSpd
	mus_note noteRst, note4
	db oct3
	
	;Piece 1
	mus_note noteB, note4
	mus_note noteB, note4
	mus_note noteB, note8
	mus_note noteG#, note8
	
	;Octave Switch
	db dNormSpd
	mus_note noteRst, note4_16
	db oct4
	
	;Piece 2
	mus_note noteE, note2
	
	mus_end ;End

PkmnHealed_md_3: ;9BD2 - 9BDD
;Music
	;Octave Switch
	db dNormSpd
	mus_note noteC#, note16
	db oct3

	;Piece 1
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteE, note4_8
	mus_note noteRst, note8
	
	mus_end ;End

	;Routes 1 and 2
Routes1_md_1: ;9BDE - 9C50
	mus_tempo 0, 152
	mus_volume 119
	mus_mod 4, 2, 3
	mus_duty duty50
	db $E8

branch_9BE9:
	mus_vel 10, 1
	mus_note noteRst, note4

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteD, note4_8
	mus_note noteD, note8
	mus_note noteD, note4_8
	mus_note noteD, note8
	mus_note noteD, note16
	mus_note noteC#, note16

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteC#, note16

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteA, note4_8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteC#, note4_8
	mus_note noteC#, note8
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteA, note4_8

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteD, note4_8
	mus_note noteD, note8
	mus_note noteD, note4_8
	mus_note noteD, note8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteD, note16
	mus_note noteC#, note16

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteA, note4_8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteC#, note4_8

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_vel 10, 2

	mus_octave oct3
	mus_note noteG, note4
	mus_note noteE, note4
	mus_note noteF#, note8
	mus_vel 10, 1

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteA, note4_8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note4
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note4
	mus_note noteG, note8
	mus_note noteE, note8
	mus_note noteC#, note4
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteA, note4
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteE, note8
	mus_note noteC#, note8
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteA, note8
	mus_jump 0, branch_9BE9 ;5BE9
	mus_end

Routes1_md_2: ;9C51 - 9CD7
	mus_duty duty50
	
branch_9C53:
	mus_vel 13, 1
	mus_call branch_9C65
	mus_call branch_9C78
	mus_call branch_9C65
	mus_call branch_9C8D
	mus_jump 0, branch_9C53

branch_9C65:
	mus_octave oct3
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteG, note8_16
	mus_note noteF#, note16
	mus_note noteE, note4_8
	mus_end

branch_9C78:
	mus_note noteC#, note16
	mus_note noteD, note16
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteC#, note16
	mus_note noteD, note16
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteC#, note16
	mus_note noteD, note16
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteF#, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteD, note4
	mus_note noteF#, note8
	mus_end

branch_9C8D:
	mus_note noteC#, note16
	mus_note noteD, note16
	mus_note noteE, note8
	mus_note noteG, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_vel 13, 2
	mus_note noteB, note4
	db $D6
	db $D1

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteC#, note16
	mus_vel 13, 1

	mus_octave oct2
	mus_note noteB, note16
	mus_note noteA, note16

	mus_octave oct3
	mus_note noteC#, note16
	mus_note noteD, note4_8
	mus_vel 13, 2
	mus_note noteF#, note16
	mus_note noteG, note16
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteD, note8

	mus_octave oct4
	mus_note noteD, note8
	mus_note noteC#, note8

	mus_octave oct3
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC#, note8

	mus_octave oct3
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteD, note8_16
	mus_note noteF#, note16
	mus_note noteE, note4_8
	mus_note noteF#, note16
	mus_note noteG, note16
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note8

	mus_octave oct4
	mus_note noteD, note8
	mus_note noteC#, note8

	mus_octave oct3
	mus_note noteB, note8_16
	mus_note noteG, note16
	mus_note noteA, note8

	mus_octave oct4
	mus_note noteD, note8
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_vel 13, 1

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteD, note8
	mus_end
	mus_end
	
Routes1_md_3: ;9CD8 - 9D23
	mus_mod 8, 2, 5
	mus_vel 1, 3
	
branch_9CDD:
	mus_note noteRst, note8

	mus_octave oct3
	mus_note noteD, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note4

	mus_octave oct2
	mus_note noteA, note4
	mus_note noteB, note4
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteA, note4
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note4

	mus_octave oct2
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note4

	mus_octave oct2
	mus_note noteA, note4
	mus_note noteB, note4
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note4

	mus_octave oct2
	mus_note noteA, note4

	mus_octave oct3
	mus_note noteD, note2

	mus_octave oct2
	mus_note noteG, note2
	mus_note noteA, note2

	mus_octave oct3
	mus_note noteC#, note2
	mus_note noteD, note2

	mus_octave oct2
	mus_note noteG, note2
	mus_note noteA, note2

	mus_octave oct3
	mus_note noteD, note4_8
	mus_jump 0, branch_9CDD
	mus_end
	; 9D23

Routes1_md_4: ;9D24 - 9DB8
; 9D24
	mus_vel 12, 3
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note4
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note1
	mus_note noteB, note8
	mus_note noteC, note1
	mus_jump 0, Routes1_md_4
	mus_end
; 9DB8

;Routes 24 and 25
Routes2_md_1: ;9DB9 - 9E4E
	; 9DB9
	mus_tempo 0, 152
	mus_volume 119
	mus_mod 9, 2, 5
	mus_duty duty25

branch_9DBC:
	mus_vel 11, 2

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteG#, note4_8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note16
	mus_note noteF#, note16
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteG#, note4
	mus_note noteF#, note4

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteG#, note4_8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note16
	mus_note noteF#, note16
	mus_note noteB, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteG#, note4
	mus_note noteB, note4
	db $D8
	mus_note noteB, note8_16

	mus_octave oct3
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteD#, note8

	mus_octave oct2
	mus_note noteG#, note8

	mus_octave oct3
	mus_note noteD#, note8
	mus_note noteD#, note8

	mus_octave oct2
	mus_note noteG#, note8

	mus_octave oct3
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteF#, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteF#, note8

	mus_octave oct3
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteB, note8
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_jump 0, branch_9DBC
	mus_end
	; 9E4E

Routes2_md_2: ;9E4F - 9E9A

	; 9E4F
	mus_mod 8, 2, 6
	mus_duty duty75
	
branch_9E54:
	mus_vel 13, 4

	mus_octave oct3
	mus_note noteE, note4_8

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteE, note16
	mus_note noteF#, note4_8
	mus_note noteA, note8
	mus_note noteG#, note8_16
	mus_note noteE, note16
	mus_note noteF#, note2

	mus_octave oct2
	mus_note noteD#, note4

	mus_octave oct3
	mus_note noteE, note4_8

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteE, note16
	mus_note noteF#, note4_8
	mus_note noteA, note8
	mus_note noteG#, note8_16
	mus_note noteE, note16
	mus_note noteB, note2

	mus_octave oct2
	mus_note noteG#, note4

	mus_octave oct4
	mus_note noteC#, note4_8

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteA, note16
	mus_note noteB, note4_8
	mus_note noteA, note16
	mus_note noteG#, note16
	mus_note noteA, note4_8
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_note noteG#, note4
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF#, note2
	mus_note noteA, note4
	mus_note noteG#, note8_16
	mus_note noteF#, note16
	mus_note noteE, note2
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF#, note8
	mus_note noteF#, note16
	mus_note noteG#, note16
	mus_note noteA, note4

	mus_octave oct4
	mus_note noteC#, note4

	mus_octave oct3
	mus_note noteB, note8_16
	mus_note noteA, note16
	mus_note noteG#, note2
	mus_note noteRst, note4
	mus_jump 0, branch_9E54
	mus_end
	; 9E9A

Routes2_md_3: ;9E9B - 9F07
	; 9E9B
	mus_mod 9, 2, 8
	
branch_9E9E:
	mus_vel 1, 1

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteB, note4_8

	mus_octave oct2
	mus_note noteD, note16
	mus_note noteC#, note16
	mus_note noteD, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteB, note4_8

	mus_octave oct2
	mus_note noteD, note16
	mus_note noteC#, note16

	mus_octave oct1
	mus_note noteA, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteB, note4_8

	mus_octave oct2
	mus_note noteD, note16
	mus_note noteC#, note16
	mus_note noteD, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteA, note8
	mus_note noteRst, note8

	mus_octave oct2
	mus_note noteD#, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteG#, note8
	mus_note noteRst, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteRst, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteRst, note8

	mus_octave oct1
	mus_note noteA, note8

	mus_octave oct2
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_jump 0, branch_9E9E
	mus_end
	; 9F07

Routes2_md_4: ;9F08 - 9FAC
	; 9F08
	mus_vel 11, 1
	mus_note noteC, note4
	mus_note noteRst, note8
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteRst, note4_16
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	db $D8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_vel 11, 0
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	db $D8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_vel 11, 0
	mus_note noteC, note4
	mus_note noteRst, note4_16
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	db $D8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_vel 11, 0
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	db $D8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_vel 11, 0
	mus_note noteC, note4
	mus_note noteRst, note4_16
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note16
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteRst, note8
	db $D8
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8
	mus_note noteC, note4
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_note noteB, note8_16
	mus_note noteC, note4
	mus_note noteRst, note8_16
	mus_jump 0, Routes2_md_4
	mus_end
	; 9FAC

;Routes 3, 4, 5, 6, 7, 8, 9, 10, 16, 17, 18, 19, 20, 21, 22
Routes3_md_1: ;9FAD - A008
	; 9FAD
	mus_tempo 0, 148
	mus_volume 119
	mus_duty duty75
	mus_mod 6, 3, 4
	db $E8
	mus_vel 11, 5

	mus_octave oct2
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteG, note4_8
	mus_note noteF, note16
	mus_note noteG, note16
	mus_note noteE, note16
	mus_note noteRst, note1
	mus_note noteRst, note2_4_8_16

branch_9FC3:
	mus_vel 11, 5
	mus_note noteE, note4_8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteC, note4
	mus_note noteE, note4
	mus_note noteC, note4_8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF, note8
	mus_note noteG, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_vel 10, 7
	mus_note noteA#, note2
	mus_note noteF, note2
	mus_note noteD, note2
	mus_note noteF, note2
	mus_vel 11, 5
	mus_note noteE, note4_8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteC, note4
	mus_note noteE, note4
	mus_note noteC, note4_8
	mus_note noteD, note16
	mus_note noteE, note16
	mus_note noteF, note8
	mus_note noteG, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_vel 10, 7
	mus_note noteA#, note2
	mus_note noteA#, note2
	mus_note noteD, note2
	mus_note noteF, note2
	mus_vel 11, 5
	mus_note noteE, note4
	mus_note noteE, note8
	mus_note noteF, note8
	mus_note noteG, note4
	mus_note noteF, note8
	mus_note noteE, note8
	mus_note noteB, note8

	mus_octave oct1
	mus_note noteG, note4

	mus_octave oct2
	mus_note noteB, note2
	mus_note noteA, note8
	db $D8
	mus_note noteRst, note4
	mus_note noteA, note4
	mus_note noteF, note4
	mus_note noteA, note4
	db $D8
	mus_note noteE, note1
	mus_note noteA, note2_4
	db $D8
	mus_note noteA, note16
	mus_note noteF, note2_4
	mus_note noteG, note2_4
	mus_jump 0, branch_9FC3
	;A008
	;No end byte until indigo plateu channel 1

Routes3_md_2: ;A009 - A07E
	; A009
	mus_mod 8, 2, 3
	mus_duty duty50
	mus_vel 12, 7

	mus_octave oct2
	mus_note noteG, note16
	mus_note noteA#, note16
	mus_note noteB, note4_8
	mus_note noteA, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteC, note16
	mus_note noteRst, note2_4_8_16
	mus_note noteRst, note1

branch_A01A:
	mus_vel 12, 7
	mus_duty duty50

	mus_octave oct3
	mus_note noteC, note4_8

	mus_octave oct2
	mus_note noteG, note16

	mus_octave oct3
	mus_note noteC, note16
	mus_note noteE, note2_8

	mus_octave oct2
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteC, note8
	mus_note noteG, note8
	mus_note noteF, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteC, note8
	mus_note noteD, note2
	mus_note noteF, note2
	mus_vel 12, 5
	mus_duty duty75

	mus_octave oct2
	mus_note noteA#, note2
	mus_note noteA, note2
	mus_vel 12, 7
	mus_duty duty50

	mus_octave oct3
	mus_note noteC, note4_8

	mus_octave oct2
	mus_note noteG, note16

	mus_octave oct3
	mus_note noteC, note16
	mus_note noteE, note2_8

	mus_octave oct2
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteC, note8
	mus_note noteG, note8
	mus_note noteF, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteC, note8
	mus_note noteD, note2
	mus_note noteF, note2
	mus_vel 12, 5
	mus_duty duty75

	mus_octave oct2
	mus_note noteA#, note2

	mus_octave oct3
	mus_note noteD, note4_8
	mus_vel 12, 7
	mus_duty duty50
	mus_note noteC, note16
	mus_note noteD, note16
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteE, note8
	mus_note noteC, note2

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteC, note16
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteG, note4

	mus_octave oct3
	mus_note noteG, note2
	mus_note noteF, note16
	mus_note noteE, note16
	db $D8
	db $D3
	mus_note noteF, note4
	mus_note noteE, note4
	db $D8
	mus_note noteRst, note4_16
	mus_note noteC, note4
	db $D8
	mus_note noteRst, note4_8
	mus_note noteC, note2_4
	mus_vel 10, 0
	mus_duty duty75

	mus_octave oct2
	mus_note noteA, note2
	mus_note noteB, note2
	mus_jump 0, branch_A01A
	; A07E
	;No end byte until indigo plateu channel 1

Routes3_md_3: ;A07F - A130
	; A07F
	mus_mod 4, 1, 0
	db $D6
	mus_note noteC#, note8_16

	mus_octave oct3
	mus_note noteG, note8
	mus_note noteA#, note8
	mus_note noteB, note2
	mus_note noteA, note2
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note4_8_16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note2
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note4_8_16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note8
	mus_note noteRst, note8
	mus_note noteG, note2
	
branch_A0A3:
	mus_vel 1, 2
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note8
	mus_note noteF, note8
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note4
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note4
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA#, note8
	mus_note noteA, note8
	mus_note noteG, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC, note4

	mus_octave oct3
	mus_note noteG, note16
	mus_note noteG, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC, note4

	mus_octave oct3
	mus_note noteG, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteD, note4

	mus_octave oct3
	mus_note noteG, note16
	mus_note noteG, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteD, note4

	mus_octave oct3
	mus_note noteF, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC, note4

	mus_octave oct3
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC, note4

	mus_octave oct3
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA, note4
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteF, note16
	mus_note noteRst, note16
	mus_note noteA, note4
	mus_jump 0, branch_A0A3
	; A130
	;No end byte until indigo plateu channel 1

Routes3_md_4: ;A131 -A269
	; A131
	db $D6
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16

branch_A17A:
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2_8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2_8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2_8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note2_4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_jump 0, branch_A17A
	; A269
	;No end byte until indigo plateu channel 1

;Routes 11, 12, 13, 14, 15
Routes4_md_1: ;a26a - a303
	; A26A
	mus_tempo 0, 148
	mus_volume 119
	mus_duty duty75
	mus_mod 10, 3, 4
	db $E8
	mus_vel 10, 2

	mus_octave oct1
	mus_note noteG#, note4
	mus_note noteG#, note4
	mus_note noteG#, note4
	mus_vel 7, 15
	mus_note noteG#, note4
	mus_vel 10, 2
	mus_note noteG#, note4
	mus_note noteG#, note4
	mus_note noteG#, note4
	mus_vel 11, 7
	mus_note noteB, note16

	mus_octave oct2
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteB, note16

branch_A28A:
	mus_vel 11, 7
	mus_note noteB, note4_8
	mus_note noteE, note8
	mus_note noteE, note4

	mus_octave oct3
	mus_note noteE, note4
	mus_note noteD, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note4
	mus_vel 11, 1
	mus_note noteG#, note8_16
	mus_vel 11, 7
	mus_note noteE, note16
	mus_note noteF#, note2_4
	mus_note noteE, note2
	mus_note noteD#, note4
	mus_note noteF#, note4
	mus_note noteB, note4_8
	mus_note noteE, note8
	mus_note noteE, note4

	mus_octave oct3
	mus_note noteE, note4
	mus_note noteD, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC#, note4
	mus_vel 11, 1
	mus_note noteE, note8_16
	mus_vel 11, 7
	mus_note noteD#, note16
	mus_note noteE, note2_4

	mus_octave oct2
	mus_note noteB, note8_16
	mus_note noteA, note16
	mus_note noteG#, note2

	mus_octave oct3
	mus_note noteE, note4

	mus_octave oct2
	mus_note noteD, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteD, note8
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteD#, note8
	mus_note noteE, note8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteB, note8
	db $D8
	mus_note noteB, note4_8
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note4

	mus_octave oct3
	mus_note noteE, note4
	mus_note noteD#, note4
	mus_note noteC#, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC#, note4
	mus_note noteD#, note4

	mus_octave oct2
	mus_note noteE, note8_16
	mus_note noteF#, note8_16
	mus_note noteG#, note8_16
	mus_note noteA, note8_16
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC#, note4
	mus_note noteD#, note4
	mus_note noteE, note8_16

	mus_octave oct2
	mus_note noteB, note8_16
	mus_note noteG#, note8_16
	mus_note noteF#, note8_16
	mus_note noteE, note8_16
	mus_note noteF#, note8_16
	mus_note noteG#, note8_16
	mus_note noteA, note8_16
	mus_jump 0, branch_A28A
	; A303
	;No end byte until indigo plateu channel 1

Routes4_md_2: ;a304 - a3c3
	; a304
	mus_mod 12, 2, 4
	mus_duty duty25
	mus_vel 9, 2

	mus_octave oct2
	mus_note noteE, note8_16
	mus_note noteF#, note16
	mus_vel 9, 0
	mus_note noteE, note2_4
	mus_vel 9, 2

	mus_octave oct1
	mus_note noteB, note8_16

	mus_octave oct2
	mus_note noteC, note16
	mus_vel 9, 0

	mus_octave oct1
	mus_note noteB, note2
	mus_duty duty75
	mus_vel 12, 7

	mus_octave oct2
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteD#, note16

branch_A325:
	mus_vel 12, 7
	mus_note noteE, note4_8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note4
	mus_note noteF#, note16
	mus_note noteA, note16
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_vel 12, 2
	mus_note noteG#, note8_16
	mus_note noteE, note16
	mus_vel 10, 0

	mus_octave oct2
	mus_note noteB, note2_4
	mus_duty duty12_5
	mus_vel 12, 2

	mus_octave oct1
	mus_note noteB, note8_16
	mus_vel 12, 7

	mus_octave oct2
	mus_note noteC, note16

	mus_octave oct1
	mus_note noteB, note2

	mus_octave oct2
	mus_note noteD#, note4
	mus_duty duty75

	mus_octave oct3
	mus_note noteE, note4_8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note4
	mus_note noteA, note16

	mus_octave oct4
	mus_note noteC#, note16

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteA, note16
	mus_vel 12, 2
	mus_note noteB, note8_16
	mus_vel 12, 7
	mus_note noteA, note16
	mus_vel 11, 0
	mus_note noteG#, note4_8
	mus_vel 9, 0
	mus_note noteG#, note4_8
	mus_vel 7, 0
	mus_note noteG#, note4_8
	mus_vel 6, 15
	mus_note noteG#, note4_8
	mus_vel 12, 7
	mus_note noteG#, note4
	db $D8
	mus_note noteRst, note4
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note4
	db $D8
	mus_note noteA, note16
	mus_note noteF#, note4_8
	db $D8
	mus_note noteG, note1
	mus_note noteF#, note4_8
	mus_duty duty12_5
	db $D8
	mus_note noteA, note16

	mus_octave oct2
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteF#, note4
	mus_note noteA, note4_8
	mus_duty duty75
	db $D8
	mus_note noteRst, note2

	mus_octave oct3
	mus_note noteF#, note4_8
	mus_note noteG#, note4
	mus_note noteF#, note4
	db $D8
	mus_note noteRst, note4_16
	mus_note noteE, note4
	db $D8
	mus_note noteA#, note16
	mus_note noteE, note2_4
	mus_duty duty12_5
	db $D8
	mus_note noteA, note16

	mus_octave oct2
	mus_note noteE, note4
	mus_note noteD#, note4
	mus_note noteE, note4
	mus_note noteG#, note4_8
	mus_duty duty75
	db $D8
	mus_note noteRst, note2

	mus_octave oct3
	mus_note noteE, note4_8
	mus_note noteF#, note4
	mus_note noteD#, note4

	mus_octave oct2
	mus_note noteB, note4
	db $D8
	mus_note noteA#, note16

	mus_octave oct3
	mus_note noteB, note1
	db $D8
	mus_note noteA#, note2
	mus_note noteB, note2
	db $D8
	mus_note noteB, note16
	mus_note noteA, note4_8
	db $D8
	mus_note noteB, note2
	mus_note noteA, note4_8
	mus_vel 10, 7
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_vel 11, 0
	mus_note noteE, note2_4
	mus_vel 10, 0
	mus_note noteE, note2
	mus_vel 10, 7
	mus_note noteE, note2_8
	mus_jump 0, branch_A325
	; A3C3
	;No end byte until indigo plateu channel 1

Routes4_md_3: ;a3c4 - a49c
; A3C4
	mus_vel 1, 0

	mus_octave oct3
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteD#, note16
	mus_note noteRst, note8_16
	
branch_A3D7:
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note8_16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note8_16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteD, note16
	mus_note noteRst, note8_16
	mus_note noteD, note16
	mus_note noteD, note16
	mus_note noteD, note16
	mus_note noteD, note16
	mus_note noteD, note16
	mus_note noteRst, note16
	mus_note noteD, note16
	mus_note noteRst, note8_16
	mus_note noteD, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note8_16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note8_16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note8_16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_jump 0, branch_A3D7
	; A49C
	;No end byte until indigo plateu channel 1

Routes4_md_4: ;a49d - a5ef
	; A49D
	mus_vel 12, 15
	mus_note noteRst, note2_4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16

branch_A4A8:
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_jump 0, branch_A4A8
	; A5EF
	;No end byte until indigo plateu channel 1

;Indigo Plateau
IndigoPlateau_md_1: ;a5f0 - a663
	mus_tempo 0, 132
	mus_volume 119
	mus_duty duty75
	mus_mod 6, 3, 4
	db $E8
	mus_vel 11, 2

	mus_octave oct1
	mus_note noteA, note2
	mus_note noteA, note2
	mus_note noteA, note2
	mus_note noteA, note4
	mus_vel 10, 4
	mus_note noteA#, note4
	
branch_a605:
	mus_call branch_a659
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteD, note4
	mus_call branch_a659
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteD#, note4
	mus_call branch_a659
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteD, note4
	mus_call branch_a659
	mus_vel 10, 0

	mus_octave oct1
	mus_note noteA#, note4
	mus_call branch_a659
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteD, note4
	mus_vel 13, 4

	mus_octave oct2
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteD#, note4
	mus_vel 13, 4

	mus_octave oct2
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_note noteA#, note4
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteF, note8
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteG, note8
	mus_vel 11, 0
	mus_note noteA, note2

	mus_octave oct1
	mus_note noteA, note2
	mus_vel 11, 7

	mus_octave oct2
	mus_note noteF, note2
	mus_vel 4, 14

	mus_octave oct1
	mus_note noteA#, note2
	mus_jump 0, branch_a605
	
branch_a659:
	mus_vel 11, 2

	mus_octave oct1
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_note noteA, note4
	mus_end
	; A663

IndigoPlateau_md_2: ;a664 - a6b9
; A664
	mus_duty duty75
	mus_mod 8, 2, 5
	mus_vel 12, 2

	mus_octave oct2
	mus_note noteD, note2
	mus_note noteD, note2
	mus_note noteD, note2
	mus_note noteD, note4
	mus_vel 5, 10
	mus_note noteD#, note4
	
branch_a673:
	mus_call branch_a6af
	mus_vel 12, 5
	mus_note noteA, note4
	mus_call branch_a6af
	mus_vel 12, 5
	mus_note noteA#, note4
	mus_call branch_a6af
	mus_vel 12, 5
	mus_note noteA, note4
	mus_call branch_a6af
	mus_vel 12, 7
	mus_note noteC#, note4
	mus_call branch_a6af
	mus_vel 12, 5
	mus_note noteA, note4
	mus_call branch_a6af
	mus_vel 12, 5
	mus_note noteA#, note4
	mus_call branch_a6af
	mus_vel 12, 5

	mus_octave oct3
	mus_note noteC, note8
	mus_vel 12, 7

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteD, note2

	mus_octave oct2
	mus_note noteD, note2

	mus_octave oct3
	mus_note noteC, note2
	mus_vel 4, 13

	mus_octave oct3
	mus_note noteD#, note2
	mus_jump 0, branch_a673
	
branch_a6af:
	mus_vel 12, 2

	mus_octave oct2
	mus_note noteD, note4
	mus_note noteD, note4
	mus_note noteD, note4
	mus_note noteD, note4
	mus_note noteD, note4
	mus_note noteD, note4
	mus_note noteD, note4
	mus_end
	; A6B9

IndigoPlateau_md_3: ;a6ba - a70e
	; A6BA
	mus_vel 1, 0

	mus_octave oct3
	mus_note noteD, note8
	mus_note noteRst, note4_8
	mus_note noteD, note8
	mus_note noteRst, note4_8
	mus_note noteD, note8
	mus_note noteRst, note4_8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD#, note4
	
branch_a6c6:
	mus_call branch_a6fe
	mus_call branch_a6fe
	mus_call branch_a6fe
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteF#, note4
	mus_call branch_a6fe
	mus_call branch_a6fe
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteA#, note16
	mus_note noteRst, note16
	mus_note noteA#, note16
	mus_note noteRst, note16
	mus_note noteA, note2
	mus_note noteD, note2
	mus_note noteA#, note2
	mus_note noteD#, note2
	mus_jump 0, branch_a6c6

	
branch_a6fe:
	mus_octave oct3
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteD, note8
	mus_note noteRst, note8
	mus_note noteA, note4
	mus_end
	; A70E

IndigoPlateau_md_4: ;a70f - a7c4
	; A70F
	
;piece 1
	db $D6
	mus_note noteB, note1
	mus_note noteC#, note8
	mus_note noteB, note1
	mus_note noteC#, note8
	mus_note noteB, note1
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	
branch_a728:
	mus_call branch_a791
	mus_call branch_a77e
	mus_call branch_a791
	mus_call branch_a7a8
	mus_call branch_a791
	mus_call branch_a77e
	mus_call branch_a791
	mus_call branch_a7a8
	mus_call branch_a791
	mus_call branch_a77e
	mus_call branch_a791
	mus_call branch_a7a8
	mus_call branch_a77e
	mus_call branch_a7a8
	mus_note noteB, note1
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8
	mus_note noteB, note2
	mus_note noteC#, note8_16
	mus_note noteB, note1
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8
	mus_jump 0, branch_a728

branch_a77e:
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note4
	mus_note noteB, note8
	mus_note noteC#, note4
	mus_note noteB, note8
	mus_note noteC#, note8_16
	mus_end
	; A790

;piece 2
branch_a791:
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_end
	; A7A7

;piece 3
branch_a7a8:
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8_16
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_end
	; A7C4

;Pallet Town
PalletTown_md_1: ; a7c5 - a85e (154 bytes)
	; A7C5
	mus_tempo 0, 160
	mus_volume 119
	mus_duty duty50
	mus_vel 12, 3

branch_a7ce:
	mus_octave oct2
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC, note8
	mus_note noteD, note4
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteD, note4
	mus_note noteD, note8
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC, note2
	mus_note noteRst, note8

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteB, note4

	mus_octave oct3
	mus_note noteC, note8
	mus_note noteD, note4
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteD, note4
	mus_note noteD, note8
	mus_note noteG, note8
	mus_note noteF#, note8
	mus_note noteE, note4
	mus_note noteD, note8
	mus_note noteC, note4

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC, note8
	mus_note noteD, note8
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG, note4
	mus_note noteF#, note4

	mus_octave oct3
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteG, note8
	mus_note noteE, note8
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_vel 11, 3
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteG, note8
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteC, note8

	mus_octave oct2
	mus_note noteG, note8
	mus_note noteE, note8
	mus_note noteG, note8

	mus_octave oct3
	mus_note noteD, note8

	mus_octave oct2
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteG, note8
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteD, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteD, note8
	mus_note noteC, note8
	mus_note noteD, note8
	mus_note noteG, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteG, note8
	mus_note noteE, note8
	mus_note noteC, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteD, note8
	mus_note noteC, note8
	mus_note noteD, note8
	mus_jump 0, branch_a7ce
	mus_end
	; A85E

PalletTown_md_2: ; a85f - a8dd (127 bytes)
	; A85F
	mus_duty duty50

branch_a861:
	mus_vel 13, 3

	mus_octave oct4
	mus_note noteD, note8
	mus_vel 10, 3
	mus_note noteC, note8
	mus_vel 13, 3

	mus_octave oct3
	mus_note noteB, note8
	mus_vel 11, 3
	mus_note noteA, note8
	mus_vel 13, 3

	mus_octave oct4
	mus_note noteG, note8
	mus_vel 11, 3
	mus_note noteE, note8
	mus_vel 13, 3
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD, note4_8

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteG, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC, note2_8

	mus_octave oct3
	mus_note noteF#, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteB, note4_8

	mus_octave oct4
	mus_note noteC, note16

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteA, note2

	mus_octave oct4
	mus_note noteD, note8
	mus_vel 10, 3
	mus_note noteC, note8
	mus_vel 13, 3

	mus_octave oct3
	mus_note noteB, note8
	mus_vel 11, 3

	mus_octave oct4
	mus_note noteD, note8
	mus_vel 13, 3
	mus_note noteG, note8
	mus_vel 10, 3
	mus_note noteF#, note8
	mus_vel 11, 3
	mus_note noteF#, note8
	mus_vel 13, 3
	mus_note noteG, note8
	mus_note noteE, note4_8
	mus_note noteD, note8
	mus_note noteD, note2
	mus_note noteC, note8

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG, note8

	mus_octave oct4
	mus_note noteD, note8
	mus_note noteC, note8

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG, note2_8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC, note2
	mus_note noteD, note4_8
	mus_note noteC, note8

	mus_octave oct3
	mus_note noteB, note2
	mus_note noteRst, note8
	mus_note noteG, note8
	mus_note noteA, note8
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC, note4
	mus_note noteC, note4
	mus_note noteD, note4_8
	mus_note noteC, note16
	mus_note noteD, note16

	mus_octave oct3
	mus_note noteB, note2
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG, note8
	mus_note noteA, note2
	mus_note noteE, note4
	mus_note noteB, note4
	mus_note noteA, note2
	mus_note noteG, note4
	mus_note noteE, note4
	mus_note noteF#, note2
	mus_note noteG, note4
	mus_note noteB, note4
	mus_note noteB, note2
	mus_note noteA, note2
	mus_jump 0, branch_a861
	mus_end
	; A8DD

PalletTown_md_3: ; a8de - aa75 (408 bytes)
;INCBIN "baserom.gbc",$a8de,$aa76 - $a8de

	; A8DE
	mus_mod 24, 2, 8
	mus_vel 1, 2

branch_a8e3:
	mus_octave oct3
	mus_note noteG, note4_8
	mus_note noteE, note4_8
	mus_note noteF#, note4
	mus_note noteG, note4_8
	mus_note noteA, note4_8
	mus_note noteG, note4
	mus_note noteE, note4_8
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteG, note4_8
	mus_note noteE, note4_8
	mus_note noteD, note4
	mus_note noteG, note4_8
	mus_note noteE, note4_8
	mus_note noteF#, note4
	mus_note noteG, note4_8
	mus_note noteA, note4_8
	mus_note noteG, note4
	mus_note noteE, note4_8
	mus_note noteF#, note4_8
	mus_note noteA, note4
	mus_note noteG, note4_8
	mus_note noteE, note4_8
	mus_note noteD, note4
	mus_note noteC, note2
	mus_note noteD, note2
	mus_note noteG, note2
	mus_note noteE, note4
	mus_note noteD, note4
	mus_note noteC, note2
	mus_note noteD, note2
	mus_note noteG, note2
	mus_note noteA, note4
	mus_note noteG, note4
	mus_note noteE, note2
	mus_note noteA, note2
	mus_note noteE, note2
	mus_note noteG, note2
	mus_note noteF#, note2
	mus_note noteE, note2
	mus_note noteE, note2
	mus_note noteF#, note2
	mus_jump 0, branch_a8e3
	mus_end
	; A912

	mus_tempo 0, 144
	mus_volume 119
	mus_mod 5, 1, 6
	
branch_a91b:
	mus_vel 1, 0

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note4
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteD#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16

	mus_octave oct5
	mus_note noteD#, note16
	mus_note noteRst, note2
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteC#, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteC#, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteD#, note4
	mus_note noteC#, note4
	mus_note noteD#, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note2
	mus_note noteD#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16

	mus_octave oct5
	mus_note noteD#, note16
	mus_note noteRst, note4

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteC#, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteRst, note8
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteF#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteD#, note8
	mus_note noteRst, note8_16

	mus_octave oct4
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note2
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8
	mus_note noteRst, note8

	mus_octave oct4
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteD#, note8
	mus_note noteE, note2
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteC#, note8
	mus_note noteD#, note8

	mus_octave oct4
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteA#, note16
	mus_note noteB, note16
	mus_note noteRst, note4
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteB, note8
	mus_note noteA#, note8
	mus_note noteB, note8

	mus_octave oct5
	mus_note noteC, note16
	mus_note noteC#, note16
	mus_note noteRst, note2

	mus_octave oct4
	mus_note noteF#, note8
	mus_note noteF, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8

	mus_octave oct5
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteRst, note4_8
	mus_note noteB, note8
	mus_note noteRst, note4_8
	mus_jump 0, branch_a91b
	mus_end
	; A9CE
	
	; A9CF
	mus_tempo 0, 144
	mus_volume 119
	db $E8
	mus_mod 6, 1, 5
	
branch_a9d8:
	mus_vel 1, 0

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteG#, note16
	mus_note noteRst, note2
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_note noteRst, note4

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteRst, note8
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteRst, note8
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteF#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteD#, note8
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteG#, note16
	mus_note noteRst, note4
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_note noteRst, note2
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteRst, note8
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_note noteD#, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteRst, note8
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteF#, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note8
	mus_note noteRst, note16
	mus_note noteC#, note8
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteRst, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteD#, note2
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteRst, note8

	mus_octave oct5
	mus_note noteC#, note8
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteC#, note2
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct4
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteG#, note16
	mus_note noteF#, note16
	mus_note noteRst, note2
	mus_note noteB, note8
	mus_note noteA#, note8
	mus_note noteB, note8
	mus_note noteA, note16
	mus_note noteG#, note16
	mus_note noteRst, note4
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteF, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteRst, note4_8
	mus_note noteD#, note8
	mus_note noteRst, note4_8
	mus_jump 0, branch_a9d8
	mus_end
	; AA6E
	
	; AA6F
	mus_tempo 0, 232
	mus_jump 0, branch_aa79
	; AA75
	
;Viridian City, Pewter City, Saffron City
Cities1_md_1: ;AA76 - AB91
	; AA76
	mus_tempo 0, 144
	
branch_aa79:
	mus_volume 119
	mus_mod 8, 2, 4
	mus_duty duty75
branch_aa80:
	mus_vel 12, 5

	mus_octave oct2
	mus_note noteG#, note4
	mus_note noteF#, note4
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_note noteD#, note4
	mus_note noteE, note8
	mus_note noteD#, note4
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_note noteE, note4
	mus_vel 10, 5
	mus_note noteC#, note4

	mus_octave oct1
	mus_note noteB, note4_8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteC#, note4

	mus_octave oct1
	mus_note noteB, note4
	mus_vel 12, 5
	mus_call branch_ab7d

	mus_octave oct2
	mus_note noteD#, note4_8
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note4
	mus_vel 10, 5

	mus_octave oct2
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note8
	mus_note noteA, note4
	mus_note noteB, note4
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_vel 12, 5
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteE, note4
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_note noteD#, note4
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_note noteE, note4
	mus_vel 10, 5
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteA, note8
	mus_note noteB, note4_8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note8
	mus_note noteB, note4
	mus_vel 12, 5
	mus_call branch_ab7d

	mus_octave oct2
	mus_note noteD#, note4
	mus_note noteD#, note8
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteG#, note8
	mus_note noteE, note4

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_vel 10, 5
	mus_note noteC#, note4

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD#, note4
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_vel 11, 3
	mus_call branch_ab8a
	mus_note noteA, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteF#, note4
	mus_note noteG#, note8
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note4
	mus_note noteG#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
branch_ab12:
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct1
	mus_note noteB, note4
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_jump 2, branch_ab12
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteE, note4

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteG#, note8
	mus_note noteG#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteF#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_call branch_ab8a
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteA, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteC#, note8
	mus_note noteG#, note8
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteE, note4
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteD#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteD#, note8
	mus_note noteF#, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteE, note8

	mus_octave oct1
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD#, note8

	mus_octave oct1
	mus_note noteB, note8
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteD#, note8
	mus_vel 11, 6
	mus_note noteF#, note2
	mus_note noteF#, note4
	mus_note noteD#, note4
	mus_note noteE, note2
	mus_vel 8, 4

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_jump 0, branch_aa80

branch_ab7d:
	mus_octave oct2
	mus_note noteF#, note8
	mus_note noteD#, note4
	mus_note noteE, note8
	mus_note noteD#, note4
	mus_note noteC#, note4

	mus_octave oct1
	mus_note noteB, note4

	mus_octave oct2
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteC#, note8
	mus_end
	; AB89

	; AB8A
branch_ab8a:
	mus_note noteA, note8
	mus_note noteE, note8
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_note noteA, note8
	mus_note noteC#, note8
	mus_note noteE, note8
	mus_end
	; AB91

Cities1_md_2: ;AB92 - AC02
	; AB92
	mus_mod 5, 1, 5
	mus_call branch_ac00

	mus_octave oct3
	mus_note noteG#, note8
	mus_vel 12, 4
	mus_note noteE, note4_8
	mus_vel 12, 5
	mus_duty duty75

	mus_octave oct2
	mus_note noteC#, note4
	mus_note noteD#, note4
	mus_note noteE, note4_8
	mus_note noteF#, note4_8
	mus_note noteG#, note4
	mus_call branch_ac00

	mus_octave oct3
	mus_note noteG#, note8
	mus_vel 12, 4
	mus_note noteE, note2_4_8
	mus_duty duty75

	mus_octave oct2
	mus_note noteE, note4_8
	mus_note noteF#, note4_8
	mus_note noteG#, note4
	mus_vel 11, 7
	mus_duty duty50
	mus_mod 8, 1, 7

	mus_octave oct4
	mus_note noteC#, note2_4

	mus_octave oct3
	mus_note noteA, note4

	mus_octave oct4
	mus_note noteE, note2
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note8
	mus_note noteC#, note8

	mus_octave oct3
	mus_note noteB, note2_4
	mus_note noteG#, note4
	mus_note noteB, note1
	mus_note noteF#, note2_4
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note4
	mus_note noteG#, note2_4
	mus_note noteE, note4
	mus_note noteB, note1

	mus_octave oct4
	mus_note noteC#, note2_4
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteD#, note4
	mus_note noteC#, note4

	mus_octave oct3
	mus_note noteB, note2_4

	mus_octave oct4
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteC#, note4

	mus_octave oct3
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteA, note2_4
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC, note8
	mus_note noteC, note4

	mus_octave oct3
	mus_note noteB, note4
	mus_note noteA, note4
	mus_note noteF#, note4
	mus_vel 11, 7
	mus_note noteA, note2

	mus_octave oct4
	mus_note noteC, note2

	mus_octave oct3
	mus_note noteB, note2_4_8
	mus_vel 8, 4
	mus_note noteG#, note16
	mus_vel 10, 4
	mus_note noteA, note16
	mus_jump 0, Cities1_md_2
	
branch_ac00:
	mus_duty duty50
	mus_vel 12, 3

	mus_octave oct3
	mus_note noteB, note4
	mus_note noteA, note4
	mus_vel 12, 4
	mus_note noteG#, note2_8
	mus_vel 12, 3
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteB, note4
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_vel 12, 4
	mus_note noteF#, note2_8
	mus_vel 12, 5
	mus_duty duty75

	mus_octave oct2
	mus_note noteE, note4
	mus_note noteD#, note2
	mus_note noteE, note4
	mus_note noteF#, note4
	mus_vel 12, 3
	mus_duty duty50

	mus_octave oct3
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_vel 12, 4
	mus_note noteF#, note2_8
	mus_vel 12, 3
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_end
	; AC31

Cities1_md_3: ;AC32 - ACEE --AC7F
	; AC32
	mus_vel 1, 1
	db $E8
	
branch_ac35:
	mus_mod 0, 0, 0

	mus_octave oct3
	mus_call branch_acc5
	mus_call branch_acc5
	mus_call branch_acce
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_call branch_acc5
	mus_note noteB, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_call branch_acc5
	mus_call branch_acce
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteB, note8
	mus_note noteE, note8
	mus_mod 8, 2, 5
	mus_note noteA, note2
	mus_note noteE, note2
	mus_note noteA, note2
	mus_note noteF#, note2
	mus_note noteG#, note2
	mus_note noteE, note2
	mus_note noteG#, note2_4
	mus_note noteE, note4
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteF#, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteA, note2
	mus_note noteE, note2
	mus_note noteA, note2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteG#, note2
	mus_note noteE, note2
	mus_note noteB, note4
	mus_note noteE, note4
	mus_note noteF#, note4
	mus_note noteG#, note4
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteA, note4
	mus_note noteG#, note4
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note16
	mus_note noteG#, note16
	mus_note noteE, note16
	mus_note noteF#, note16
	mus_note noteG#, note4
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_jump 0, branch_ac35

branch_acc5:
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteRst, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_end
	; ACCD

	; ACCE
branch_acce:
	mus_note noteA, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteRst, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteD#, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteRst, note8
	mus_note noteD#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_end
	; ACEE

Cities1_md_4: ;ACEF - ADAD
	; ACEF
	mus_vel 15, 13
	mus_note noteD#, note4_8_16
	mus_note noteF#, note2_4_8
	
branch_acf3:
	mus_call branch_ad36
	mus_call branch_ad45
	mus_call branch_ad45
	mus_jump 2, branch_acf3
	mus_call branch_ad36
	mus_call branch_ad5f
	mus_call branch_ad52
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4
	mus_note noteC, note2
	mus_call branch_ad6e
	mus_call branch_ad5f
	mus_call branch_ad52
	mus_call branch_ad6e
	mus_call branch_ad52
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note8
	mus_note noteC, note2
	mus_note noteB, note8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4
	mus_note noteC, note2_16
	mus_jump 0, Cities1_md_4
	
branch_ad36:
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note8
	mus_note noteC, note2_16
	mus_note noteB, note8
	mus_note noteC, note2_16
	mus_end
	; AD44

	; AD45
branch_ad45:
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4_8
	mus_note noteC, note2_16
	mus_note noteB, note4
	mus_note noteC, note2_16
	mus_end
	; AD51

	; AD52
branch_ad52:
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4
	mus_note noteC, note2
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4
	mus_note noteC, note2
	mus_end
	; AD5E

	; AD5F
branch_ad5f:
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4
	mus_note noteC, note2
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note8
	mus_note noteC, note2
	mus_note noteB, note8
	mus_note noteC, note4_8_16
	mus_end
	; AD6D

	; AD6E
branch_ad6e:
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note4_8
	mus_note noteC, note4_8_16
	mus_note noteB, note8
	mus_note noteC, note2
	mus_note noteB, note8
	mus_note noteC, note2
	mus_end
	; AD76

	; AD77
branch_ad77:
	db $F8
	mus_tempo 1, 0
	mus_volume 119
	mus_mod 6, 2, 6
	mus_duty duty50
	db $E8
	db $D4
	mus_note noteB, note8

	mus_octave oct2
	mus_note noteG#, note8
	mus_note noteG#, note8
	mus_note noteG#, note8
	mus_vel 11, 3

	mus_octave oct3
	mus_note noteE, note4
	mus_end
	; AD8D

	; AD8E
branch_ad8e:
	db $F8
	mus_mod 8, 2, 7
	mus_duty duty50
	db $D4
	mus_note noteRst, note8

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteE, note8
	mus_note noteE, note8
	mus_vel 12, 3
	mus_note noteB, note4
	mus_end
	; AD9D

	; AD9E
branch_ad9e:
	db $F8
	db $D4
	mus_note noteC#, note16

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_vel 1, 0

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteRst, note8
	mus_end
	; ADAD

;Guy walks you to museum
MuseumGuy_md_1: ;ADAE - ADF0
	; ADAE
	mus_tempo 0, 128
	mus_volume 119
	mus_duty duty50
	db $E8
	mus_vel 11, 1

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteF#, note8
	mus_note noteE, note8
	mus_note noteD#, note8

	mus_octave oct1
	mus_note noteB, note4
	mus_note noteB, note16

	mus_octave oct2
	mus_note noteD#, note16
	mus_note noteE, note16
	mus_note noteG#, note16
	mus_note noteB, note2_8
	mus_call branch_ade7
	mus_call branch_adec
	mus_call branch_ade7
	mus_note noteE, note4
	mus_note noteE, note4
	mus_note noteE, note8
	mus_note noteE, note4_8
	
branch_add6:
	mus_call branch_ade7
	mus_call branch_adec
	mus_call branch_ade7
	mus_note noteE, note4
	mus_note noteE, note4
	mus_note noteE, note8
	mus_note noteE, note4_8
	mus_jump 0, branch_add6
	
branch_ade7:
	mus_note noteE, note8
	mus_note noteE, note4_8
	mus_note noteF#, note8
	mus_note noteF#, note4_8
	mus_end
	; ADEB

	; ADEC
branch_adec:
	mus_note noteE, note8
	mus_note noteE, note4_8
	mus_note noteD, note8
	mus_note noteD, note4_8
	mus_end
	; ADF0

MuseumGuy_md_2: ;ADF1 - AE6D
	; ADF1
	mus_duty duty50
	mus_vel 12, 1

	mus_octave oct3
	mus_note noteE, note8
	mus_note noteD, note8
	mus_note noteC#, note8
	mus_note noteD, note8
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteE, note4
	mus_note noteE, note16
	mus_note noteG#, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteD#, note16
	mus_note noteE, note2

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteA, note4

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_note noteD, note8
	mus_note noteC#, note8

	mus_octave oct2
	mus_note noteB, note4
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteE, note8
	mus_note noteF#, note8
	mus_note noteG#, note8
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteA, note4

branch_ae26:
	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note8_16
	mus_vel 8, 1
	mus_note noteE, note16
	mus_vel 12, 1
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteA, note8_16
	mus_vel 9, 1
	mus_note noteA, note16
	mus_vel 12, 1

	mus_octave oct2
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note4
	mus_note noteD, note16
	mus_note noteC#, note16
	mus_note noteC, note16

	mus_octave oct2
	mus_note noteB, note16
	mus_note noteB, note8_16
	mus_vel 10, 1
	mus_note noteG#, note16
	mus_vel 12, 1
	mus_note noteA, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteE, note8_16
	mus_vel 9, 1
	mus_note noteE, note16
	mus_vel 12, 1
	mus_note noteD, note8
	mus_note noteF#, note8
	mus_note noteA, note8_16
	mus_vel 8, 1
	mus_note noteA, note16
	mus_vel 12, 1
	mus_note noteG#, note8
	mus_note noteE, note16
	mus_vel 8, 1
	mus_note noteE, note16
	mus_vel 12, 1
	mus_note noteF#, note8
	mus_vel 8, 1
	mus_note noteF#, note16
	mus_vel 12, 1
	mus_note noteG#, note16
	mus_note noteA, note8
	mus_note noteA, note8
	mus_note noteA, note4
	mus_jump 0, branch_ae26
	; AE6D

MuseumGuy_md_3: ;AE6E - AED0
	; AE6E
	mus_vel 1, 0
	mus_note noteRst, note1

	mus_octave oct3
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note8_16
	mus_note noteE, note16
	mus_note noteRst, note2_16
	mus_call branch_aeb8
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note4_16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note4_16
	mus_call branch_aeb8
	mus_note noteB, note16
	mus_note noteRst, note8_16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note8_16
	
branch_ae8e:
	mus_call branch_aec1
	mus_note noteRst, note8_16

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note8_16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_call branch_aec1
	mus_note noteRst, note16

	mus_octave oct5
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteD, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note8_16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note8_16
	mus_jump 0, branch_ae8e
	
branch_aeb8:
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note4_16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note4_16
	mus_end
	; AEC0

	; AEC1
branch_aec1:
	mus_octave oct5
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note8_16

	mus_octave oct5
	mus_note noteF#, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_end
	; AED0

MuseumGuy_md_4: ;AED1 - AF58
	; AED1
	mus_vel 12, 15
	mus_note noteRst, note1
	mus_note noteRst, note1
	mus_note noteRst, note1
	mus_note noteRst, note1
	mus_note noteRst, note2_4_8
	db $D6
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	
branch_aee1:
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4_8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4_8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4_8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4_8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note4_8
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note4
	mus_note noteC#, note8
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note4
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_note noteB, note16
	mus_note noteC#, note8_16
	mus_jump 0, branch_aee1
	; AF58

;Meet Prof. Oak
MeetProfOak_md_1: ;AF59 - AFA8
	; AF59
	mus_tempo 0, 112
	mus_volume 119
	mus_duty duty75
	db $E8
	mus_vel 11, 4

	mus_octave oct2
	mus_note noteF#, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteD#, note16
	mus_note noteE, note16
	mus_note noteF#, note2_4
	mus_vel 10, 2

	mus_octave oct2
	mus_note noteE, note4_8
	mus_note noteB, note2_8
	mus_note noteE, note4_8
	mus_note noteB, note2_8
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	mus_note noteE, note4_8
	mus_note noteB, note2_8
	mus_note noteE, note4_8
	mus_note noteB, note2_8
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	
branch_af85:
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteA, note8
	mus_note noteA, note4
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteA, note8
	mus_note noteA, note4
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteG#, note8
	mus_note noteG#, note4
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteG#, note8
	mus_note noteG#, note4
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	mus_note noteE, note4_8
	mus_note noteD#, note4
	mus_note noteF#, note8
	mus_note noteF#, note4
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteG#, note8
	mus_note noteG#, note4
	mus_note noteF#, note4_8
	mus_note noteE, note4
	mus_note noteG#, note8
	mus_note noteG#, note4
	mus_jump 0, branch_af85
	; AFA8

MeetProfOak_md_2: ;AFA9 - B03D
	; AFA9
	mus_mod 8, 1, 1
	mus_duty duty50
	mus_vel 12, 4

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteD#, note16
	mus_note noteF#, note16
	mus_note noteA#, note16
	mus_note noteB, note2_4
	mus_vel 11, 2

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_vel 6, 4

	mus_octave oct3
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_vel 11, 2

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteB, note8
	mus_note noteB, note4
	mus_vel 8, 1

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteB, note8
	mus_note noteB, note4
	mus_vel 11, 2

	mus_octave oct2
	mus_note noteB, note8

	mus_octave oct3
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_vel 6, 4

	mus_octave oct3
	mus_note noteB, note8

	mus_octave oct4
	mus_note noteC#, note8
	mus_note noteD#, note8
	mus_note noteE, note4
	mus_note noteD#, note8
	mus_note noteC#, note4
	mus_vel 11, 2

	mus_octave oct2
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteB, note8
	mus_note noteB, note4
	mus_vel 8, 1

	mus_octave oct3
	mus_note noteB, note8
	mus_note noteA, note8
	mus_note noteG#, note8
	mus_note noteA, note4
	mus_note noteB, note8
	mus_note noteB, note4
	mus_vel 11, 5

branch_b005:
	mus_octave oct3
	mus_note noteC#, note4_8

	mus_octave oct2
	mus_note noteA, note16

	mus_octave oct3
	mus_note noteC#, note16
	mus_note noteE, note4_8
	mus_note noteC#, note16
	mus_note noteE, note16
	mus_note noteF#, note4
	mus_note noteE, note4
	mus_note noteD#, note4
	mus_note noteC#, note4

	mus_octave oct2
	mus_note noteB, note4_8
	mus_note noteG#, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteE, note2
	mus_vel 6, 5

	mus_octave oct3
	mus_note noteB, note4_8
	mus_note noteG#, note16
	mus_note noteB, note16

	mus_octave oct4
	mus_note noteE, note2
	mus_vel 11, 5

	mus_octave oct2
	mus_note noteA, note4_8
	mus_note noteF#, note16
	mus_note noteA, note16

	mus_octave oct3
	mus_note noteD#, note2
	mus_note noteE, note4
	mus_note noteD#, note4
	mus_note noteC#, note4
	mus_note noteC, note4

	mus_octave oct2
	mus_note noteB, note4_8
	mus_note noteG#, note16
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteE, note4_8

	mus_octave oct2
	mus_note noteB, note16

	mus_octave oct3
	mus_note noteE, note16
	mus_vel 11, 7
	mus_note noteG#, note1
	mus_jump 0, branch_b005
	; B03C

MeetProfOak_md_3: ;B03D - B11F
	; B03D
	mus_vel 1, 2
	mus_note noteRst, note2_8

	mus_octave oct3
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteRst, note4_16

	mus_octave oct4
	mus_note noteE, note4
	mus_note noteRst, note4_8

	mus_octave oct3
	mus_note noteB, note16
	mus_note noteRst, note4_16

	mus_octave oct4
	mus_note noteE, note4

	mus_octave oct3
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct3
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteE, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteG, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16

branch_bobc:
	mus_octave oct3
	mus_note noteA, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct3
	mus_note noteA, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct3
	mus_note noteA, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16

	mus_octave oct3
	mus_note noteA, note16
	mus_note noteRst, note16

	mus_octave oct4
	mus_note noteC#, note16
	mus_note noteRst, note16
	mus_jump 2, branch_bobc

branch_b0d8:
	mus_octave oct3
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_jump 2, branch_b0d8
	
branch_b0ed:
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_note noteF#, note16
	mus_note noteRst, note16
	mus_note noteA, note16
	mus_note noteRst, note16
	mus_jump 2, branch_b0ed
	
branch_b101:
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_note noteG#, note16
	mus_note noteRst, note16
	mus_note noteB, note16
	mus_note noteRst, note16
	mus_jump 2, branch_b101
	mus_jump 0, branch_bobc
	mus_tempo 0, 100
	mus_jump 0, $7123
	; B11F

;Meet Rival
MeetRival_md_1: ;B120 - B1BA
; B120
        mus_tempo 0, 112
        mus_volume 119
        mus_duty duty75
        mus_mod 6, 3, 4
        db $e8; B12A
        mus_vel 11, 3

        mus_octave oct3
                mus_note noteD, note16
                mus_note noteC#, note16
                mus_note noteC, note16; B130

        mus_octave oct2
                mus_note noteB, note16
                mus_note noteA#, note8
                mus_note noteA, note16
                mus_note noteG#, note16; B135
                mus_note noteG, note16
                mus_note noteF#, note16
                mus_note noteF, note4_8
                mus_note noteD, note16
                mus_note noteRst, note8_16; B13A

                mus_note noteD, note16
                mus_note noteRst, note4_16

                mus_note noteA, note8
                mus_note noteG, note8
                mus_note noteA, note8; B13F
				
branch_b140:
                mus_note noteB, note4
                mus_note noteA#, note8
                mus_note noteA, note4
                mus_note noteG, note8

        mus_octave oct3; B144
                mus_note noteC, note4
                mus_note noteD, note8
                mus_note noteRst, note4

                mus_note noteD, note4
                mus_note noteC#, note8; B149
                mus_note noteC, note8

        mus_octave oct2
                mus_note noteB, note8

        mus_octave oct3
                mus_note noteC, note4; B14E
                mus_note noteE, note8
                mus_note noteD, note4
                mus_note noteC, note8

        mus_octave oct2
                mus_note noteB, note4; B153

        mus_octave oct3
                mus_note noteC, note8
                mus_note noteRst, note4

                mus_note noteG, note4
                mus_note noteG, note8; B158
                mus_note noteF#, note8
                mus_note noteE, note8
                mus_note noteD, note8
                mus_note noteF#, note8

        mus_octave oct2; B15D
                mus_note noteA, note8

        mus_octave oct3
                mus_note noteD, note8
                mus_note noteF#, note8

        mus_octave oct2; B162
                mus_note noteA, note8

        mus_octave oct3
                mus_note noteD, note8

        mus_octave oct2
                mus_note noteD, note8; B167

        mus_octave oct3
                mus_note noteD, note8
                mus_note noteRst, note8

        mus_octave oct2
                mus_note noteD, note8; B16C

        mus_octave oct3
                mus_note noteC, note4

        mus_octave oct2
                mus_note noteB, note8
                mus_note noteA#, note8; B171
                mus_note noteB, note8

        mus_octave oct3
                mus_note noteC, note8
                mus_note noteF, note8

        mus_octave oct2; B176
                mus_note noteG, note8

        mus_octave oct3
                mus_note noteC, note8
                mus_note noteF, note8
                mus_note noteD#, note8; B17B
                mus_note noteC, note8

        mus_octave oct2
                mus_note noteA#, note8
                mus_note noteG, note8
                mus_note noteRst, note4; B180

                mus_note noteA#, note4

        mus_octave oct3
                mus_note noteC, note8

        mus_octave oct2
                mus_note noteA#, note8; B185

        mus_octave oct3
                mus_note noteC, note8

        mus_vel 11, 7

        mus_octave oct2
                mus_note noteG, note4; B18B
                mus_note noteD, note8
                mus_note noteF, note4_8
                mus_note noteF#, note4
                mus_note noteD, note8
                mus_note noteRst, note4; B190

                mus_note noteD, note4

        mus_vel 11, 3
                mus_note noteA, note8
                mus_note noteG, note8
                mus_note noteA, note8; B196

        mus_jump 0, branch_b140
        mus_tempo 0, 100
        mus_jump 0, branch_b1a5
        mus_tempo 0, 112
		
branch_b1a5:
        mus_volume 119; B1A6
        mus_duty duty75
        mus_mod 6, 3, 4
        db $e8
        mus_vel 11, 3

        mus_octave oct2; B1AF
                mus_note noteD, note16
                mus_note noteRst, note8_16

                mus_note noteD, note16
                mus_note noteRst, note4_16

                mus_note noteA, note8; B1B4
                mus_note noteG, note8
                mus_note noteA, note8

        mus_jump 0, branch_b140
; B1BA

MeetRival_md_2: ;B1BB - B232
; B1BB
        mus_duty duty75
        mus_mod 10, 2, 6
        mus_vel 12, 7

        mus_octave oct3
                mus_note noteB, note16; B1C3
                mus_note noteA#, note16
                mus_note noteA, note16
                mus_note noteG#, note16
                mus_note noteG, note8
                mus_note noteF#, note16; B1C8
                mus_note noteF, note16
                mus_note noteE, note16
                mus_note noteD#, note16
                mus_note noteD, note4_8

        mus_octave oct2; B1CD
                mus_note noteG, note16
                mus_note noteRst, note8_16

                mus_note noteG, note16
                mus_note noteRst, note8_16

                mus_note noteD, note16; B1D2
                mus_note noteRst, note16

        mus_octave oct3
                mus_note noteD, note8
                mus_note noteF, note8
                mus_note noteF#, note8; B1D7

branch_b1d8:
        mus_vel 12, 7
                mus_note noteG, note4
                mus_note noteD, note8
                mus_note noteF, note4_8
                mus_note noteF#, note4; B1DD
                mus_note noteG, note8
                mus_note noteRst, note4

                mus_note noteG, note4
                mus_note noteG, note8
                mus_note noteA#, note8; B1E2
                mus_note noteB, note8

        mus_octave oct4
                mus_note noteC, note4

        mus_octave oct3
                mus_note noteG, note8; B1E7
                mus_note noteA#, note4_8
                mus_note noteB, note4

        mus_octave oct4
                mus_note noteC, note8
                mus_note noteRst, note4; B1EC

                mus_note noteC, note4
                mus_note noteC, note8

        mus_octave oct3
                mus_note noteB, note8

        mus_octave oct4; B1F1
                mus_note noteC, note8

        mus_vel 11, 0
                mus_note noteD, note1

        mus_vel 11, 5
                mus_note noteD, note4_8; B1F8

        mus_vel 12, 7
                mus_note noteF, note4
                mus_note noteD, note8
                mus_note noteC, note8
                mus_note noteD, note8; B1FE

        mus_vel 11, 0
                mus_note noteC, note2

        mus_vel 12, 7
                mus_note noteC, note2

        mus_octave oct3; B205
                mus_note noteC, note8
                mus_note noteRst, note4

                mus_note noteA#, note4
                mus_note noteG, note8
                mus_note noteF, note8; B20A

        mus_vel 11, 0
                mus_note noteG, note1

        mus_vel 11, 3
                mus_note noteG, note8

        mus_octave oct2; B211
                mus_note noteG, note8
                mus_note noteRst, note4

                mus_note noteG, note4

        mus_octave oct3
                mus_note noteD, note8; B216
                mus_note noteF, note8
                mus_note noteF#, note8

        mus_jump 0, branch_b1d8
        mus_duty duty75
        mus_mod 10, 2, 6; B221
        mus_vel 12, 7

        mus_octave oct2
                mus_note noteG, note16
                mus_note noteRst, note8_16

                mus_note noteG, note16; B227
                mus_note noteRst, note8_16

                mus_note noteD, note16
                mus_note noteRst, note16

        mus_octave oct3
                mus_note noteD, note8; B22C
                mus_note noteF, note8
                mus_note noteF#, note8

        mus_jump 0, branch_b1d8
; B232

MeetRival_md_3: ;B233 - B3A6
; B233
        mus_vel 1, 4

        mus_octave oct4
                mus_note noteD, note8
                mus_note noteRst, note8

                mus_note noteC#, note8; B238
                mus_note noteRst, note8

                mus_note noteC, note8
                mus_note noteRst, note8

        mus_octave oct3
                mus_note noteB, note8; B23D
                mus_note noteRst, note8

                mus_note noteG, note16
                mus_note noteRst, note8_16

                mus_note noteG, note16
                mus_note noteRst, note8_16; B242

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteG, note16; B247
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16

branch_b24b:
                mus_note noteG, note8

        mus_octave oct4; B24C
                mus_note noteD, note8

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteRst, note8

        mus_octave oct4; B251
                mus_note noteD, note8

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteRst, note8

        mus_octave oct4; B256
                mus_note noteD, note8

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteRst, note4

        mus_octave oct4; B25B
                mus_note noteD, note4

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteA#, note8
                mus_note noteB, note8; B260
                mus_note noteG, note8

        mus_octave oct4
                mus_note noteC, note8

        mus_octave oct3
                mus_note noteG, note8; B265
                mus_note noteRst, note8

        mus_octave oct4
                mus_note noteC, note8

        mus_octave oct3
                mus_note noteG, note8; B26A
                mus_note noteRst, note8

                mus_note noteB, note8

        mus_octave oct4
                mus_note noteC, note8
                mus_note noteRst, note4; B26F

                mus_note noteC, note4
                mus_note noteC, note8

        mus_octave oct3
                mus_note noteB, note8
                mus_note noteA, note8; B274
                mus_note noteF#, note8
                mus_note noteA, note8
                mus_note noteRst, note8

                mus_note noteF#, note8
                mus_note noteA, note8; B279
                mus_note noteF#, note8
                mus_note noteRst, note8

                mus_note noteA, note8
                mus_note noteF#, note8
                mus_note noteA, note8; B27E
                mus_note noteRst, note8

                mus_note noteF#, note8
                mus_note noteA, note8
                mus_note noteF#, note8

        mus_octave oct4; B283
                mus_note noteD, note8

        mus_octave oct3
                mus_note noteA, note8
                mus_note noteE, note8

        mus_octave oct4; B288
                mus_note noteC, note8
                mus_note noteRst, note8

        mus_octave oct3
                mus_note noteE, note8

        mus_octave oct4; B28D
                mus_note noteC, note8

        mus_octave oct3
                mus_note noteE, note8
                mus_note noteF, note8
                mus_note noteG, note8; B292
                mus_note noteE, note8
                mus_note noteRst, note4

                mus_note noteE, note8

        mus_octave oct4
                mus_note noteC, note8; B297

        mus_octave oct3
                mus_note noteB, note8
                mus_note noteA#, note8
                mus_note noteA, note8
                mus_note noteG, note8; B29C
                mus_note noteA#, note8
                mus_note noteRst, note8

                mus_note noteG, note8
                mus_note noteA#, note8
                mus_note noteG, note8; B2A1
                mus_note noteRst, note8

                mus_note noteA#, note8
                mus_note noteG, note8

        mus_octave oct4
                mus_note noteD, note8; B2A6

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteRst, note8

        mus_octave oct4
                mus_note noteD, note8; B2AB

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteRst, note8

        mus_octave oct4
                mus_note noteD, note8; B2B0

        mus_jump 0, branch_b24b
        mus_vel 1, 4

        mus_octave oct3
                mus_note noteG, note16
                mus_note noteRst, note8_16; B2B9

                mus_note noteG, note16
                mus_note noteRst, note8_16

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteG, note16; B2BE
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16; B2C3

        mus_jump 0, branch_b24b
        db $f8
        mus_tempo 1, 0
        mus_volume 119
        mus_duty duty50; B2CF
        db $d5

                mus_note noteB, note8

        mus_octave oct2
                mus_note noteA, note8
                mus_note noteA, note8; B2D4
                mus_note noteG, note8
                mus_note noteG, note8
                mus_note noteF, note8
                mus_note noteE, note8
                mus_note noteF, note8; B2D9
                mus_note noteA, note8

        mus_octave oct3
                mus_note noteC, note4
                mus_note noteE, note4

        mus_octave oct2; B2DE
                mus_note noteF, note4

        mus_end
; B2E0

; B2E1
branch_b2e1:
        db $f8
        mus_duty duty50
        db $d5

                mus_note noteRst, note8_16

        mus_octave oct4; B2E6
                mus_note noteF, note8
                mus_note noteE, note16
                mus_note noteRst, note16

                mus_note noteD, note8
                mus_note noteC, note16; B2EB
                mus_note noteRst, note16

        mus_octave oct3
                mus_note noteA#, note8

        mus_octave oct4
                mus_note noteC, note8; B2F0
                mus_note noteD, note8
                mus_note noteE, note8
                mus_note noteF, note4
                mus_note noteG, note4
                mus_note noteF, note4; B2F5

        mus_end
; B2F6

; B2F7
branch_b2f7:
        db $f8
        db $d5

                mus_note noteC#, note16

        mus_octave oct4
                mus_note noteC, note16; B2FB
                mus_note noteRst, note16

        mus_octave oct3
                mus_note noteF, note8

        mus_octave oct4
                mus_note noteC, note16; B300
                mus_note noteRst, note16

        mus_octave oct3
                mus_note noteA#, note16
                mus_note noteRst, note16

                mus_note noteA, note16; B305
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteF, note16
                mus_note noteRst, note16; B30A

                mus_note noteE, note16
                mus_note noteRst, note16

        mus_octave oct4
                mus_note noteF, note16
                mus_note noteRst, note8_16; B30F

                mus_note noteC, note16
                mus_note noteRst, note8_16

        mus_octave oct3
                mus_note noteF, note8
                mus_note noteRst, note8; B314

        mus_end
; B315

; B316
branch_b316:
        db $f8
        mus_tempo 1, 0
        mus_volume 119
        mus_duty duty50
        db $e8; B31E
        db $d5

                mus_note noteB, note4_16

        mus_octave oct3
                mus_note noteD, note4
                mus_note noteC, note4; B323

        mus_octave oct2
                mus_note noteA, note2

        db $d5

                mus_note noteB, note8_16

        mus_octave oct3; B328
                mus_note noteD#, note8
                mus_note noteD#, note8
                mus_note noteD, note8
                mus_note noteC, note8
                mus_note noteC, note8; B32D

        mus_octave oct2
                mus_note noteA#, note8

        db $d5

                mus_note noteB, note4_16

        mus_octave oct3; B332
                mus_note noteC, note2

        mus_end
; B334

; B335
branch_b335:
        db $f8
        mus_mod 8, 2, 7
        mus_duty duty50
        db $d5

                mus_note noteRst, note4_8; B33C

        mus_octave oct3
                mus_note noteA, note4
                mus_note noteF, note4
                mus_note noteC, note2

        db $d5; B341

                mus_note noteRst, note8_16

                mus_note noteA#, note8
                mus_note noteA#, note8
                mus_note noteA#, note8
                mus_note noteG, note8; B346
                mus_note noteG, note8
                mus_note noteA#, note8

        db $d5

                mus_note noteRst, note4_16

                mus_note noteA, note2; B34B

        mus_end
; B34C

; B34D
branch_b34d:
        db $f8
        db $d5

                mus_note noteC#, note16

        mus_octave oct4
                mus_note noteF, note4; B351
                mus_note noteD#, note4
                mus_note noteC, note2
                mus_note noteD#, note16
                mus_note noteRst, note16

                mus_note noteD#, note16; B356
                mus_note noteRst, note16

                mus_note noteE, note16
                mus_note noteRst, note16

                mus_note noteF, note16
                mus_note noteRst, note16; B35B

                mus_note noteF, note16
                mus_note noteRst, note16

                mus_note noteG, note16
                mus_note noteRst, note16

                mus_note noteA, note2; B360

        mus_end
; B361

; B362
branch_b362:
        db $f8
        mus_tempo 1, 0
        mus_volume 119
        mus_duty duty50
        db $e8; B36A
        db $d5

                mus_note noteA#, note4_16

        mus_octave oct2
                mus_note noteA#, note4

        db $d5; B36F

                mus_note noteB, note8

        mus_octave oct3
                mus_note noteC, note8
                mus_note noteC, note16
                mus_note noteC, note16; B374

        db $d5

                mus_note noteA#, note4_16
                mus_note noteD#, note4

        db $d5

                mus_note noteB, note8; B379
                mus_note noteF, note8
                mus_note noteF, note16
                mus_note noteF, note16

        db $d5

                mus_note noteB, note4_16; B37E
                mus_note noteA#, note2

        mus_end
; B380

; B381
branch_b381:
        db $f8
        mus_mod 4, 2, 3
        mus_duty duty50
        db $d5
        db $d1; B388

        mus_octave oct3
                mus_note noteG, note8
                mus_note noteG, note16
                mus_note noteG, note16

        db $d5; B38D

                mus_note noteRst, note4_16

                mus_note noteD#, note4

        db $d5
        db $d1

                mus_note noteG#, note8; B392
                mus_note noteG#, note16
                mus_note noteG#, note16
                mus_note noteA#, note8
                mus_note noteA#, note16
                mus_note noteA#, note16; B397

        db $d5

                mus_note noteRst, note4_16

        mus_octave oct4
                mus_note noteD#, note2

        mus_end; B39C
; B39C

; B39D
branch_b39d:
        db $f8
        db $d5

                mus_note noteC#, note16

        mus_octave oct3
                mus_note noteD#, note4; B3A1
                mus_note noteG#, note4
                mus_note noteG, note4
                mus_note noteF, note4
                mus_note noteD#, note2

        mus_end; B3A6
; B3A6

;SS Anne
SSAnne_md_1: ;B3A7 - B418
INCBIN "baserom.gbc",$b3a7,$b419 - $b3a7

SSAnne_md_2: ;B419 - B4CA
INCBIN "baserom.gbc",$b419,$b4cb - $b419

SSAnne_md_3: ;B4CB - B503
INCBIN "baserom.gbc",$b4cb,$b504 - $b4cb

;Cerulean City, Fuchsia City
Cities2_md_1: ;B504 - B568
INCBIN "baserom.gbc",$b504,$b569 - $b504

Cities2_md_2: ;B569 - B63F
INCBIN "baserom.gbc",$b569,$b640 - $b569

Cities2_md_3: ;B640 - B6C6
INCBIN "baserom.gbc",$b640,$b6c7 - $b640

;Celadon City
Celadon_md_1: ;B6C7 - B739
INCBIN "baserom.gbc",$b6c7,$b73a - $b6c7

Celadon_md_2: ;B73A - B7B4
INCBIN "baserom.gbc",$b73a,$b7b5 - $b73a

Celadon_md_3: ;B7B5 - B86C
INCBIN "baserom.gbc",$b7b5,$b86d - $b7b5

;Cinnabar Island
Cinnabar_md_1: ;B86D - B8D3
INCBIN "baserom.gbc",$b86d,$b8d4 - $b86d

Cinnabar_md_2: ;B8D4 - B93C
INCBIN "baserom.gbc",$b8d4,$b93d - $b8d4

Cinnabar_md_3: ;B93D - B9EA
INCBIN "baserom.gbc",$b93d,$b9eb - $b93d

;Vermilion City
Vermilion_md_1: ;B9EB - BA60
INCBIN "baserom.gbc",$b9eb,$ba61 - $b9eb

Vermilion_md_2: ;BA61 - BAA5
INCBIN "baserom.gbc",$ba61,$baa6 - $ba61

Vermilion_md_3: ;BAA6 - BB0C
INCBIN "baserom.gbc",$baa6,$bb0d - $baa6

Vermilion_md_4: ;BB0D - BB57
INCBIN "baserom.gbc",$bb0d,$bb58 - $bb0d

;Lavender Town
Lavender_md_1: ;BB58 - BB9D
INCBIN "baserom.gbc",$bb58,$bb9e - $bb58

Lavender_md_2: ;BB9E - BBAD
INCBIN "baserom.gbc",$bb9e,$bbae - $bb9e

Lavender_md_3: ;BBAE - BC20
INCBIN "baserom.gbc",$bbae,$bc21 - $bbae

Lavender_md_4: ;BC21 - BC2D
INCBIN "baserom.gbc",$bc21,$bc2e - $bc21

;Safari Zone
SafariZone_md_1: ;BC2E - BC69
INCBIN "baserom.gbc",$bc2e,$bc6a - $bc2e

SafariZone_md_2: ;BC6A - BC93
INCBIN "baserom.gbc",$bc6a,$bc94 - $bc6a

SafariZone_md_3: ;BC94 - BCBA
INCBIN "baserom.gbc",$bc94,$bcbb - $bc94

;Gyms
Gym_md_1: ;bcbb - bd6a (175 bytes)
INCBIN "baserom.gbc",$bcbb,$bd6b - $bcbb

Gym_md_2: ;bd6b - bdf9 (142 bytes)
INCBIN "baserom.gbc",$bd6b,$bdfa - $bd6b

Gym_md_3: ;bdfa - be55 (91 bytes)
INCBIN "baserom.gbc",$bdfa,$be56 - $bdfa

;Pokemon Center
Pokecenter_md_1: ;be56 - bef8 (162 bytes)
INCBIN "baserom.gbc",$be56,$bef9 - $be56

Pokecenter_md_2: ;0xbef9 - bf6f (118 bytes)
INCBIN "baserom.gbc",$bef9,$bf70 - $bef9

Pokecenter_md_3: ;0xbf70 - bfff (143 bytes)
INCBIN "baserom.gbc",$bf70,$c000 - $bf70
