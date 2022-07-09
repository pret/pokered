CreditsTextPointers:
; entries correspond to CRED_* constants
	table_width 2, CreditsTextPointers
	dw CredVersion
	dw CredTajiri
	dw CredTaOota
	dw CredMorimoto
	dw CredWatanabe
	dw CredMasuda
	dw CredNisino
	dw CredSugimori
	dw CredNishida
	dw CredMiyamoto
	dw CredKawaguchi
	dw CredIshihara
	dw CredYamauchi
	dw CredZinnai
	dw CredHishida
	dw CredSakai
	dw CredYamaguchi
	dw CredYamamoto
	dw CredTaniguchi
	dw CredNonomura
	dw CredFuziwara
	dw CredMatsusima
	dw CredTomisawa
	dw CredKawamoto
	dw CredKakei
	dw CredTsuchiya
	dw CredTaNakamura
	dw CredYuda
	dw CredMon
	dw CredDirector
	dw CredProgrammers
	dw CredCharDesign
	dw CredMusic
	dw CredSoundEffects
	dw CredGameDesign
	dw CredMonsterDesign
	dw CredGameScene
	dw CredParam
	dw CredMap
	dw CredTest
	dw CredSpecial
	dw CredProducers
	dw CredProducer
	dw CredExecutive
	dw CredTamada
	dw CredSaOota
	dw CredYoshikawa
	dw CredToOota
	dw CredUSStaff
	dw CredUSCoord
	dw CredTilden
	dw CredKawakami
	dw CredHiNakamura
	dw CredGiese
	dw CredOsborne
	dw CredTrans
	dw CredOgasawara
	dw CredIwata
	dw CredIzushi
	dw CredHarada
	dw CredMurakawa
	dw CredFukui
	dw CredClub
	dw CredPAAD
	assert_table_length NUM_CRED_STRINGS

CredVersion:
IF DEF(_RED)
	db -8, "RED VERSION STAFF@"
ENDC
IF DEF(_BLUE)
	db -8, "BLUE VERSION STAFF@"
ENDC
CredTajiri:
	db -6, "SATOSHI TAJIRI@"
CredTaOota:
	db -6, "TAKENORI OOTA@"
CredMorimoto:
	db -7, "SHIGEKI MORIMOTO@"
CredWatanabe:
	db -7, "TETSUYA WATANABE@"
CredMasuda:
	db -6, "JUNICHI MASUDA@"
CredNisino:
	db -5, "KOHJI NISINO@"
CredSugimori:
	db -5, "KEN SUGIMORI@"
CredNishida:
	db -6, "ATSUKO NISHIDA@"
CredMiyamoto:
	db -7, "SHIGERU MIYAMOTO@"
CredKawaguchi:
	db -8, "TAKASHI KAWAGUCHI@"
CredIshihara:
	db -8, "TSUNEKAZU ISHIHARA@"
CredYamauchi:
	db -7, "HIROSHI YAMAUCHI@"
CredZinnai:
	db -7, "HIROYUKI ZINNAI@"
CredHishida:
	db -7, "TATSUYA HISHIDA@"
CredSakai:
	db -6, "YASUHIRO SAKAI@"
CredYamaguchi:
	db -7, "WATARU YAMAGUCHI@"
CredYamamoto:
	db -8, "KAZUYUKI YAMAMOTO@"
CredTaniguchi:
	db -8, "RYOHSUKE TANIGUCHI@"
CredNonomura:
	db -8, "FUMIHIRO NONOMURA@"
CredFuziwara:
	db -7, "MOTOFUMI FUZIWARA@"
CredMatsusima:
	db -7, "KENJI MATSUSIMA@"
CredTomisawa:
	db -7, "AKIHITO TOMISAWA@"
CredKawamoto:
	db -7, "HIROSHI KAWAMOTO@"
CredKakei:
	db -6, "AKIYOSHI KAKEI@"
CredTsuchiya:
	db -7, "KAZUKI TSUCHIYA@"
CredTaNakamura:
	db -6, "TAKEO NAKAMURA@"
CredYuda:
	db -6, "MASAMITSU YUDA@"
CredMon:
	db -3, "#MON@"
CredDirector:
	db -3, "DIRECTOR@"
CredProgrammers:
	db -5, "PROGRAMMERS@"
CredCharDesign:
	db -7, "CHARACTER DESIGN@"
CredMusic:
	db -2, "MUSIC@"
CredSoundEffects:
	db -6, "SOUND EFFECTS@"
CredGameDesign:
	db -5, "GAME DESIGN@"
CredMonsterDesign:
	db -6, "MONSTER DESIGN@"
CredGameScene:
	db -6, "GAME SCENARIO@"
CredParam:
	db -8, "PARAMETRIC DESIGN@"
CredMap:
	db -4, "MAP DESIGN@"
CredTest:
	db -7, "PRODUCT TESTING@"
CredSpecial:
	db -6, "SPECIAL THANKS@"
CredProducers:
	db -4, "PRODUCERS@"
CredProducer:
	db -4, "PRODUCER@"
CredExecutive:
	db -8, "EXECUTIVE PRODUCER@"
CredTamada:
	db -6, "SOUSUKE TAMADA@"
CredSaOota:
	db -5, "SATOSHI OOTA@"
CredYoshikawa:
	db -6, "RENA YOSHIKAWA@"
CredToOota:
	db -6, "TOMOMICHI OOTA@"
CredUSStaff:
	db -7, "US VERSION STAFF@"
CredUSCoord:
	db -7, "US COORDINATION@"
CredTilden:
	db -5, "GAIL TILDEN@"
CredKawakami:
	db -6, "NAOKO KAWAKAMI@"
CredHiNakamura:
	db -6, "HIRO NAKAMURA@"
CredGiese:
	db -6, "WILLIAM GIESE@"
CredOsborne:
	db -5, "SARA OSBORNE@"
CredTrans:
	db -7, "TEXT TRANSLATION@"
CredOgasawara:
	db -6, "NOB OGASAWARA@"
CredIwata:
	db -5, "SATORU IWATA@"
CredIzushi:
	db -7, "TAKEHIRO IZUSHI@"
CredHarada:
	db -7, "TAKAHIRO HARADA@"
CredMurakawa:
	db -7, "TERUKI MURAKAWA@"
CredFukui:
	db -5, "KOHTA FUKUI@"
CredClub:
	db -9, "NCL SUPER MARIO CLUB@"
CredPAAD:
	db -5, "PAAD TESTING@"
