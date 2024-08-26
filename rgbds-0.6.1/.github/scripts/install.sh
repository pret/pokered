#!/bin/bash
install -d /usr/local/bin/ /usr/local/share/man/man1/ /usr/local/share/man/man5/ /usr/local/share/man/man7/
install -s -m 755 rgbasm rgblink rgbfix rgbgfx /usr/local/bin/
install -m 644 rgbasm.1 rgblink.1 rgbfix.1 rgbgfx.1 /usr/local/share/man/man1/
install -m 644 rgbds.5 rgbasm.5 rgblink.5 /usr/local/share/man/man5/
install -m 644 rgbds.7 gbz80.7 /usr/local/share/man/man7/
