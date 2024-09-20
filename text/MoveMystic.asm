_MoveMysticIntro::
	text "I am the"
	line "MOVE MYSTIC!"
	para "Certain #MON"
	line "have hidden"
	cont "talents!"
	para "I can scry for"
	line "their secrets in"
	cont "my crystal ball!"
	para "But only if"
	line "you've seen the"
	cont "#MON before!"
	prompt

_MoveMysticAgain::
	text "You've returned to"
	line "the MOVE MYSTIC!"
	prompt

_MoveMysticQuestion::
	text "What #MON"
	line "shall I divine"
	cont "the secrets of?"
	prompt

_MoveMysticLookDeep::
	text "Look deep into"
	line "my crystal ball!"
	prompt

_MoveMysticAhYes::
	text "Ah yes<...>"
	line "I see it."
	para "@"
	text_ram wStringBuffer
	text ", the@"
	text_end

; TODO: use pokemon's names correctly with stringbuffer
_BeedrillMoveMysticText::
	text_start
	line "hypodermic"
	cont "hornet."
	prompt

_ArbokMoveMysticText::
	text_start
	line "venomous viper."
	prompt

_FearowMoveMysticText::
	text_start
	line "bloodthirsty"
	cont "beak."
	prompt

_GolemMoveMysticText::
	text_start
	line "rolling rock."
	prompt

_HitmonleeMoveMysticText::
	text_start
	line "king of kicks."
	prompt

_HitmonchanMoveMysticText::
	text_start
	line "furious fist."
	prompt

_ElectabuzzMoveMysticText::
	text_start
	line "voltaic vanguard."
	prompt

_MagmarMoveMysticText::
	text_start
	line "pyroclastic"
	cont "punisher."
	prompt

_JynxMoveMysticText::
	text_start
	line "glacial goddess."
	prompt

_HypnoMoveMysticText::
	text_start
	line "hypnotic horror."
	prompt

_DragoniteMoveMysticText::
	text_start
	line "mystical monarch."
	prompt

_SeakingMoveMysticText::
	text_start
	line "fabulous fish."
	prompt
	
_KangaskhanMoveMysticText::
	text_start
	line "parental"
	cont "powerhouse."
	prompt
	
_LickitungMoveMysticText::
	text_start
	line "salivating"
	cont "slurper."
	prompt

_OmastarMoveMysticText::
	text_start
	line "ancient ammonite."
	prompt

_JigglypuffMoveMysticText::
	text_start
	line "spherical"
	cont "songstress."
	prompt

_WigglytuffMoveMysticText::
	text_start
	line "globular glory."
	prompt

_MoveMysticMasterOfMoveText::
	text "It's a master"
	line "of @"
	text_ram wcd6d
	text "!"
	prompt

_MoveMysticTalentOfMoveText::
	text "@"
	text_ram wcd6d
	text ""
	line "is its talent!"
	prompt

_MoveMysticSoulCallsForMoveText::
	text "Its soul calls"
	line "for @"
	text_ram wcd6d
	text "!"
	prompt

_MoveMysticLovesMoveText::
	text "It loves to use"
	line "@"
	text_ram wcd6d
	text "!"
	prompt

_MoveMysticBeedrillText::
	text "Its deadly"
	line "stingers help in"
	cont "multiple ways!"
	para "POISON STING's"
	line "POWER triples to"
	cont "45!"
	para "On top of that,"
	line "TWINEEDLE's POWER"
	cont "increases to 65!"
	done

_MoveMysticAccuracy85::
	text "Its ACCURACY"
	line "increases to 85%!"
	done

_MoveMysticJigglyWigglyOnlyLevel20Text::
	text_start
	para "But only when"
	line "above level 20!"
	done

; TODO: use another smaller buffer
_GenericMovePowerIncreasesText::
	text "Its POWER"
	line "increases to @"
	text_decimal w2CharStringBuffer, 1, 3
	text "!"
	done
