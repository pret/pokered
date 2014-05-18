PokemonTower1Script: ; 6042c (18:442c)
	jp EnableAutoTextBoxDrawing

PokemonTower1TextPointers: ; 6042f (18:442f)
	dw PokemonTower1Text1
	dw PokemonTower1Text2
	dw PokemonTower1Text3
	dw PokemonTower1Text4
	dw PokemonTower1Text5

PokemonTower1Text1: ; 60439 (18:4439)
	TX_FAR _PokemonTower1Text1
	db "@"

PokemonTower1Text2: ; 6043e (18:443e)
	TX_FAR _PokemonTower1Text2
	db "@"

PokemonTower1Text3: ; 60443 (18:4443)
	TX_FAR _PokemonTower1Text3
	db "@"

PokemonTower1Text4: ; 60448 (18:4448)
	TX_FAR _PokemonTower1Text4
	db "@"

PokemonTower1Text5: ; 6044d (18:444d)
	TX_FAR _PokemonTower1Text5
	db "@"
