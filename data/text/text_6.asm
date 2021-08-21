_ItemUseBallText00:: ;Utilizar balls
	text "¡Esquivó la bola"
	line "que le tiraron!"

	para "¡Este #MON"
	line "no puede ser"
	cont "atrapado!"
	prompt

_ItemUseBallText01::
	text "¡¡No acertaste al"
	line "#MON!!"
	prompt

_ItemUseBallText02::
	text "¡Maldición!"
	line "¡El #MON"
	cont "se escapó!"
	prompt

_ItemUseBallText03::
	text "¡Auu! ¡Creía"
	line "haberlo atrapado!"
	prompt

_ItemUseBallText04::
	text "¡Cáspita! ¡Estaba"
	line "tan cerca!"
	prompt

_ItemUseBallText05::
	text "¡Muy bien!"
	line "@"
	text_ram wEnemyMonNick
	cont "fue atrapado!@"
	text_end

_ItemUseBallText07::
	text "¡@"
	text_ram wBoxMonNicks
	line "fue transferido"
	cont "al PC de BILL!"
	prompt

_ItemUseBallText08::
	text "¡@"
	text_ram wBoxMonNicks
	line "fue transferido"
	cont "al PC de Alguien!"
	prompt

_ItemUseBallText06::
	text "¡Serán añadidos"
	line "nuevos datos"
	cont "#DEX sobre"
	cont "@"
	text_ram wEnemyMonNick
	text "!@"
	text_end

_SurfingGotOnText:: ;Utilizar SURF
	text "¡<PLAYER> se monta"
	line "en @"
	text_ram wcd6d
	text "!"
	prompt

_SurfingNoPlaceToGetOffText::
	text "¡No hay sitio"
	line "por donde salir!"
	prompt

_VitaminStatRoseText:: ;Utilizar vitaminas
	text_ram wcd6d
	text " de"
	line "@"
	text_ram wcf4b
	text " creció."
	prompt

_VitaminNoEffectText::
	text "No surtirá ningún"
	line "efecto."
	prompt

_ThrewBaitText:: ;Lanzar Safari
	text "<PLAYER> lanzó"
	line "algo de CEBO."
	done

_ThrewRockText::
	text "<PLAYER> lanzó"
	line "una ROCA."
	done

_PlayedFluteNoEffectText:: ;Pokeflauta
	text "Tocada la #"
	line "FLAUTA."

	para "¡Es una melodía"
	line "muy pegadiza!"
	prompt

_FluteWokeUpText::
	text "Todos los"
	line "#MON dormidos"
	cont "se despertaron."
	prompt

_PlayedFluteHadEffectText::
	text "<PLAYER> tocó la"
	line "# FLAUTA.@"
	text_end

_CoinCaseNumCoinsText:: ;???
	text "@"
	text_bcd wPlayerCoins, 2 | LEADING_ZEROES | LEFT_ALIGN
	line " fichas."
	prompt

_ItemfinderFoundItemText:: ;Buscaobjetos
	text "¡Bien!"
	line "¡El BUSCAOBJETOS"
	cont "indica que hay"
	cont "un objeto cerca!"
	prompt

_ItemfinderFoundNothingText::
	text "¡No!"
	line "El BUSCAOBJETOS"
	cont "no responde."
	prompt

_RaisePPWhichTechniqueText:: ;Aumentar/Restaurar PP
	text "¿Aumentar PP de"
	line "qué ataque?"
	done

_RestorePPWhichTechniqueText::
	text "¿Restaurar PP de"
	line "qué ataque?"
	done

_PPMaxedOutText::
	text "Los PP de"
	line "@"
	text_ram wcf4b
	cont "están al máximo."
	prompt

_PPIncreasedText::
	text "PP de @"
	text_ram wcf4b
	line "aumentados."
	prompt

_PPRestoredText::
	text "PP restaurados."
	prompt

_BootedUpTMText:: ;Enseñar MT/MO
	text "¡MT escogida!"
	prompt

_BootedUpHMText::
	text "¡Escogida una MO!"
	prompt

_TeachMachineMoveText::
	text "¡Ésta contiene"
	line "@"
	text_ram wcf4b
	text "!"

	para "¿Enseñar"
	line "@"
	text_ram wcf4b
	cont "a un #MON?"
	done

_MonCannotLearnMachineMoveText::
	text_ram wcd6d
	text " no es"
	line "compatible con"
	cont "@"
	text_ram wcf4b
	text "."

	para "No puede aprender"
	line "@"
	text_ram wcf4b
	text "."
	prompt

_ItemUseNotTimeText:: ;No puedes usar objeto
	text "OAK: ¡<PLAYER>!"
	line "¡Éste no es"
	cont "momento de"
	cont "usarlo!"
	prompt

_ItemUseNotYoursToUseText::
	text "No puedes usarlo"
	line "porque no es tuyo"
	prompt

_ItemUseNoEffectText::
	text "No surtirá ningún"
	line "efecto."
	prompt

_ThrowBallAtTrainerMonText1::
	text "¡El entrenador"
	line "bloqueó la bola!"
	prompt

_ThrowBallAtTrainerMonText2::
	text "¡No robes nada!"
	prompt

_NoCyclingAllowedHereText::
	text "Está prohibido"
	next "pedalear aquí."
	prompt

_NoSurfingHereText::
	text "¡Aquí está"
	line "prohibido SURFEAR"
	cont "en @"
	text_ram wcd6d
	text "!"
	prompt

_BoxFullCannotThrowBallText::
	text "¡La CAJA #MON"
	line "está llena! ¡No"
	cont "puedes usar"
	cont "ese objeto!"
	prompt
