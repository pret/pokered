MACRO m
  DEF depth += 1
  IF depth == 10
    OPT r9
  ENDC
  println "at depth {d:depth}"
  m
ENDM

  DEF depth = 0
  m
