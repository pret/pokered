SECTION "ccode test", ROM0[0]

Label:

.local1
	jp z, Label
	jr nz, .local1
	call c, Label
	call nc, Label

.local2
	jp !nz, Label
	jr !z, .local2
	call !nc, Label
	call !c, Label

.local3
	jp !!z, Label
	jr !!nz, .local3
	call !!c, Label
	call !!nc, Label
