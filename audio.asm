INCLUDE "constants.asm"
INCLUDE "crysmacros.asm"

; crystal.py macros: 
octave: MACRO
	db $d8 - (\1)
	ENDM
	
notetype: MACRO
	db $d8, \1
IF _NARG==2
	db \2
ENDC
	ENDM
forceoctave: MACRO
	db $d9, \1
	ENDM
tempo: MACRO
	db $da
	bigdw \1
	ENDM
dutycycle: MACRO
	db $db, \1
	ENDM
intensity: MACRO
	db $dc, \1
	ENDM
soundinput: MACRO
	db $dd, \1
	ENDM
unknownmusic0xde: MACRO
	db $de, \1
	ENDM
togglesfx: MACRO
	db $df
	ENDM
unknownmusic0xe0: MACRO
	db $e0, \1, \2
	ENDM
vibrato: MACRO
	db $e1, \1, \2
	ENDM
unknownmusic0xe2: MACRO
	db $e2, \1
	ENDM
togglenoise: MACRO
	db $e3, \1
	ENDM
panning: MACRO
	db $e4, \1
	ENDM
volume: MACRO
	db $e5, \1
	ENDM
tone: MACRO
	db $e6
	bigdw \1
	ENDM
unknownmusic0xe7: MACRO
	db $e7, \1
	ENDM
unknownmusic0xe8: MACRO
	db $e8, \1
	ENDM
globaltempo: MACRO
	db $e9
	bigdw \1
	ENDM
restartchannel: MACRO
	dbw $ea, \1
	ENDM
newsong: MACRO
	db $eb
	bigdw \1
	ENDM
sfxpriorityon: MACRO
	db $ec
	ENDM
sfxpriorityoff: MACRO
	db $ed
	ENDM
unknownmusic0xee: MACRO
	dbw $ee, \1
	ENDM
stereopanning: MACRO
	db $ef, \1
	ENDM
sfxtogglenoise: MACRO
	db $f0, \1
	ENDM
ftempo: MACRO
	db $f1
	bigdw \1
	ENDM
fdutycycle: MACRO
	db $f2, \1
	ENDM
music0xf3: MACRO
	db $f3
	ENDM
incoctave: MACRO
	db $f4
	ENDM
decoctave: MACRO
	db $f5
	ENDM
music0xf6: MACRO
	db $f6
	ENDM
music0xf7: MACRO
	db $f7
	ENDM
music0xf8: MACRO
	db $f8
	ENDM
unknownmusic0xf9: MACRO
	db $f9, \1
	ENDM
setcondition: MACRO
	db $fa, \1
	ENDM
jumpif: MACRO
	db $fb, \1
	dw \2
	ENDM
jumpchannel: MACRO
	dbw $fc, \1
	ENDM
loopchannel: MACRO
	db $fd, \1
	dw \2
	ENDM
callchannel: MACRO
	dbw $fe, \1
	ENDM
endchannel: MACRO
	db $ff
	ENDM
	
	
sound: MACRO
	db \1, \2
	dw \3
	ENDM

noise: MACRO
	db \1, \2, \3
	ENDM
    
toggleperfectpitch: MACRO ; XXX XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
	ENDM


SECTION "Sound Effect Headers 1", ROMX ; BANK $02
INCLUDE "audio/headers/sfxheaders1.asm"

SECTION "Sound Effect Headers 2", ROMX ; BANK $08
INCLUDE "audio/headers/sfxheaders2.asm"

SECTION "Sound Effect Headers 3", ROMX ; BANK $1f
INCLUDE "audio/headers/sfxheaders3.asm"

SECTION "Sound Effects 1", ROMX ; BANK $02

SFX_02:
INCLUDE "audio/sfx/get_item1_1.asm"
INCLUDE "audio/sfx/get_item2_1.asm"
INCLUDE "audio/sfx/tink_1.asm"
INCLUDE "audio/sfx/heal_hp_1.asm"
INCLUDE "audio/sfx/heal_ailment_1.asm"
INCLUDE "audio/sfx/start_menu_1.asm"
INCLUDE "audio/sfx/press_ab_1.asm"
INCLUDE "audio/sfx/pokedex_rating_1.asm"
INCLUDE "audio/sfx/get_key_item_1.asm"
INCLUDE "audio/sfx/poisoned_1.asm"
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
INCLUDE "audio/sfx/cut_1.asm"
INCLUDE "audio/sfx/go_inside_1.asm"
INCLUDE "audio/sfx/swap_1.asm"
INCLUDE "audio/sfx/59_1.asm"
INCLUDE "audio/sfx/purchase_1.asm"
INCLUDE "audio/sfx/collision_1.asm"
INCLUDE "audio/sfx/go_outside_1.asm"
INCLUDE "audio/sfx/save_1.asm"
INCLUDE "audio/sfx/pokeflute.asm"
INCLUDE "audio/sfx/safari_zone_pa.asm"

SECTION "Sound Effects 2", ROMX ; BANK $08

SFX_08:
INCLUDE "audio/sfx/level_up.asm"
INCLUDE "audio/sfx/ball_toss.asm"
INCLUDE "audio/sfx/ball_poof.asm"
INCLUDE "audio/sfx/faint_thud.asm"
INCLUDE "audio/sfx/run.asm"
INCLUDE "audio/sfx/dex_page_added.asm"
INCLUDE "audio/sfx/caught_mon.asm"
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
INCLUDE "audio/sfx/silph_scope.asm"

SECTION "Sound Effects 3", ROMX ; BANK $1f

SFX_1F:
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


SECTION "Bill's PC", ROMX
INCLUDE "engine/menu/bills_pc.asm"

SECTION "Music Routines", ROMX
PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	ld [MusicFade], a
	dec a
	ld [wNewSoundID], a
	call PlayMusic ; stop music
	call DelayFrame
	;ld c, BANK(Music_GymLeaderBattle)
	ld a, [wGymLeaderNo]
	and a
	jr z, .notGymLeaderBattle
	ld a, MUSIC_GYM_LEADER_BATTLE
	jr .playSong
.notGymLeaderBattle
	ld a, [wCurOpponent]
	cp 200
	jr c, .wildBattle
	cp OPP_SONY3
	jr z, .finalBattle
	cp OPP_LANCE
	jr nz, .normalTrainerBattle
	ld a, MUSIC_GYM_LEADER_BATTLE ; lance also plays gym leader theme
	jr .playSong
.normalTrainerBattle
	ld a, MUSIC_TRAINER_BATTLE
	jr .playSong
.finalBattle
	ld a, MUSIC_FINAL_BATTLE
	jr .playSong
.wildBattle
	ld a, MUSIC_WILD_BATTLE
.playSong
	jp PlayMusic

SECTION "Alt Music Routines", ROMX
; an alternate start for MeetRival which has a different first measure
Music_RivalAlternateStart::
	ld a, MUSIC_MEET_RIVAL
	jp PlayMusic
	;ld hl, wChannelCommandPointers
	;ld de, Music_MeetRival_branch_b1a2
	;call Audio1_OverwriteChannelPointer
	;ld de, Music_MeetRival_branch_b21d
	;call Audio1_OverwriteChannelPointer
	;ld de, Music_MeetRival_branch_b2b5

; an alternate tempo for MeetRival which is slightly slower
Music_RivalAlternateTempo::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	jp PlayMusic
	;ld hl, wChannelCommandPointers
	;ld de, Music_MeetRival_branch_b119
	;jp Audio1_OverwriteChannelPointer

; applies both the alternate start and alternate tempo
Music_RivalAlternateStartAndTempo::
	jp Music_RivalAlternateStart
	;ld hl, wChannelCommandPointers
	;ld de, Music_MeetRival_branch_b19b
	;jp Audio1_OverwriteChannelPointer

; an alternate tempo for Cities1 which is used for the Hall of Fame room
Music_Cities1AlternateTempo::
	ld a, 10
	ld [wAudioFadeOutCounterReloadValue], a
	ld [wAudioFadeOutCounter], a
	ld a, $ff ; stop playing music after the fade-out is finished
	ld [wAudioFadeOutControl], a
	ld c, 100
	call DelayFrames ; wait for the fade-out to finish
	ld c, BANK(Music_Cities1)
	ld a, MUSIC_CITIES1
	jp PlayMusic
	;ld hl, wChannelCommandPointers
	;ld de, Music_Cities1_branch_aa6f
	;jp Audio1_OverwriteChannelPointer

SECTION "Pokedex Rating SFX Routines", ROMX
PlayPokedexRatingSfx::
	ld a, [$ffdc]
	ld c, $0
	ld hl, OwnedMonValues
.getSfxPointer
	cp [hl]
	jr c, .gotSfxPointer
	inc c
	inc hl
	jr .getSfxPointer
.gotSfxPointer
	push bc
	ld a, $ff
	ld [wNewSoundID], a
	call PlaySoundWaitForCurrent
	pop bc
	ld b, $0
	ld hl, PokedexRatingSfxPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld c, [hl]
	call PlaySound
	call WaitForSoundToFinish
	jp PlayDefaultMusic

PokedexRatingSfxPointers:
	db SFX_DENIED,         BANK(SFX_Denied_1)
	db SFX_POKEDEX_RATING, BANK(SFX_Pokedex_Rating_1)
	db SFX_GET_ITEM_1,     BANK(SFX_Get_Item1_1)
	db SFX_CAUGHT_MON,     BANK(SFX_Caught_Mon)
	db SFX_LEVEL_UP,       BANK(SFX_Level_Up)
	db SFX_GET_KEY_ITEM,   BANK(SFX_Get_Key_Item_1)
	db SFX_GET_ITEM_2,     BANK(SFX_Get_Item2_1)

OwnedMonValues:
	db 10, 40, 60, 90, 120, 150, $ff

; crystal:
    
SECTION "Audio Engine 1", ROMX


INCLUDE "crysaudio/engine.asm"

; What music plays when a trainer notices you
;INCLUDE "crysaudio/trainer_encounters.asm"

MusicMT:
INCLUDE "crysaudio/music_pointers_music_test.asm"

Music:
INCLUDE "crysaudio/red_pointers.asm"
;INCLUDE "crysaudio/music_pointers.asm"

Music2:
INCLUDE "crysaudio/music_pointers2.asm"


INCLUDE "crysaudio/music/nothing.asm"

Cries:
INCLUDE "crysaudio/cry_pointers.asm"

;SFX:
INCLUDE "crysaudio/rbsfx.asm"


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
	inc_section "crysaudio/music/wildpokemonvictory.asm"
	inc_section "crysaudio/music/successfulcapture.asm"
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
	inc_section "crysaudio/music/kantotrainerbattle.asm"


SECTION "Extra Songs 1", ROMX

	inc_section "crysaudio/music/credits.asm"
	inc_section "crysaudio/music/clair.asm"
	inc_section "crysaudio/music/mobileadapter.asm"

SECTION "Extra Songs 2", ROMX

	inc_section "crysaudio/music/postcredits.asm"


SECTION "RBY Songs 1", ROMX

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
	inc_section "crysaudio/music/RBY/gymleaderbattle.asm"
	inc_section "crysaudio/music/RBY/trainerbattle.asm"
	inc_section "crysaudio/music/RBY/wildbattle.asm"
	inc_section "crysaudio/music/RBY/finalbattle.asm"

SECTION "RBY Songs 2", ROMX

	inc_section "crysaudio/music/RBY/defeatedtrainer.asm"
	inc_section "crysaudio/music/RBY/defeatedwildmon.asm"
	inc_section "crysaudio/music/RBY/defeatedgymleader.asm"
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
	inc_section "crysaudio/music/RBY/yellowintro.asm"
	inc_section "crysaudio/music/RBY/surfingpikachu.asm"
	inc_section "crysaudio/music/RBY/meetjessiejames.asm"
	inc_section "crysaudio/music/RBY/yellowunusedsong.asm"

SECTION "Custom Songs 1", ROMX

	inc_section "crysaudio/music/custom/johtoGSC.asm"
	inc_section "crysaudio/music/custom/ceruleanGSC.asm"
	inc_section "crysaudio/music/custom/cinnabarGSC.asm"
	inc_section "crysaudio/music/custom/nuggetbridge.asm"
	inc_section "crysaudio/music/custom/shop.asm"
	inc_section "crysaudio/music/custom/pokeathelonfinal.asm"

SECTION "Custom Songs 2", ROMX

	inc_section "crysaudio/music/custom/naljowildbattle.asm"
	inc_section "crysaudio/music/custom/naljogymbattle.asm"
	inc_section "crysaudio/music/custom/palletbattle.asm"
	inc_section "crysaudio/music/custom/cinnabarremix.asm"
	inc_section "crysaudio/music/custom/kantogymleaderremix.asm"

SECTION "DPPt Songs 1", ROMX

	inc_section "crysaudio/music/DPPt/pokeradar.asm"
	inc_section "crysaudio/music/DPPt/sinnohtrainer.asm"
	inc_section "crysaudio/music/DPPt/sinnohwild.asm"
	inc_section "crysaudio/music/DPPt/WinPokeSinnoh.asm"
	inc_section "crysaudio/music/DPPt/WinTrainerSinnoh.asm"
	inc_section "crysaudio/music/DPPt/route201.asm"
	inc_section "crysaudio/music/DPPt/route203.asm"
	inc_section "crysaudio/music/DPPt/route205.asm"
	inc_section "crysaudio/music/DPPt/route206.asm"
	inc_section "crysaudio/music/DPPt/jubilifecity.asm"
	inc_section "crysaudio/music/DPPt/EternaForest.asm"
	inc_section "crysaudio/music/DPPt/frontierbrain.asm"

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
	inc_section "crysaudio/music/TCG/darkdiddly.asm"
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

SECTION "Pinball Songs", ROMX
	inc_section "crysaudio/music/pinball/redfield.asm"
	inc_section "crysaudio/music/pinball/catchem_red.asm"
	inc_section "crysaudio/music/pinball/hurryup_red.asm"
	inc_section "crysaudio/music/pinball/pokedex.asm"
	inc_section "crysaudio/music/pinball/gengarstage_gastly.asm"
	inc_section "crysaudio/music/pinball/gengarstage_hauntergengar.asm" ; the two songs are interleaved
	inc_section "crysaudio/music/pinball/bluefield.asm"
	inc_section "crysaudio/music/pinball/catchem_blue.asm"
	inc_section "crysaudio/music/pinball/hurryup_blue.asm"
	inc_section "crysaudio/music/pinball/hiscorescreen.asm"
	inc_section "crysaudio/music/pinball/gameover.asm"
	inc_section "crysaudio/music/pinball/diglettstage_digletts.asm"
	inc_section "crysaudio/music/pinball/diglettstage_dugtrio.asm"

SECTION "Pinball Songs 2", ROMX
	inc_section "crysaudio/music/pinball/seelstage.asm"
	inc_section "crysaudio/music/pinball/titlescreen.asm"
	inc_section "crysaudio/music/pinball/mewtwostage.asm"
	inc_section "crysaudio/music/pinball/options.asm"
	inc_section "crysaudio/music/pinball/fieldselect.asm"
	inc_section "crysaudio/music/pinball/meowthstage.asm"
	inc_section "crysaudio/music/pinball/endcredits.asm"
	inc_section "crysaudio/music/pinball/nameentry.asm"

SECTION "Sound Effects", ROMX

INCLUDE "crysaudio/sfx.asm"


SECTION "Crystal Sound Effects", ROMX

INCLUDE "crysaudio/sfx_crystal.asm"



SECTION "Cries", ROMX

CryHeaders:: INCLUDE "crysaudio/cry_headers.asm"

INCLUDE "crysaudio/cries.asm"


