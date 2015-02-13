; [wd0b5] = pokemon ID
; hl = dest addr
PrintMonType: ; 27d6b (9:7d6b)
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [W_MONHTYPE1]
	call PrintType
	ld a, [W_MONHTYPE1]
	ld b, a
	ld a, [W_MONHTYPE2]
	cp b
	pop hl
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 2
	add hl, bc

; a = type
; hl = dest addr
PrintType: ; 27d89 (9:7d89)
	push hl
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text: ; 27d8c (9:7d8c)
	ld a, " "
	ld bc, $13
	add hl, bc
	ld bc, $6
	jp FillMemory

PrintMoveType: ; 27d98 (9:7d98)
	call GetPredefRegisters
	push hl
	ld a, [W_PLAYERMOVETYPE]
; fall through

PrintType_: ; 27d9f (9:7d9f)
	add a
	ld hl, TypeNames
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "text/type_names.asm"

SaveTrainerName: ; 27e4a (9:7e4a)
	ld hl,TrainerNamePointers
	ld a,[W_TRAINERCLASS]
	dec a
	ld c,a
	ld b,0
	add hl,bc
	add hl,bc
	ld a,[hli]
	ld h,[hl]
	ld l,a
	ld de,wcd6d
.CopyCharacter
	ld a,[hli]
	ld [de],a
	inc de
	cp "@"
	jr nz,.CopyCharacter
	ret

TrainerNamePointers: ; 27e64 (9:7e64)
; what is the point of these?
	dw YoungsterName
	dw BugCatcherName
	dw LassName
	dw W_TRAINERNAME
	dw JrTrainerMName
	dw JrTrainerFName
	dw PokemaniacName
	dw SuperNerdName
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw BurglarName
	dw EngineerName
	dw JugglerXName
	dw W_TRAINERNAME
	dw SwimmerName
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw BeautyName
	dw W_TRAINERNAME
	dw RockerName
	dw JugglerName
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw BlackbeltName
	dw W_TRAINERNAME
	dw ProfOakName
	dw ChiefName
	dw ScientistName
	dw W_TRAINERNAME
	dw RocketName
	dw CooltrainerMName
	dw CooltrainerFName
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME
	dw W_TRAINERNAME

YoungsterName: ; 27ec2 (9:7ec2)
	db "YOUNGSTER@"
BugCatcherName: ; 27ecc (9:7ecc)
	db "BUG CATCHER@"
LassName: ; 27ed8 (9:7ed8)
	db "LASS@"
JrTrainerMName: ; 27edd (9:7edd)
	db "JR.TRAINER♂@"
JrTrainerFName: ; 27ee9 (9:7ee9)
	db "JR.TRAINER♀@"
PokemaniacName: ; 27ef5 (9:7ef5)
	db "POKéMANIAC@"
SuperNerdName: ; 27f00 (9:7f00)
	db "SUPER NERD@"
BurglarName: ; 27f0b (9:7f0b)
	db "BURGLAR@"
EngineerName: ; 27f13 (9:7f13)
	db "ENGINEER@"
JugglerXName: ; 27f1c (9:7f1c)
	db "JUGGLER@"
SwimmerName: ; 27f24 (9:7f24)
	db "SWIMMER@"
BeautyName: ; 27f2c (9:7f2c)
	db "BEAUTY@"
RockerName: ; 27f33 (9:7f33)
	db "ROCKER@"
JugglerName: ; 27f3a (9:7f3a)
	db "JUGGLER@"
BlackbeltName: ; 27f42 (9:7f42)
	db "BLACKBELT@"
ProfOakName: ; 27f4c (9:7f4c)
	db "PROF.OAK@"
ChiefName: ; 27f55 (9:7f55)
	db "CHIEF@"
ScientistName: ; 27f5b (9:7f5b)
	db "SCIENTIST@"
RocketName: ; 27f65 (9:7f65)
	db "ROCKET@"
CooltrainerMName: ; 27f6c (9:7f6c)
	db "COOLTRAINER♂@"
CooltrainerFName: ; 27f79 (9:7f79)
	db "COOLTRAINER♀@"

FocusEnergyEffect_: ; 27f86 (9:7f86)
	ld hl, W_PLAYERBATTSTATUS2
	ld a, [H_WHOSETURN]
	and a
	jr z, .notEnemy
	ld hl, W_ENEMYBATTSTATUS2
.notEnemy
	bit GettingPumped, [hl] ; is mon already using focus energy?
	jr nz, .alreadyUsing
	set GettingPumped, [hl] ; mon is now using focus energy
	callab PlayCurrentMoveAnimation
	ld hl, GettingPumpedText
	jp PrintText
.alreadyUsing
	ld c, $32
	call DelayFrames
	ld hl, PrintButItFailedText_
	ld b, BANK(PrintButItFailedText_)
	jp Bankswitch

GettingPumpedText: ; 27fb3 (9:7fb3)
	db $0a
	TX_FAR _GettingPumpedText
	db "@"
