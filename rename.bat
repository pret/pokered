@echo off
::if not defined in_subprocess (cmd /k set in_subprocess=y ^& %0 %*) & exit )

del "Pokemon - Red Version (USA, Europe) (SGB Enhanced).gb"
del "Pokemon - Blue Version (USA, Europe) (SGB Enhanced).gb"
ren pokered.gbc "Pokemon - Red Version (USA, Europe) (SGB Enhanced).gb"
ren pokeblue.gbc "Pokemon - Blue Version (USA, Europe) (SGB Enhanced).gb"