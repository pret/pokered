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
	dw CredEURStaff ;editado
	dw CredEURCoord	;editado
	dw CredMoyse	;editado
	dw CredPfitzner ;nuevo
	dw CredKraft	;nuevo
	dw CredKawakami
	dw CredEdasawa  ;editado
	dw CredUesugi   ;editado
	dw CredYoshimura ;editado
	dw CredTrans
	dw CredAlcami ;editado
	dw CredGreppi ;nuevo
	dw CredIwata
	dw CredIzushi
	dw CredHarada
	dw CredNakamichi
	dw CredMurakawa
	dw CredFukui
	dw CredNOE ;editado
	dw CredZehFei ;nuevo
	dw CredNOA ;editado
	dw CredHudsonBuechele ;nuevo
	assert_table_length NUM_CRED_STRINGS

CredVersion: ; this 1 byte difference makes all bank addresses offset by 1 in the blue version
IF DEF(_RED)
	db -5, "EDICIÓN ROJA@"
ENDC
IF DEF(_BLUE)
	db -5, "EDICIÓN AZUL@"
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
	db -6, "PROGRAMADORES@"
CredCharDesign:
	db -8, "DISEÑO PERSONAJES@"
CredMusic:
	db -2, "MÚSICA@"
CredSoundEffects:
	db -8, "EFECTOS DE SONIDO@"
CredGameDesign:
	db -7, "DISEÑO DEL JUEGO@"
CredMonsterDesign:
	db -7, "DISEÑO CRIATURAS@"
CredGameScene:
	db -8, "ESCENARIO DE JUEGO@"
CredParam:
	db -8, "DISEÑO PARAMÉTRICO@"
CredMap:
	db -8, "DISEÑO DEL MAPEADO@"
CredTest:
	db -7, "TEST DE PRODUCTO@"
CredSpecial:
	db -7, "AGRADECIMIENTOS@"
CredProducers:
	db -5, "PRODUCTORES@"
CredProducer:
	db -4, "PRODUCTOR@"
CredExecutive:
	db -7, "PROD. EJECUTIVO@"
CredTamada:
	db -6, "SOUSUKE TAMADA@"
CredSaOota:
	db -5, "SATOSHI OOTA@"
CredYoshikawa:
	db -6, "RENA YOSHIKAWA@"
CredToOota:
	db -6, "TOMOMICHI OOTA@"
CredEURStaff:
	db -6, "EQUIPO EUROPEO@"
CredEURCoord:
	db -9, "COORDINACIÓN EUROPEA@"
CredMoyse:
	db -7, "CLAUDE M. MOYSE@" ;editado
CredPfitzner:
	db -7, "MARKUS PFITZNER@" ;nuevo
CredKraft:
	db -6, "JOHN D. KRAFT@" ;nuevo
CredKawakami:
	db -6, "NAOKO KAWAKAMI@"
CredEdasawa:
	db -6, "YUSUKE EDASAWA@" ;editado
CredUesugi:
	db -5, "HIRO UESUGI@" ;editado
CredYoshimura:
	db -7, "KAMON YOSHIMURA@" ;editado
CredTrans:
	db -7, "TEXTO CASTELLANO@"
CredAlcami:
	db -5, "SUSA ALCAMI@" ;editado
CredGreppi:
	db -6, "ANTONIO GREPPI@" ;nuevo
CredIwata:
	db -5, "SATORU IWATA@"
CredIzushi:
	db -7, "TAKEHIRO IZUSHI@"
CredHarada:
	db -7, "TAKAHIRO HARADA@"
CredNakamichi:
	db -7, "KIMIKO NAKAMICHI@" ;nuevo
CredMurakawa:
	db -7, "TERUKI MURAKAWA@"
CredFukui:
	db -5, "KOHTA FUKUI@"
CredNOE:
	db -9, "NOE PRODUCT TESTING@" ;editado
CredZehFei:
	db -7, "KAI ZEH/ANDY FEY@" ;nuevo
CredNOA:
	db -9, "NOA PRODUCT TESTING@" ;editado
CredHudsonBuechele:
	db -9, "K.HUDSON/T.BUECHELE@" ;nuevo