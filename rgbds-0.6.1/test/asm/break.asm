FOR V, 1, 100
      PRINTLN "- {d:V}"
      IF V == 5
          PRINTLN "stop"
          BREAK
      ENDC
      PRINTLN "cont"
ENDR
WARN "done {d:V}"
rept 1
  break
  ; skips invalid code
  !@#$%
macro elif
  invalid
endr
warn "OK"
rept 1
  if 1
    break
  no endc
endr
println "done"
