BulbasaurBaseStats: ; 383de (e:43de)
	db DEX_BULBASAUR ; pokedex id
	db 45 ; base hp
	db 49 ; base attack
	db 49 ; base defense
	db 45 ; base speed
	db 65 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 64 ; base exp yield
	db $55 ; sprite dimensions

	dw BulbasaurPicFront
	dw BulbasaurPicBack

	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

IvysaurBaseStats: ; 383fa (e:43fa)
	db DEX_IVYSAUR ; pokedex id
	db 60 ; base hp
	db 62 ; base attack
	db 63 ; base defense
	db 60 ; base speed
	db 80 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 141 ; base exp yield
	db $66 ; sprite dimensions

	dw IvysaurPicFront
	dw IvysaurPicBack

	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db LEECH_SEED
	db 0

	db 3 ; growth rate

	; learnset
	db %10100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

VenusaurBaseStats: ; 38416 (e:4416)
	db DEX_VENUSAUR ; pokedex id
	db 80 ; base hp
	db 82 ; base attack
	db 83 ; base defense
	db 80 ; base speed
	db 100 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 208 ; base exp yield
	db $77 ; sprite dimensions

	dw VenusaurPicFront
	dw VenusaurPicBack

	; attacks known at lvl 0
	db TACKLE
	db GROWL
	db LEECH_SEED
	db VINE_WHIP

	db 3 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

CharmanderBaseStats: ; 38432 (e:4432)
	db DEX_CHARMANDER ; pokedex id
	db 39 ; base hp
	db 52 ; base attack
	db 43 ; base defense
	db 65 ; base speed
	db 50 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 45 ; catch rate
	db 65 ; base exp yield
	db $55 ; sprite dimensions

	dw CharmanderPicFront
	dw CharmanderPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10110101
	db %00000011
	db %01001111
	db %11001000
	db %11100011
	db %00001000
	db %00100110

	db 0 ; padding

CharmeleonBaseStats: ; 3844e (e:444e)
	db DEX_CHARMELEON ; pokedex id
	db 58 ; base hp
	db 64 ; base attack
	db 58 ; base defense
	db 80 ; base speed
	db 65 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 45 ; catch rate
	db 142 ; base exp yield
	db $66 ; sprite dimensions

	dw CharmeleonPicFront
	dw CharmeleonPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db EMBER
	db 0

	db 3 ; growth rate

	; learnset
	db %10110101
	db %00000011
	db %01001111
	db %11001000
	db %11100011
	db %00001000
	db %00100110

	db 0 ; padding

CharizardBaseStats: ; 3846a (e:446a)
	db DEX_CHARIZARD ; pokedex id
	db 78 ; base hp
	db 84 ; base attack
	db 78 ; base defense
	db 100 ; base speed
	db 85 ; base special

	db FIRE ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 209 ; base exp yield
	db $77 ; sprite dimensions

	dw CharizardPicFront
	dw CharizardPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db EMBER
	db LEER

	db 3 ; growth rate

	; learnset
	db %10110101
	db %01000011
	db %01001111
	db %11001110
	db %11100011
	db %00001000
	db %00100110

	db 0 ; padding

SquirtleBaseStats: ; 38486 (e:4486)
	db DEX_SQUIRTLE ; pokedex id
	db 44 ; base hp
	db 48 ; base attack
	db 65 ; base defense
	db 43 ; base speed
	db 50 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 66 ; base exp yield
	db $55 ; sprite dimensions

	dw SquirtlePicFront
	dw SquirtlePicBack

	; attacks known at lvl 0
	db TACKLE
	db TAIL_WHIP
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %00001111
	db %11001000
	db %10000011
	db %00001000
	db %00110010

	db 0 ; padding

WartortleBaseStats: ; 384a2 (e:44a2)
	db DEX_WARTORTLE ; pokedex id
	db 59 ; base hp
	db 63 ; base attack
	db 80 ; base defense
	db 58 ; base speed
	db 65 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 143 ; base exp yield
	db $66 ; sprite dimensions

	dw WartortlePicFront
	dw WartortlePicBack

	; attacks known at lvl 0
	db TACKLE
	db TAIL_WHIP
	db BUBBLE
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %00001111
	db %11001000
	db %10000011
	db %00001000
	db %00110010

	db 0 ; padding

BlastoiseBaseStats: ; 384be (e:44be)
	db DEX_BLASTOISE ; pokedex id
	db 79 ; base hp
	db 83 ; base attack
	db 100 ; base defense
	db 78 ; base speed
	db 85 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 210 ; base exp yield
	db $77 ; sprite dimensions

	dw BlastoisePicFront
	dw BlastoisePicBack

	; attacks known at lvl 0
	db TACKLE
	db TAIL_WHIP
	db BUBBLE
	db WATER_GUN

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %00001111
	db %11001110
	db %10000011
	db %00001000
	db %00110010

	db 0 ; padding

CaterpieBaseStats: ; 384da (e:44da)
	db DEX_CATERPIE ; pokedex id
	db 45 ; base hp
	db 30 ; base attack
	db 35 ; base defense
	db 45 ; base speed
	db 20 ; base special

	db BUG ; species type 1
	db BUG ; species type 2

	db 255 ; catch rate
	db 53 ; base exp yield
	db $55 ; sprite dimensions

	dw CaterpiePicFront
	dw CaterpiePicBack

	; attacks known at lvl 0
	db TACKLE
	db STRING_SHOT
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

MetapodBaseStats: ; 384f6 (e:44f6)
	db DEX_METAPOD ; pokedex id
	db 50 ; base hp
	db 20 ; base attack
	db 55 ; base defense
	db 30 ; base speed
	db 25 ; base special

	db BUG ; species type 1
	db BUG ; species type 2

	db 120 ; catch rate
	db 72 ; base exp yield
	db $55 ; sprite dimensions

	dw MetapodPicFront
	dw MetapodPicBack

	; attacks known at lvl 0
	db HARDEN
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

ButterfreeBaseStats: ; 38512 (e:4512)
	db DEX_BUTTERFREE ; pokedex id
	db 60 ; base hp
	db 45 ; base attack
	db 50 ; base defense
	db 70 ; base speed
	db 80 ; base special

	db BUG ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 160 ; base exp yield
	db $77 ; sprite dimensions

	dw ButterfreePicFront
	dw ButterfreePicBack

	; attacks known at lvl 0
	db CONFUSION
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00111000
	db %11110000
	db %01000011
	db %00101000
	db %00000010

	db 0 ; padding

WeedleBaseStats: ; 3852e (e:452e)
	db DEX_WEEDLE ; pokedex id
	db 40 ; base hp
	db 35 ; base attack
	db 30 ; base defense
	db 50 ; base speed
	db 20 ; base special

	db BUG ; species type 1
	db POISON ; species type 2

	db 255 ; catch rate
	db 52 ; base exp yield
	db $55 ; sprite dimensions

	dw WeedlePicFront
	dw WeedlePicBack

	; attacks known at lvl 0
	db POISON_STING
	db STRING_SHOT
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

KakunaBaseStats: ; 3854a (e:454a)
	db DEX_KAKUNA ; pokedex id
	db 45 ; base hp
	db 25 ; base attack
	db 50 ; base defense
	db 35 ; base speed
	db 25 ; base special

	db BUG ; species type 1
	db POISON ; species type 2

	db 120 ; catch rate
	db 71 ; base exp yield
	db $55 ; sprite dimensions

	dw KakunaPicFront
	dw KakunaPicBack

	; attacks known at lvl 0
	db HARDEN
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

BeedrillBaseStats: ; 38566 (e:4566)
	db DEX_BEEDRILL ; pokedex id
	db 65 ; base hp
	db 80 ; base attack
	db 40 ; base defense
	db 75 ; base speed
	db 45 ; base special

	db BUG ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 159 ; base exp yield
	db $77 ; sprite dimensions

	dw BeedrillPicFront
	dw BeedrillPicBack

	; attacks known at lvl 0
	db FURY_ATTACK
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100100
	db %01000011
	db %00011000
	db %11000000
	db %11000011
	db %00001000
	db %00000110

	db 0 ; padding

PidgeyBaseStats: ; 38582 (e:4582)
	db DEX_PIDGEY ; pokedex id
	db 40 ; base hp
	db 45 ; base attack
	db 40 ; base defense
	db 56 ; base speed
	db 35 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 255 ; catch rate
	db 55 ; base exp yield
	db $55 ; sprite dimensions

	dw PidgeyPicFront
	dw PidgeyPicBack

	; attacks known at lvl 0
	db GUST
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %00101010
	db %00000011
	db %00001000
	db %11000000
	db %01000011
	db %00001100
	db %00001010

	db 0 ; padding

PidgeottoBaseStats: ; 3859e (e:459e)
	db DEX_PIDGEOTTO ; pokedex id
	db 63 ; base hp
	db 60 ; base attack
	db 55 ; base defense
	db 71 ; base speed
	db 50 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 120 ; catch rate
	db 113 ; base exp yield
	db $66 ; sprite dimensions

	dw PidgeottoPicFront
	dw PidgeottoPicBack

	; attacks known at lvl 0
	db GUST
	db SAND_ATTACK
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %00101010
	db %00000011
	db %00001000
	db %11000000
	db %01000011
	db %00001100
	db %00001010

	db 0 ; padding

PidgeotBaseStats: ; 385ba (e:45ba)
	db DEX_PIDGEOT ; pokedex id
	db 83 ; base hp
	db 80 ; base attack
	db 75 ; base defense
	db 91 ; base speed
	db 70 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 172 ; base exp yield
	db $77 ; sprite dimensions

	dw PidgeotPicFront
	dw PidgeotPicBack

	; attacks known at lvl 0
	db GUST
	db SAND_ATTACK
	db QUICK_ATTACK
	db 0

	db 3 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00001000
	db %11000000
	db %01000011
	db %00001100
	db %00001010

	db 0 ; padding

RattataBaseStats: ; 385d6 (e:45d6)
	db DEX_RATTATA ; pokedex id
	db 30 ; base hp
	db 56 ; base attack
	db 35 ; base defense
	db 72 ; base speed
	db 25 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 255 ; catch rate
	db 57 ; base exp yield
	db $55 ; sprite dimensions

	dw RattataPicFront
	dw RattataPicBack

	; attacks known at lvl 0
	db TACKLE
	db TAIL_WHIP
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00101111
	db %10001000
	db %11001001
	db %11000010
	db %00001000
	db %00000010

	db 0 ; padding

RaticateBaseStats: ; 385f2 (e:45f2)
	db DEX_RATICATE ; pokedex id
	db 55 ; base hp
	db 81 ; base attack
	db 60 ; base defense
	db 97 ; base speed
	db 50 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 90 ; catch rate
	db 116 ; base exp yield
	db $66 ; sprite dimensions

	dw RaticatePicFront
	dw RaticatePicBack

	; attacks known at lvl 0
	db TACKLE
	db TAIL_WHIP
	db QUICK_ATTACK
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01111111
	db %10001000
	db %11001001
	db %11000010
	db %00001000
	db %00000010

	db 0 ; padding

SpearowBaseStats: ; 3860e (e:460e)
	db DEX_SPEAROW ; pokedex id
	db 40 ; base hp
	db 60 ; base attack
	db 30 ; base defense
	db 70 ; base speed
	db 31 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 255 ; catch rate
	db 58 ; base exp yield
	db $55 ; sprite dimensions

	dw SpearowPicFront
	dw SpearowPicBack

	; attacks known at lvl 0
	db PECK
	db GROWL
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00101010
	db %00000011
	db %00001000
	db %11000000
	db %01000010
	db %00001100
	db %00001010

	db 0 ; padding

FearowBaseStats: ; 3862a (e:462a)
	db DEX_FEAROW ; pokedex id
	db 65 ; base hp
	db 90 ; base attack
	db 65 ; base defense
	db 100 ; base speed
	db 61 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 90 ; catch rate
	db 162 ; base exp yield
	db $77 ; sprite dimensions

	dw FearowPicFront
	dw FearowPicBack

	; attacks known at lvl 0
	db PECK
	db GROWL
	db LEER
	db 0

	db 0 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00001000
	db %11000000
	db %01000010
	db %00001100
	db %00001010

	db 0 ; padding

EkansBaseStats: ; 38646 (e:4646)
	db DEX_EKANS ; pokedex id
	db 35 ; base hp
	db 60 ; base attack
	db 44 ; base defense
	db 55 ; base speed
	db 40 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 255 ; catch rate
	db 62 ; base exp yield
	db $55 ; sprite dimensions

	dw EkansPicFront
	dw EkansPicBack

	; attacks known at lvl 0
	db WRAP
	db LEER
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %00011000
	db %11001110
	db %10000010
	db %10001000
	db %00100010

	db 0 ; padding

ArbokBaseStats: ; 38662 (e:4662)
	db DEX_ARBOK ; pokedex id
	db 60 ; base hp
	db 85 ; base attack
	db 69 ; base defense
	db 80 ; base speed
	db 65 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 90 ; catch rate
	db 147 ; base exp yield
	db $77 ; sprite dimensions

	dw ArbokPicFront
	dw ArbokPicBack

	; attacks known at lvl 0
	db WRAP
	db LEER
	db POISON_STING
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %00011000
	db %11001110
	db %10000010
	db %10001000
	db %00100010

	db 0 ; padding

PikachuBaseStats: ; 3867e (e:467e)
	db DEX_PIKACHU ; pokedex id
	db 35 ; base hp
	db 55 ; base attack
	db 30 ; base defense
	db 90 ; base speed
	db 50 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 190 ; catch rate
	db 82 ; base exp yield
	db $55 ; sprite dimensions

	dw PikachuPicFront
	dw PikachuPicBack

	; attacks known at lvl 0
	db THUNDERSHOCK
	db GROWL
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %10000011
	db %10001101
	db %11000001
	db %11000011
	db %00011000
	db %01000010

	db 0 ; padding

RaichuBaseStats: ; 3869a (e:469a)
	db DEX_RAICHU ; pokedex id
	db 60 ; base hp
	db 90 ; base attack
	db 55 ; base defense
	db 100 ; base speed
	db 90 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 75 ; catch rate
	db 122 ; base exp yield
	db $77 ; sprite dimensions

	dw RaichuPicFront
	dw RaichuPicBack

	; attacks known at lvl 0
	db THUNDERSHOCK
	db GROWL
	db THUNDER_WAVE
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %11000011
	db %10001101
	db %11000001
	db %11000011
	db %00011000
	db %01000010

	db 0 ; padding

SandshrewBaseStats: ; 386b6 (e:46b6)
	db DEX_SANDSHREW ; pokedex id
	db 50 ; base hp
	db 75 ; base attack
	db 85 ; base defense
	db 40 ; base speed
	db 30 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 255 ; catch rate
	db 93 ; base exp yield
	db $55 ; sprite dimensions

	dw SandshrewPicFront
	dw SandshrewPicBack

	; attacks known at lvl 0
	db SCRATCH
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %00000011
	db %00001101
	db %11001110
	db %11000010
	db %10001000
	db %00100110

	db 0 ; padding

SandslashBaseStats: ; 386d2 (e:46d2)
	db DEX_SANDSLASH ; pokedex id
	db 75 ; base hp
	db 100 ; base attack
	db 110 ; base defense
	db 65 ; base speed
	db 55 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 90 ; catch rate
	db 163 ; base exp yield
	db $66 ; sprite dimensions

	dw SandslashPicFront
	dw SandslashPicBack

	; attacks known at lvl 0
	db SCRATCH
	db SAND_ATTACK
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00001101
	db %11001110
	db %11000010
	db %10001000
	db %00100110

	db 0 ; padding

NidoranFBaseStats: ; 386ee (e:46ee)
	db DEX_NIDORAN_F ; pokedex id
	db 55 ; base hp
	db 47 ; base attack
	db 52 ; base defense
	db 41 ; base speed
	db 40 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 235 ; catch rate
	db 59 ; base exp yield
	db $55 ; sprite dimensions

	dw NidoranFPicFront
	dw NidoranFPicBack

	; attacks known at lvl 0
	db GROWL
	db TACKLE
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10100000
	db %00100011
	db %10001000
	db %11000001
	db %10000011
	db %00001000
	db %00000010

	db 0 ; padding

NidorinaBaseStats: ; 3870a (e:470a)
	db DEX_NIDORINA ; pokedex id
	db 70 ; base hp
	db 62 ; base attack
	db 67 ; base defense
	db 56 ; base speed
	db 55 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 120 ; catch rate
	db 117 ; base exp yield
	db $66 ; sprite dimensions

	dw NidorinaPicFront
	dw NidorinaPicBack

	; attacks known at lvl 0
	db GROWL
	db TACKLE
	db SCRATCH
	db 0

	db 3 ; growth rate

	; learnset
	db %11100000
	db %00111111
	db %10001000
	db %11000001
	db %10000011
	db %00001000
	db %00000010

	db 0 ; padding

NidoqueenBaseStats: ; 38726 (e:4726)
	db DEX_NIDOQUEEN ; pokedex id
	db 90 ; base hp
	db 82 ; base attack
	db 87 ; base defense
	db 76 ; base speed
	db 75 ; base special

	db POISON ; species type 1
	db GROUND ; species type 2

	db 45 ; catch rate
	db 194 ; base exp yield
	db $77 ; sprite dimensions

	dw NidoqueenPicFront
	dw NidoqueenPicBack

	; attacks known at lvl 0
	db TACKLE
	db SCRATCH
	db TAIL_WHIP
	db BODY_SLAM

	db 3 ; growth rate

	; learnset
	db %11110001
	db %11111111
	db %10001111
	db %11000111
	db %10100011
	db %10001000
	db %00110010

	db 0 ; padding

NidoranMBaseStats: ; 38742 (e:4742)
	db DEX_NIDORAN_M ; pokedex id
	db 46 ; base hp
	db 57 ; base attack
	db 40 ; base defense
	db 50 ; base speed
	db 40 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 235 ; catch rate
	db 60 ; base exp yield
	db $55 ; sprite dimensions

	dw NidoranMPicFront
	dw NidoranMPicBack

	; attacks known at lvl 0
	db LEER
	db TACKLE
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %11100000
	db %00100011
	db %10001000
	db %11000001
	db %10000011
	db %00001000
	db %00000010

	db 0 ; padding

NidorinoBaseStats: ; 3875e (e:475e)
	db DEX_NIDORINO ; pokedex id
	db 61 ; base hp
	db 72 ; base attack
	db 57 ; base defense
	db 65 ; base speed
	db 55 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 120 ; catch rate
	db 118 ; base exp yield
	db $66 ; sprite dimensions

	dw NidorinoPicFront
	dw NidorinoPicBack

	; attacks known at lvl 0
	db LEER
	db TACKLE
	db HORN_ATTACK
	db 0

	db 3 ; growth rate

	; learnset
	db %11100000
	db %00111111
	db %10001000
	db %11000001
	db %10000011
	db %00001000
	db %00000010

	db 0 ; padding

NidokingBaseStats: ; 3877a (e:477a)
	db DEX_NIDOKING ; pokedex id
	db 81 ; base hp
	db 92 ; base attack
	db 77 ; base defense
	db 85 ; base speed
	db 75 ; base special

	db POISON ; species type 1
	db GROUND ; species type 2

	db 45 ; catch rate
	db 195 ; base exp yield
	db $77 ; sprite dimensions

	dw NidokingPicFront
	dw NidokingPicBack

	; attacks known at lvl 0
	db TACKLE
	db HORN_ATTACK
	db POISON_STING
	db THRASH

	db 3 ; growth rate

	; learnset
	db %11110001
	db %11111111
	db %10001111
	db %11000111
	db %10100011
	db %10001000
	db %00110010

	db 0 ; padding

ClefairyBaseStats: ; 38796 (e:4796)
	db DEX_CLEFAIRY ; pokedex id
	db 70 ; base hp
	db 45 ; base attack
	db 48 ; base defense
	db 35 ; base speed
	db 60 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 150 ; catch rate
	db 68 ; base exp yield
	db $55 ; sprite dimensions

	dw ClefairyPicFront
	dw ClefairyPicBack

	; attacks known at lvl 0
	db POUND
	db GROWL
	db 0
	db 0

	db 4 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %10101111
	db %11110001
	db %10100111
	db %00111000
	db %01100011

	db 0 ; padding

ClefableBaseStats: ; 387b2 (e:47b2)
	db DEX_CLEFABLE ; pokedex id
	db 95 ; base hp
	db 70 ; base attack
	db 73 ; base defense
	db 60 ; base speed
	db 85 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 25 ; catch rate
	db 129 ; base exp yield
	db $66 ; sprite dimensions

	dw ClefablePicFront
	dw ClefablePicBack

	; attacks known at lvl 0
	db SING
	db DOUBLESLAP
	db MINIMIZE
	db METRONOME

	db 4 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %10101111
	db %11110001
	db %10100111
	db %00111000
	db %01100011

	db 0 ; padding

VulpixBaseStats: ; 387ce (e:47ce)
	db DEX_VULPIX ; pokedex id
	db 38 ; base hp
	db 41 ; base attack
	db 40 ; base defense
	db 65 ; base speed
	db 65 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 190 ; catch rate
	db 63 ; base exp yield
	db $66 ; sprite dimensions

	dw VulpixPicFront
	dw VulpixPicBack

	; attacks known at lvl 0
	db EMBER
	db TAIL_WHIP
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %00001000
	db %11001000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

NinetalesBaseStats: ; 387ea (e:47ea)
	db DEX_NINETALES ; pokedex id
	db 73 ; base hp
	db 76 ; base attack
	db 75 ; base defense
	db 100 ; base speed
	db 100 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 75 ; catch rate
	db 178 ; base exp yield
	db $77 ; sprite dimensions

	dw NinetalesPicFront
	dw NinetalesPicBack

	; attacks known at lvl 0
	db EMBER
	db TAIL_WHIP
	db QUICK_ATTACK
	db ROAR

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %00001000
	db %11001000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

JigglypuffBaseStats: ; 38806 (e:4806)
	db DEX_JIGGLYPUFF ; pokedex id
	db 115 ; base hp
	db 45 ; base attack
	db 20 ; base defense
	db 20 ; base speed
	db 25 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 170 ; catch rate
	db 76 ; base exp yield
	db $55 ; sprite dimensions

	dw JigglypuffPicFront
	dw JigglypuffPicBack

	; attacks known at lvl 0
	db SING
	db 0
	db 0
	db 0

	db 4 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %10101111
	db %11110001
	db %10100011
	db %00111000
	db %01100011

	db 0 ; padding

WigglytuffBaseStats: ; 38822 (e:4822)
	db DEX_WIGGLYTUFF ; pokedex id
	db 140 ; base hp
	db 70 ; base attack
	db 45 ; base defense
	db 45 ; base speed
	db 50 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 50 ; catch rate
	db 109 ; base exp yield
	db $66 ; sprite dimensions

	dw WigglytuffPicFront
	dw WigglytuffPicBack

	; attacks known at lvl 0
	db SING
	db DISABLE
	db DEFENSE_CURL
	db DOUBLESLAP

	db 4 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %10101111
	db %11110001
	db %10100011
	db %00111000
	db %01100011

	db 0 ; padding

ZubatBaseStats: ; 3883e (e:483e)
	db DEX_ZUBAT ; pokedex id
	db 40 ; base hp
	db 45 ; base attack
	db 35 ; base defense
	db 55 ; base speed
	db 40 ; base special

	db POISON ; species type 1
	db FLYING ; species type 2

	db 255 ; catch rate
	db 54 ; base exp yield
	db $55 ; sprite dimensions

	dw ZubatPicFront
	dw ZubatPicBack

	; attacks known at lvl 0
	db LEECH_LIFE
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00101010
	db %00000011
	db %00011000
	db %11000000
	db %01000010
	db %00001000
	db %00000010

	db 0 ; padding

GolbatBaseStats: ; 3885a (e:485a)
	db DEX_GOLBAT ; pokedex id
	db 75 ; base hp
	db 80 ; base attack
	db 70 ; base defense
	db 90 ; base speed
	db 75 ; base special

	db POISON ; species type 1
	db FLYING ; species type 2

	db 90 ; catch rate
	db 171 ; base exp yield
	db $77 ; sprite dimensions

	dw GolbatPicFront
	dw GolbatPicBack

	; attacks known at lvl 0
	db LEECH_LIFE
	db SCREECH
	db BITE
	db 0

	db 0 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00011000
	db %11000000
	db %01000010
	db %00001000
	db %00000010

	db 0 ; padding

OddishBaseStats: ; 38876 (e:4876)
	db DEX_ODDISH ; pokedex id
	db 45 ; base hp
	db 50 ; base attack
	db 55 ; base defense
	db 30 ; base speed
	db 75 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 255 ; catch rate
	db 78 ; base exp yield
	db $55 ; sprite dimensions

	dw OddishPicFront
	dw OddishPicBack

	; attacks known at lvl 0
	db ABSORB
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %00100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

GloomBaseStats: ; 38892 (e:4892)
	db DEX_GLOOM ; pokedex id
	db 60 ; base hp
	db 65 ; base attack
	db 70 ; base defense
	db 40 ; base speed
	db 85 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 120 ; catch rate
	db 132 ; base exp yield
	db $66 ; sprite dimensions

	dw GloomPicFront
	dw GloomPicBack

	; attacks known at lvl 0
	db ABSORB
	db POISONPOWDER
	db STUN_SPORE
	db 0

	db 3 ; growth rate

	; learnset
	db %00100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

VileplumeBaseStats: ; 388ae (e:48ae)
	db DEX_VILEPLUME ; pokedex id
	db 75 ; base hp
	db 80 ; base attack
	db 85 ; base defense
	db 50 ; base speed
	db 100 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 184 ; base exp yield
	db $77 ; sprite dimensions

	dw VileplumePicFront
	dw VileplumePicBack

	; attacks known at lvl 0
	db STUN_SPORE
	db SLEEP_POWDER
	db ACID
	db PETAL_DANCE

	db 3 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

ParasBaseStats: ; 388ca (e:48ca)
	db DEX_PARAS ; pokedex id
	db 35 ; base hp
	db 70 ; base attack
	db 55 ; base defense
	db 25 ; base speed
	db 55 ; base special

	db BUG ; species type 1
	db GRASS ; species type 2

	db 190 ; catch rate
	db 70 ; base exp yield
	db $55 ; sprite dimensions

	dw ParasPicFront
	dw ParasPicBack

	; attacks known at lvl 0
	db SCRATCH
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %00000011
	db %00111000
	db %11001000
	db %10000011
	db %00001000
	db %00000110

	db 0 ; padding

ParasectBaseStats: ; 388e6 (e:48e6)
	db DEX_PARASECT ; pokedex id
	db 60 ; base hp
	db 95 ; base attack
	db 80 ; base defense
	db 30 ; base speed
	db 80 ; base special

	db BUG ; species type 1
	db GRASS ; species type 2

	db 75 ; catch rate
	db 128 ; base exp yield
	db $77 ; sprite dimensions

	dw ParasectPicFront
	dw ParasectPicBack

	; attacks known at lvl 0
	db SCRATCH
	db STUN_SPORE
	db LEECH_LIFE
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00111000
	db %11001000
	db %10000011
	db %00001000
	db %00000110

	db 0 ; padding

VenonatBaseStats: ; 38902 (e:4902)
	db DEX_VENONAT ; pokedex id
	db 60 ; base hp
	db 55 ; base attack
	db 50 ; base defense
	db 45 ; base speed
	db 40 ; base special

	db BUG ; species type 1
	db POISON ; species type 2

	db 190 ; catch rate
	db 75 ; base exp yield
	db $55 ; sprite dimensions

	dw VenonatPicFront
	dw VenonatPicBack

	; attacks known at lvl 0
	db TACKLE
	db DISABLE
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %00000011
	db %00111000
	db %11010000
	db %00000011
	db %00101000
	db %00000010

	db 0 ; padding

VenomothBaseStats: ; 3891e (e:491e)
	db DEX_VENOMOTH ; pokedex id
	db 70 ; base hp
	db 65 ; base attack
	db 60 ; base defense
	db 90 ; base speed
	db 90 ; base special

	db BUG ; species type 1
	db POISON ; species type 2

	db 75 ; catch rate
	db 138 ; base exp yield
	db $77 ; sprite dimensions

	dw VenomothPicFront
	dw VenomothPicBack

	; attacks known at lvl 0
	db TACKLE
	db DISABLE
	db POISONPOWDER
	db LEECH_LIFE

	db 0 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00111000
	db %11110000
	db %01000011
	db %00101000
	db %00000010

	db 0 ; padding

DiglettBaseStats: ; 3893a (e:493a)
	db DEX_DIGLETT ; pokedex id
	db 10 ; base hp
	db 55 ; base attack
	db 25 ; base defense
	db 95 ; base speed
	db 45 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 255 ; catch rate
	db 81 ; base exp yield
	db $55 ; sprite dimensions

	dw DiglettPicFront
	dw DiglettPicBack

	; attacks known at lvl 0
	db SCRATCH
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %00001000
	db %11001110
	db %00000010
	db %10001000
	db %00000010

	db 0 ; padding

DugtrioBaseStats: ; 38956 (e:4956)
	db DEX_DUGTRIO ; pokedex id
	db 35 ; base hp
	db 80 ; base attack
	db 50 ; base defense
	db 120 ; base speed
	db 70 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 50 ; catch rate
	db 153 ; base exp yield
	db $66 ; sprite dimensions

	dw DugtrioPicFront
	dw DugtrioPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db DIG
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %00001000
	db %11001110
	db %00000010
	db %10001000
	db %00000010

	db 0 ; padding

MeowthBaseStats: ; 38972 (e:4972)
	db DEX_MEOWTH ; pokedex id
	db 40 ; base hp
	db 45 ; base attack
	db 35 ; base defense
	db 90 ; base speed
	db 40 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 255 ; catch rate
	db 69 ; base exp yield
	db $55 ; sprite dimensions

	dw MeowthPicFront
	dw MeowthPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %10001111
	db %10001000
	db %11000001
	db %11000010
	db %00001000
	db %00000010

	db 0 ; padding

PersianBaseStats: ; 3898e (e:498e)
	db DEX_PERSIAN ; pokedex id
	db 65 ; base hp
	db 70 ; base attack
	db 60 ; base defense
	db 115 ; base speed
	db 65 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 90 ; catch rate
	db 148 ; base exp yield
	db $77 ; sprite dimensions

	dw PersianPicFront
	dw PersianPicBack

	; attacks known at lvl 0
	db SCRATCH
	db GROWL
	db BITE
	db SCREECH

	db 0 ; growth rate

	; learnset
	db %10100000
	db %11001111
	db %10001000
	db %11000001
	db %11000010
	db %00001000
	db %00000010

	db 0 ; padding

PsyduckBaseStats: ; 389aa (e:49aa)
	db DEX_PSYDUCK ; pokedex id
	db 50 ; base hp
	db 52 ; base attack
	db 48 ; base defense
	db 55 ; base speed
	db 50 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 190 ; catch rate
	db 80 ; base exp yield
	db $55 ; sprite dimensions

	dw PsyduckPicFront
	dw PsyduckPicBack

	; attacks known at lvl 0
	db SCRATCH
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %10111111
	db %00001111
	db %11001000
	db %11000010
	db %00001000
	db %00110010

	db 0 ; padding

GolduckBaseStats: ; 389c6 (e:49c6)
	db DEX_GOLDUCK ; pokedex id
	db 80 ; base hp
	db 82 ; base attack
	db 78 ; base defense
	db 85 ; base speed
	db 80 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 75 ; catch rate
	db 174 ; base exp yield
	db $77 ; sprite dimensions

	dw GolduckPicFront
	dw GolduckPicBack

	; attacks known at lvl 0
	db SCRATCH
	db TAIL_WHIP
	db DISABLE
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %11111111
	db %00001111
	db %11001000
	db %11000010
	db %00001000
	db %00110010

	db 0 ; padding

MankeyBaseStats: ; 389e2 (e:49e2)
	db DEX_MANKEY ; pokedex id
	db 40 ; base hp
	db 80 ; base attack
	db 35 ; base defense
	db 70 ; base speed
	db 35 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 190 ; catch rate
	db 74 ; base exp yield
	db $55 ; sprite dimensions

	dw MankeyPicFront
	dw MankeyPicBack

	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %10000011
	db %10001111
	db %11001001
	db %11000110
	db %10001000
	db %00100010

	db 0 ; padding

PrimeapeBaseStats: ; 389fe (e:49fe)
	db DEX_PRIMEAPE ; pokedex id
	db 65 ; base hp
	db 105 ; base attack
	db 60 ; base defense
	db 95 ; base speed
	db 60 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 75 ; catch rate
	db 149 ; base exp yield
	db $77 ; sprite dimensions

	dw PrimeapePicFront
	dw PrimeapePicBack

	; attacks known at lvl 0
	db SCRATCH
	db LEER
	db KARATE_CHOP
	db FURY_SWIPES

	db 0 ; growth rate

	; learnset
	db %10110001
	db %11000011
	db %10001111
	db %11001001
	db %11000110
	db %10001000
	db %00100010

	db 0 ; padding

GrowlitheBaseStats: ; 38a1a (e:4a1a)
	db DEX_GROWLITHE ; pokedex id
	db 55 ; base hp
	db 70 ; base attack
	db 45 ; base defense
	db 60 ; base speed
	db 50 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 190 ; catch rate
	db 91 ; base exp yield
	db $55 ; sprite dimensions

	dw GrowlithePicFront
	dw GrowlithePicBack

	; attacks known at lvl 0
	db BITE
	db ROAR
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %01001000
	db %11001000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

ArcanineBaseStats: ; 38a36 (e:4a36)
	db DEX_ARCANINE ; pokedex id
	db 90 ; base hp
	db 110 ; base attack
	db 80 ; base defense
	db 95 ; base speed
	db 80 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 75 ; catch rate
	db 213 ; base exp yield
	db $77 ; sprite dimensions

	dw ArcaninePicFront
	dw ArcaninePicBack

	; attacks known at lvl 0
	db ROAR
	db EMBER
	db LEER
	db TAKE_DOWN

	db 5 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %01001000
	db %11101000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

PoliwagBaseStats: ; 38a52 (e:4a52)
	db DEX_POLIWAG ; pokedex id
	db 40 ; base hp
	db 50 ; base attack
	db 40 ; base defense
	db 90 ; base speed
	db 40 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 255 ; catch rate
	db 77 ; base exp yield
	db $55 ; sprite dimensions

	dw PoliwagPicFront
	dw PoliwagPicBack

	; attacks known at lvl 0
	db BUBBLE
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10100000
	db %00111111
	db %00001000
	db %11010000
	db %10000010
	db %00101000
	db %00010010

	db 0 ; padding

PoliwhirlBaseStats: ; 38a6e (e:4a6e)
	db DEX_POLIWHIRL ; pokedex id
	db 65 ; base hp
	db 65 ; base attack
	db 65 ; base defense
	db 90 ; base speed
	db 50 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 120 ; catch rate
	db 131 ; base exp yield
	db $66 ; sprite dimensions

	dw PoliwhirlPicFront
	dw PoliwhirlPicBack

	; attacks known at lvl 0
	db BUBBLE
	db HYPNOSIS
	db WATER_GUN
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %00001111
	db %11010110
	db %10000110
	db %00101000
	db %00110010

	db 0 ; padding

PoliwrathBaseStats: ; 38a8a (e:4a8a)
	db DEX_POLIWRATH ; pokedex id
	db 90 ; base hp
	db 85 ; base attack
	db 95 ; base defense
	db 70 ; base speed
	db 70 ; base special

	db WATER ; species type 1
	db FIGHTING ; species type 2

	db 45 ; catch rate
	db 185 ; base exp yield
	db $77 ; sprite dimensions

	dw PoliwrathPicFront
	dw PoliwrathPicBack

	; attacks known at lvl 0
	db HYPNOSIS
	db WATER_GUN
	db DOUBLESLAP
	db BODY_SLAM

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %00001111
	db %11010110
	db %10000110
	db %00101000
	db %00110010

	db 0 ; padding

AbraBaseStats: ; 38aa6 (e:4aa6)
	db DEX_ABRA ; pokedex id
	db 25 ; base hp
	db 20 ; base attack
	db 15 ; base defense
	db 90 ; base speed
	db 105 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 200 ; catch rate
	db 73 ; base exp yield
	db $55 ; sprite dimensions

	dw AbraPicFront
	dw AbraPicBack

	; attacks known at lvl 0
	db TELEPORT
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11110000
	db %10000111
	db %00111000
	db %01000011

	db 0 ; padding

KadabraBaseStats: ; 38ac2 (e:4ac2)
	db DEX_KADABRA ; pokedex id
	db 40 ; base hp
	db 35 ; base attack
	db 30 ; base defense
	db 105 ; base speed
	db 120 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 100 ; catch rate
	db 145 ; base exp yield
	db $66 ; sprite dimensions

	dw KadabraPicFront
	dw KadabraPicBack

	; attacks known at lvl 0
	db TELEPORT
	db CONFUSION
	db DISABLE
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11111000
	db %10000111
	db %00111000
	db %01000011

	db 0 ; padding

AlakazamBaseStats: ; 38ade (e:4ade)
	db DEX_ALAKAZAM ; pokedex id
	db 55 ; base hp
	db 50 ; base attack
	db 45 ; base defense
	db 120 ; base speed
	db 135 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 50 ; catch rate
	db 186 ; base exp yield
	db $77 ; sprite dimensions

	dw AlakazamPicFront
	dw AlakazamPicBack

	; attacks known at lvl 0
	db TELEPORT
	db CONFUSION
	db DISABLE
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %00001111
	db %11111000
	db %10000111
	db %00111000
	db %01000011

	db 0 ; padding

MachopBaseStats: ; 38afa (e:4afa)
	db DEX_MACHOP ; pokedex id
	db 70 ; base hp
	db 80 ; base attack
	db 50 ; base defense
	db 35 ; base speed
	db 35 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 180 ; catch rate
	db 88 ; base exp yield
	db $55 ; sprite dimensions

	dw MachopPicFront
	dw MachopPicBack

	; attacks known at lvl 0
	db KARATE_CHOP
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11001110
	db %10100110
	db %10001000
	db %00100010

	db 0 ; padding

MachokeBaseStats: ; 38b16 (e:4b16)
	db DEX_MACHOKE ; pokedex id
	db 80 ; base hp
	db 100 ; base attack
	db 70 ; base defense
	db 45 ; base speed
	db 50 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 90 ; catch rate
	db 146 ; base exp yield
	db $77 ; sprite dimensions

	dw MachokePicFront
	dw MachokePicBack

	; attacks known at lvl 0
	db KARATE_CHOP
	db LOW_KICK
	db LEER
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11001110
	db %10100110
	db %10001000
	db %00100010

	db 0 ; padding

MachampBaseStats: ; 38b32 (e:4b32)
	db DEX_MACHAMP ; pokedex id
	db 90 ; base hp
	db 130 ; base attack
	db 80 ; base defense
	db 55 ; base speed
	db 65 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 45 ; catch rate
	db 193 ; base exp yield
	db $77 ; sprite dimensions

	dw MachampPicFront
	dw MachampPicBack

	; attacks known at lvl 0
	db KARATE_CHOP
	db LOW_KICK
	db LEER
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %00001111
	db %11001110
	db %10100110
	db %10001000
	db %00100010

	db 0 ; padding

BellsproutBaseStats: ; 38b4e (e:4b4e)
	db DEX_BELLSPROUT ; pokedex id
	db 50 ; base hp
	db 75 ; base attack
	db 35 ; base defense
	db 40 ; base speed
	db 70 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 255 ; catch rate
	db 84 ; base exp yield
	db $55 ; sprite dimensions

	dw BellsproutPicFront
	dw BellsproutPicBack

	; attacks known at lvl 0
	db VINE_WHIP
	db GROWTH
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %00100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

WeepinbellBaseStats: ; 38b6a (e:4b6a)
	db DEX_WEEPINBELL ; pokedex id
	db 65 ; base hp
	db 90 ; base attack
	db 50 ; base defense
	db 55 ; base speed
	db 85 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 120 ; catch rate
	db 151 ; base exp yield
	db $66 ; sprite dimensions

	dw WeepinbellPicFront
	dw WeepinbellPicBack

	; attacks known at lvl 0
	db VINE_WHIP
	db GROWTH
	db WRAP
	db 0

	db 3 ; growth rate

	; learnset
	db %00100100
	db %00000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

VictreebelBaseStats: ; 38b86 (e:4b86)
	db DEX_VICTREEBEL ; pokedex id
	db 80 ; base hp
	db 105 ; base attack
	db 65 ; base defense
	db 70 ; base speed
	db 100 ; base special

	db GRASS ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 191 ; base exp yield
	db $77 ; sprite dimensions

	dw VictreebelPicFront
	dw VictreebelPicBack

	; attacks known at lvl 0
	db SLEEP_POWDER
	db STUN_SPORE
	db ACID
	db RAZOR_LEAF

	db 3 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00111000
	db %11000000
	db %00000011
	db %00001000
	db %00000110

	db 0 ; padding

TentacoolBaseStats: ; 38ba2 (e:4ba2)
	db DEX_TENTACOOL ; pokedex id
	db 40 ; base hp
	db 40 ; base attack
	db 35 ; base defense
	db 70 ; base speed
	db 100 ; base special

	db WATER ; species type 1
	db POISON ; species type 2

	db 190 ; catch rate
	db 105 ; base exp yield
	db $55 ; sprite dimensions

	dw TentacoolPicFront
	dw TentacoolPicBack

	; attacks known at lvl 0
	db ACID
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00100100
	db %00111111
	db %00011000
	db %11000000
	db %10000011
	db %00001000
	db %00010110

	db 0 ; padding

TentacruelBaseStats: ; 38bbe (e:4bbe)
	db DEX_TENTACRUEL ; pokedex id
	db 80 ; base hp
	db 70 ; base attack
	db 65 ; base defense
	db 100 ; base speed
	db 120 ; base special

	db WATER ; species type 1
	db POISON ; species type 2

	db 60 ; catch rate
	db 205 ; base exp yield
	db $66 ; sprite dimensions

	dw TentacruelPicFront
	dw TentacruelPicBack

	; attacks known at lvl 0
	db ACID
	db SUPERSONIC
	db WRAP
	db 0

	db 5 ; growth rate

	; learnset
	db %00100100
	db %01111111
	db %00011000
	db %11000000
	db %10000011
	db %00001000
	db %00010110

	db 0 ; padding

GeodudeBaseStats: ; 38bda (e:4bda)
	db DEX_GEODUDE ; pokedex id
	db 40 ; base hp
	db 80 ; base attack
	db 100 ; base defense
	db 20 ; base speed
	db 30 ; base special

	db ROCK ; species type 1
	db GROUND ; species type 2

	db 255 ; catch rate
	db 86 ; base exp yield
	db $55 ; sprite dimensions

	dw GeodudePicFront
	dw GeodudePicBack

	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10100001
	db %00000011
	db %00001111
	db %11001110
	db %00101110
	db %11001000
	db %00100010

	db 0 ; padding

GravelerBaseStats: ; 38bf6 (e:4bf6)
	db DEX_GRAVELER ; pokedex id
	db 55 ; base hp
	db 95 ; base attack
	db 115 ; base defense
	db 35 ; base speed
	db 45 ; base special

	db ROCK ; species type 1
	db GROUND ; species type 2

	db 120 ; catch rate
	db 134 ; base exp yield
	db $66 ; sprite dimensions

	dw GravelerPicFront
	dw GravelerPicBack

	; attacks known at lvl 0
	db TACKLE
	db DEFENSE_CURL
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10100001
	db %00000011
	db %00001111
	db %11001110
	db %00101110
	db %11001000
	db %00100010

	db 0 ; padding

GolemBaseStats: ; 38c12 (e:4c12)
	db DEX_GOLEM ; pokedex id
	db 80 ; base hp
	db 110 ; base attack
	db 130 ; base defense
	db 45 ; base speed
	db 55 ; base special

	db ROCK ; species type 1
	db GROUND ; species type 2

	db 45 ; catch rate
	db 177 ; base exp yield
	db $66 ; sprite dimensions

	dw GolemPicFront
	dw GolemPicBack

	; attacks known at lvl 0
	db TACKLE
	db DEFENSE_CURL
	db 0
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %00001111
	db %11001110
	db %00101110
	db %11001000
	db %00100010

	db 0 ; padding

PonytaBaseStats: ; 38c2e (e:4c2e)
	db DEX_PONYTA ; pokedex id
	db 50 ; base hp
	db 85 ; base attack
	db 55 ; base defense
	db 90 ; base speed
	db 65 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 190 ; catch rate
	db 152 ; base exp yield
	db $66 ; sprite dimensions

	dw PonytaPicFront
	dw PonytaPicBack

	; attacks known at lvl 0
	db EMBER
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %11100000
	db %00000011
	db %00001000
	db %11000000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

RapidashBaseStats: ; 38c4a (e:4c4a)
	db DEX_RAPIDASH ; pokedex id
	db 65 ; base hp
	db 100 ; base attack
	db 70 ; base defense
	db 105 ; base speed
	db 80 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 60 ; catch rate
	db 192 ; base exp yield
	db $77 ; sprite dimensions

	dw RapidashPicFront
	dw RapidashPicBack

	; attacks known at lvl 0
	db EMBER
	db TAIL_WHIP
	db STOMP
	db GROWL

	db 0 ; growth rate

	; learnset
	db %11100000
	db %01000011
	db %00001000
	db %11000000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

SlowpokeBaseStats: ; 38c66 (e:4c66)
	db DEX_SLOWPOKE ; pokedex id
	db 90 ; base hp
	db 65 ; base attack
	db 65 ; base defense
	db 15 ; base speed
	db 40 ; base special

	db WATER ; species type 1
	db PSYCHIC ; species type 2

	db 190 ; catch rate
	db 99 ; base exp yield
	db $55 ; sprite dimensions

	dw SlowpokePicFront
	dw SlowpokePicBack

	; attacks known at lvl 0
	db CONFUSION
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %10111111
	db %00001000
	db %11111110
	db %11100011
	db %00111000
	db %01110011

	db 0 ; padding

SlowbroBaseStats: ; 38c82 (e:4c82)
	db DEX_SLOWBRO ; pokedex id
	db 95 ; base hp
	db 75 ; base attack
	db 110 ; base defense
	db 30 ; base speed
	db 80 ; base special

	db WATER ; species type 1
	db PSYCHIC ; species type 2

	db 75 ; catch rate
	db 164 ; base exp yield
	db $77 ; sprite dimensions

	dw SlowbroPicFront
	dw SlowbroPicBack

	; attacks known at lvl 0
	db CONFUSION
	db DISABLE
	db HEADBUTT
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %11111111
	db %00001111
	db %11111110
	db %11100011
	db %00111000
	db %01110011

	db 0 ; padding

MagnemiteBaseStats: ; 38c9e (e:4c9e)
	db DEX_MAGNEMITE ; pokedex id
	db 25 ; base hp
	db 35 ; base attack
	db 70 ; base defense
	db 45 ; base speed
	db 95 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 190 ; catch rate
	db 89 ; base exp yield
	db $55 ; sprite dimensions

	dw MagnemitePicFront
	dw MagnemitePicBack

	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %00000011
	db %10001000
	db %11100001
	db %01000011
	db %00011000
	db %01000010

	db 0 ; padding

MagnetonBaseStats: ; 38cba (e:4cba)
	db DEX_MAGNETON ; pokedex id
	db 50 ; base hp
	db 60 ; base attack
	db 95 ; base defense
	db 70 ; base speed
	db 120 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 60 ; catch rate
	db 161 ; base exp yield
	db $66 ; sprite dimensions

	dw MagnetonPicFront
	dw MagnetonPicBack

	; attacks known at lvl 0
	db TACKLE
	db SONICBOOM
	db THUNDERSHOCK
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %01000011
	db %10001000
	db %11100001
	db %01000011
	db %00011000
	db %01000010

	db 0 ; padding

FarfetchdBaseStats: ; 38cd6 (e:4cd6)
	db DEX_FARFETCH_D ; pokedex id
	db 52 ; base hp
	db 65 ; base attack
	db 55 ; base defense
	db 60 ; base speed
	db 58 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 94 ; base exp yield
	db $66 ; sprite dimensions

	dw FarfetchdPicFront
	dw FarfetchdPicBack

	; attacks known at lvl 0
	db PECK
	db SAND_ATTACK
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10101110
	db %00000011
	db %00001000
	db %11000000
	db %11000011
	db %00001000
	db %00001110

	db 0 ; padding

DoduoBaseStats: ; 38cf2 (e:4cf2)
	db DEX_DODUO ; pokedex id
	db 35 ; base hp
	db 85 ; base attack
	db 45 ; base defense
	db 75 ; base speed
	db 35 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 190 ; catch rate
	db 96 ; base exp yield
	db $55 ; sprite dimensions

	dw DoduoPicFront
	dw DoduoPicBack

	; attacks known at lvl 0
	db PECK
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10101000
	db %00000011
	db %00001000
	db %11000000
	db %10000011
	db %00001100
	db %00001011

	db 0 ; padding

DodrioBaseStats: ; 38d0e (e:4d0e)
	db DEX_DODRIO ; pokedex id
	db 60 ; base hp
	db 110 ; base attack
	db 70 ; base defense
	db 100 ; base speed
	db 60 ; base special

	db NORMAL ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 158 ; base exp yield
	db $77 ; sprite dimensions

	dw DodrioPicFront
	dw DodrioPicBack

	; attacks known at lvl 0
	db PECK
	db GROWL
	db FURY_ATTACK
	db 0

	db 0 ; growth rate

	; learnset
	db %10101000
	db %01000011
	db %00001000
	db %11000000
	db %10000011
	db %00001100
	db %00001011

	db 0 ; padding

SeelBaseStats: ; 38d2a (e:4d2a)
	db DEX_SEEL ; pokedex id
	db 65 ; base hp
	db 45 ; base attack
	db 55 ; base defense
	db 45 ; base speed
	db 70 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 190 ; catch rate
	db 100 ; base exp yield
	db $66 ; sprite dimensions

	dw SeelPicFront
	dw SeelPicBack

	; attacks known at lvl 0
	db HEADBUTT
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %11100000
	db %10111111
	db %00001000
	db %11000000
	db %10000010
	db %00001000
	db %00110010

	db 0 ; padding

DewgongBaseStats: ; 38d46 (e:4d46)
	db DEX_DEWGONG ; pokedex id
	db 90 ; base hp
	db 70 ; base attack
	db 80 ; base defense
	db 70 ; base speed
	db 95 ; base special

	db WATER ; species type 1
	db ICE ; species type 2

	db 75 ; catch rate
	db 176 ; base exp yield
	db $66 ; sprite dimensions

	dw DewgongPicFront
	dw DewgongPicBack

	; attacks known at lvl 0
	db HEADBUTT
	db GROWL
	db AURORA_BEAM
	db 0

	db 0 ; growth rate

	; learnset
	db %11100000
	db %11111111
	db %00001000
	db %11000000
	db %10000010
	db %00001000
	db %00110010

	db 0 ; padding

GrimerBaseStats: ; 38d62 (e:4d62)
	db DEX_GRIMER ; pokedex id
	db 80 ; base hp
	db 80 ; base attack
	db 50 ; base defense
	db 25 ; base speed
	db 40 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 190 ; catch rate
	db 90 ; base exp yield
	db $55 ; sprite dimensions

	dw GrimerPicFront
	dw GrimerPicBack

	; attacks known at lvl 0
	db POUND
	db DISABLE
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000000
	db %10011000
	db %11000001
	db %00101010
	db %01001000
	db %00000010

	db 0 ; padding

MukBaseStats: ; 38d7e (e:4d7e)
	db DEX_MUK ; pokedex id
	db 105 ; base hp
	db 105 ; base attack
	db 75 ; base defense
	db 50 ; base speed
	db 65 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 75 ; catch rate
	db 157 ; base exp yield
	db $77 ; sprite dimensions

	dw MukPicFront
	dw MukPicBack

	; attacks known at lvl 0
	db POUND
	db DISABLE
	db POISON_GAS
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000000
	db %10011000
	db %11000001
	db %00101010
	db %01001000
	db %00000010

	db 0 ; padding

ShellderBaseStats: ; 38d9a (e:4d9a)
	db DEX_SHELLDER ; pokedex id
	db 30 ; base hp
	db 65 ; base attack
	db 100 ; base defense
	db 40 ; base speed
	db 45 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 190 ; catch rate
	db 97 ; base exp yield
	db $55 ; sprite dimensions

	dw ShellderPicFront
	dw ShellderPicBack

	; attacks known at lvl 0
	db TACKLE
	db WITHDRAW
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00100000
	db %00111111
	db %00001000
	db %11100000
	db %01001011
	db %01001000
	db %00010011

	db 0 ; padding

CloysterBaseStats: ; 38db6 (e:4db6)
	db DEX_CLOYSTER ; pokedex id
	db 50 ; base hp
	db 95 ; base attack
	db 180 ; base defense
	db 70 ; base speed
	db 85 ; base special

	db WATER ; species type 1
	db ICE ; species type 2

	db 60 ; catch rate
	db 203 ; base exp yield
	db $77 ; sprite dimensions

	dw CloysterPicFront
	dw CloysterPicBack

	; attacks known at lvl 0
	db WITHDRAW
	db SUPERSONIC
	db CLAMP
	db AURORA_BEAM

	db 5 ; growth rate

	; learnset
	db %00100000
	db %01111111
	db %00001000
	db %11100000
	db %01001011
	db %01001000
	db %00010011

	db 0 ; padding

GastlyBaseStats: ; 38dd2 (e:4dd2)
	db DEX_GASTLY ; pokedex id
	db 30 ; base hp
	db 35 ; base attack
	db 30 ; base defense
	db 80 ; base speed
	db 100 ; base special

	db GHOST ; species type 1
	db POISON ; species type 2

	db 190 ; catch rate
	db 95 ; base exp yield
	db $77 ; sprite dimensions

	dw GastlyPicFront
	dw GastlyPicBack

	; attacks known at lvl 0
	db LICK
	db CONFUSE_RAY
	db NIGHT_SHADE
	db 0

	db 3 ; growth rate

	; learnset
	db %00100000
	db %00000000
	db %10011000
	db %11010001
	db %00001010
	db %01101010
	db %00000010

	db 0 ; padding

HaunterBaseStats: ; 38dee (e:4dee)
	db DEX_HAUNTER ; pokedex id
	db 45 ; base hp
	db 50 ; base attack
	db 45 ; base defense
	db 95 ; base speed
	db 115 ; base special

	db GHOST ; species type 1
	db POISON ; species type 2

	db 90 ; catch rate
	db 126 ; base exp yield
	db $66 ; sprite dimensions

	dw HaunterPicFront
	dw HaunterPicBack

	; attacks known at lvl 0
	db LICK
	db CONFUSE_RAY
	db NIGHT_SHADE
	db 0

	db 3 ; growth rate

	; learnset
	db %00100000
	db %00000000
	db %10011000
	db %11010001
	db %00001010
	db %01101010
	db %00000010

	db 0 ; padding

GengarBaseStats: ; 38e0a (e:4e0a)
	db DEX_GENGAR ; pokedex id
	db 60 ; base hp
	db 65 ; base attack
	db 60 ; base defense
	db 110 ; base speed
	db 130 ; base special

	db GHOST ; species type 1
	db POISON ; species type 2

	db 45 ; catch rate
	db 190 ; base exp yield
	db $66 ; sprite dimensions

	dw GengarPicFront
	dw GengarPicBack

	; attacks known at lvl 0
	db LICK
	db CONFUSE_RAY
	db NIGHT_SHADE
	db 0

	db 3 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %10011111
	db %11010001
	db %10001110
	db %01101010
	db %00100010

	db 0 ; padding

OnixBaseStats: ; 38e26 (e:4e26)
	db DEX_ONIX ; pokedex id
	db 35 ; base hp
	db 45 ; base attack
	db 160 ; base defense
	db 70 ; base speed
	db 30 ; base special

	db ROCK ; species type 1
	db GROUND ; species type 2

	db 45 ; catch rate
	db 108 ; base exp yield
	db $77 ; sprite dimensions

	dw OnixPicFront
	dw OnixPicBack

	; attacks known at lvl 0
	db TACKLE
	db SCREECH
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %00001000
	db %11001110
	db %10001010
	db %11001000
	db %00100010

	db 0 ; padding

DrowzeeBaseStats: ; 38e42 (e:4e42)
	db DEX_DROWZEE ; pokedex id
	db 60 ; base hp
	db 48 ; base attack
	db 45 ; base defense
	db 42 ; base speed
	db 90 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 190 ; catch rate
	db 102 ; base exp yield
	db $66 ; sprite dimensions

	dw DrowzeePicFront
	dw DrowzeePicBack

	; attacks known at lvl 0
	db POUND
	db HYPNOSIS
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11110000
	db %10000111
	db %00111010
	db %01000011

	db 0 ; padding

HypnoBaseStats: ; 38e5e (e:4e5e)
	db DEX_HYPNO ; pokedex id
	db 85 ; base hp
	db 73 ; base attack
	db 70 ; base defense
	db 67 ; base speed
	db 115 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 75 ; catch rate
	db 165 ; base exp yield
	db $77 ; sprite dimensions

	dw HypnoPicFront
	dw HypnoPicBack

	; attacks known at lvl 0
	db POUND
	db HYPNOSIS
	db DISABLE
	db CONFUSION

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %00001111
	db %11110000
	db %10000111
	db %00111010
	db %01000011

	db 0 ; padding

KrabbyBaseStats: ; 38e7a (e:4e7a)
	db DEX_KRABBY ; pokedex id
	db 30 ; base hp
	db 105 ; base attack
	db 90 ; base defense
	db 50 ; base speed
	db 25 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 225 ; catch rate
	db 115 ; base exp yield
	db $55 ; sprite dimensions

	dw KrabbyPicFront
	dw KrabbyPicBack

	; attacks known at lvl 0
	db BUBBLE
	db LEER
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %00111111
	db %00001000
	db %11000000
	db %00000010
	db %00001000
	db %00110110

	db 0 ; padding

KinglerBaseStats: ; 38e96 (e:4e96)
	db DEX_KINGLER ; pokedex id
	db 55 ; base hp
	db 130 ; base attack
	db 115 ; base defense
	db 75 ; base speed
	db 50 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 60 ; catch rate
	db 206 ; base exp yield
	db $77 ; sprite dimensions

	dw KinglerPicFront
	dw KinglerPicBack

	; attacks known at lvl 0
	db BUBBLE
	db LEER
	db VICEGRIP
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %01111111
	db %00001000
	db %11000000
	db %00000010
	db %00001000
	db %00110110

	db 0 ; padding

VoltorbBaseStats: ; 38eb2 (e:4eb2)
	db DEX_VOLTORB ; pokedex id
	db 40 ; base hp
	db 30 ; base attack
	db 50 ; base defense
	db 100 ; base speed
	db 55 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 190 ; catch rate
	db 103 ; base exp yield
	db $55 ; sprite dimensions

	dw VoltorbPicFront
	dw VoltorbPicBack

	; attacks known at lvl 0
	db TACKLE
	db SCREECH
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %00000001
	db %10001000
	db %11100001
	db %01001011
	db %01011000
	db %01000010

	db 0 ; padding

ElectrodeBaseStats: ; 38ece (e:4ece)
	db DEX_ELECTRODE ; pokedex id
	db 60 ; base hp
	db 50 ; base attack
	db 70 ; base defense
	db 140 ; base speed
	db 80 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 60 ; catch rate
	db 150 ; base exp yield
	db $55 ; sprite dimensions

	dw ElectrodePicFront
	dw ElectrodePicBack

	; attacks known at lvl 0
	db TACKLE
	db SCREECH
	db SONICBOOM
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %01000001
	db %10001000
	db %11100001
	db %11001011
	db %01011000
	db %01000010

	db 0 ; padding

ExeggcuteBaseStats: ; 38eea (e:4eea)
	db DEX_EXEGGCUTE ; pokedex id
	db 60 ; base hp
	db 40 ; base attack
	db 80 ; base defense
	db 40 ; base speed
	db 60 ; base special

	db GRASS ; species type 1
	db PSYCHIC ; species type 2

	db 90 ; catch rate
	db 98 ; base exp yield
	db $77 ; sprite dimensions

	dw ExeggcutePicFront
	dw ExeggcutePicBack

	; attacks known at lvl 0
	db BARRAGE
	db HYPNOSIS
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00100000
	db %00000011
	db %00001000
	db %11110000
	db %00011011
	db %01101000
	db %00000010

	db 0 ; padding

ExeggutorBaseStats: ; 38f06 (e:4f06)
	db DEX_EXEGGUTOR ; pokedex id
	db 95 ; base hp
	db 95 ; base attack
	db 85 ; base defense
	db 55 ; base speed
	db 125 ; base special

	db GRASS ; species type 1
	db PSYCHIC ; species type 2

	db 45 ; catch rate
	db 212 ; base exp yield
	db $77 ; sprite dimensions

	dw ExeggutorPicFront
	dw ExeggutorPicBack

	; attacks known at lvl 0
	db BARRAGE
	db HYPNOSIS
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00100000
	db %01000011
	db %00111000
	db %11110000
	db %00011011
	db %01101000
	db %00100010

	db 0 ; padding

CuboneBaseStats: ; 38f22 (e:4f22)
	db DEX_CUBONE ; pokedex id
	db 50 ; base hp
	db 50 ; base attack
	db 95 ; base defense
	db 35 ; base speed
	db 40 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 190 ; catch rate
	db 87 ; base exp yield
	db $55 ; sprite dimensions

	dw CubonePicFront
	dw CubonePicBack

	; attacks known at lvl 0
	db BONE_CLUB
	db GROWL
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %00111111
	db %00001111
	db %11001110
	db %10100010
	db %00001000
	db %00100010

	db 0 ; padding

MarowakBaseStats: ; 38f3e (e:4f3e)
	db DEX_MAROWAK ; pokedex id
	db 60 ; base hp
	db 80 ; base attack
	db 110 ; base defense
	db 45 ; base speed
	db 50 ; base special

	db GROUND ; species type 1
	db GROUND ; species type 2

	db 75 ; catch rate
	db 124 ; base exp yield
	db $66 ; sprite dimensions

	dw MarowakPicFront
	dw MarowakPicBack

	; attacks known at lvl 0
	db BONE_CLUB
	db GROWL
	db LEER
	db FOCUS_ENERGY

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %00001111
	db %11001110
	db %10100010
	db %00001000
	db %00100010

	db 0 ; padding

HitmonleeBaseStats: ; 38f5a (e:4f5a)
	db DEX_HITMONLEE ; pokedex id
	db 50 ; base hp
	db 120 ; base attack
	db 53 ; base defense
	db 87 ; base speed
	db 35 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 45 ; catch rate
	db 139 ; base exp yield
	db $77 ; sprite dimensions

	dw HitmonleePicFront
	dw HitmonleePicBack

	; attacks known at lvl 0
	db DOUBLE_KICK
	db MEDITATE
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11000000
	db %11000110
	db %00001000
	db %00100010

	db 0 ; padding

HitmonchanBaseStats: ; 38f76 (e:4f76)
	db DEX_HITMONCHAN ; pokedex id
	db 50 ; base hp
	db 105 ; base attack
	db 79 ; base defense
	db 76 ; base speed
	db 35 ; base special

	db FIGHTING ; species type 1
	db FIGHTING ; species type 2

	db 45 ; catch rate
	db 140 ; base exp yield
	db $66 ; sprite dimensions

	dw HitmonchanPicFront
	dw HitmonchanPicBack

	; attacks known at lvl 0
	db COMET_PUNCH
	db AGILITY
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %00000011
	db %00001111
	db %11000000
	db %11000110
	db %00001000
	db %00100010

	db 0 ; padding

LickitungBaseStats: ; 38f92 (e:4f92)
	db DEX_LICKITUNG ; pokedex id
	db 90 ; base hp
	db 55 ; base attack
	db 75 ; base defense
	db 30 ; base speed
	db 60 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 45 ; catch rate
	db 127 ; base exp yield
	db $77 ; sprite dimensions

	dw LickitungPicFront
	dw LickitungPicBack

	; attacks known at lvl 0
	db WRAP
	db SUPERSONIC
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110101
	db %01111111
	db %10001111
	db %11000111
	db %10100010
	db %00001000
	db %00110110

	db 0 ; padding

KoffingBaseStats: ; 38fae (e:4fae)
	db DEX_KOFFING ; pokedex id
	db 40 ; base hp
	db 65 ; base attack
	db 95 ; base defense
	db 35 ; base speed
	db 60 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 190 ; catch rate
	db 114 ; base exp yield
	db $66 ; sprite dimensions

	dw KoffingPicFront
	dw KoffingPicBack

	; attacks known at lvl 0
	db TACKLE
	db SMOG
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %00000000
	db %10001000
	db %11000001
	db %00101010
	db %01001000
	db %00000010

	db 0 ; padding

WeezingBaseStats: ; 38fca (e:4fca)
	db DEX_WEEZING ; pokedex id
	db 65 ; base hp
	db 90 ; base attack
	db 120 ; base defense
	db 60 ; base speed
	db 85 ; base special

	db POISON ; species type 1
	db POISON ; species type 2

	db 60 ; catch rate
	db 173 ; base exp yield
	db $77 ; sprite dimensions

	dw WeezingPicFront
	dw WeezingPicBack

	; attacks known at lvl 0
	db TACKLE
	db SMOG
	db SLUDGE
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %01000000
	db %10001000
	db %11000001
	db %00101010
	db %01001000
	db %00000010

	db 0 ; padding

RhyhornBaseStats: ; 38fe6 (e:4fe6)
	db DEX_RHYHORN ; pokedex id
	db 80 ; base hp
	db 85 ; base attack
	db 95 ; base defense
	db 25 ; base speed
	db 30 ; base special

	db GROUND ; species type 1
	db ROCK ; species type 2

	db 120 ; catch rate
	db 135 ; base exp yield
	db $77 ; sprite dimensions

	dw RhyhornPicFront
	dw RhyhornPicBack

	; attacks known at lvl 0
	db HORN_ATTACK
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %11100000
	db %00000011
	db %10001000
	db %11001111
	db %10100010
	db %10001000
	db %00100010

	db 0 ; padding

RhydonBaseStats: ; 39002 (e:5002)
	db DEX_RHYDON ; pokedex id
	db 105 ; base hp
	db 130 ; base attack
	db 120 ; base defense
	db 40 ; base speed
	db 45 ; base special

	db GROUND ; species type 1
	db ROCK ; species type 2

	db 60 ; catch rate
	db 204 ; base exp yield
	db $77 ; sprite dimensions

	dw RhydonPicFront
	dw RhydonPicBack

	; attacks known at lvl 0
	db HORN_ATTACK
	db STOMP
	db TAIL_WHIP
	db FURY_ATTACK

	db 5 ; growth rate

	; learnset
	db %11110001
	db %11111111
	db %10001111
	db %11001111
	db %10100010
	db %10001000
	db %00110010

	db 0 ; padding

ChanseyBaseStats: ; 3901e (e:501e)
	db DEX_CHANSEY ; pokedex id
	db 250 ; base hp
	db 5 ; base attack
	db 5 ; base defense
	db 50 ; base speed
	db 105 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 30 ; catch rate
	db 255 ; base exp yield
	db $66 ; sprite dimensions

	dw ChanseyPicFront
	dw ChanseyPicBack

	; attacks known at lvl 0
	db POUND
	db DOUBLESLAP
	db 0
	db 0

	db 4 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %10101111
	db %11110001
	db %10110111
	db %00111001
	db %01100011

	db 0 ; padding

TangelaBaseStats: ; 3903a (e:503a)
	db DEX_TANGELA ; pokedex id
	db 65 ; base hp
	db 55 ; base attack
	db 115 ; base defense
	db 60 ; base speed
	db 100 ; base special

	db GRASS ; species type 1
	db GRASS ; species type 2

	db 45 ; catch rate
	db 166 ; base exp yield
	db $66 ; sprite dimensions

	dw TangelaPicFront
	dw TangelaPicBack

	; attacks known at lvl 0
	db CONSTRICT
	db BIND
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00111000
	db %11000000
	db %10000010
	db %00001000
	db %00000110

	db 0 ; padding

KangaskhanBaseStats: ; 39056 (e:5056)
	db DEX_KANGASKHAN ; pokedex id
	db 105 ; base hp
	db 95 ; base attack
	db 80 ; base defense
	db 90 ; base speed
	db 40 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 45 ; catch rate
	db 175 ; base exp yield
	db $77 ; sprite dimensions

	dw KangaskhanPicFront
	dw KangaskhanPicBack

	; attacks known at lvl 0
	db COMET_PUNCH
	db RAGE
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %10001111
	db %11000111
	db %10100010
	db %10001000
	db %00110010

	db 0 ; padding

HorseaBaseStats: ; 39072 (e:5072)
	db DEX_HORSEA ; pokedex id
	db 30 ; base hp
	db 40 ; base attack
	db 70 ; base defense
	db 60 ; base speed
	db 70 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 225 ; catch rate
	db 83 ; base exp yield
	db $55 ; sprite dimensions

	dw HorseaPicFront
	dw HorseaPicBack

	; attacks known at lvl 0
	db BUBBLE
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %00111111
	db %00001000
	db %11000000
	db %11000010
	db %00001000
	db %00010010

	db 0 ; padding

SeadraBaseStats: ; 3908e (e:508e)
	db DEX_SEADRA ; pokedex id
	db 55 ; base hp
	db 65 ; base attack
	db 95 ; base defense
	db 85 ; base speed
	db 95 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 75 ; catch rate
	db 155 ; base exp yield
	db $66 ; sprite dimensions

	dw SeadraPicFront
	dw SeadraPicBack

	; attacks known at lvl 0
	db BUBBLE
	db SMOKESCREEN
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %01111111
	db %00001000
	db %11000000
	db %11000010
	db %00001000
	db %00010010

	db 0 ; padding

GoldeenBaseStats: ; 390aa (e:50aa)
	db DEX_GOLDEEN ; pokedex id
	db 45 ; base hp
	db 67 ; base attack
	db 60 ; base defense
	db 63 ; base speed
	db 50 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 225 ; catch rate
	db 111 ; base exp yield
	db $66 ; sprite dimensions

	dw GoldeenPicFront
	dw GoldeenPicBack

	; attacks known at lvl 0
	db PECK
	db TAIL_WHIP
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %01100000
	db %00111111
	db %00001000
	db %11000000
	db %11000010
	db %00001000
	db %00010010

	db 0 ; padding

SeakingBaseStats: ; 390c6 (e:50c6)
	db DEX_SEAKING ; pokedex id
	db 80 ; base hp
	db 92 ; base attack
	db 65 ; base defense
	db 68 ; base speed
	db 80 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 60 ; catch rate
	db 170 ; base exp yield
	db $77 ; sprite dimensions

	dw SeakingPicFront
	dw SeakingPicBack

	; attacks known at lvl 0
	db PECK
	db TAIL_WHIP
	db SUPERSONIC
	db 0

	db 0 ; growth rate

	; learnset
	db %01100000
	db %01111111
	db %00001000
	db %11000000
	db %11000010
	db %00001000
	db %00010010

	db 0 ; padding

StaryuBaseStats: ; 390e2 (e:50e2)
	db DEX_STARYU ; pokedex id
	db 30 ; base hp
	db 45 ; base attack
	db 55 ; base defense
	db 85 ; base speed
	db 70 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 225 ; catch rate
	db 106 ; base exp yield
	db $66 ; sprite dimensions

	dw StaryuPicFront
	dw StaryuPicBack

	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00100000
	db %00111111
	db %10001000
	db %11110001
	db %11000011
	db %00111000
	db %01010011

	db 0 ; padding

StarmieBaseStats: ; 390fe (e:50fe)
	db DEX_STARMIE ; pokedex id
	db 60 ; base hp
	db 75 ; base attack
	db 85 ; base defense
	db 115 ; base speed
	db 100 ; base special

	db WATER ; species type 1
	db PSYCHIC ; species type 2

	db 60 ; catch rate
	db 207 ; base exp yield
	db $66 ; sprite dimensions

	dw StarmiePicFront
	dw StarmiePicBack

	; attacks known at lvl 0
	db TACKLE
	db WATER_GUN
	db HARDEN
	db 0

	db 5 ; growth rate

	; learnset
	db %00100000
	db %01111111
	db %10001000
	db %11110001
	db %11000011
	db %00111000
	db %01010011

	db 0 ; padding

MrMimeBaseStats: ; 3911a (e:511a)
	db DEX_MR_MIME ; pokedex id
	db 40 ; base hp
	db 45 ; base attack
	db 65 ; base defense
	db 90 ; base speed
	db 100 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 45 ; catch rate
	db 136 ; base exp yield
	db $66 ; sprite dimensions

	dw MrMimePicFront
	dw MrMimePicBack

	; attacks known at lvl 0
	db CONFUSION
	db BARRIER
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %10101111
	db %11110001
	db %10000111
	db %00111000
	db %01000010

	db 0 ; padding

ScytherBaseStats: ; 39136 (e:5136)
	db DEX_SCYTHER ; pokedex id
	db 70 ; base hp
	db 110 ; base attack
	db 80 ; base defense
	db 105 ; base speed
	db 55 ; base special

	db BUG ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 187 ; base exp yield
	db $77 ; sprite dimensions

	dw ScytherPicFront
	dw ScytherPicBack

	; attacks known at lvl 0
	db QUICK_ATTACK
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00100100
	db %01000011
	db %00001000
	db %11000000
	db %11000010
	db %00001000
	db %00000110

	db 0 ; padding

JynxBaseStats: ; 39152 (e:5152)
	db DEX_JYNX ; pokedex id
	db 65 ; base hp
	db 50 ; base attack
	db 35 ; base defense
	db 95 ; base speed
	db 95 ; base special

	db ICE ; species type 1
	db PSYCHIC ; species type 2

	db 45 ; catch rate
	db 137 ; base exp yield
	db $66 ; sprite dimensions

	dw JynxPicFront
	dw JynxPicBack

	; attacks known at lvl 0
	db POUND
	db LOVELY_KISS
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01111111
	db %00001111
	db %11110000
	db %10000111
	db %00101000
	db %00000010

	db 0 ; padding

ElectabuzzBaseStats: ; 3916e (e:516e)
	db DEX_ELECTABUZZ ; pokedex id
	db 65 ; base hp
	db 83 ; base attack
	db 57 ; base defense
	db 105 ; base speed
	db 85 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 45 ; catch rate
	db 156 ; base exp yield
	db $66 ; sprite dimensions

	dw ElectabuzzPicFront
	dw ElectabuzzPicBack

	; attacks known at lvl 0
	db QUICK_ATTACK
	db LEER
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %10001111
	db %11110001
	db %11000111
	db %00111000
	db %01100010

	db 0 ; padding

MagmarBaseStats: ; 3918a (e:518a)
	db DEX_MAGMAR ; pokedex id
	db 65 ; base hp
	db 95 ; base attack
	db 57 ; base defense
	db 93 ; base speed
	db 85 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 45 ; catch rate
	db 167 ; base exp yield
	db $66 ; sprite dimensions

	dw MagmarPicFront
	dw MagmarPicBack

	; attacks known at lvl 0
	db EMBER
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10110001
	db %01000011
	db %00001111
	db %11110000
	db %10100110
	db %00101000
	db %00100010

	db 0 ; padding

PinsirBaseStats: ; 391a6 (e:51a6)
	db DEX_PINSIR ; pokedex id
	db 65 ; base hp
	db 125 ; base attack
	db 100 ; base defense
	db 85 ; base speed
	db 55 ; base special

	db BUG ; species type 1
	db BUG ; species type 2

	db 45 ; catch rate
	db 200 ; base exp yield
	db $77 ; sprite dimensions

	dw PinsirPicFront
	dw PinsirPicBack

	; attacks known at lvl 0
	db VICEGRIP
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %10100100
	db %01000011
	db %00001101
	db %11000000
	db %00000010
	db %00001000
	db %00100110

	db 0 ; padding

TaurosBaseStats: ; 391c2 (e:51c2)
	db DEX_TAUROS ; pokedex id
	db 75 ; base hp
	db 100 ; base attack
	db 95 ; base defense
	db 110 ; base speed
	db 70 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 45 ; catch rate
	db 211 ; base exp yield
	db $77 ; sprite dimensions

	dw TaurosPicFront
	dw TaurosPicBack

	; attacks known at lvl 0
	db TACKLE
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %11100000
	db %01110011
	db %10001000
	db %11000111
	db %10100010
	db %00001000
	db %00100010

	db 0 ; padding

MagikarpBaseStats: ; 391de (e:51de)
	db DEX_MAGIKARP ; pokedex id
	db 20 ; base hp
	db 10 ; base attack
	db 55 ; base defense
	db 80 ; base speed
	db 20 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 255 ; catch rate
	db 20 ; base exp yield
	db $66 ; sprite dimensions

	dw MagikarpPicFront
	dw MagikarpPicBack

	; attacks known at lvl 0
	db SPLASH
	db 0
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

GyaradosBaseStats: ; 391fa (e:51fa)
	db DEX_GYARADOS ; pokedex id
	db 95 ; base hp
	db 125 ; base attack
	db 79 ; base defense
	db 81 ; base speed
	db 100 ; base special

	db WATER ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 214 ; base exp yield
	db $77 ; sprite dimensions

	dw GyaradosPicFront
	dw GyaradosPicBack

	; attacks known at lvl 0
	db BITE
	db DRAGON_RAGE
	db LEER
	db HYDRO_PUMP

	db 5 ; growth rate

	; learnset
	db %10100000
	db %01111111
	db %11001000
	db %11000001
	db %10100011
	db %00001000
	db %00110010

	db 0 ; padding

LaprasBaseStats: ; 39216 (e:5216)
	db DEX_LAPRAS ; pokedex id
	db 130 ; base hp
	db 85 ; base attack
	db 80 ; base defense
	db 60 ; base speed
	db 95 ; base special

	db WATER ; species type 1
	db ICE ; species type 2

	db 45 ; catch rate
	db 219 ; base exp yield
	db $77 ; sprite dimensions

	dw LaprasPicFront
	dw LaprasPicBack

	; attacks known at lvl 0
	db WATER_GUN
	db GROWL
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %11100000
	db %01111111
	db %11101000
	db %11010001
	db %10000011
	db %00101000
	db %00110010

	db 0 ; padding

DittoBaseStats: ; 39232 (e:5232)
	db DEX_DITTO ; pokedex id
	db 48 ; base hp
	db 48 ; base attack
	db 48 ; base defense
	db 48 ; base speed
	db 48 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 35 ; catch rate
	db 61 ; base exp yield
	db $55 ; sprite dimensions

	dw DittoPicFront
	dw DittoPicBack

	; attacks known at lvl 0
	db TRANSFORM
	db 0
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000
	db %00000000

	db 0 ; padding

EeveeBaseStats: ; 3924e (e:524e)
	db DEX_EEVEE ; pokedex id
	db 55 ; base hp
	db 55 ; base attack
	db 50 ; base defense
	db 55 ; base speed
	db 65 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 45 ; catch rate
	db 92 ; base exp yield
	db $55 ; sprite dimensions

	dw EeveePicFront
	dw EeveePicBack

	; attacks known at lvl 0
	db TACKLE
	db SAND_ATTACK
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00000011
	db %00001000
	db %11000000
	db %11000011
	db %00001000
	db %00000010

	db 0 ; padding

VaporeonBaseStats: ; 3926a (e:526a)
	db DEX_VAPOREON ; pokedex id
	db 130 ; base hp
	db 65 ; base attack
	db 60 ; base defense
	db 65 ; base speed
	db 110 ; base special

	db WATER ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 196 ; base exp yield
	db $66 ; sprite dimensions

	dw VaporeonPicFront
	dw VaporeonPicBack

	; attacks known at lvl 0
	db TACKLE
	db SAND_ATTACK
	db QUICK_ATTACK
	db WATER_GUN

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01111111
	db %00001000
	db %11000000
	db %11000011
	db %00001000
	db %00010010

	db 0 ; padding

JolteonBaseStats: ; 39286 (e:5286)
	db DEX_JOLTEON ; pokedex id
	db 65 ; base hp
	db 65 ; base attack
	db 60 ; base defense
	db 130 ; base speed
	db 110 ; base special

	db ELECTRIC ; species type 1
	db ELECTRIC ; species type 2

	db 45 ; catch rate
	db 197 ; base exp yield
	db $66 ; sprite dimensions

	dw JolteonPicFront
	dw JolteonPicBack

	; attacks known at lvl 0
	db TACKLE
	db SAND_ATTACK
	db QUICK_ATTACK
	db THUNDERSHOCK

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %10001000
	db %11000001
	db %11000011
	db %00011000
	db %01000010

	db 0 ; padding

FlareonBaseStats: ; 392a2 (e:52a2)
	db DEX_FLAREON ; pokedex id
	db 65 ; base hp
	db 130 ; base attack
	db 60 ; base defense
	db 65 ; base speed
	db 110 ; base special

	db FIRE ; species type 1
	db FIRE ; species type 2

	db 45 ; catch rate
	db 198 ; base exp yield
	db $66 ; sprite dimensions

	dw FlareonPicFront
	dw FlareonPicBack

	; attacks known at lvl 0
	db TACKLE
	db SAND_ATTACK
	db QUICK_ATTACK
	db EMBER

	db 0 ; growth rate

	; learnset
	db %10100000
	db %01000011
	db %00001000
	db %11000000
	db %11100011
	db %00001000
	db %00000010

	db 0 ; padding

PorygonBaseStats: ; 392be (e:52be)
	db DEX_PORYGON ; pokedex id
	db 65 ; base hp
	db 60 ; base attack
	db 70 ; base defense
	db 40 ; base speed
	db 75 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 45 ; catch rate
	db 130 ; base exp yield
	db $66 ; sprite dimensions

	dw PorygonPicFront
	dw PorygonPicBack

	; attacks known at lvl 0
	db TACKLE
	db SHARPEN
	db CONVERSION
	db 0

	db 0 ; growth rate

	; learnset
	db %00100000
	db %01110011
	db %10001000
	db %11110001
	db %11000011
	db %00111000
	db %01000011

	db 0 ; padding

OmanyteBaseStats: ; 392da (e:52da)
	db DEX_OMANYTE ; pokedex id
	db 35 ; base hp
	db 40 ; base attack
	db 100 ; base defense
	db 35 ; base speed
	db 90 ; base special

	db ROCK ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 120 ; base exp yield
	db $55 ; sprite dimensions

	dw OmanytePicFront
	dw OmanytePicBack

	; attacks known at lvl 0
	db WATER_GUN
	db WITHDRAW
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00111111
	db %00001000
	db %11000000
	db %00000011
	db %00001000
	db %00010010

	db 0 ; padding

OmastarBaseStats: ; 392f6 (e:52f6)
	db DEX_OMASTAR ; pokedex id
	db 70 ; base hp
	db 60 ; base attack
	db 125 ; base defense
	db 55 ; base speed
	db 115 ; base special

	db ROCK ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 199 ; base exp yield
	db $66 ; sprite dimensions

	dw OmastarPicFront
	dw OmastarPicBack

	; attacks known at lvl 0
	db WATER_GUN
	db WITHDRAW
	db HORN_ATTACK
	db 0

	db 0 ; growth rate

	; learnset
	db %11100000
	db %01111111
	db %00001101
	db %11000000
	db %10000011
	db %00001000
	db %00010010

	db 0 ; padding

KabutoBaseStats: ; 39312 (e:5312)
	db DEX_KABUTO ; pokedex id
	db 30 ; base hp
	db 80 ; base attack
	db 90 ; base defense
	db 55 ; base speed
	db 45 ; base special

	db ROCK ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 119 ; base exp yield
	db $55 ; sprite dimensions

	dw KabutoPicFront
	dw KabutoPicBack

	; attacks known at lvl 0
	db SCRATCH
	db HARDEN
	db 0
	db 0

	db 0 ; growth rate

	; learnset
	db %10100000
	db %00111111
	db %00001000
	db %11000000
	db %00000011
	db %00001000
	db %00010010

	db 0 ; padding

KabutopsBaseStats: ; 3932e (e:532e)
	db DEX_KABUTOPS ; pokedex id
	db 60 ; base hp
	db 115 ; base attack
	db 105 ; base defense
	db 80 ; base speed
	db 70 ; base special

	db ROCK ; species type 1
	db WATER ; species type 2

	db 45 ; catch rate
	db 201 ; base exp yield
	db $66 ; sprite dimensions

	dw KabutopsPicFront
	dw KabutopsPicBack

	; attacks known at lvl 0
	db SCRATCH
	db HARDEN
	db ABSORB
	db 0

	db 0 ; growth rate

	; learnset
	db %10110110
	db %01111111
	db %00001101
	db %11000000
	db %10000011
	db %00001000
	db %00010010

	db 0 ; padding

AerodactylBaseStats: ; 3934a (e:534a)
	db DEX_AERODACTYL ; pokedex id
	db 80 ; base hp
	db 105 ; base attack
	db 65 ; base defense
	db 130 ; base speed
	db 60 ; base special

	db ROCK ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 202 ; base exp yield
	db $77 ; sprite dimensions

	dw AerodactylPicFront
	dw AerodactylPicBack

	; attacks known at lvl 0
	db WING_ATTACK
	db AGILITY
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %01001000
	db %11000000
	db %01100011
	db %00001100
	db %00001010

	db 0 ; padding

SnorlaxBaseStats: ; 39366 (e:5366)
	db DEX_SNORLAX ; pokedex id
	db 160 ; base hp
	db 110 ; base attack
	db 65 ; base defense
	db 30 ; base speed
	db 65 ; base special

	db NORMAL ; species type 1
	db NORMAL ; species type 2

	db 25 ; catch rate
	db 154 ; base exp yield
	db $77 ; sprite dimensions

	dw SnorlaxPicFront
	dw SnorlaxPicBack

	; attacks known at lvl 0
	db HEADBUTT
	db AMNESIA
	db REST
	db 0

	db 5 ; growth rate

	; learnset
	db %10110001
	db %11111111
	db %10101111
	db %11010111
	db %10101111
	db %10101000
	db %00110010

	db 0 ; padding

ArticunoBaseStats: ; 39382 (e:5382)
	db DEX_ARTICUNO ; pokedex id
	db 90 ; base hp
	db 85 ; base attack
	db 100 ; base defense
	db 85 ; base speed
	db 125 ; base special

	db ICE ; species type 1
	db FLYING ; species type 2

	db 3 ; catch rate
	db 215 ; base exp yield
	db $77 ; sprite dimensions

	dw ArticunoPicFront
	dw ArticunoPicBack

	; attacks known at lvl 0
	db PECK
	db ICE_BEAM
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00101010
	db %01111111
	db %00001000
	db %11000000
	db %01000011
	db %00001100
	db %00001010

	db 0 ; padding

ZapdosBaseStats: ; 3939e (e:539e)
	db DEX_ZAPDOS ; pokedex id
	db 90 ; base hp
	db 90 ; base attack
	db 85 ; base defense
	db 100 ; base speed
	db 125 ; base special

	db ELECTRIC ; species type 1
	db FLYING ; species type 2

	db 3 ; catch rate
	db 216 ; base exp yield
	db $77 ; sprite dimensions

	dw ZapdosPicFront
	dw ZapdosPicBack

	; attacks known at lvl 0
	db THUNDERSHOCK
	db DRILL_PECK
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %10001000
	db %11000001
	db %01000011
	db %00011100
	db %01001010

	db 0 ; padding

MoltresBaseStats: ; 393ba (e:53ba)
	db DEX_MOLTRES ; pokedex id
	db 90 ; base hp
	db 100 ; base attack
	db 90 ; base defense
	db 90 ; base speed
	db 125 ; base special

	db FIRE ; species type 1
	db FLYING ; species type 2

	db 3 ; catch rate
	db 217 ; base exp yield
	db $77 ; sprite dimensions

	dw MoltresPicFront
	dw MoltresPicBack

	; attacks known at lvl 0
	db PECK
	db FIRE_SPIN
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %00101010
	db %01000011
	db %00001000
	db %11000000
	db %01100011
	db %00001100
	db %00001010

	db 0 ; padding

DratiniBaseStats: ; 393d6 (e:53d6)
	db DEX_DRATINI ; pokedex id
	db 41 ; base hp
	db 64 ; base attack
	db 45 ; base defense
	db 50 ; base speed
	db 50 ; base special

	db DRAGON ; species type 1
	db DRAGON ; species type 2

	db 45 ; catch rate
	db 67 ; base exp yield
	db $55 ; sprite dimensions

	dw DratiniPicFront
	dw DratiniPicBack

	; attacks known at lvl 0
	db WRAP
	db LEER
	db 0
	db 0

	db 5 ; growth rate

	; learnset
	db %10100000
	db %00111111
	db %11001000
	db %11000001
	db %11100011
	db %00011000
	db %00010010

	db 0 ; padding

DragonairBaseStats: ; 393f2 (e:53f2)
	db DEX_DRAGONAIR ; pokedex id
	db 61 ; base hp
	db 84 ; base attack
	db 65 ; base defense
	db 70 ; base speed
	db 70 ; base special

	db DRAGON ; species type 1
	db DRAGON ; species type 2

	db 45 ; catch rate
	db 144 ; base exp yield
	db $66 ; sprite dimensions

	dw DragonairPicFront
	dw DragonairPicBack

	; attacks known at lvl 0
	db WRAP
	db LEER
	db THUNDER_WAVE
	db 0

	db 5 ; growth rate

	; learnset
	db %11100000
	db %00111111
	db %11001000
	db %11000001
	db %11100011
	db %00011000
	db %00010010

	db 0 ; padding

DragoniteBaseStats: ; 3940e (e:540e)
	db DEX_DRAGONITE ; pokedex id
	db 91 ; base hp
	db 134 ; base attack
	db 95 ; base defense
	db 80 ; base speed
	db 100 ; base special

	db DRAGON ; species type 1
	db FLYING ; species type 2

	db 45 ; catch rate
	db 218 ; base exp yield
	db $77 ; sprite dimensions

	dw DragonitePicFront
	dw DragonitePicBack

	; attacks known at lvl 0
	db WRAP
	db LEER
	db THUNDER_WAVE
	db AGILITY

	db 5 ; growth rate

	; learnset
	db %11100010
	db %01111111
	db %11001000
	db %11000001
	db %11100011
	db %00011000
	db %00110010

	db 0 ; padding

MewtwoBaseStats: ; 3942a (e:542a)
	db DEX_MEWTWO ; pokedex id
	db 106 ; base hp
	db 110 ; base attack
	db 90 ; base defense
	db 130 ; base speed
	db 154 ; base special

	db PSYCHIC ; species type 1
	db PSYCHIC ; species type 2

	db 3 ; catch rate
	db 220 ; base exp yield
	db $77 ; sprite dimensions

	dw MewtwoPicFront
	dw MewtwoPicBack

	; attacks known at lvl 0
	db CONFUSION
	db DISABLE
	db SWIFT
	db PSYCHIC_M

	db 5 ; growth rate

	; learnset
	db %10110001
	db %11111111
	db %10101111
	db %11110001
	db %10101111
	db %00111000
	db %01100011

	db 0 ; padding