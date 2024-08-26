SECTION "All instructions", ROM0[0]

    ; 8-bit Arithmetic and Logic Instructions

MACRO alu_instruction_list
    \1 a,a
    \1 a,b
    \1 a,c
    \1 a,d
    \1 a,$DB
    \1 a,e
    \1 a,h
    \1 a,[hl]
    \1 a,l
ENDM

    alu_instruction_list adc
    alu_instruction_list add
    alu_instruction_list and
    alu_instruction_list cp
    alu_instruction_list or
    alu_instruction_list sbc
    alu_instruction_list sub
    alu_instruction_list xor

MACRO incdec_8bit_instruction_list
    \1 a
    \1 b
    \1 c
    \1 d
    \1 e
    \1 h
    \1 [hl]
    \1 l
ENDM

    incdec_8bit_instruction_list inc
    incdec_8bit_instruction_list dec

    ; 16-bit Arithmetic Instructions

    add hl,bc
    add hl,de
    add hl,hl
    add hl,sp

    inc bc
    inc de
    inc hl
    inc sp

    dec bc
    dec de
    dec hl
    dec sp

    ; Bit Operations Instructions

MACRO bitop_u3_instruction_list
NBIT = 0
    REPT 8
        \1 NBIT,a
        \1 NBIT,b
        \1 NBIT,c
        \1 NBIT,d
        \1 NBIT,e
        \1 NBIT,h
        \1 NBIT,[hl]
        \1 NBIT,l
NBIT = NBIT + 1
    ENDR
ENDM

    bitop_u3_instruction_list bit
    bitop_u3_instruction_list res
    bitop_u3_instruction_list set

MACRO bitop_noarg_instruction_list
    \1 a
    \1 b
    \1 c
    \1 d
    \1 e
    \1 h
    \1 [hl]
    \1 l
ENDM

    bitop_noarg_instruction_list swap

    ; Bit Shift Instructions

    rla
    rlca
    rra
    rrca

    bitop_noarg_instruction_list rl
    bitop_noarg_instruction_list rlc
    bitop_noarg_instruction_list rr
    bitop_noarg_instruction_list rrc
    bitop_noarg_instruction_list sla
    bitop_noarg_instruction_list sra
    bitop_noarg_instruction_list srl

    ; Load Instructions

MACRO ld_r8_x_instruction_list
    ld \1,a
    ld \1,b
    ld \1,c
    ld \1,d
    ld \1,$DB
    ld \1,e
    ld \1,h
    ld \1,l
ENDM

    ld_r8_x_instruction_list a
    ld_r8_x_instruction_list b
    ld_r8_x_instruction_list c
    ld_r8_x_instruction_list d
    ld_r8_x_instruction_list e
    ld_r8_x_instruction_list h
    ld_r8_x_instruction_list [hl]
    ld_r8_x_instruction_list l

MACRO ld_x_r8_instruction_list
    ld a,\1
    ld b,\1
    ld c,\1
    ld d,\1
    ld e,\1
    ld h,\1
    ld l,\1
ENDM

    ld_x_r8_instruction_list a
    ld_x_r8_instruction_list b
    ld_x_r8_instruction_list c
    ld_x_r8_instruction_list d
    ld_x_r8_instruction_list e
    ld_x_r8_instruction_list h
    ld_x_r8_instruction_list [hl]
    ld_x_r8_instruction_list l

    ld  bc,$ABCD
    ld  de,$ABCD
    ld  hl,$ABCD
    ld  sp,$ABCD

    ld  [bc],a
    ld  [de],a
    ld  [hl],a
    ld  [$ABCD],a
    ldh [$ff00+$DB],a
    ld  [$ff00+c],a
    ld  [$ff00 + c],a
    ldh [c],a

    ld  a,[bc]
    ld  a,[de]
    ld  a,[hl]
    ld  a,[$ABCD]
    ldh a,[$ff00+$DB]
    ld  a,[$ff00+c]
    ld  a,[$ff00 + c]
    ldh a,[c]

    ld  [hl+],a
    ld  [hli],a
    ld  [hl-],a
    ld  [hld],a
    ld  a,[hl+]
    ld  a,[hli]
    ld  a,[hl-]
    ld  a,[hld]

    ; Jumps and Subroutines

    call $ABCD
    call z,$ABCD
    call nz,$ABCD
    call c,$ABCD
    call nc,$ABCD

    jp hl

    jp $ABCD
    jp z,$ABCD
    jp nz,$ABCD
    jp c,$ABCD
    jp nc,$ABCD

jrlabel:
    jr jrlabel
    jr z,jrlabel
    jr nz,jrlabel
    jr c,jrlabel
    jr nc,jrlabel

    ret
    ret z
    ret nz
    ret c
    ret nc
    reti

    rst $00
    rst $08
    rst $10
    rst $18
    rst $20
    rst $28
    rst $30
    rst $38

    ; Stack Operations Instructions

    add sp,$DB
    ld  [$ABCD],sp
    ld  hl,sp+$DB
    ld  hl,sp-$25
    ld  sp,hl

    pop af
    pop bc
    pop de
    pop hl

    push af
    push bc
    push de
    push hl

    ; Miscellaneous Instructions

    ccf
    cpl
    daa
    di
    ei
    halt
    nop
    scf
    stop
FOR BYTE, 256
    stop BYTE
ENDR
