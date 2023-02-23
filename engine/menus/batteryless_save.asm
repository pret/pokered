; PureRGBnote: ADDED: currently unused code, intended for usage in a future version optionally for saving on a cart without a SRAM battery.
;                     some bootleg carts allow you to flash the save data to the ROM itself so no battery needs to hold the volatile SRAM. 
;                     This code is what does that. It's not fully implemented yet.

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
RestoreSRAMFromROM:
	callfar CopyFlashedSaveToSRAM
;	ret
;	push af
;	ld   a,??	; load/save code bank
;	ld   [MBC1RomBank],a
;	call 4000   ; offset in the bank for our load code
;	ld   a,01
;	ld   [MBC1RomBank],a
;	pop  af
;	ret
;	jp   ????  ; game start address (aka original entry point)

; Save SRAM to Flash.
SaveSRAMtoROM::
	di ; disable interrupts
	push af
	push bc
	push de
	push hl
	ld   a,?? ; load/save code bank
	ld   [MBC1RomBank],a
	call FlashSRAMToROM ; offset in the bank for our save code
	ld   a,(????) ; Game Engine Current Bank Variable
	ld   [MBC1RomBank],a
	pop  hl
	pop  de
	pop  bc
	pop  af
	ei
	ret  

; Bank Switch and copy code
BankSwitchAndCopy::
	ld   [MBC1RomBank],a
	rst CopyDataRST
	ld   a,?? ; load/save code bank
	ld   [MBC1RomBank],a
	ret  

CopyFlashedSaveToSRAM::
	ld   a,SRAM_ENABLE
	ld   [MBC1SRamEnable],a
	xor  a
	ld   [MBC1SRamBank],a 
	ld   hl, 4000  
	ld   de, SRAM_Begin  
	ld   bc, SRAM_End - SRAM_Begin  
	ld   a,$3D
	call BankswitchAndCopy ; Bank switch + copy routine
	ld   a,1
	ld   [MBC1SRamBank],a 
	ld   hl, 6000  
	ld   de, SRAM_Begin  
	ld   bc, SRAM_End - SRAM_Begin
	ld   a,$3D
	call BankswitchAndCopy ; Bank switch + copy routine
	ld   a,2
	ld   [MBC1SRamBank],a 
	ld   hl, 4000  
	ld   de, SRAM_Begin  
	ld   bc, SRAM_End - SRAM_Begin
	ld   a,$3F
	call BankswitchAndCopy ; Bank switch + copy routine
	ld   a,3
	ld   [MBC1SRamBank],a 
	ld   hl, 6000  
	ld   de, SRAM_Begin  
	ld   bc, SRAM_End - SRAM_Begin  
	ld   a,$3F
	call BankswitchAndCopy ; Bank switch + copy routine
	ret   

; @4100 erase+write routines copy to WRAM then jump
FlashSRAMToROM::
	ld   hl,EraseROMSave ; ERASE ROUTINE
	ld   de,wBatterylessSaveCode ; free WRAM
	ld   bc,0050
	rst CopyDataRST    ; copy routine
	ld   a,$3D   ; bank 1
	call wBatterylessSaveCode    ; free WRAM
	nop  
	ld   hl,FlashSRAMBank0 ; WRITE ROUTINE
	ld   de,wBatterylessSaveCode ; free WRAM
	ld   bc,005D
	rst CopyDataRST
	call wBatterylessSaveCode    ; free WRAM
	nop  
	ld   hl,FlashSRAMBank1 ; WRITE ROUTINE
	ld   de,wBatterylessSaveCode ; free WRAM
	ld   bc,005D
	rst CopyDataRST
	call wBatterylessSaveCode    ; free WRAM
	nop
	ld   hl,FlashSRAMBank2 ; WRITE ROUTINE
	ld   de,wBatterylessSaveCode ; free WRAM
	ld   bc,005D
	rst CopyDataRST
	call wBatterylessSaveCode    ; free WRAM
	nop  
	ld   hl,FlashSRAMBank3 ; WRITE ROUTINE
	ld   de,wBatterylessSaveCode ; free WRAM
	ld   bc,005D
	rst CopyDataRST
	call wBatterylessSaveCode ; free WRAM
	nop  
	ret  

; @ 4200 erase bank
EraseROMSave:
	ld   [MBC1RomBank],a
	nop  
	ld   a,F0
	ld   [MBC1SRamBank],a
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
	ld   [MBC1SRamBank],a
	nop  
	ld   a,[MBC1SRamBank]
	cp   a,FF
	jr   z,$2
	jr   $F7
	nop  
	ld   a,F0
	ld   [MBC1SRamBank],a
	ld   a,??  ;Load/Save code Bank#
	ld   [MBC1RomBank],a
	ret  

; @ 4300: copy SRAM bank 0 
FlashSRAMBank0:
	push hl
	push de
	push bc
	ld   a,$3D     ; savestate bank 1    
	ld   [MBC1RomBank],a
	ld   hl,SRAM_Begin
	ld   de,4000
	ld   a,SRAM_ENABLE
	ld   [MBC1SRamEnable],a
	ld   a,$01
	ld   [MBC1SRamBankingMode],a
	ld   a,$00    
	ld   [MBC1SRamBank],a
	ld   a,[hl]
	ld   b,a
	ld   a,$00
	ld   [MBC1SRamBankingMode],a
	ld   [MBC1SRamEnable],a
	ld   a,$F0
	ld   [MBC1SRamBank],a
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
	ld   [de],a
	ld   a,[de]
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
	ld   [MBC1SRamBank],a
	ld   a,$??      ; Load/save routines bank
	ld   [MBC1RomBank],a
	pop  bc
	pop  de
	pop  hl
	ret  

; @ 4400: copy SRAM bank 1 
FlashSRAMBank1:
push hl
push de
push bc
ld   a,$3D     ; savestate bank 1
ld   [MBC1RomBank],a
ld   hl,SRAM_Begin
ld   de,6000
ld   a,SRAM_ENABLE
ld   [MBC1SRamEnable],a
ld   a,$01
ld   [MBC1SRamBankingMode],a
ld   a,$01    
ld   [MBC1SRamBank],a
ld   a,[hl]
ld   b,a
ld   a,$00
ld   [MBC1SRamBankingMode],a
ld   [MBC1SRamEnable],a
ld   a,$F0
ld   [MBC1SRamBank],a
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
ld   [de],a
ld   a,[de]
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
ld   [MBC1SRamBank],a
ld   a,$??      ; Load/save routines bank
ld   [MBC1RomBank],a
pop  bc
pop  de
pop  hl
ret  

; @ 4500: copy SRAM bank 2 
FlashSRAMBank2:
push hl
push de
push bc
ld   a,$3F     ; savestate bank 2
ld   [MBC1RomBank],a
ld   hl,SRAM_Begin
ld   de,4000
ld   a,SRAM_ENABLE
ld   [MBC1SRamEnable],a
ld   a,$01
ld   [MBC1SRamBankingMode],a
ld   a,$02    
ld   [MBC1SRamBank],a
ld   a,[hl]
ld   b,a
ld   a,$00
ld   [MBC1SRamBankingMode],a
ld   [MBC1SRamEnable],a
ld   a,$F0
ld   [MBC1SRamBank],a
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
ld   [de],a
ld   a,[de]
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
ld   [MBC1SRamBank],a
ld   a,$??      ; Load/save routines bank
ld   [MBC1RomBank],a
pop  bc
pop  de
pop  hl
ret  

; @ 4600: copy SRAM bank 3 
FlashSRAMBank3:
push hl
push de
push bc
ld   a,$3F     ; savestate bank 2
ld   [MBC1RomBank],a
ld   hl,SRAM_Begin
ld   de,6000
ld   a, SRAM_ENABLE
ld   [MBC1SRamEnable],a
ld   a,$01
ld   [MBC1SRamBankingMode],a
ld   a,$03    
ld   [MBC1SRamBank],a
ld   a,[hl]
ld   b,a
ld   a,$00
ld   [MBC1SRamBankingMode],a
ld   [MBC1SRamEnable],a
ld   a,$F0
ld   [MBC1SRamBank],a
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
ld   [de],a
ld   a,[de]
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
ld   [MBC1SRamBank],a
ld   a,$??      ; Load/save routines bank
ld   [MBC1RomBank],a
pop  bc
pop  de
pop  hl
ret  

; utility code for save algo redirect
; place (preferably) in the same bank as the save call (or bank 1)
; TIP: intercept a call opcode and replace it with a jp statement to this
call ???? ; redirected call
di   
ld   a, [rIE]
push af
ld   a,[rIF]
push af
ld   a,[rTAC]
push af
ld   a,[rSTAT]
push af
ld   a,[rNR50]
push af
halt 
xor  a
ld   [rIE],a
ld   [rIF],a
ld   [rTAC],a
ld   [rSTAT],a
ld   [rNR50],a
call SaveSRAMtoROM ; save SRAM function address
pop  af
ld   [rNR50],a
pop  af
ld   [rSTAT],a
pop  af
ld   [rTAC],a
pop  af
ld   [rIF],a
pop  af
ld   [rIE],a
ei   
jp   ???? ; instruction just after the trojanized call