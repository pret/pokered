FadeOutAudio::
	ld a, [wAudioFadeOutControl]
	and a ; currently fading out audio?
	jr nz, .fadingOut
	ld a, [wd72c]
	bit 1, a
	ret nz
	ld a, $77
	ldh [rNR50], a
	ret
.fadingOut
	ld a, [wAudioFadeOutCounter]
	and a
	jr z, .counterReachedZero
	dec a
	ld [wAudioFadeOutCounter], a
	ret
.counterReachedZero
	ld a, [wAudioFadeOutCounterReloadValue]
	ld [wAudioFadeOutCounter], a
	ldh a, [rNR50]
	and a ; has the volume reached 0?
	jr z, .fadeOutComplete
	ld b, a
	and $f
	dec a
	ld c, a
	ld a, b
	and $f0
	swap a
	dec a
	swap a
	or c
	ldh [rNR50], a
	ret
.fadeOutComplete
	ld a, [wAudioFadeOutControl]
	ld b, a
	xor a
	ld [wAudioFadeOutControl], a
	call StopAllMusic ; shinpokerednote: MOVED: a common function to do what the 3 lines that used to be here did was created
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a ; PureRGbnote: ADDED: does the map have extra music
	jr z, .noExtraMusic
	ld d, 0
	jr PlayExtraMusic ; if it has extra music, try to play it instead of what was supposed to play after fading out
.noExtraMusic
	ld a, [wAudioSavedROMBank]
	ld [wAudioROMBank], a
	ld a, b
	ld [wNewSoundID], a
	jp PlaySound

;;;;;;;;;; PureRGBnote: ADDED: function for playing new music after it fades out without relying on the current music tracking setup.
TryPlayExtraMusic:
	ld a, [wCurMapConnections]
	bit BIT_EXTRA_MUSIC_MAP, a ; does the map have extra music
	ret z
PlayExtraMusic:
	ld a, [wCurMap]
	cp SECRET_LAB
	jr z, .secretlab
	cp DIAMOND_MINE
	jr z, .diamondMine
	cp CELADON_MANSION_2F
	jr z, .prospectorsHouseCheck
	cp CINNABAR_VOLCANO
	jr z, .volcano
	cp CINNABAR_VOLCANO_WEST
	jr z, .volcano
	cp POKEMON_TOWER_B1F
	jr z, .towerB1F
	ret
.secretlab
	jpfar SecretLabPlayMusic
.volcano
	call FadeOutAudio.noExtraMusic
	jpfar VolcanoPlayMusic
.diamondMine
	ld a, d
	and a
	jr z, .fadingOut
	jpfar DiamondMinePlayMusic
.towerB1F
	jpfar PokemonTowerB1FPlayMusic
.prospectorsHouseCheck
	jpfar CheckBoomboxPlaying
.fadingOut
	xor a
	ld [wReplacedMapMusic], a
	jr FadeOutAudio.noExtraMusic
;;;;;;;;;;
