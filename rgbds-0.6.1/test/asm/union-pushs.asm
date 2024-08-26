
SECTION "Test", ROM0[0]
    dw SIZEOF("RAM")
    dw SIZEOF("HRAM")

SECTION "RAM",WRAM0
    ds 654
UNION
    ds 14
NEXTU
    ds 897

PUSHS

SECTION "HRAM",HRAM
    ds $7F

POPS
    ds 75
NEXTU
    ds 863
ENDU

    ds 28

