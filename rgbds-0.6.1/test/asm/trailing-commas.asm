SECTION "test", ROM0

MACRO mac
	println "\#"
ENDM

	mac 1,2, 3 , ,5,

	db 1,2,3,
	dw 4,5,6,
	dl 7,8,9,
	ds 10, $a, $b, $c,

	print "Hello", " ",
	println "world", "!",

spam:
eggs:
lobsterThermidor:

	export spam, eggs,
	purge lobsterThermidor,

	opt boO, g.xX#,
	dw %ooOOOOoo, `XX##..xx,
