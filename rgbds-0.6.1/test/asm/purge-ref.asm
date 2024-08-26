SECTION "test", ROM0 ; Important: do not purge this!

	dw ref
	PURGE ref

OK:
	PURGE OK

	dw NotOK
NotOK:
	PURGE NotOK

EvenLessOK:
	dw EvenLessOK
	PURGE EvenLessOK

SECTION "fixed", ROM0[0]

Maybe:
	dw Maybe
	; This is currently fine because the expression above is fully evaluated
	; above, so it's fine as of now... but changing it might make sense
	PURGE Maybe
