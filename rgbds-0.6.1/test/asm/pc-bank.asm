SECTION "Fixed bank", ROMX,BANK[42]
	ldh a, [BANK(@) * 256] ; This should be complained about at assembly time

X = BANK(@)

SECTION "Something else", ROMX
Y = BANK("Fixed bank")

    PRINTLN "@: {X}\nStr: {Y}"

ERR = BANK(@)
