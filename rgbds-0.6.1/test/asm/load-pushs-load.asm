
SECTION "Output", ROM0[0]
    dw Rom0Label1
    dw Rom0Label2
    dw SramLabel1
    dw SramLabel2
    dw RomxLabel1
    dw RomxLabel2
    dw HramLabel


SECTION "A", ROM0[$1324]
Rom0Label1:
LOAD "LA", SRAM[$BEAD]
    SramLabel1:
    PUSHS
        ; not inside a section or load section here yet
        SECTION "B", ROMX[$4698]
        RomxLabel1:
        LOAD "LB", HRAM[$FF86]
            HramLabel:
        ENDL
        RomxLabel2:
    POPS
    SramLabel2:
ENDL
Rom0Label2:
