; Music Data
; The start and stop of these byte ranges were based off the theory they're lined
; consecutively (Right up against each other).

INCBIN "baserom.gbc",$82FD,$9ba3 - $82FD

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
	mus_jump 0, $64A8
	; A5EF
	;No end byte until indigo plateu channel 1

;Indigo Plateau
IndigoPlateau_md_1: ;a5f0 - a663
INCBIN "baserom.gbc",$a5f0,$a664 - $a5f0

IndigoPlateau_md_2: ;a664 - a6b9
INCBIN "baserom.gbc",$a664,$a6ba - $a664

IndigoPlateau_md_3: ;a6ba - a70e
INCBIN "baserom.gbc",$a6ba,$a70f - $a6ba

IndigoPlateau_md_4: ;a70f - a7c4
INCBIN "baserom.gbc",$a70f,$a7c5 - $a70f

;Pallet Town
PalletTown_md_1: ; a7c5 - a85e (154 bytes)
INCBIN "baserom.gbc",$a7c5,$a85f - $a7c5

PalletTown_md_2: ; a85f - a8dd (127 bytes)
INCBIN "baserom.gbc",$a85f,$a8de - $a85f

PalletTown_md_3: ; a8de - aa75 (408 bytes)
INCBIN "baserom.gbc",$a8de,$aa76 - $a8de

;Viridian City, Pewter City, Saffron City
Cities1_md_1: ;AA76 - AB91
INCBIN "baserom.gbc",$aa76,$ab92 - $aa76

Cities1_md_2: ;AB92 - AC02
INCBIN "baserom.gbc",$ab92,$ac32 - $ab92

Cities1_md_3: ;AC32 - AC7F
INCBIN "baserom.gbc",$ac32,$acef - $ac32

Cities1_md_4: ;ACEF - ADAD
INCBIN "baserom.gbc",$acef,$adae - $acef

;Guy walks you to museum
MuseumGuy_md_1: ;ADAE - ADF0
INCBIN "baserom.gbc",$adae,$adf1 - $adae

MuseumGuy_md_2: ;ADF1 - AE6D
INCBIN "baserom.gbc",$adf1,$ae6e - $adf1

MuseumGuy_md_3: ;AE6E - AED0
INCBIN "baserom.gbc",$ae6e,$aed1 - $ae6e

MuseumGuy_md_4: ;AED1 - AF58
INCBIN "baserom.gbc",$aed1,$af59 - $aed1

;Meet Prof. Oak
MeetProfOak_md_1: ;AF59 - AFA8
INCBIN "baserom.gbc",$af59,$afa9 - $af59

MeetProfOak_md_2: ;AFA9 - B03D
INCBIN "baserom.gbc",$afa9,$b03d - $afa9

MeetProfOak_md_3: ;B03D - B11F
INCBIN "baserom.gbc",$b03d,$b120 - $b03d

;Meet Rival
MeetRival_md_1: ;B120 - B1BA
INCBIN "baserom.gbc",$b120,$b1bb - $b120

MeetRival_md_2: ;B1BB - B232
INCBIN "baserom.gbc",$b1bb,$b233 - $b1bb

MeetRival_md_3: ;B233 - B3A6
INCBIN "baserom.gbc",$b233,$b3a7 - $b233

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