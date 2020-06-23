; format: db tileset id, bookshelf tile id, text id
BookshelfTileIDs:
	db PLATEAU,      $30
	db_tx_pre IndigoPlateauStatues
	db HOUSE,        $3D
	db_tx_pre TownMapText
	db HOUSE,        $1E
	db_tx_pre BookOrSculptureText
	db MANSION,      $32
	db_tx_pre BookOrSculptureText
	db REDS_HOUSE_1, $32
	db_tx_pre BookOrSculptureText
	db LAB,          $28
	db_tx_pre BookOrSculptureText
	db LOBBY,        $16
	db_tx_pre ElevatorText
	db GYM,          $1D
	db_tx_pre BookOrSculptureText
	db DOJO,         $1D
	db_tx_pre BookOrSculptureText
	db GATE,         $22
	db_tx_pre BookOrSculptureText
	db MART,         $54
	db_tx_pre PokemonStuffText
	db MART,         $55
	db_tx_pre PokemonStuffText
	db POKECENTER,   $54
	db_tx_pre PokemonStuffText
	db POKECENTER,   $55
	db_tx_pre PokemonStuffText
	db LOBBY,        $50
	db_tx_pre PokemonStuffText
	db LOBBY,        $52
	db_tx_pre PokemonStuffText
	db SHIP,         $36
	db_tx_pre BookOrSculptureText
	db $FF
