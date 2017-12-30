SaveTrainerName:
	ld hl, TrainerNamePointers
	ld a, [wTrainerClass]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcd6d
.CopyCharacter
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .CopyCharacter
	ret

TrainerNamePointers:
; what is the point of these?
	dw YoungsterName
	dw BugCatcherName
	dw LassName
	dw wTrainerName
	dw JrTrainerMName
	dw JrTrainerFName
	dw PokemaniacName
	dw SuperNerdName
	dw wTrainerName
	dw wTrainerName
	dw BurglarName
	dw EngineerName
	dw JugglerXName
	dw wTrainerName
	dw SwimmerName
	dw wTrainerName
	dw wTrainerName
	dw BeautyName
	dw wTrainerName
	dw RockerName
	dw JugglerName
	dw wTrainerName
	dw wTrainerName
	dw BlackbeltName
	dw wTrainerName
	dw ProfOakName
	dw ChiefName
	dw ScientistName
	dw wTrainerName
	dw RocketName
	dw CooltrainerMName
	dw CooltrainerFName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName
	dw wTrainerName

YoungsterName:
	db "YOUNGSTER@"
BugCatcherName:
	db "BUG CATCHER@"
LassName:
	db "LASS@"
JrTrainerMName:
	db "JR.TRAINER♂@"
JrTrainerFName:
	db "JR.TRAINER♀@"
PokemaniacName:
	db "POKéMANIAC@"
SuperNerdName:
	db "SUPER NERD@"
BurglarName:
	db "BURGLAR@"
EngineerName:
	db "ENGINEER@"
JugglerXName:
	db "JUGGLER@"
SwimmerName:
	db "SWIMMER@"
BeautyName:
	db "BEAUTY@"
RockerName:
	db "ROCKER@"
JugglerName:
	db "JUGGLER@"
BlackbeltName:
	db "BLACKBELT@"
ProfOakName:
	db "PROF.OAK@"
ChiefName:
	db "CHIEF@"
ScientistName:
	db "SCIENTIST@"
RocketName:
	db "ROCKET@"
CooltrainerMName:
	db "COOLTRAINER♂@"
CooltrainerFName:
	db "COOLTRAINER♀@"
