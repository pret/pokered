INCLUDE "crysaudio/macros.asm"
INCLUDE "crysaudio/audio_constants.asm"
INCLUDE "crysaudio/cry_constants.asm"


SECTION "Sound Effect Headers 1", ROMX
INCLUDE "audio/headers/sfxheaders1.asm"

SECTION "Sound Effect Headers 2", ROMX
INCLUDE "audio/headers/sfxheaders2.asm"

SECTION "Sound Effect Headers 3", ROMX
INCLUDE "audio/headers/sfxheaders3.asm"


SECTION "Sound Effects 1", ROMX

INCLUDE "audio/sfx/start_menu_1.asm"
INCLUDE "audio/sfx/pokeflute.asm"
INCLUDE "audio/sfx/cut_1.asm"
INCLUDE "audio/sfx/go_inside_1.asm"
INCLUDE "audio/sfx/swap_1.asm"
INCLUDE "audio/sfx/tink_1.asm"
INCLUDE "audio/sfx/59_1.asm"
INCLUDE "audio/sfx/purchase_1.asm"
INCLUDE "audio/sfx/collision_1.asm"
INCLUDE "audio/sfx/go_outside_1.asm"
INCLUDE "audio/sfx/press_ab_1.asm"
INCLUDE "audio/sfx/save_1.asm"
INCLUDE "audio/sfx/heal_hp_1.asm"
INCLUDE "audio/sfx/poisoned_1.asm"
INCLUDE "audio/sfx/heal_ailment_1.asm"
INCLUDE "audio/sfx/trade_machine_1.asm"
INCLUDE "audio/sfx/turn_on_pc_1.asm"
INCLUDE "audio/sfx/turn_off_pc_1.asm"
INCLUDE "audio/sfx/enter_pc_1.asm"
INCLUDE "audio/sfx/shrink_1.asm"
INCLUDE "audio/sfx/switch_1.asm"
INCLUDE "audio/sfx/healing_machine_1.asm"
INCLUDE "audio/sfx/teleport_exit1_1.asm"
INCLUDE "audio/sfx/teleport_enter1_1.asm"
INCLUDE "audio/sfx/teleport_exit2_1.asm"
INCLUDE "audio/sfx/ledge_1.asm"
INCLUDE "audio/sfx/teleport_enter2_1.asm"
INCLUDE "audio/sfx/fly_1.asm"
INCLUDE "audio/sfx/denied_1.asm"
INCLUDE "audio/sfx/arrow_tiles_1.asm"
INCLUDE "audio/sfx/push_boulder_1.asm"
INCLUDE "audio/sfx/ss_anne_horn_1.asm"
INCLUDE "audio/sfx/withdraw_deposit_1.asm"
INCLUDE "audio/sfx/safari_zone_pa.asm"

INCLUDE "audio/sfx/get_item1_1.asm"
INCLUDE "audio/sfx/pokedex_rating_1.asm"
INCLUDE "audio/sfx/get_item2_1.asm"
INCLUDE "audio/sfx/get_key_item_1.asm"


SECTION "Sound Effects 2", ROMX

INCLUDE "audio/sfx/silph_scope.asm"
INCLUDE "audio/sfx/ball_toss.asm"
INCLUDE "audio/sfx/ball_poof.asm"
INCLUDE "audio/sfx/faint_thud.asm"
INCLUDE "audio/sfx/run.asm"
INCLUDE "audio/sfx/dex_page_added.asm"
INCLUDE "audio/sfx/peck.asm"
INCLUDE "audio/sfx/faint_fall.asm"
INCLUDE "audio/sfx/battle_09.asm"
INCLUDE "audio/sfx/pound.asm"
INCLUDE "audio/sfx/battle_0b.asm"
INCLUDE "audio/sfx/battle_0c.asm"
INCLUDE "audio/sfx/battle_0d.asm"
INCLUDE "audio/sfx/battle_0e.asm"
INCLUDE "audio/sfx/battle_0f.asm"
INCLUDE "audio/sfx/damage.asm"
INCLUDE "audio/sfx/not_very_effective.asm"
INCLUDE "audio/sfx/battle_12.asm"
INCLUDE "audio/sfx/battle_13.asm"
INCLUDE "audio/sfx/battle_14.asm"
INCLUDE "audio/sfx/vine_whip.asm"
INCLUDE "audio/sfx/battle_16.asm"
INCLUDE "audio/sfx/battle_17.asm"
INCLUDE "audio/sfx/battle_18.asm"
INCLUDE "audio/sfx/battle_19.asm"
INCLUDE "audio/sfx/super_effective.asm"
INCLUDE "audio/sfx/battle_1b.asm"
INCLUDE "audio/sfx/battle_1c.asm"
INCLUDE "audio/sfx/doubleslap.asm"
INCLUDE "audio/sfx/battle_1e.asm"
INCLUDE "audio/sfx/horn_drill.asm"
INCLUDE "audio/sfx/battle_20.asm"
INCLUDE "audio/sfx/battle_21.asm"
INCLUDE "audio/sfx/battle_22.asm"
INCLUDE "audio/sfx/battle_23.asm"
INCLUDE "audio/sfx/battle_24.asm"
INCLUDE "audio/sfx/battle_25.asm"
INCLUDE "audio/sfx/battle_26.asm"
INCLUDE "audio/sfx/battle_27.asm"
INCLUDE "audio/sfx/battle_28.asm"
INCLUDE "audio/sfx/battle_29.asm"
INCLUDE "audio/sfx/battle_2a.asm"
INCLUDE "audio/sfx/battle_2b.asm"
INCLUDE "audio/sfx/battle_2c.asm"
INCLUDE "audio/sfx/psybeam.asm"
INCLUDE "audio/sfx/battle_2e.asm"
INCLUDE "audio/sfx/battle_2f.asm"
INCLUDE "audio/sfx/psychic_m.asm"
INCLUDE "audio/sfx/battle_31.asm"
INCLUDE "audio/sfx/battle_32.asm"
INCLUDE "audio/sfx/battle_33.asm"
INCLUDE "audio/sfx/battle_34.asm"
INCLUDE "audio/sfx/battle_35.asm"
INCLUDE "audio/sfx/battle_36.asm"

INCLUDE "audio/sfx/level_up.asm"
INCLUDE "audio/sfx/caught_mon.asm"

INCLUDE "audio/sfx/pokeflute_ch5_ch6.asm"
INCLUDE "audio/sfx/pokeflute_ch7.asm"


SECTION "Sound Effects 3", ROMX

INCLUDE "audio/sfx/intro_lunge.asm"
INCLUDE "audio/sfx/intro_hip.asm"
INCLUDE "audio/sfx/intro_hop.asm"
INCLUDE "audio/sfx/intro_raise.asm"
INCLUDE "audio/sfx/intro_crash.asm"
INCLUDE "audio/sfx/intro_whoosh.asm"
INCLUDE "audio/sfx/slots_stop_wheel.asm"
INCLUDE "audio/sfx/slots_reward.asm"
INCLUDE "audio/sfx/slots_new_spin.asm"
INCLUDE "audio/sfx/shooting_star.asm"


SECTION "Music Routines", ROMX

INCLUDE "audio/play_battle_music.asm"


SECTION "Alt Music Routines", ROMX

INCLUDE "audio/alternate_tempo.asm"


SECTION "Pokedex Rating SFX Routines", ROMX

INCLUDE "audio/pokedex_rating_sfx.asm"

; crystal:

SECTION "Audio Engine 1", ROMX

INCLUDE "crysaudio/engine.asm"

INCLUDE "crysaudio/music_pointers_red.asm"
;INCLUDE "crysaudio/music_pointers.asm"

INCLUDE "crysaudio/music/nothing.asm"

INCLUDE "crysaudio/cry_pointers.asm"

INCLUDE "crysaudio/sfx_pointers_red.asm"
;INCLUDE "crysaudio/sfx_pointers.asm"


SECTION "Songs 1", ROMX

	inc_section "crysaudio/music/route36.asm"
	inc_section "crysaudio/music/rivalbattle.asm"
	inc_section "crysaudio/music/rocketbattle.asm"
	inc_section "crysaudio/music/elmslab.asm"
	inc_section "crysaudio/music/darkcave.asm"
	inc_section "crysaudio/music/johtogymbattle.asm"
	inc_section "crysaudio/music/championbattle.asm"
	inc_section "crysaudio/music/ssaqua.asm"
	inc_section "crysaudio/music/newbarktown.asm"
	inc_section "crysaudio/music/goldenrodcity.asm"
	inc_section "crysaudio/music/vermilioncity.asm"
	inc_section "crysaudio/music/titlescreen.asm"
	inc_section "crysaudio/music/ruinsofalphinterior.asm"
	inc_section "crysaudio/music/lookpokemaniac.asm"
	inc_section "crysaudio/music/trainervictory.asm"


SECTION "Songs 2", ROMX

	inc_section "crysaudio/music/route1.asm"
	inc_section "crysaudio/music/route3.asm"
	inc_section "crysaudio/music/route12.asm"
	inc_section "crysaudio/music/kantogymbattle.asm"
	inc_section "crysaudio/music/kantotrainerbattle.asm"
	inc_section "crysaudio/music/kantowildbattle.asm"
	inc_section "crysaudio/music/pokemoncenter.asm"
	inc_section "crysaudio/music/looklass.asm"
	inc_section "crysaudio/music/lookofficer.asm"
	inc_section "crysaudio/music/route2.asm"
	inc_section "crysaudio/music/mtmoon.asm"
	inc_section "crysaudio/music/showmearound.asm"
	inc_section "crysaudio/music/gamecorner.asm"
	inc_section "crysaudio/music/bicycle.asm"
	inc_section "crysaudio/music/looksage.asm"
	inc_section "crysaudio/music/pokemonchannel.asm"
	inc_section "crysaudio/music/lighthouse.asm"
	inc_section "crysaudio/music/lakeofrage.asm"
	inc_section "crysaudio/music/indigoplateau.asm"
	inc_section "crysaudio/music/route37.asm"
	inc_section "crysaudio/music/rockethideout.asm"
	inc_section "crysaudio/music/dragonsden.asm"
	inc_section "crysaudio/music/ruinsofalphradio.asm"
	inc_section "crysaudio/music/lookbeauty.asm"
	inc_section "crysaudio/music/route26.asm"
	inc_section "crysaudio/music/ecruteakcity.asm"
	inc_section "crysaudio/music/lakeofragerocketradio.asm"
	inc_section "crysaudio/music/magnettrain.asm"
	inc_section "crysaudio/music/lavendertown.asm"
	inc_section "crysaudio/music/dancinghall.asm"
	inc_section "crysaudio/music/contestresults.asm"
	inc_section "crysaudio/music/route30.asm"


SECTION "Songs 3", ROMX

	inc_section "crysaudio/music/violetcity.asm"
	inc_section "crysaudio/music/route29.asm"
	inc_section "crysaudio/music/halloffame.asm"
	inc_section "crysaudio/music/healpokemon.asm"
	inc_section "crysaudio/music/evolution.asm"
	inc_section "crysaudio/music/printer.asm"


SECTION "Songs 4", ROMX

	inc_section "crysaudio/music/viridiancity.asm"
	inc_section "crysaudio/music/celadoncity.asm"
SECTION "Wild Pokemon Victory and Successful Capture", ROMX
	INCLUDE "crysaudio/music/wildpokemonvictory.asm"
	INCLUDE "crysaudio/music/successfulcapture.asm"
	inc_section "crysaudio/music/gymleadervictory.asm"
	inc_section "crysaudio/music/mtmoonsquare.asm"
	inc_section "crysaudio/music/gym.asm"
	inc_section "crysaudio/music/pallettown.asm"
	inc_section "crysaudio/music/profoakspokemontalk.asm"
	inc_section "crysaudio/music/profoak.asm"
SECTION "Johto Rival", ROMX
	INCLUDE "crysaudio/music/lookrival.asm"
	INCLUDE "crysaudio/music/aftertherivalfight.asm"
	inc_section "crysaudio/music/surf.asm"
	inc_section "crysaudio/music/nationalpark.asm"
	inc_section "crysaudio/music/azaleatown.asm"
	inc_section "crysaudio/music/cherrygrovecity.asm"
	inc_section "crysaudio/music/unioncave.asm"
SECTION "Johto Wild Battle", ROMX
	INCLUDE "crysaudio/music/johtowildbattle.asm"
	INCLUDE "crysaudio/music/johtowildbattlenight.asm"
	inc_section "crysaudio/music/johtotrainerbattle.asm"
	inc_section "crysaudio/music/lookyoungster.asm"
	inc_section "crysaudio/music/tintower.asm"
	inc_section "crysaudio/music/sprouttower.asm"
	inc_section "crysaudio/music/burnedtower.asm"
	inc_section "crysaudio/music/mom.asm"
	inc_section "crysaudio/music/victoryroad.asm"
	inc_section "crysaudio/music/pokemonlullaby.asm"
	inc_section "crysaudio/music/pokemonmarch.asm"
	inc_section "crysaudio/music/goldsilveropening.asm"
	inc_section "crysaudio/music/goldsilveropening2.asm"
	inc_section "crysaudio/music/lookhiker.asm"
SECTION "Johto Rocket Themes", ROMX
	INCLUDE "crysaudio/music/lookrocket.asm"
	INCLUDE "crysaudio/music/rockettheme.asm"
	inc_section "crysaudio/music/mainmenu.asm"
	inc_section "crysaudio/music/lookkimonogirl.asm"
	inc_section "crysaudio/music/pokeflutechannel.asm"
	inc_section "crysaudio/music/bugcatchingcontest.asm"


SECTION "Songs 5", ROMX

	inc_section "crysaudio/music/mobileadaptermenu.asm"
	inc_section "crysaudio/music/buenaspassword.asm"
	inc_section "crysaudio/music/lookmysticalman.asm"
	inc_section "crysaudio/music/crystalopening.asm"
	inc_section "crysaudio/music/battletowertheme.asm"
	inc_section "crysaudio/music/suicunebattle.asm"
	inc_section "crysaudio/music/battletowerlobby.asm"
	inc_section "crysaudio/music/mobilecenter.asm"


SECTION "Extra Songs 1", ROMX

	inc_section "crysaudio/music/credits.asm"
	inc_section "crysaudio/music/clair.asm"
	inc_section "crysaudio/music/mobileadapter.asm"


SECTION "Extra Songs 2", ROMX

	inc_section "crysaudio/music/postcredits.asm"


SECTION "RBY Songs 1", ROMX

	inc_section "crysaudio/music/RBY/pkmnhealed.asm"
	inc_section "crysaudio/music/RBY/routes1.asm"
	inc_section "crysaudio/music/RBY/routes2.asm"
	inc_section "crysaudio/music/RBY/routes3.asm"
	inc_section "crysaudio/music/RBY/routes4.asm"
	inc_section "crysaudio/music/RBY/indigoplateau.asm"
	inc_section "crysaudio/music/RBY/pallettown.asm"
	inc_section "crysaudio/music/RBY/unusedsong.asm"
	inc_section "crysaudio/music/RBY/cities1.asm"
	inc_section "crysaudio/music/RBY/museumguy.asm"
	inc_section "crysaudio/music/RBY/meetprofoak.asm"
	inc_section "crysaudio/music/RBY/meetrival.asm"
	inc_section "crysaudio/music/RBY/ssanne.asm"
	inc_section "crysaudio/music/RBY/cities2.asm"
	inc_section "crysaudio/music/RBY/celadon.asm"
	inc_section "crysaudio/music/RBY/cinnabar.asm"
	inc_section "crysaudio/music/RBY/vermilion.asm"
	inc_section "crysaudio/music/RBY/lavender.asm"
	inc_section "crysaudio/music/RBY/safarizone.asm"
	inc_section "crysaudio/music/RBY/gym.asm"
	inc_section "crysaudio/music/RBY/pokecenter.asm"


SECTION "RBY Songs 2", ROMX

	inc_section "crysaudio/music/RBY/gymleaderbattle.asm"
	inc_section "crysaudio/music/RBY/trainerbattle.asm"
	inc_section "crysaudio/music/RBY/wildbattle.asm"
	inc_section "crysaudio/music/RBY/finalbattle.asm"
	inc_section "crysaudio/music/RBY/defeatedtrainer.asm"
	inc_section "crysaudio/music/RBY/defeatedwildmon.asm"
	inc_section "crysaudio/music/RBY/defeatedgymleader.asm"


SECTION "RBY Songs 3", ROMX

	inc_section "crysaudio/music/RBY/bikeriding.asm"
	inc_section "crysaudio/music/RBY/dungeon1.asm"
	inc_section "crysaudio/music/RBY/gamecorner.asm"
	inc_section "crysaudio/music/RBY/titlescreen.asm"
	inc_section "crysaudio/music/RBY/dungeon2.asm"
	inc_section "crysaudio/music/RBY/dungeon3.asm"
	inc_section "crysaudio/music/RBY/cinnabarmansion.asm"
	inc_section "crysaudio/music/RBY/oakslab.asm"
	inc_section "crysaudio/music/RBY/pokemontower.asm"
	inc_section "crysaudio/music/RBY/silphco.asm"
	inc_section "crysaudio/music/RBY/meeteviltrainer.asm"
	inc_section "crysaudio/music/RBY/meetfemaletrainer.asm"
	inc_section "crysaudio/music/RBY/meetmaletrainer.asm"
	inc_section "crysaudio/music/RBY/introbattle.asm"
	inc_section "crysaudio/music/RBY/surfing.asm"
	inc_section "crysaudio/music/RBY/jigglypuffsong.asm"
	inc_section "crysaudio/music/RBY/halloffame.asm"
	inc_section "crysaudio/music/RBY/credits.asm"


SECTION "RBY Songs 4", ROMX

	inc_section "crysaudio/music/RBY/yellowintro.asm"
	inc_section "crysaudio/music/RBY/surfingpikachu.asm"
	inc_section "crysaudio/music/RBY/yellowunusedsong.asm"
	inc_section "crysaudio/music/RBY/meetjessiejames.asm"


SECTION "TCG Songs 1", ROMX

	inc_section "crysaudio/music/TCG/titlescreen.asm"
	inc_section "crysaudio/music/TCG/dueltheme1.asm"
	inc_section "crysaudio/music/TCG/dueltheme2.asm"
	inc_section "crysaudio/music/TCG/dueltheme3.asm"
	inc_section "crysaudio/music/TCG/pausemenu.asm"
	inc_section "crysaudio/music/TCG/pcmainmenu.asm"
	inc_section "crysaudio/music/TCG/deckmachine.asm"
	inc_section "crysaudio/music/TCG/cardpop.asm"
	inc_section "crysaudio/music/TCG/overworld.asm"
	inc_section "crysaudio/music/TCG/pokemondome.asm"
	inc_section "crysaudio/music/TCG/challengehall.asm"
	inc_section "crysaudio/music/TCG/club1.asm"
	inc_section "crysaudio/music/TCG/club2.asm"
	inc_section "crysaudio/music/TCG/club3.asm"


SECTION "TCG Songs 2", ROMX

	inc_section "crysaudio/music/TCG/ronald.asm"
	inc_section "crysaudio/music/TCG/imakuni.asm"
	inc_section "crysaudio/music/TCG/hallofhonor.asm"
	inc_section "crysaudio/music/TCG/credits.asm"
	inc_section "crysaudio/music/TCG/matchstart1.asm"
	inc_section "crysaudio/music/TCG/matchstart2.asm"
	inc_section "crysaudio/music/TCG/matchstart3.asm"
	inc_section "crysaudio/music/TCG/matchvictory.asm"
	inc_section "crysaudio/music/TCG/matchloss.asm"
	inc_section "crysaudio/music/TCG/matchdraw.asm"
	inc_section "crysaudio/music/TCG/boosterpack.asm"
	inc_section "crysaudio/music/TCG/medal.asm"


SECTION "TCG2 Songs 1", ROMX

	inc_section "crysaudio/music/TCG2/titlescreen.asm"
	inc_section "crysaudio/music/TCG2/herecomesgr.asm"
	inc_section "crysaudio/music/TCG2/groverworld.asm"
	inc_section "crysaudio/music/TCG2/fort1.asm"
	inc_section "crysaudio/music/TCG2/fort2.asm"
	inc_section "crysaudio/music/TCG2/fort3.asm"
	inc_section "crysaudio/music/TCG2/fort4.asm"
	inc_section "crysaudio/music/TCG2/grcastle.asm"
	inc_section "crysaudio/music/TCG2/grchallengecup.asm"


SECTION "TCG2 Songs 2", ROMX

	inc_section "crysaudio/music/TCG2/gamecorner.asm"
	inc_section "crysaudio/music/TCG2/grblimp.asm"
	inc_section "crysaudio/music/TCG2/grdueltheme1.asm"
	inc_section "crysaudio/music/TCG2/grdueltheme2.asm"
	inc_section "crysaudio/music/TCG2/grdueltheme3.asm"
	inc_section "crysaudio/music/TCG2/ishihara.asm"


SECTION "TCG2 Songs 3", ROMX

	inc_section "crysaudio/music/TCG2/imakuni2.asm"
	inc_section "crysaudio/music/TCG2/credits.asm"
	inc_section "crysaudio/music/TCG2/diddly1.asm"
	inc_section "crysaudio/music/TCG2/diddly2.asm"
	inc_section "crysaudio/music/TCG2/diddly3.asm"
	inc_section "crysaudio/music/TCG2/diddly4.asm"
	inc_section "crysaudio/music/TCG2/diddly5.asm"
	inc_section "crysaudio/music/TCG2/diddly6.asm"


SECTION "Pinball Songs 1", ROMX

	inc_section "crysaudio/music/pinball/redfield.asm"
	inc_section "crysaudio/music/pinball/catchemred.asm"
	inc_section "crysaudio/music/pinball/hurryupred.asm"
	inc_section "crysaudio/music/pinball/pokedex.asm"
SECTION "Gastly and Haunter Graveyard", ROMX
	INCLUDE "crysaudio/music/pinball/gastlyinthegraveyard.asm"
	INCLUDE "crysaudio/music/pinball/haunterinthegraveyard.asm"
	inc_section "crysaudio/music/pinball/gengarinthegraveyard.asm"


SECTION "Pinball Songs 2", ROMX

	inc_section "crysaudio/music/pinball/bluefield.asm"
	inc_section "crysaudio/music/pinball/catchemblue.asm"
	inc_section "crysaudio/music/pinball/hurryupblue.asm"
	inc_section "crysaudio/music/pinball/hiscore.asm"
	inc_section "crysaudio/music/pinball/gameover.asm"


SECTION "Pinball Songs 3", ROMX

	inc_section "crysaudio/music/pinball/whackthediglett.asm"
	inc_section "crysaudio/music/pinball/whackthedugtrio.asm"
	inc_section "crysaudio/music/pinball/seelstage.asm"
	inc_section "crysaudio/music/pinball/title.asm"


SECTION "Pinball Songs 4", ROMX

	inc_section "crysaudio/music/pinball/mewtwostage.asm"
	inc_section "crysaudio/music/pinball/options.asm"
	inc_section "crysaudio/music/pinball/fieldselect.asm"
	inc_section "crysaudio/music/pinball/meowthstage.asm"


SECTION "Pinball Songs 5", ROMX

	inc_section "crysaudio/music/pinball/endcredits.asm"
	inc_section "crysaudio/music/pinball/nameentry.asm"


SECTION "Sound Effects", ROMX

INCLUDE "crysaudio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "crysaudio/sfx_crystal.asm"


SECTION "Cries", ROMX

INCLUDE "crysaudio/cry_headers.asm"

INCLUDE "crysaudio/cries.asm"
