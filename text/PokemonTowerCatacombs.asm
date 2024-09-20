_PokemonTowerCatacombsTorchedGraveText::
	text "HERE LIES KOKO"
	line "THE EXEGGUTOR"
	para "KOKO tragically"
	line "perished in a"
	cont "house fire."
	; fall through
_PokemonTowerCatacombsWavedStaff::
	para "<PLAYER> waved the"
	line "CHANNELER's STAFF."
	prompt 

_PokemonTowerCatacombsTorchedGraveText2::
	text "NEED@"
	text_dots 3
	text ""
	para "WATER@"
	text_dots 3
	text ""
	para "NOW!@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsMonSpeaksText::
	text "Listen, child!"
	para "The #MON's"
	line "spirit speaks"
	cont "through me:"
	para "@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsTorchedAfterText::
	text ""
	para "My trainer didn't"
	line "own a fire"
	cont "extinguisher!"
	para "Why were they so"
	line "short sighted??"
	; fall through
_PokemonTowerCatacombsSpiritDissipatedText::
	para "@"
	text_dots 3
	text ""
	para "The spirit"
	line "seems satisfied."
	para "It departed to"
	line "the afterlife!"
	done

_PokemonTowerCatacombsChunkyGraveText::
	text "HERE LIES ZAPPY"
	line "THE RAICHU"
	para "ZAPPY had a sudden"
	line "heart attack"
	cont "while sleeping.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsChunkyGraveText2::
	text "I HUNGER@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsChunkyAfterText::
	text ""
	para "I loved my trainer"
	line "very much!"
	para "She gave me lots"
	line "of yummy food!"
	para "But I ate too"
	line "much I think!"
	para "Whoops!"
	para "Do you have"
	line "anything to eat?"
	para "No?"
	para "Oh well!"
	para "I'll wait for my"
	line "trainer in the"
	cont "great beyond!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsPainlessGraveText::
	text "HERE LIES TUFF"
	line "THE WIGGLYTUFF"
	para "TUFF passed away"
	line "due to blunt"
	cont "force trauma.@" 
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsPainlessGraveText2::
	text "MUST@"
	text_dots 3
	text ""
	para "FIGHT@"
	text_dots 3
	text ""
	para "HARDER@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsPainlessAfterText::
	text ""
	para "My trainer made me"
	line "fight so hard,"
	cont "I got permanent"
	cont "brain damage!"
	para "I just wanted to"
	line "make him happy!"
	para "We should have"
	line "known our limits!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsIrradiatedGraveText::
	text "HERE LIES BOB"
	line "THE HITMONCHAN"
	para "BOB perished with"
	line "their trainer"
	cont "due to radiation"
	cont "sickness.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsIrradiatedGraveText2::
	text "WHAT IS"
	line "HAPPENING@"
	text_dots 3
	text ""
	cont "TO ME??@"
	text_dots 3
	text ""
	done

_PokemonTowerCatacombsIrradiatedAfterText::
	text ""
	para "My trainer and I"
	line "trespassed in a"
	cont "restricted cave!"
	para "We had no idea"
	line "it was nuclear"
	cont "waste storage!"
	para "We shouldn't"
	line "have gone there!@"
	text_jump _PokemonTowerCatacombsSpiritDissipatedText

_PokemonTowerCatacombsDarkChannelerText::
	text "Kekeke, are you"
	line "getting a bit too"
	cont "spooked out?"
	para "Want to go back"
	line "upstairs?"
	done

_PokemonTowerCatacombsDarkChannelerTextYes::
	text "Follow me, child!"
	done

_GhostMarowakAfterGiovanniText::
	text "<PLAYER>!"
	para "This is GHOST"
	line "MAROWAK speaking"
	cont "through the"
	cont "KARATE KING."
	para "Thank you for"
	line "defeating <TEAM>"
	cont "<ROCKET>."
	para "It was my last"
	line "wish to help get"
	cont "rid of them."
	para "If you could,"
	line "please take me"
	cont "to the basement"
	cont "of #MON TOWER."
	para "There I can"
	line "finally be laid"
	cont "to rest."
	done

_ViridianGymHiker3WhatText::
	text "Huh??"
	para "What happened?"
	para "How'd I get over"
	line "here?"
	done

_DarkChannelerGoDownText::
	text "Hmm? I sense a"
	line "spirit among your"
	cont "#MON."
	para "Hoho! The mother"
	line "MAROWAK?"
	para "She wishes to be"
	line "laid to rest at"
	cont "her grave now,"
	cont "is that it?"
	para "It's downstairs"
	line "in the catacombs."
	para "I'll let you go"
	line "down for this one"
	cont "special case."
	para "Want to go?"
	done

_DarkChannelerCatacombsIntroText::
	text "Just follow the"
	line "path to reach"
	cont "MAROWAK's grave!"
	para "But you'll probably"
	line "encounter some"
	cont "restless spirits"
	cont "along the way."
	para "Here! Use my"
	line "CHANNELER's STAFF."
	para "It'll reveal and"
	line "purify spirits"
	cont "better than a"
	cont "SILPH SCOPE!"
	para "<PLAYER> borrowed"
	line "CHANNELER's STAFF!"
	done

_TorchedOnFire::
	text "@"
	text_ram wEnemyMonNick
	text ""
	line "is consumed by"
	cont "scorching flames!"
	prompt

_PainlessBattleInitText::
	text "PAINLESS won't feel"
	line "any pain from"
	cont "your attacks!"
	prompt

_IrradiatedBattleInitText::
	text "Radiation spreads"
	line "everywhere!"
	prompt

_IrradiatedGrowsLarger::
	text "IRRADIATED twists"
	line "and contorts as"
	cont "its body grows"
	cont "ever larger!"
	prompt

_CatacombsCuboneText::
	text "Looks like CUBONE"
	line "is visiting its"
	cont "mother's grave."
	done

_CatacombsMarowakTouchedText::
	text "@"
	text_ram wcd6d
	text " seems"
	line "really happy!"
	done

_DarkChannelerReunionText::
	text "What a touching"
	line "reunion!"
	para "But @"
	text_ram wcd6d
	text ""
	line "can't be laid to"
	cont "rest yet!"
	para "There's still a"
	line "dark presence"
	cont "around here!"
	para "Once it's gone"
	line "everything should"
	cont "be ready!"
	done

_PokemonTowerCatacombsTheMawGraveText::
	text "HERE LIES A"
	line "NOTORIOUS GOLBAT"
	para "This GOLBAT killed"
	line "its own trainer"
	cont "and continued on"
	cont "a violent spree."
	para "It is unknown"
	line "whether it had a"
	cont "nickname.@"
	text_jump _PokemonTowerCatacombsWavedStaff

_PokemonTowerCatacombsTheMawGraveText2::
	text "YOU DIE NOW"
	done

_PokemonTowerB1FTheMawUsedHyperBeamText::
	text "The dark spirit"
	line "used HYPER BEAM!"
	done

_PokemonTowerB1FMarowakBlockedHyperBeamText::
	text "@"
	text_ram wcd6d
	text " blocked"
	line "the HYPER BEAM"
	cont "from hitting"
	cont "CUBONE!"
	para "But the beam was"
	line "too powerful!"
	para "@"
	text_ram wcd6d
	text " can't"
	line "maintain its"
	cont "physical form"
	cont "anymore!"
	done

_PokemonTowerB1FMarowakBuffedCubone::
	text "@"
	text_ram wcd6d
	text "'s spirit"
	line "cradled CUBONE,"
	cont "and transferred"
	cont "all of its power!"
	para "CUBONE joined"
	line "your party."
	prompt

_PokemonTowerB1FTheMawAttacked::
	text "It's time to"
	line "fight!"
	para "The dark spirit"
	line "attacked!"
	done

_CubonePoweredUp::
	text "@"
	text_ram wTrainerName
	text "'s spirit"
	line "bestowed divine"
	cont "energy on CUBONE!"
	prompt

_CuboneGainedUltimateProtection::
	text "CUBONE gained"
	line "ultimate"
	cont "protection!"
	prompt

_TheMawMeltedIntoShadows::
	text "The dark spirit"
	line "faded into the"
	cont "shadows, never to"
	cont "return."
	done

_GhostMarowakOneLastTime::
	text "@"
	text_ram wTrainerName
	text " used"
	line "the remnants of"
	cont "its energy to"
	cont "show itself one"
	cont "last time."
	prompt

_PokemonTowerGhostMarowakAfterText::
	text ""
	para "Thank you"
	line "<PLAYER>!"
	para "I can finally"
	line "rest in peace!"
	para "I love you CUBONE!"
	para "But it's time for"
	line "mother to go."
	para "Don't be sad."
	para "Enjoy life while"
	line "you can-"
	para "Goodbye<...>"
	prompt

_PokemonTowerCatacombsDoneText::
	text "Well, thanks for"
	line "doing my job for"
	cont "me!"
	para "The DARK CHANNELER"
	line "took back her"
	cont "CHANNELER's STAFF."
	para "Time to go back"
	line "upstairs!"
	done

_PokemonTowerCatacombsGoBackDown::
	text "Want to go"
	line "back downstairs?"
	done