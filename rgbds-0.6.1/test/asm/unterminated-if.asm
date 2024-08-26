if 1
  if 0
    println "A"
  elif 1
    println "B"
  else
    println "C"
  endc
else
  println "D"
endc

INCLUDE "unterminated-if-include.inc"

println "done"
