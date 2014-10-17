CreditsTextPointers: ; 742c3 (1d:42c3)
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

CredVersion: ; 74343 (1d:4343) ; this 1 byte difference makes all bank addresses offset by 1 in the blue version
IF DEF(_RED)
	db -8, "RED VERSION STAFF@"
ENDC
IF DEF(_BLUE)
	db -8, "BLUE VERSION STAFF@"
ENDC
CredTajiri: ; 74356 (1d:4356)
	db -6, "SATOSHI TAJIRI@"
CredTaOota: ; 74366 (1d:4366)
	db -6, "TAKENORI OOTA@"
CredMorimoto: ; 74375 (1d:4375)
	db -7, "SHIGEKI MORIMOTO@"
CredWatanabe: ; 74387 (1d:4387)
	db -7, "TETSUYA WATANABE@"
CredMasuda: ; 74399 (1d:4399)
	db -6, "JUNICHI MASUDA@"
CredNisino: ; 743a9 (1d:43a9)
	db -5, "KOHJI NISINO@"
CredSugimori: ; 743b7 (1d:43b7)
	db -5, "KEN SUGIMORI@"
CredNishida: ; 743c5 (1d:43c5)
	db -6, "ATSUKO NISHIDA@"
CredMiyamoto: ; 743d5 (1d:43d5)
	db -7, "SHIGERU MIYAMOTO@"
CredKawaguchi: ; 743e7 (1d:43e7)
	db -8, "TAKASHI KAWAGUCHI@"
CredIshihara: ; 743fa (1d:43fa)
	db -8, "TSUNEKAZU ISHIHARA@"
CredYamauchi: ; 7440e (1d:440e)
	db -7, "HIROSHI YAMAUCHI@"
CredZinnai: ; 74420 (1d:4420)
	db -7, "HIROYUKI ZINNAI@"
CredHishida: ; 74431 (1d:4431)
	db -7, "TATSUYA HISHIDA@"
CredSakai: ; 74442 (1d:4442)
	db -6, "YASUHIRO SAKAI@"
CredYamaguchi: ; 74452 (1d:4452)
	db -7, "WATARU YAMAGUCHI@"
CredYamamoto: ; 74464 (1d:4464)
	db -8, "KAZUYUKI YAMAMOTO@"
CredTaniguchi: ; 74477 (1d:4477)
	db -8, "RYOHSUKE TANIGUCHI@"
CredNonomura: ; 7448b (1d:448b)
	db -8, "FUMIHIRO NONOMURA@"
CredFuziwara: ; 7449e (1d:449e)
	db -7, "MOTOFUMI FUZIWARA@"
CredMatsusima: ; 744b1 (1d:44b1)
	db -7, "KENJI MATSUSIMA@"
CredTomisawa: ; 744c2 (1d:44c2)
	db -7, "AKIHITO TOMISAWA@"
CredKawamoto: ; 744d4 (1d:44d4)
	db -7, "HIROSHI KAWAMOTO@"
CredKakei: ; 744e6 (1d:44e6)
	db -6, "AKIYOSHI KAKEI@"
CredTsuchiya: ; 744f6 (1d:44f6)
	db -7, "KAZUKI TSUCHIYA@"
CredTaNakamura: ; 74507 (1d:4507)
	db -6, "TAKEO NAKAMURA@"
CredYuda: ; 74517 (1d:4517)
	db -6, "MASAMITSU YUDA@"
CredMon: ; 74527 (1d:4527)
	db -3, "#MON@"
CredDirector: ; 7452d (1d:452d)
	db -3, "DIRECTOR@"
CredProgrammers: ; 74537 (1d:4537)
	db -5, "PROGRAMMERS@"
CredCharDesign: ; 74544 (1d:4544)
	db -7, "CHARACTER DESIGN@"
CredMusic: ; 74556 (1d:4556)
	db -2, "MUSIC@"
CredSoundEffects: ; 7455d (1d:455d)
	db -6, "SOUND EFFECTS@"
CredGameDesign: ; 7456c (1d:456c)
	db -5, "GAME DESIGN@"
CredMonsterDesign: ; 74579 (1d:4579)
	db -6, "MONSTER DESIGN@"
CredGameScene: ; 74589 (1d:4589)
	db -6, "GAME SCENARIO@"
CredParam: ; 74598 (1d:4598)
	db -8, "PARAMETRIC DESIGN@"
CredMap: ; 745ab (1d:45ab)
	db -4, "MAP DESIGN@"
CredTest: ; 745b7 (1d:45b7)
	db -7, "PRODUCT TESTING@"
CredSpecial: ; 745c8 (1d:45c8)
	db -6, "SPECIAL THANKS@"
CredProducers: ; 745d8 (1d:45d8)
	db -4, "PRODUCERS@"
CredProducer: ; 745e3 (1d:45e3)
	db -4, "PRODUCER@"
CredExecutive: ; 745ed (1d:45ed)
	db -8, "EXECUTIVE PRODUCER@"
CredTamada: ; 74601 (1d:4601)
	db -6, "SOUSUKE TAMADA@"
CredSaOota: ; 74611 (1d:4611)
	db -5, "SATOSHI OOTA@"
CredYoshikawa: ; 7461f (1d:461f)
	db -6, "RENA YOSHIKAWA@"
CredToOota: ; 7462f (1d:462f)
	db -6, "TOMOMICHI OOTA@"
CredUSStaff: ; 7463f (1d:463f)
	db -7, "US VERSION STAFF@"
CredUSCoord: ; 74651 (1d:4651)
	db -7, "US COORDINATION@"
CredTilden: ; 74662 (1d:4662)
	db -5, "GAIL TILDEN@"
CredKawakami: ; 7466f (1d:466f)
	db -6, "NAOKO KAWAKAMI@"
CredHiNakamura: ; 7467f (1d:467f)
	db -6, "HIRO NAKAMURA@"
CredGiese: ; 7468e (1d:468e)
	db -6, "WILLIAM GIESE@"
CredOsborne: ; 7469d (1d:469d)
	db -5, "SARA OSBORNE@"
CredTrans: ; 746ab (1d:46ab)
	db -7, "TEXT TRANSLATION@"
CredOgasawara: ; 746bd (1d:46bd)
	db -6, "NOB OGASAWARA@"
CredIwata: ; 746cc (1d:46cc)
	db -5, "SATORU IWATA@"
CredIzushi: ; 746da (1d:46da)
	db -7, "TAKEHIRO IZUSHI@"
CredHarada: ; 746eb (1d:46eb)
	db -7, "TAKAHIRO HARADA@"
CredMurakawa: ; 746fc (1d:46fc)
	db -7, "TERUKI MURAKAWA@"
CredFukui: ; 7470d (1d:470d)
	db -5, "KOHTA FUKUI@"
CredClub: ; 7471a (1d:471a)
	db -9, "NCL SUPER MARIO CLUB@"
CredPAAD: ; 74730 (1d:4730)
	db -5, "PAAD TESTING@"
