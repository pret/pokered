; 32K routines by LucentW#6667 / https://t.me/LucentW / https://github.com/LucentW

; big credits to BennVenn for the base template for 8K savestates,
; part of the routines used for this, the explanatory video
; and the effort into collecting the infos for these patches

; BennVenn's video: https://www.youtube.com/watch?v=l2bx-udTN84

; Things we need to know to patch our ROM.
; Use the Joey's debug log, Lesserkuma's FlashGBX flash prober or read the datasheet
; Erase Block size of our Flash IC: 0x

; BEWARE: make sure that the savestate banks are aligned to the erase block size!
; (in a nutshell: make sure that the starting address is exactly divisible by 10000)

; BIG TIP: most repro carts pack a 4MB flash, grow the ROM to 4M to get LOTS of free
; space, especially on larger games. The cart CPLD works even with banks over MBC3 limits.

; Free rom area equal to the Block erase size (Save Flash Bank # = Address/0x4000): 0x
; Free rom areas for our Load/Save routines (Usually the two banks below the free area): 0x 0x
; Game engine Current Bank# Variable address: 0x
; 93 bytes of unused Working ram for our code to execute in: 0x
; Game Start Address: 0x
; Restore SRAM function address: 0x
; Save SRAM function address: 0x
; Bank switch and copy function address: 0x
; Where in the ROM is the original save routine?: 0x

; Restore SRAM code - Do this first thing at game startup
push af
ld   a,??	; load/save code bank
ld   (2000),a
call 4000   ; offset in the bank for our load code
ld   a,01
ld   (2000),a
pop  af
jp   ????  ; game start address (aka original entry point)

; Save SRAM to Flash.
di ; disable interrupts
push af
push bc
push de
push hl
ld   a,?? ; load/save code bank
ld   (2000),a
call 4100 ; offset in the bank for our save code
ld   a,(????) ; Game Engine Current Bank Variable
ld   (2000),a
pop  hl
pop  de
pop  bc
pop  af
ei
ret  

; Bank Switch and copy code
ld   (2000),a
ldi  a,(hl)
ld   (de),a
inc  de
dec  bc
ld   a,c
or   b
jr   nz,$F8
ld   a,?? ; load/save code bank
ld   (2000),a
ret  

; @4000 rom 2 sram
ld   a,0A
ld   (0000),a
xor  a
ld   (4000),a 
ld   hl,4000  
ld   de,A000  
ld   bc,2000  
ld   a,?? ; Bank 1
call ???? ; Bank switch + copy routine
ld   a,1
ld   (4000),a 
ld   hl,6000  
ld   de,A000  
ld   bc,2000  
ld   a,?? ; Bank 1
call ???? ; Bank switch + copy routine
ld   a,2
ld   (4000),a 
ld   hl,4000  
ld   de,A000  
ld   bc,2000  
ld   a,?? ; Bank 2
call ???? ; Bank switch + copy routine
ld   a,3
ld   (4000),a 
ld   hl,6000  
ld   de,A000  
ld   bc,2000  
ld   a,?? ; Bank 2
call ???? ; Bank switch + copy routine
ret 

; @40A0 copy routine
ldi  a,(hl)
ld   (de),a
inc  de
dec  bc
ld   a,c
or   b
jr   nz,$F8
ret  

; @4100 erase+write routines copy to WRAM then jump
ld   hl,4200 ; ERASE ROUTINE
ld   de,???? ; free WRAM
ld   bc,0050
call 40A0    ; copy routine
ld   a,??    ; bank 1
call ????    ; free WRAM
nop  
ld   hl,4300 ; WRITE ROUTINE
ld   de,???? ; free WRAM
ld   bc,005D
call 40A0
call ????    ; free WRAM
nop  
ld   hl,4400 ; WRITE ROUTINE
ld   de,???? ; free WRAM
ld   bc,005D
call 40A0
call ????    ; free WRAM
nop
ld   hl,4500 ; WRITE ROUTINE
ld   de,???? ; free WRAM
ld   bc,005D
call 40A0
call ????    ; free WRAM
nop  
ld   hl,4600 ; WRITE ROUTINE
ld   de,???? ; free WRAM
ld   bc,005D
call 40A0
call ???? ; free WRAM
nop  
ret  

; @ 4200 erase bank
ld   (2000),a
nop  
ld   a,F0
ld   (4000),a
nop  
ld   a,A9
ld   (0AAA),a
nop  
ld   a,56
ld   (0555),a
nop  
ld   a,80
ld   (0AAA),a
nop  
ld   a,A9
ld   (0AAA),a
nop  
ld   a,56
ld   (0555),a
nop  
ld   a,30
ld   (4000),a
nop  
ld   a,(4000)
cp   a,FF
jr   z,$2
jr   $F7
nop  
ld   a,F0
ld   (4000),a
ld   a,??  ;Load/Save code Bank#
ld   (2000),a
ret  

; @ 4300: copy SRAM bank 0 
push hl
push de
push bc
ld   a,$??     ; savestate bank 1    
ld   (2000),a
ld   hl,A000
ld   de,4000
ld   a,0A
ld   (0000),a
ld   a,$01
ld   (6000),a
ld   a,$00    
ld   (4000),a
ld   a,(hl)
ld   b,a
ld   a,$00
ld   (6000),a
ld   (0000),a
ld   a,$F0
ld   (4000),a
nop  
ld   a,$A9
ld   (0AAA),a
nop  
ld   a,$56
ld   (0555),a
nop  
ld   a,$A0
ld   (0AAA),a
nop  
ld   a,b
ld   (de),a
ld   a,(de)
xor  b
jr   z,$3
jr   $F9
nop
inc  hl
inc  de
ld   a,h
cp   a,$C0
jr   nz,$BF
ld   a,$F0
ld   (4000),a
ld   a,$??      ; Load/save routines bank
ld   (2000),a
pop  bc
pop  de
pop  hl
ret  

; @ 4400: copy SRAM bank 1 
push hl
push de
push bc
ld   a,$??     ; savestate bank 1
ld   (2000),a
ld   hl,A000
ld   de,6000
ld   a,0A
ld   (0000),a
ld   a,$01
ld   (6000),a
ld   a,$01    
ld   (4000),a
ld   a,(hl)
ld   b,a
ld   a,$00
ld   (6000),a
ld   (0000),a
ld   a,$F0
ld   (4000),a
nop  
ld   a,$A9
ld   (0AAA),a
nop  
ld   a,$56
ld   (0555),a
nop  
ld   a,$A0
ld   (0AAA),a
nop  
ld   a,b
ld   (de),a
ld   a,(de)
xor  b
jr   z,$3
jr   $F9
nop
inc  hl
inc  de
ld   a,h
cp   a,$C0
jr   nz,$BF
ld   a,$F0
ld   (4000),a
ld   a,$??      ; Load/save routines bank
ld   (2000),a
pop  bc
pop  de
pop  hl
ret  

; @ 4500: copy SRAM bank 2 
push hl
push de
push bc
ld   a,$??     ; savestate bank 2
ld   (2000),a
ld   hl,A000
ld   de,4000
ld   a,0A
ld   (0000),a
ld   a,$01
ld   (6000),a
ld   a,$02    
ld   (4000),a
ld   a,(hl)
ld   b,a
ld   a,$00
ld   (6000),a
ld   (0000),a
ld   a,$F0
ld   (4000),a
nop  
ld   a,$A9
ld   (0AAA),a
nop  
ld   a,$56
ld   (0555),a
nop  
ld   a,$A0
ld   (0AAA),a
nop  
ld   a,b
ld   (de),a
ld   a,(de)
xor  b
jr   z,$3
jr   $F9
nop
inc  hl
inc  de
ld   a,h
cp   a,$C0
jr   nz,$BF
ld   a,$F0
ld   (4000),a
ld   a,$??      ; Load/save routines bank
ld   (2000),a
pop  bc
pop  de
pop  hl
ret  

; @ 4600: copy SRAM bank 3 
push hl
push de
push bc
ld   a,$??     ; savestate bank 2
ld   (2000),a
ld   hl,A000
ld   de,6000
ld   a,0A
ld   (0000),a
ld   a,$01
ld   (6000),a
ld   a,$03    
ld   (4000),a
ld   a,(hl)
ld   b,a
ld   a,$00
ld   (6000),a
ld   (0000),a
ld   a,$F0
ld   (4000),a
nop  
ld   a,$A9
ld   (0AAA),a
nop  
ld   a,$56
ld   (0555),a
nop  
ld   a,$A0
ld   (0AAA),a
nop  
ld   a,b
ld   (de),a
ld   a,(de)
xor  b
jr   z,$3
jr   $F9
nop
inc  hl
inc  de
ld   a,h
cp   a,$C0
jr   nz,$BF
ld   a,$F0
ld   (4000),a
ld   a,$??      ; Load/save routines bank
ld   (2000),a
pop  bc
pop  de
pop  hl
ret  

; utility code for save algo redirect
; place (preferably) in the same bank as the save call (or bank 1)
; TIP: intercept a call opcode and replace it with a jp statement to this
call ???? ; redirected call
di   
ld   a,(FFFF)
push af
ld   a,(FF0F)
push af
ld   a,(FF07)
push af
ld   a,(FF41)
push af
ld   a,(FF24)
push af
halt 
xor  a
ld   (FFFF),a
ld   (FF0F),a
ld   (FF07),a
ld   (FF41),a
ld   (FF24),a
call ???? ; save SRAM function address
pop  af
ld   (FF24),a
pop  af
ld   (FF41),a
pop  af
ld   (FF07),a
pop  af
ld   (FF0F),a
pop  af
ld   (FFFF),a
ei   
jp   ???? ; instruction just after the trojanized call