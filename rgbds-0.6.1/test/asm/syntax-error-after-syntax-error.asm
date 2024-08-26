MACRO mac
	println "got {d:_NARG} args"
ENDM
	mac
	mac 42
notmac
mac
mac 42
mac::
mac ::
