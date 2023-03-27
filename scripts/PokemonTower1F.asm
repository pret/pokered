PokemonTower1F_Script:
	jp EnableAutoTextBoxDrawing

PokemonTower1F_TextPointers:
	dw PokemonTower1Text1
	dw PokemonTower1Text2
	dw PokemonTower1Text3
	dw PokemonTower1Text4
	dw PokemonTower1Text5
	dw PokemonTower1Text6

PokemonTower1Text1:
	text_far _PokemonTower1Text1
	text_end

PokemonTower1Text2:
	text_far _PokemonTower1Text2
	text_end

PokemonTower1Text3:
	text_far _PokemonTower1Text3
	text_end

PokemonTower1Text4:
	text_far _PokemonTower1Text4
	text_end

PokemonTower1Text5:
	text_far _PokemonTower1Text5
	text_end

PokemonTower1Text6:
	text_asm
	ld hl, PokemonTower1FRocketText
	rst _PrintText
	CheckEvent EVENT_BEAT_ROCKET_HIDEOUT_GIOVANNI
	ld hl, PokemonTower1FRocketText2
	jr z, .done
	ld hl, PokemonTower1FRocketText3
.done
	rst _PrintText
	rst TextScriptEnd

PokemonTower1FRocketText:
	text_far _PokemonTower1FRocketText
	text_end

PokemonTower1FRocketText2:
	text_far _PokemonTower1FRocketText2
	text_end

PokemonTower1FRocketText3:
	text_far _PokemonTower1FRocketText3
	text_end

