INCLUDE "constants.asm"


SECTION "Sound Effect Headers 1", ROMX ; BANK $02
INCLUDE "audio/headers/sfxheaders1.asm"

SECTION "Sound Effect Headers 2", ROMX ; BANK $08
INCLUDE "audio/headers/sfxheaders2.asm"

SECTION "Sound Effect Headers 3", ROMX ; BANK $1f
INCLUDE "audio/headers/sfxheaders3.asm"


SECTION "Music Headers 1", ROMX ; BANK $02
INCLUDE "audio/headers/musicheaders1.asm"

SECTION "Music Headers 2", ROMX ; BANK $08
INCLUDE "audio/headers/musicheaders2.asm"

SECTION "Music Headers 3", ROMX ; BANK $1f
INCLUDE "audio/headers/musicheaders3.asm"


SECTION "Sound Effects 1", ROMX ; BANK $02

INCLUDE "audio/sfx/snare1_1.asm"
INCLUDE "audio/sfx/snare2_1.asm"
INCLUDE "audio/sfx/snare3_1.asm"
INCLUDE "audio/sfx/snare4_1.asm"
INCLUDE "audio/sfx/snare5_1.asm"
INCLUDE "audio/sfx/triangle1_1.asm"
INCLUDE "audio/sfx/triangle2_1.asm"
INCLUDE "audio/sfx/snare6_1.asm"
INCLUDE "audio/sfx/snare7_1.asm"
INCLUDE "audio/sfx/snare8_1.asm"
INCLUDE "audio/sfx/snare9_1.asm"
INCLUDE "audio/sfx/cymbal1_1.asm"
INCLUDE "audio/sfx/cymbal2_1.asm"
INCLUDE "audio/sfx/cymbal3_1.asm"
INCLUDE "audio/sfx/muted_snare1_1.asm"
INCLUDE "audio/sfx/triangle3_1.asm"
INCLUDE "audio/sfx/muted_snare2_1.asm"
INCLUDE "audio/sfx/muted_snare3_1.asm"
INCLUDE "audio/sfx/muted_snare4_1.asm"

Audio1_WavePointers: INCLUDE "audio/wave_instruments.asm"

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
INCLUDE "audio/sfx/unused_1.asm"
INCLUDE "audio/sfx/cry09_1.asm"
INCLUDE "audio/sfx/cry23_1.asm"
INCLUDE "audio/sfx/cry24_1.asm"
INCLUDE "audio/sfx/cry11_1.asm"
INCLUDE "audio/sfx/cry25_1.asm"
INCLUDE "audio/sfx/cry03_1.asm"
INCLUDE "audio/sfx/cry0f_1.asm"
INCLUDE "audio/sfx/cry10_1.asm"
INCLUDE "audio/sfx/cry00_1.asm"
INCLUDE "audio/sfx/cry0e_1.asm"
INCLUDE "audio/sfx/cry06_1.asm"
INCLUDE "audio/sfx/cry07_1.asm"
INCLUDE "audio/sfx/cry05_1.asm"
INCLUDE "audio/sfx/cry0b_1.asm"
INCLUDE "audio/sfx/cry0c_1.asm"
INCLUDE "audio/sfx/cry02_1.asm"
INCLUDE "audio/sfx/cry0d_1.asm"
INCLUDE "audio/sfx/cry01_1.asm"
INCLUDE "audio/sfx/cry0a_1.asm"
INCLUDE "audio/sfx/cry08_1.asm"
INCLUDE "audio/sfx/cry04_1.asm"
INCLUDE "audio/sfx/cry19_1.asm"
INCLUDE "audio/sfx/cry16_1.asm"
INCLUDE "audio/sfx/cry1b_1.asm"
INCLUDE "audio/sfx/cry12_1.asm"
INCLUDE "audio/sfx/cry13_1.asm"
INCLUDE "audio/sfx/cry14_1.asm"
INCLUDE "audio/sfx/cry1e_1.asm"
INCLUDE "audio/sfx/cry15_1.asm"
INCLUDE "audio/sfx/cry17_1.asm"
INCLUDE "audio/sfx/cry1c_1.asm"
INCLUDE "audio/sfx/cry1a_1.asm"
INCLUDE "audio/sfx/cry1d_1.asm"
INCLUDE "audio/sfx/cry18_1.asm"
INCLUDE "audio/sfx/cry1f_1.asm"
INCLUDE "audio/sfx/cry20_1.asm"
INCLUDE "audio/sfx/cry21_1.asm"
INCLUDE "audio/sfx/cry22_1.asm"


SECTION "Sound Effects 2", ROMX ; BANK $08

INCLUDE "audio/sfx/snare1_2.asm"
INCLUDE "audio/sfx/snare2_2.asm"
INCLUDE "audio/sfx/snare3_2.asm"
INCLUDE "audio/sfx/snare4_2.asm"
INCLUDE "audio/sfx/snare5_2.asm"
INCLUDE "audio/sfx/triangle1_2.asm"
INCLUDE "audio/sfx/triangle2_2.asm"
INCLUDE "audio/sfx/snare6_2.asm"
INCLUDE "audio/sfx/snare7_2.asm"
INCLUDE "audio/sfx/snare8_2.asm"
INCLUDE "audio/sfx/snare9_2.asm"
INCLUDE "audio/sfx/cymbal1_2.asm"
INCLUDE "audio/sfx/cymbal2_2.asm"
INCLUDE "audio/sfx/cymbal3_2.asm"
INCLUDE "audio/sfx/muted_snare1_2.asm"
INCLUDE "audio/sfx/triangle3_2.asm"
INCLUDE "audio/sfx/muted_snare2_2.asm"
INCLUDE "audio/sfx/muted_snare3_2.asm"
INCLUDE "audio/sfx/muted_snare4_2.asm"

Audio2_WavePointers: INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/press_ab_2.asm"
INCLUDE "audio/sfx/start_menu_2.asm"
INCLUDE "audio/sfx/tink_2.asm"
INCLUDE "audio/sfx/heal_hp_2.asm"
INCLUDE "audio/sfx/heal_ailment_2.asm"
INCLUDE "audio/sfx/silph_scope.asm"
INCLUDE "audio/sfx/ball_toss.asm"
INCLUDE "audio/sfx/ball_poof.asm"
INCLUDE "audio/sfx/faint_thud.asm"
INCLUDE "audio/sfx/run.asm"
INCLUDE "audio/sfx/dex_page_added.asm"
INCLUDE "audio/sfx/pokeflute_ch6.asm"
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
INCLUDE "audio/sfx/unused_2.asm"
INCLUDE "audio/sfx/cry09_2.asm"
INCLUDE "audio/sfx/cry23_2.asm"
INCLUDE "audio/sfx/cry24_2.asm"
INCLUDE "audio/sfx/cry11_2.asm"
INCLUDE "audio/sfx/cry25_2.asm"
INCLUDE "audio/sfx/cry03_2.asm"
INCLUDE "audio/sfx/cry0f_2.asm"
INCLUDE "audio/sfx/cry10_2.asm"
INCLUDE "audio/sfx/cry00_2.asm"
INCLUDE "audio/sfx/cry0e_2.asm"
INCLUDE "audio/sfx/cry06_2.asm"
INCLUDE "audio/sfx/cry07_2.asm"
INCLUDE "audio/sfx/cry05_2.asm"
INCLUDE "audio/sfx/cry0b_2.asm"
INCLUDE "audio/sfx/cry0c_2.asm"
INCLUDE "audio/sfx/cry02_2.asm"
INCLUDE "audio/sfx/cry0d_2.asm"
INCLUDE "audio/sfx/cry01_2.asm"
INCLUDE "audio/sfx/cry0a_2.asm"
INCLUDE "audio/sfx/cry08_2.asm"
INCLUDE "audio/sfx/cry04_2.asm"
INCLUDE "audio/sfx/cry19_2.asm"
INCLUDE "audio/sfx/cry16_2.asm"
INCLUDE "audio/sfx/cry1b_2.asm"
INCLUDE "audio/sfx/cry12_2.asm"
INCLUDE "audio/sfx/cry13_2.asm"
INCLUDE "audio/sfx/cry14_2.asm"
INCLUDE "audio/sfx/cry1e_2.asm"
INCLUDE "audio/sfx/cry15_2.asm"
INCLUDE "audio/sfx/cry17_2.asm"
INCLUDE "audio/sfx/cry1c_2.asm"
INCLUDE "audio/sfx/cry1a_2.asm"
INCLUDE "audio/sfx/cry1d_2.asm"
INCLUDE "audio/sfx/cry18_2.asm"
INCLUDE "audio/sfx/cry1f_2.asm"
INCLUDE "audio/sfx/cry20_2.asm"
INCLUDE "audio/sfx/cry21_2.asm"
INCLUDE "audio/sfx/cry22_2.asm"


SECTION "Sound Effects 3", ROMX ; BANK $1f

INCLUDE "audio/sfx/snare1_3.asm"
INCLUDE "audio/sfx/snare2_3.asm"
INCLUDE "audio/sfx/snare3_3.asm"
INCLUDE "audio/sfx/snare4_3.asm"
INCLUDE "audio/sfx/snare5_3.asm"
INCLUDE "audio/sfx/triangle1_3.asm"
INCLUDE "audio/sfx/triangle2_3.asm"
INCLUDE "audio/sfx/snare6_3.asm"
INCLUDE "audio/sfx/snare7_3.asm"
INCLUDE "audio/sfx/snare8_3.asm"
INCLUDE "audio/sfx/snare9_3.asm"
INCLUDE "audio/sfx/cymbal1_3.asm"
INCLUDE "audio/sfx/cymbal2_3.asm"
INCLUDE "audio/sfx/cymbal3_3.asm"
INCLUDE "audio/sfx/muted_snare1_3.asm"
INCLUDE "audio/sfx/triangle3_3.asm"
INCLUDE "audio/sfx/muted_snare2_3.asm"
INCLUDE "audio/sfx/muted_snare3_3.asm"
INCLUDE "audio/sfx/muted_snare4_3.asm"

Audio3_WavePointers: INCLUDE "audio/wave_instruments.asm"

INCLUDE "audio/sfx/start_menu_3.asm"
INCLUDE "audio/sfx/cut_3.asm"
INCLUDE "audio/sfx/go_inside_3.asm"
INCLUDE "audio/sfx/swap_3.asm"
INCLUDE "audio/sfx/tink_3.asm"
INCLUDE "audio/sfx/59_3.asm"
INCLUDE "audio/sfx/purchase_3.asm"
INCLUDE "audio/sfx/collision_3.asm"
INCLUDE "audio/sfx/go_outside_3.asm"
INCLUDE "audio/sfx/press_ab_3.asm"
INCLUDE "audio/sfx/save_3.asm"
INCLUDE "audio/sfx/heal_hp_3.asm"
INCLUDE "audio/sfx/poisoned_3.asm"
INCLUDE "audio/sfx/heal_ailment_3.asm"
INCLUDE "audio/sfx/trade_machine_3.asm"
INCLUDE "audio/sfx/turn_on_pc_3.asm"
INCLUDE "audio/sfx/turn_off_pc_3.asm"
INCLUDE "audio/sfx/enter_pc_3.asm"
INCLUDE "audio/sfx/shrink_3.asm"
INCLUDE "audio/sfx/switch_3.asm"
INCLUDE "audio/sfx/healing_machine_3.asm"
INCLUDE "audio/sfx/teleport_exit1_3.asm"
INCLUDE "audio/sfx/teleport_enter1_3.asm"
INCLUDE "audio/sfx/teleport_exit2_3.asm"
INCLUDE "audio/sfx/ledge_3.asm"
INCLUDE "audio/sfx/teleport_enter2_3.asm"
INCLUDE "audio/sfx/fly_3.asm"
INCLUDE "audio/sfx/denied_3.asm"
INCLUDE "audio/sfx/arrow_tiles_3.asm"
INCLUDE "audio/sfx/push_boulder_3.asm"
INCLUDE "audio/sfx/ss_anne_horn_3.asm"
INCLUDE "audio/sfx/withdraw_deposit_3.asm"
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
INCLUDE "audio/sfx/unused_3.asm"
INCLUDE "audio/sfx/cry09_3.asm"
INCLUDE "audio/sfx/cry23_3.asm"
INCLUDE "audio/sfx/cry24_3.asm"
INCLUDE "audio/sfx/cry11_3.asm"
INCLUDE "audio/sfx/cry25_3.asm"
INCLUDE "audio/sfx/cry03_3.asm"
INCLUDE "audio/sfx/cry0f_3.asm"
INCLUDE "audio/sfx/cry10_3.asm"
INCLUDE "audio/sfx/cry00_3.asm"
INCLUDE "audio/sfx/cry0e_3.asm"
INCLUDE "audio/sfx/cry06_3.asm"
INCLUDE "audio/sfx/cry07_3.asm"
INCLUDE "audio/sfx/cry05_3.asm"
INCLUDE "audio/sfx/cry0b_3.asm"
INCLUDE "audio/sfx/cry0c_3.asm"
INCLUDE "audio/sfx/cry02_3.asm"
INCLUDE "audio/sfx/cry0d_3.asm"
INCLUDE "audio/sfx/cry01_3.asm"
INCLUDE "audio/sfx/cry0a_3.asm"
INCLUDE "audio/sfx/cry08_3.asm"
INCLUDE "audio/sfx/cry04_3.asm"
INCLUDE "audio/sfx/cry19_3.asm"
INCLUDE "audio/sfx/cry16_3.asm"
INCLUDE "audio/sfx/cry1b_3.asm"
INCLUDE "audio/sfx/cry12_3.asm"
INCLUDE "audio/sfx/cry13_3.asm"
INCLUDE "audio/sfx/cry14_3.asm"
INCLUDE "audio/sfx/cry1e_3.asm"
INCLUDE "audio/sfx/cry15_3.asm"
INCLUDE "audio/sfx/cry17_3.asm"
INCLUDE "audio/sfx/cry1c_3.asm"
INCLUDE "audio/sfx/cry1a_3.asm"
INCLUDE "audio/sfx/cry1d_3.asm"
INCLUDE "audio/sfx/cry18_3.asm"
INCLUDE "audio/sfx/cry1f_3.asm"
INCLUDE "audio/sfx/cry20_3.asm"
INCLUDE "audio/sfx/cry21_3.asm"
INCLUDE "audio/sfx/cry22_3.asm"



SECTION "Audio Engine 1", ROMX ; BANK $02

PlayBattleMusic::
	xor a
	ld [wAudioFadeOutControl], a
	ld [wLowHealthAlarm], a
	dec a
	ld [wNewSoundID], a
	call PlaySound ; stop music
	call DelayFrame
	ld c, BANK(Music_GymLeaderBattle)
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


INCLUDE "audio/engine_1.asm"


; an alternate start for MeetRival which has a different first measure
Music_RivalAlternateStart::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b1a2
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_branch_b21d
	call Audio1_OverwriteChannelPointer
	ld de, Music_MeetRival_branch_b2b5

Audio1_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret

; an alternate tempo for MeetRival which is slightly slower
Music_RivalAlternateTempo::
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b119
	jp Audio1_OverwriteChannelPointer

; applies both the alternate start and alternate tempo
Music_RivalAlternateStartAndTempo::
	call Music_RivalAlternateStart
	ld hl, wChannelCommandPointers
	ld de, Music_MeetRival_branch_b19b
	jp Audio1_OverwriteChannelPointer

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
	call PlayMusic
	ld hl, wChannelCommandPointers
	ld de, Music_Cities1_branch_aa6f
	jp Audio1_OverwriteChannelPointer


SECTION "Audio Engine 2", ROMX ; BANK $08

Music_DoLowHealthAlarm::
	ld a, [wLowHealthAlarm]
	cp $ff
	jr z, .disableAlarm

	bit 7, a  ;alarm enabled?
	ret z     ;nope

	and $7f   ;low 7 bits are the timer.
	jr nz, .asm_21383 ;if timer > 0, play low tone.

	call .playToneHi
	ld a, 30 ;keep this tone for 30 frames.
	jr .asm_21395 ;reset the timer.

.asm_21383
	cp 20
	jr nz, .asm_2138a ;if timer == 20,
	call .playToneLo  ;actually set the sound registers.

.asm_2138a
	ld a, $86
	ld [wChannelSoundIDs + Ch4], a ;disable sound channel?
	ld a, [wLowHealthAlarm]
	and $7f ;decrement alarm timer.
	dec a

.asm_21395
	; reset the timer and enable flag.
	set 7, a
	ld [wLowHealthAlarm], a
	ret

.disableAlarm
	xor a
	ld [wLowHealthAlarm], a  ;disable alarm
	ld [wChannelSoundIDs + Ch4], a  ;re-enable sound channel?
	ld de, .toneDataSilence
	jr .playTone

;update the sound registers to change the frequency.
;the tone set here stays until we change it.
.playToneHi
	ld de, .toneDataHi
	jr .playTone

.playToneLo
	ld de, .toneDataLo

;update sound channel 1 to play the alarm, overriding all other sounds.
.playTone
	ld hl, rNR10 ;channel 1 sound register
	ld c, $5
	xor a

.copyLoop
	ld [hli], a
	ld a, [de]
	inc de
	dec c
	jr nz, .copyLoop
	ret

;bytes to write to sound channel 1 registers for health alarm.
;starting at FF11 (FF10 is always zeroed), so these bytes are:
;length, envelope, freq lo, freq hi
.toneDataHi
	db $A0,$E2,$50,$87

.toneDataLo
	db $B0,$E2,$EE,$86

;written to stop the alarm
.toneDataSilence
	db $00,$00,$00,$80


INCLUDE "engine/menu/bills_pc.asm"

INCLUDE "audio/engine_2.asm"


Music_PokeFluteInBattle::
	; begin playing the "caught mon" sound effect
	ld a, SFX_CAUGHT_MON
	call PlaySoundWaitForCurrent
	; then immediately overwrite the channel pointers
	ld hl, wChannelCommandPointers + Ch4 * 2
	ld de, SFX_08_PokeFlute_Ch4
	call Audio2_OverwriteChannelPointer
	ld de, SFX_08_PokeFlute_Ch5
	call Audio2_OverwriteChannelPointer
	ld de, SFX_08_PokeFlute_Ch6

Audio2_OverwriteChannelPointer:
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ret


SECTION "Audio Engine 3", ROMX ; BANK $1f

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
	call PlayMusic
	jp PlayDefaultMusic

PokedexRatingSfxPointers:
	db SFX_DENIED,         BANK(SFX_Denied_3)
	db SFX_POKEDEX_RATING, BANK(SFX_Pokedex_Rating_1)
	db SFX_GET_ITEM_1,     BANK(SFX_Get_Item1_1)
	db SFX_CAUGHT_MON,     BANK(SFX_Caught_Mon)
	db SFX_LEVEL_UP,       BANK(SFX_Level_Up)
	db SFX_GET_KEY_ITEM,   BANK(SFX_Get_Key_Item_1)
	db SFX_GET_ITEM_2,     BANK(SFX_Get_Item2_1)

OwnedMonValues:
	db 10, 40, 60, 90, 120, 150, $ff


INCLUDE "audio/engine_3.asm"



SECTION "Music 1", ROMX ; BANK $02

INCLUDE "audio/music/pkmnhealed.asm"
INCLUDE "audio/music/routes1.asm"
INCLUDE "audio/music/routes2.asm"
INCLUDE "audio/music/routes3.asm"
INCLUDE "audio/music/routes4.asm"
INCLUDE "audio/music/indigoplateau.asm"
INCLUDE "audio/music/pallettown.asm"
INCLUDE "audio/music/unusedsong.asm"
INCLUDE "audio/music/cities1.asm"
INCLUDE "audio/sfx/get_item1_1.asm"
INCLUDE "audio/music/museumguy.asm"
INCLUDE "audio/music/meetprofoak.asm"
INCLUDE "audio/music/meetrival.asm"
INCLUDE "audio/sfx/pokedex_rating_1.asm"
INCLUDE "audio/sfx/get_item2_1.asm"
INCLUDE "audio/sfx/get_key_item_1.asm"
INCLUDE "audio/music/ssanne.asm"
INCLUDE "audio/music/cities2.asm"
INCLUDE "audio/music/celadon.asm"
INCLUDE "audio/music/cinnabar.asm"
INCLUDE "audio/music/vermilion.asm"
INCLUDE "audio/music/lavender.asm"
INCLUDE "audio/music/safarizone.asm"
INCLUDE "audio/music/gym.asm"
INCLUDE "audio/music/pokecenter.asm"


SECTION "Music 2", ROMX ; BANK $08

INCLUDE "audio/sfx/pokeflute_ch4_ch5.asm"
INCLUDE "audio/sfx/unused2_2.asm"
INCLUDE "audio/music/gymleaderbattle.asm"
INCLUDE "audio/music/trainerbattle.asm"
INCLUDE "audio/music/wildbattle.asm"
INCLUDE "audio/music/finalbattle.asm"
INCLUDE "audio/sfx/level_up.asm"
INCLUDE "audio/sfx/get_item2_2.asm"
INCLUDE "audio/sfx/caught_mon.asm"
INCLUDE "audio/music/defeatedtrainer.asm"
INCLUDE "audio/music/defeatedwildmon.asm"
INCLUDE "audio/music/defeatedgymleader.asm"


SECTION "Music 3", ROMX ; BANK $1f

INCLUDE "audio/music/bikeriding.asm"
INCLUDE "audio/music/dungeon1.asm"
INCLUDE "audio/music/gamecorner.asm"
INCLUDE "audio/music/titlescreen.asm"
INCLUDE "audio/sfx/get_item1_3.asm"
INCLUDE "audio/music/dungeon2.asm"
INCLUDE "audio/music/dungeon3.asm"
INCLUDE "audio/music/cinnabarmansion.asm"
INCLUDE "audio/sfx/pokedex_rating_3.asm"
INCLUDE "audio/sfx/get_item2_3.asm"
INCLUDE "audio/sfx/get_key_item_3.asm"
INCLUDE "audio/music/oakslab.asm"
INCLUDE "audio/music/pokemontower.asm"
INCLUDE "audio/music/silphco.asm"
INCLUDE "audio/music/meeteviltrainer.asm"
INCLUDE "audio/music/meetfemaletrainer.asm"
INCLUDE "audio/music/meetmaletrainer.asm"
INCLUDE "audio/music/introbattle.asm"
INCLUDE "audio/music/surfing.asm"
INCLUDE "audio/music/jigglypuffsong.asm"
INCLUDE "audio/music/halloffame.asm"
INCLUDE "audio/music/credits.asm"

