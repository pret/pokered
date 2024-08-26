for Q, 2, 31
	OPT Q.{d:Q}

	assert sin(0.25) == 1.0
	assert asin(1.0) == 0.25

	assert sin(0.0) == 0.0
	assert asin(0.0) == 0.0

	assert cos(0.0) == 1.0
	assert acos(1.0) == 0.0

	if Q > 2 ; can't represent 0.125 in Q.2
		assert tan(0.125) == 1.0
		assert atan(1.0) == 0.125
	else
		assert tan(0.0) == 0.0
		assert atan(0.0) == 0.0
	endc
endr

SECTION "sine", ROM0[0]
OPT Q.16
; Generate a table of sine values from sin(0.0) to sin(1.0), with
; amplitude scaled from [-1.0, 1.0] to [0.0, 128.0]
DEF turns = 0.0
REPT 256
    db MUL(64.0, SIN(turns) + 1.0) >> 16
    DEF turns += 1.0 / 256
ENDR


SECTION "cosine", ROM0[256]
OPT Q.8
; 32 samples of cos(x) from x=0 to x=pi radians=0.5 turns
for x, 0.0, 0.5, 0.5 / 32
    dw cos(x)
endr
