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

INCLUDE "crysaudio/music/route36.asm"
INCLUDE "crysaudio/music/rivalbattle.asm"
INCLUDE "crysaudio/music/rocketbattle.asm"
INCLUDE "crysaudio/music/elmslab.asm"
INCLUDE "crysaudio/music/darkcave.asm"
INCLUDE "crysaudio/music/johtogymbattle.asm"
INCLUDE "crysaudio/music/championbattle.asm"
INCLUDE "crysaudio/music/ssaqua.asm"
INCLUDE "crysaudio/music/newbarktown.asm"
INCLUDE "crysaudio/music/goldenrodcity.asm"
INCLUDE "crysaudio/music/vermilioncity.asm"
INCLUDE "crysaudio/music/titlescreen.asm"
INCLUDE "crysaudio/music/ruinsofalphinterior.asm"
INCLUDE "crysaudio/music/lookpokemaniac.asm"
INCLUDE "crysaudio/music/trainervictory.asm"


SECTION "Songs 2", ROMX

INCLUDE "crysaudio/music/route1.asm"
INCLUDE "crysaudio/music/route3.asm"
INCLUDE "crysaudio/music/route12.asm"
INCLUDE "crysaudio/music/kantogymbattle.asm"
INCLUDE "crysaudio/music/kantotrainerbattle.asm"
INCLUDE "crysaudio/music/kantowildbattle.asm"
INCLUDE "crysaudio/music/pokemoncenter.asm"
INCLUDE "crysaudio/music/looklass.asm"
INCLUDE "crysaudio/music/lookofficer.asm"
INCLUDE "crysaudio/music/route2.asm"
INCLUDE "crysaudio/music/mtmoon.asm"
INCLUDE "crysaudio/music/showmearound.asm"
INCLUDE "crysaudio/music/gamecorner.asm"
INCLUDE "crysaudio/music/bicycle.asm"
INCLUDE "crysaudio/music/looksage.asm"
INCLUDE "crysaudio/music/pokemonchannel.asm"
INCLUDE "crysaudio/music/lighthouse.asm"
INCLUDE "crysaudio/music/lakeofrage.asm"
INCLUDE "crysaudio/music/indigoplateau.asm"
INCLUDE "crysaudio/music/route37.asm"
INCLUDE "crysaudio/music/rockethideout.asm"
INCLUDE "crysaudio/music/dragonsden.asm"
INCLUDE "crysaudio/music/ruinsofalphradio.asm"
INCLUDE "crysaudio/music/lookbeauty.asm"
INCLUDE "crysaudio/music/route26.asm"
INCLUDE "crysaudio/music/ecruteakcity.asm"
INCLUDE "crysaudio/music/lakeofragerocketradio.asm"
INCLUDE "crysaudio/music/magnettrain.asm"
INCLUDE "crysaudio/music/lavendertown.asm"
INCLUDE "crysaudio/music/dancinghall.asm"
INCLUDE "crysaudio/music/contestresults.asm"
INCLUDE "crysaudio/music/route30.asm"


SECTION "Songs 3", ROMX

INCLUDE "crysaudio/music/violetcity.asm"
INCLUDE "crysaudio/music/route29.asm"
INCLUDE "crysaudio/music/halloffame.asm"
INCLUDE "crysaudio/music/healpokemon.asm"
INCLUDE "crysaudio/music/evolution.asm"
INCLUDE "crysaudio/music/printer.asm"


SECTION "Songs 4", ROMX

INCLUDE "crysaudio/music/viridiancity.asm"
INCLUDE "crysaudio/music/celadoncity.asm"

INCLUDE "crysaudio/music/wildpokemonvictory.asm"
INCLUDE "crysaudio/music/successfulcapture.asm"
assert BANK(Music_WildPokemonVictory) == BANK(Music_SuccessfulCapture)

INCLUDE "crysaudio/music/gymleadervictory.asm"
INCLUDE "crysaudio/music/mtmoonsquare.asm"
INCLUDE "crysaudio/music/gym.asm"
INCLUDE "crysaudio/music/pallettown.asm"
INCLUDE "crysaudio/music/profoakspokemontalk.asm"
INCLUDE "crysaudio/music/profoak.asm"

INCLUDE "crysaudio/music/lookrival.asm"
INCLUDE "crysaudio/music/aftertherivalfight.asm"
assert BANK(Music_LookRival) == BANK(Music_AfterTheRivalFight)

INCLUDE "crysaudio/music/surf.asm"
INCLUDE "crysaudio/music/nationalpark.asm"
INCLUDE "crysaudio/music/azaleatown.asm"
INCLUDE "crysaudio/music/cherrygrovecity.asm"
INCLUDE "crysaudio/music/unioncave.asm"

INCLUDE "crysaudio/music/johtowildbattle.asm"
INCLUDE "crysaudio/music/johtowildbattlenight.asm"
assert BANK(Music_JohtoWildBattle) == BANK(Music_JohtoWildBattleNight)

INCLUDE "crysaudio/music/johtotrainerbattle.asm"
INCLUDE "crysaudio/music/lookyoungster.asm"
INCLUDE "crysaudio/music/tintower.asm"
INCLUDE "crysaudio/music/sprouttower.asm"
INCLUDE "crysaudio/music/burnedtower.asm"
INCLUDE "crysaudio/music/mom.asm"
INCLUDE "crysaudio/music/victoryroad.asm"
INCLUDE "crysaudio/music/pokemonlullaby.asm"
INCLUDE "crysaudio/music/pokemonmarch.asm"
INCLUDE "crysaudio/music/goldsilveropening.asm"
INCLUDE "crysaudio/music/goldsilveropening2.asm"
INCLUDE "crysaudio/music/lookhiker.asm"

INCLUDE "crysaudio/music/lookrocket.asm"
INCLUDE "crysaudio/music/rockettheme.asm"
assert BANK(Music_LookRocket) == BANK(Music_RocketTheme)

INCLUDE "crysaudio/music/mainmenu.asm"
INCLUDE "crysaudio/music/lookkimonogirl.asm"
INCLUDE "crysaudio/music/pokeflutechannel.asm"
INCLUDE "crysaudio/music/bugcatchingcontest.asm"


SECTION "Songs 5", ROMX

INCLUDE "crysaudio/music/mobileadaptermenu.asm"
INCLUDE "crysaudio/music/buenaspassword.asm"
INCLUDE "crysaudio/music/lookmysticalman.asm"
INCLUDE "crysaudio/music/crystalopening.asm"
INCLUDE "crysaudio/music/battletowertheme.asm"
INCLUDE "crysaudio/music/suicunebattle.asm"
INCLUDE "crysaudio/music/battletowerlobby.asm"
INCLUDE "crysaudio/music/mobilecenter.asm"


SECTION "Extra Songs 1", ROMX

INCLUDE "crysaudio/music/credits.asm"
INCLUDE "crysaudio/music/clair.asm"
INCLUDE "crysaudio/music/mobileadapter.asm"


SECTION "Extra Songs 2", ROMX

INCLUDE "crysaudio/music/postcredits.asm"


SECTION "RBY Songs 1", ROMX

INCLUDE "crysaudio/music/RBY/pkmnhealed.asm"
INCLUDE "crysaudio/music/RBY/routes1.asm"
INCLUDE "crysaudio/music/RBY/routes2.asm"
INCLUDE "crysaudio/music/RBY/routes3.asm"
INCLUDE "crysaudio/music/RBY/routes4.asm"
INCLUDE "crysaudio/music/RBY/indigoplateau.asm"
INCLUDE "crysaudio/music/RBY/pallettown.asm"
INCLUDE "crysaudio/music/RBY/unusedsong.asm"
INCLUDE "crysaudio/music/RBY/cities1.asm"
INCLUDE "crysaudio/music/RBY/museumguy.asm"
INCLUDE "crysaudio/music/RBY/meetprofoak.asm"
INCLUDE "crysaudio/music/RBY/meetrival.asm"
INCLUDE "crysaudio/music/RBY/ssanne.asm"
INCLUDE "crysaudio/music/RBY/cities2.asm"
INCLUDE "crysaudio/music/RBY/celadon.asm"
INCLUDE "crysaudio/music/RBY/cinnabar.asm"
INCLUDE "crysaudio/music/RBY/vermilion.asm"
INCLUDE "crysaudio/music/RBY/lavender.asm"
INCLUDE "crysaudio/music/RBY/safarizone.asm"
INCLUDE "crysaudio/music/RBY/gym.asm"
INCLUDE "crysaudio/music/RBY/pokecenter.asm"


SECTION "RBY Songs 2", ROMX

INCLUDE "crysaudio/music/RBY/gymleaderbattle.asm"
INCLUDE "crysaudio/music/RBY/trainerbattle.asm"
INCLUDE "crysaudio/music/RBY/wildbattle.asm"
INCLUDE "crysaudio/music/RBY/finalbattle.asm"
INCLUDE "crysaudio/music/RBY/defeatedtrainer.asm"
INCLUDE "crysaudio/music/RBY/defeatedwildmon.asm"
INCLUDE "crysaudio/music/RBY/defeatedgymleader.asm"


SECTION "RBY Songs 3", ROMX

INCLUDE "crysaudio/music/RBY/bikeriding.asm"
INCLUDE "crysaudio/music/RBY/dungeon1.asm"
INCLUDE "crysaudio/music/RBY/gamecorner.asm"
INCLUDE "crysaudio/music/RBY/titlescreen.asm"
INCLUDE "crysaudio/music/RBY/dungeon2.asm"
INCLUDE "crysaudio/music/RBY/dungeon3.asm"
INCLUDE "crysaudio/music/RBY/cinnabarmansion.asm"
INCLUDE "crysaudio/music/RBY/oakslab.asm"
INCLUDE "crysaudio/music/RBY/pokemontower.asm"
INCLUDE "crysaudio/music/RBY/silphco.asm"
INCLUDE "crysaudio/music/RBY/meeteviltrainer.asm"
INCLUDE "crysaudio/music/RBY/meetfemaletrainer.asm"
INCLUDE "crysaudio/music/RBY/meetmaletrainer.asm"
INCLUDE "crysaudio/music/RBY/introbattle.asm"
INCLUDE "crysaudio/music/RBY/surfing.asm"
INCLUDE "crysaudio/music/RBY/jigglypuffsong.asm"
INCLUDE "crysaudio/music/RBY/halloffame.asm"
INCLUDE "crysaudio/music/RBY/credits.asm"


SECTION "RBY Songs 4", ROMX

INCLUDE "crysaudio/music/RBY/yellowintro.asm"
INCLUDE "crysaudio/music/RBY/surfingpikachu.asm"
INCLUDE "crysaudio/music/RBY/yellowunusedsong.asm"
INCLUDE "crysaudio/music/RBY/meetjessiejames.asm"


SECTION "TCG Songs 1", ROMX

INCLUDE "crysaudio/music/TCG/titlescreen.asm"
INCLUDE "crysaudio/music/TCG/dueltheme1.asm"
INCLUDE "crysaudio/music/TCG/dueltheme2.asm"
INCLUDE "crysaudio/music/TCG/dueltheme3.asm"
INCLUDE "crysaudio/music/TCG/pausemenu.asm"
INCLUDE "crysaudio/music/TCG/pcmainmenu.asm"
INCLUDE "crysaudio/music/TCG/deckmachine.asm"
INCLUDE "crysaudio/music/TCG/cardpop.asm"
INCLUDE "crysaudio/music/TCG/overworld.asm"
INCLUDE "crysaudio/music/TCG/pokemondome.asm"
INCLUDE "crysaudio/music/TCG/challengehall.asm"
INCLUDE "crysaudio/music/TCG/club1.asm"
INCLUDE "crysaudio/music/TCG/club2.asm"
INCLUDE "crysaudio/music/TCG/club3.asm"


SECTION "TCG Songs 2", ROMX

INCLUDE "crysaudio/music/TCG/ronald.asm"
INCLUDE "crysaudio/music/TCG/imakuni.asm"
INCLUDE "crysaudio/music/TCG/hallofhonor.asm"
INCLUDE "crysaudio/music/TCG/credits.asm"
INCLUDE "crysaudio/music/TCG/matchstart1.asm"
INCLUDE "crysaudio/music/TCG/matchstart2.asm"
INCLUDE "crysaudio/music/TCG/matchstart3.asm"
INCLUDE "crysaudio/music/TCG/matchvictory.asm"
INCLUDE "crysaudio/music/TCG/matchloss.asm"
INCLUDE "crysaudio/music/TCG/matchdraw.asm"
INCLUDE "crysaudio/music/TCG/boosterpack.asm"
INCLUDE "crysaudio/music/TCG/medal.asm"


SECTION "TCG2 Songs 1", ROMX

INCLUDE "crysaudio/music/TCG2/titlescreen.asm"
INCLUDE "crysaudio/music/TCG2/herecomesgr.asm"
INCLUDE "crysaudio/music/TCG2/groverworld.asm"
INCLUDE "crysaudio/music/TCG2/fort1.asm"
INCLUDE "crysaudio/music/TCG2/fort2.asm"
INCLUDE "crysaudio/music/TCG2/fort3.asm"
INCLUDE "crysaudio/music/TCG2/fort4.asm"

SECTION "TCG2 Songs 1b", ROMX

INCLUDE "crysaudio/music/TCG2/grcastle.asm"
INCLUDE "crysaudio/music/TCG2/grchallengecup.asm"


SECTION "TCG2 Songs 2", ROMX

INCLUDE "crysaudio/music/TCG2/gamecorner.asm"
INCLUDE "crysaudio/music/TCG2/grblimp.asm"
INCLUDE "crysaudio/music/TCG2/grdueltheme1.asm"
INCLUDE "crysaudio/music/TCG2/grdueltheme2.asm"
INCLUDE "crysaudio/music/TCG2/grdueltheme3.asm"

SECTION "TCG2 Songs 2b", ROMX

INCLUDE "crysaudio/music/TCG2/ishihara.asm"


SECTION "TCG2 Songs 3", ROMX

INCLUDE "crysaudio/music/TCG2/imakuni2.asm"
INCLUDE "crysaudio/music/TCG2/credits.asm"
INCLUDE "crysaudio/music/TCG2/ditty1.asm"
INCLUDE "crysaudio/music/TCG2/ditty2.asm"
INCLUDE "crysaudio/music/TCG2/ditty3.asm"
INCLUDE "crysaudio/music/TCG2/ditty4.asm"
INCLUDE "crysaudio/music/TCG2/ditty5.asm"
INCLUDE "crysaudio/music/TCG2/ditty6.asm"


SECTION "Pinball Songs 1", ROMX

INCLUDE "crysaudio/music/pinball/redfield.asm"
INCLUDE "crysaudio/music/pinball/catchemred.asm"
INCLUDE "crysaudio/music/pinball/hurryupred.asm"
INCLUDE "crysaudio/music/pinball/pokedex.asm"

INCLUDE "crysaudio/music/pinball/gastlyinthegraveyard.asm"
INCLUDE "crysaudio/music/pinball/haunterinthegraveyard.asm"
assert BANK(Music_GastlyInTheGraveyard) == BANK(Music_HaunterInTheGraveyard)

INCLUDE "crysaudio/music/pinball/gengarinthegraveyard.asm"


SECTION "Pinball Songs 2", ROMX

INCLUDE "crysaudio/music/pinball/bluefield.asm"
INCLUDE "crysaudio/music/pinball/catchemblue.asm"
INCLUDE "crysaudio/music/pinball/hurryupblue.asm"
INCLUDE "crysaudio/music/pinball/hiscore.asm"
INCLUDE "crysaudio/music/pinball/gameover.asm"


SECTION "Pinball Songs 3", ROMX

INCLUDE "crysaudio/music/pinball/whackthediglett.asm"
INCLUDE "crysaudio/music/pinball/whackthedugtrio.asm"
INCLUDE "crysaudio/music/pinball/seelstage.asm"
INCLUDE "crysaudio/music/pinball/title.asm"


SECTION "Pinball Songs 4", ROMX

INCLUDE "crysaudio/music/pinball/mewtwostage.asm"
INCLUDE "crysaudio/music/pinball/options.asm"
INCLUDE "crysaudio/music/pinball/fieldselect.asm"
INCLUDE "crysaudio/music/pinball/meowthstage.asm"


SECTION "Pinball Songs 5", ROMX

INCLUDE "crysaudio/music/pinball/endcredits.asm"
INCLUDE "crysaudio/music/pinball/nameentry.asm"


SECTION "Sound Effects", ROMX

INCLUDE "crysaudio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "crysaudio/sfx_crystal.asm"


SECTION "Cries", ROMX

INCLUDE "crysaudio/cry_headers.asm"

INCLUDE "crysaudio/cries.asm"
