CreditsTextPointers:
; entries correspond to CRED_* constants
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
	dw CredEUStaff
	dw CredEUCoord
	dw CredMoyse
	dw CredPfitzner
	dw CredKraft
	dw CredKawakami
	dw CredEdasawa
	dw CredUesugi
	dw CredYoshimura
	dw CredTrans
	dw CredFabri
	dw CredNakamichi
	dw CredIzushi
	dw CredHarada
	dw CredMurakawa
	dw CredFukui
	dw CredNoEProdTest
	dw CredZehAndTappert
	dw CredNoAProdTest
	dw CredHudsonAndBuechele

CredVersion: ; this 1 byte difference makes all bank addresses offset by 1 in the blue version
IF DEF(_RED)
	db -5, "ROTE EDITION@"
ENDC
IF DEF(_BLUE)
	db -6, "BLAUE EDITION@"
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
	db -3, "LEITUNG@"
CredProgrammers:
	db -6, "PROGRAMMIERER@"
CredCharDesign:
	db -6, "FIGUREN-DESIGN@"
CredMusic:
	db -2, "MUSIK@"
CredSoundEffects:
	db -6, "SOUND-EFFEKTE@"
CredGameDesign:
	db -5, "SPIEL-DESIGN@"
CredMonsterDesign:
	db -6, "MONSTER-DESIGN@"
CredGameScene:
	db -6, "SPIEL-SZENARIO@"
CredParam:
	db -7, "PARAMETR. DESIGN@"
CredMap:
	db -6, "KARTEN-DESIGN@"
CredTest:
	db -5, "PRODUKT-TEST@"
CredSpecial:
	db -7, "BESONDERER DANK@"
CredProducers:
	db -5, "PRODUZENTEN@"
CredProducer:
	db -4, "PRODUZENT@"
CredExecutive:
	db -5, "AUSFÜHRENDER@"
CredTamada:
	db -6, "SOUSUKE TAMADA@"
CredSaOota:
	db -5, "SATOSHI OOTA@"
CredYoshikawa:
	db -6, "RENA YOSHIKAWA@"
CredToOota:
	db -6, "TOMOMICHI OOTA@"
CredEUStaff:
	db -8, "EUROPÄISCHES TEAM@"
CredEUCoord:
	db -9, "EUROPA-KOORDINATION@"
CredMoyse:
	db -7, "CLAUDE M. MOYSE@"
CredPfitzner:
	db -7, "MARKUS PFITZNER@"
CredKraft:
	db -6, "JOHN D. KRAFT@"
CredKawakami:
	db -6, "NAOKO KAWAKAMI@"
CredEdasawa:
	db -6, "YUSUKE EDASAWA@"
CredUesugi:
	db -5, "HIRO UESUGI@"
CredYoshimura:
	db -7, "KAMON YOSHIMURA@"
CredTrans:
	db -6, "DEUTSCHER TEXT@"
CredFabri:
	db -6, "PATRICK FABRI@"
CredNakamichi:
	db -7, "KIMIKO NAKAMICHI@"
CredIzushi:
	db -7, "TAKEHIRO IZUSHI@"
CredHarada:
	db -7, "TAKAHIRO HARADA@"
CredMurakawa:
	db -7, "TERUKI MURAKAWA@"
CredFukui:
	db -5, "KOHTA FUKUI@"
CredNoEProdTest:
	db -9, "NOE PRODUCT TESTING@"
CredZehAndTappert:
	db -9, "KAI ZEH + F.TAPPERT@"
CredNoAProdTest:
	db -9, "NOA PRODUCT TESTING@"
CredHudsonAndBuechele:
	db -9, "K.HUDSON+T.BUECHELE@"
