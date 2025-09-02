_CinnabarVolcanoBombRocksText::
	text "These rocks are"
	line "blocking the lava"
	cont "from flowing out."
	para "Smash them with"
	line "a #MON?"
	done

_CinnabarVolcanoBombRocksTextDoneJump::
	para "@"
_CinnabarVolcanoBombRocksTextDone::
	text "Lava's flowing out"
	line "of the volcano."
	done

_CinnabarVolcanoProspectorGreetingNotMetText::
	text "Hey kid!"
	para "This place is"
	line "dangerous!"
	para "What are you doing"
	line "here?"
	para "Huh! You've got"
	line "strong #MON!"
	prompt

_CinnabarVolcanoProspectorGreetingMetText::
	text "PROSPECTOR: Hey"
	line "kid!"
	para "Imagine meeting"
	line "you again here!"
	para "You came at a"
	line "great time!"
	para "You've got strong"
	line "#MON!"
	prompt

_CinnabarVolcanoProspectorStrongMonsText::
	text "It's too hot in"
	line "CINNABAR VOLCANO"
	cont "for the average"
	cont "explorer."
	para "Maybe you can help"
	line "us out in here!"
	para "But first you'll"
	line "need to put on"
	cont "one of these-"
	prompt

_CinnabarVolcanoProspectorLavaSuitText::
	text "It's a LAVA SUIT!"
	para "It'll protect you"
	line "from the heat!"
	para "It's like an oven"
	line "in there!"
	para "Here try this"
	line "one on!"
	prompt

_CinnabarVolcanoProspectorLetsGo::
	text "Lookin' good!"
	para "Alright,"
	line "follow me!"
	done

_CinnabarVolcanoProspectorHeresProblem::
	text "Alright kid, here's"
	line "the problem-"
	prompt

_CinnabarVolcanoProspectorLavaExplain::
	text "There's too much"
	line "lava here in the"
	cont "main lava cone!"
	para "It usually flows"
	line "out underwater."
	para "If we don't drain"
	line "some of this lava"
	cont "the volcano will"
	cont "erupt soon!"
	para "The lava must be"
	line "clogged up"
	cont "somewhere below."
	para "You've got to"
	line "clear those"
	cont "blockages!"
	prompt

_CinnabarVolcanoProspectorBlowRocks::
	text "Rocks that look"
	line "like this one"
	cont "create blockages!"
	para "Find the blockages"
	line "and blow them up,"
	cont "smash them, melt"
	cont "them down-just"
	cont "do whatever to"
	cont "get rid of them!"
	prompt

_CinnabarVolcanoGiveDrill::
	text "You'll need to"
	line "dig down deeper"
	cont "into the volcano!"
	para "There isn't any"
	line "way down yet, so"
	cont "take a DRILL!"
	prompt

_CinnabarVolcanoGotDrill::
	text "<PLAYER> got a"
	line "POWER DRILL!"
	done

_CinnabarVolcanoDrill::
	text "Press SELECT to"
	line "use your DRILL."
	para "You can drill a"
	line "hole down where"
	cont "you see cracks!"
	para "But it'll take"
	line "a fresh DRILL bit"
	cont "to dig down."
	para "To make a new one,"
	line "just pop 3 RUBIES"
	cont "into the DRILL!"
	para "You should be"
	line "able to find lots"
	cont "of them here!"
	prompt

_CinnabarVolcanoFriend::
	text "This guy with his"
	line "ARCANINE will go"
	cont "clear the west"
	cont "side."
	prompt

_CinnabarVolcanoYouClearEast::
	text "You clear the"
	line "east side!"
	para "Oh and one last"
	line "thing."
	para "Since it's so"
	line "hot, you might"
	cont "want to stick to"
	cont "FIRE, GROUND, or"
	cont "ROCK #MON."
	para "They're the only"
	line "ones who can take"
	cont "this heat!"
	prompt

_ExplodeRocksExplosionText::
	text_ram wNameBuffer
	text " used"
	line "EXPLOSION to"
	cont "blow up the rocks!"
	done

_ExplodeRocksSelfdestructText::
	text_ram wNameBuffer
	text " used"
	line "SELFDESTRUCT to"
	cont "blow up the rocks!"
	done

_ShatteredRocksSkullBashText::
	text_ram wNameBuffer
	text " smashed"
	line "the rocks with"
	cont "SKULL BASH!"
	done

_ShatteredRocksText::
	text_ram wNameBuffer
	text " smashed"
	line "the rocks with"
	cont "a powerful blow!"
	done

_MeltedRocksText::
	text_ram wNameBuffer
	text " melted"
	line "the rocks with"
	cont "superheated fire!"
	done

_RocksGoneText::
	text "The lava flow was"
	line "unclogged!"
	done

_WhereRubiesText::
	text "Time to find"
	line "some RUBIES for"
	cont "the DRILL!"
	para "They should be"
	line "on this floor!"
	done

_FoundRubyText::
	text "<PLAYER> found"
	line "a RUBY!"
	done

_RubyTwoMoreToGoText::
	text "Two@"
	text_jump _MoreToGoText
	
_MoreToGoText:
	text_end
	text " more to go!"
	done

_RubyOneMoreToGoText::
	text "One@"
	text_jump _MoreToGoText

_RubyGotAllOfThemText::
	text "<PLAYER> inserted"
	line "the 3 RUBIES into"
	cont "the DRILL."
	done

_RubyGoodToGo::
	text "The DRILL entered"
	line "power mode!"
	para "Time to dig down"
	line "to the next floor!"
	done

_ItsRhydon::
	text "It's a RHYDON."
	para "It looks bored."
	prompt

_RhydonGetOnBack::
	text "Jump on its back?"
	done

_RhydonGotOnBack::
	text "Here we go!"
	done

_GotRocksalts::
	text "<PLAYER> found"
	line "ROCK SALTS!"
	done

_GotLimestone::
	text "<PLAYER> found"
	line "LIMESTONE!"
	done

_ItsGraveler::
	text "It's a GRAVELER."
	para "It's enjoying a"
	line "massage from the"
	cont "flowing lava."
	para "It looks a bit"
	line "hungry."
	done

_GiveGravelerRockSalts::
	text "Give it ROCK SALTS"
	line "to eat?"
	done

_GravelerMunching::
	text "The GRAVELER is"
	line "munching on the"
	cont "ROCK SALTS."
	para "Looks satisfied!"
	done

_ItsSickRhydon::
	text "It's another"
	line "RHYDON."
	para "This one seems"
	line "to have an upset"
	cont "stomach."
	done

_GiveRhydonLimestone::
	text "Give it some"
	line "crushed LIMESTONE"
	cont "to cure its"
	cont "indigestion?"
	done

_RhydonGrinded::
	text "<PLAYER> ground"
	line "the LIMESTONE to"
	cont "a fine powder"
	cont "with the DRILL."
	done

_GotAntacidText::
	text "The LIMESTONE"
	line "became ANTACID!"
	done

_GaveRhydonAntacid::
	text "The sick RHYDON"
	line "swallowed the"
	cont "ANTACID."
	prompt

_RhydonResting::
	text "The sick RHYDON"
	line "will feel better,"
	cont "but needs rest!"
	done

_MagmarBoss::
	text "A big MAGMAR is"
	line "blocking the way."
	done

_MagmarFight::
	text "It looks very"
	line "aggressive."
	para "Fight it?"
	done

_VolcanoBattleBurnText::
	text "The volcano's"
	line "too hot for"
	cont "@"
	text_ram wBattleMonNick
	text "!"
	prompt


_LetsDoThis::
	text "Let's do this!"
	done

_MagmarBattleInit::
	text "A veil of magma"
	line "covers @"
	text_ram wEnemyMonNick
	text "!"
	para "It powered up!"
	prompt

_EnemyMonWasDefeatedText::
	text "Enemy @"
	text_ram wEnemyMonNick
	text_start
	line "was defeated!"
	prompt

_MagmarDefeat::
	text "MAGMAR conceded"
	line "defeat and moved"
	cont "to let you pass."
	done

_UhohVolcano::
	text "Uh oh. The lava"
	line "is about to burst"
	cont "through the whole"
	cont "eastern wall!"
	para "Gotta get behind"
	line "cover quick!"
	done

_VolcanoBlockagesGone::
	text "Wow! That should"
	line "drain any excess"
	cont "lava!"
	para "<PLAYER> cleared"
	line "all blockages!"
	done

_VolcanoGoBackMainFloor::
	text_start
	para "Lets see how"
	line "they did back"
	cont "up at the top."
	done

_VolcanoBlaineJoinUs::
	text "Nice of you"
	line "to join us!"
	done

_VolcanoProspectorDone::
	text "Whoa!"
	para "What did you do?"
	para "The lava is"
	line "draining out"
	cont "like crazy!!"
	para "Look!"
	prompt

_VolcanoProspectorDone2::
	text "Well, that should"
	line "stop an eruption!"
	para "Lets get out"
	line "of here, kid!"
	para "I'm sweating like"
	line "an ODDISH at a"
	cont "salad bar!"
	done

_VolcanoProspectorPhew::
	text "Phew, we can"
	line "finally get out"
	cont "of these suits!"
	prompt

_VolcanoProspectorRightBlaine::
	text "Glad I got them!"
	para "They came in"
	line "handy!"
	para "Even though you"
	line "and BLAINE did"
	cont "all the work!"
	prompt

_VolcanoBlaineMessage1::
	text "BLAINE: Well that"
	line "should keep the"
	cont "eruption at bay."
	para "That heat is"
	line "something else!"
	para "Thought I might"
	line "catch a glimpse"
	cont "of a fiery bird"
	cont "#MON I saw"
	cont "many years ago."
	para "Oh well!"
	para "Maybe I'll see"
	line "it again someday!"
	prompt

_VolcanoBlaineMessageNotDone::
	text "<PLAYER> was your"
	line "name, correct?"
	para "Great work!"
	para "I hope you come"
	line "to challenge me"
	cont "at CINNABAR GYM!"
	para "That is, if you"
	line "can get in!"
	para "Hah! Until next"
	line "time!"
	done

_VolcanoBlaineMessageGymDone::
	text "We meet again,"
	line "<PLAYER>!"
	para "This young buck"
	line "was one of the"
	cont "two trainers who"
	cont "trounced me at"
	cont "the GYM recently!"
	para "Keep at it, boy!"
	para "Hah! Until next"
	line "time!"
	done

_VolcanoProspectorAfterMessage::
	text "I'll be here for"
	line "a while, doing"
	cont "what I do best-"
	para "prospecting!"
	para "You saw all those"
	line "RUBIES!"
	para "You can use that"
	line "LAVA SUIT as much"
	cont "as you like, kid!"
	done

_VolcanoAvoidWestSide::
	text "Someone's taking"
	line "care of the west"
	cont "side already."
	para "Gotta clear the"
	line "blockages on the"
	cont "other side!"
	done

_VolcanoGetToIt::
	text "I'll keep an eye"
	line "on the amount of"
	cont "lava up here."
	para "I'd help, but I"
	line "don't have #MON"
	cont "to bring with me!"
	para "Get to it, kid!"
	done

_FailedDrillFloorText::
	text "The DRILL is too"
	line "dull to dig down!"
	para "Find 3 RUBIES"
	line "to make a new"
	cont "DRILL bit!"
	done

_CinnabarVolcanoFloor2WarpTilesText::
	text "Whoa! What are"
	line "those?"
	para "Looks like the"
	line "lava flow opened"
	cont "up the ground"
	cont "over there!"
	done

_CinnabarVolcanoWestMagmar1Text::
	text "Many MAGMAR are"
	line "relaxing in the"
	cont "lava flow."
	done

_CinnabarVolcanoWestMagmar1QuestionText::
	text "It looks like"
	line "there's room for"
	cont "one more!"
	prompt

_CinnabarVolcanoWestMagmar2Text::
	text "MAGMAR: Fwoo?"
	done

_CinnabarVolcanoWestMagmar3Text::
	text "MAGMAR: Fshaa!"
	done

_CinnabarVolcanoWestLavaFlowText::
	text "This is where"
	line "BLAINE cleared a"
	cont "lava blockage.@"
	text_jump _CinnabarVolcanoBombRocksTextDoneJump

_CinnabarVolcanoWestMagmarTransformText1::
	text "@"
	text_ram wNameBuffer
	text " looks"
	line "excited for a"
	cont "lava bath!"
	done

_CinnabarVolcanoWestMagmarTransformText2::
	text "@"
	text_ram wNameBuffer
	text " did a"
	line "cannonball into"
	cont "the lava pool!"
	done

_CinnabarVolcanoWestMagmarTransformText3::
	text "Volcanic power"
	line "radiated through"
	cont "@"
	text_ram wNameBuffer
	text "!"
	done

_MagmarEventAlready::
	text "It's already"
	line "filled with the"
	cont "burning heat"
	cont "of the volcano."
	done

_CinnabarVolcanoWestMagmarTransformText4::
	text "<PARA>It became so"
	line "scorchingly hot,"
	cont "all water near it"
	cont "will vaporize!"
	para "@"
	text_ram wNameBuffer
	text " became"
	line "immune to WATER"
	cont "and FIRE-type"
	cont "moves!"
	para "The tectonic power"
	line "of the volcano"
	cont "flows through it!"
	para "GROUND-type moves"
	line "will get bonus"
	cont "damage!"
	done

_Route21CinnabarVolcanoSignText::
	text "CINNABAR VOLCANO"
	para "DANGER!"
	para "DO NOT ENTER"
	line "WITHOUT HEAT-"
	cont "RESISTANT KIT!"
	done
