#!/usr/bin/python
# -*- coding: utf-8 -*-

import sys

chars = {}
chars["ガ"] = "$05"
chars["ギ"] = "$06"
chars["グ"] = "$07"
chars["ゲ"] = "$08"
chars["ゴ"] = "$09"
chars["ザ"] = "$0A"
chars["ジ"] = "$0B"
chars["ズ"] = "$0C"
chars["ゼ"] = "$0D"
chars["ゾ"] = "$0E"
chars["ダ"] = "$0F"
chars["ヂ"] = "$10"
chars["ヅ"] = "$11"
chars["デ"] = "$12"
chars["ド"] = "$13"
chars["バ"] = "$19"
chars["ビ"] = "$1A"
chars["ブ"] = "$1B"
chars["ボ"] = "$1C"
chars["が"] = "$26"
chars["ぎ"] = "$27"
chars["ぐ"] = "$28"
chars["げ"] = "$29"
chars["ご"] = "$2A"
chars["ざ"] = "$2B"
chars["じ"] = "$2C"
chars["ず"] = "$2D"
chars["ぜ"] = "$2E"
chars["ぞ"] = "$2F"
chars["だ"] = "$30"
chars["ぢ"] = "$31"
chars["づ"] = "$32"
chars["で"] = "$33"
chars["ど"] = "$34"
chars["ば"] = "$3A"
chars["び"] = "$3B"
chars["ぶ"] = "$3C"
chars["べ"] = "$3D"
chars["ぼ"] = "$3E"
chars["パ"] = "$40"
chars["ピ"] = "$41"
chars["プ"] = "$42"
chars["ポ"] = "$43"
chars["ぱ"] = "$44"
chars["ぴ"] = "$45"
chars["ぷ"] = "$46"
chars["ぺ"] = "$47"
chars["ぽ"] = "$48"
chars["ア"] = "$80"
chars["イ"] = "$81"
chars["ウ"] = "$82"
chars["エ"] = "$83"
chars["ォ"] = "$84"
chars["カ"] = "$85"
chars["キ"] = "$86"
chars["ク"] = "$87"
chars["ケ"] = "$88"
chars["コ"] = "$89"
chars["サ"] = "$8A"
chars["シ"] = "$8B"
chars["ス"] = "$8C"
chars["セ"] = "$8D"
chars["ソ"] = "$8E"
chars["タ"] = "$8F"
chars["チ"] = "$90"
chars["ツ"] = "$91"
chars["テ"] = "$92"
chars["ト"] = "$93"
chars["ナ"] = "$94"
chars["ニ"] = "$95"
chars["ヌ"] = "$96"
chars["ネ"] = "$97"
chars["ノ"] = "$98"
chars["ハ"] = "$99"
chars["ヒ"] = "$9A"
chars["フ"] = "$9B"
chars["ホ"] = "$9C"
chars["マ"] = "$9D"
chars["ミ"] = "$9E"
chars["ム"] = "$9F"
chars["メ"] = "$A0"
chars["モ"] = "$A1"
chars["ヤ"] = "$A2"
chars["ユ"] = "$A3"
chars["ヨ"] = "$A4"
chars["ラ"] = "$A5"
chars["ル"] = "$A6"
chars["レ"] = "$A7"
chars["ロ"] = "$A8"
chars["ワ"] = "$A9"
chars["ヲ"] = "$AA"
chars["ン"] = "$AB"
chars["ッ"] = "$AC"
chars["ャ"] = "$AD"
chars["ュ"] = "$AE"
chars["ョ"] = "$AF"
chars["ィ"] = "$B0"
chars["あ"] = "$B1"
chars["い"] = "$B2"
chars["う"] = "$B3"
chars["え"] = "$B4"
chars["お"] = "$B5"
chars["か"] = "$B6"
chars["き"] = "$B7"
chars["く"] = "$B8"
chars["け"] = "$B9"
chars["こ"] = "$BA"
chars["さ"] = "$BB"
chars["し"] = "$BC"
chars["す"] = "$BD"
chars["せ"] = "$BE"
chars["そ"] = "$BF"
chars["た"] = "$C0"
chars["ち"] = "$C1"
chars["つ"] = "$C2"
chars["て"] = "$C3"
chars["と"] = "$C4"
chars["な"] = "$C5"
chars["に"] = "$C6"
chars["ぬ"] = "$C7"
chars["ね"] = "$C8"
chars["の"] = "$C9"
chars["は"] = "$CA"
chars["ひ"] = "$CB"
chars["ふ"] = "$CC"
chars["へ"] = "$CD"
chars["ほ"] = "$CE"
chars["ま"] = "$CF"
chars["み"] = "$D0"
chars["む"] = "$D1"
chars["め"] = "$D2"
chars["も"] = "$D3"
chars["や"] = "$D4"
chars["ゆ"] = "$D5"
chars["よ"] = "$D6"
chars["ら"] = "$D7"
chars["り"] = "$D8"
chars["る"] = "$D9"
chars["れ"] = "$DA"
chars["ろ"] = "$DB"
chars["わ"] = "$DC"
chars["を"] = "$DD"
chars["ん"] = "$DE"
chars["っ"] = "$DF"
chars["ゃ"] = "$E0"
chars["ゅ"] = "$E1"
chars["ょ"] = "$E2"
chars["ー"] = "$E3"


chars["@"] = "$50"
chars["#"] = "$54"
chars["…"] = "$75"

# textbox borders
chars["┌"] = "$79"
chars["─"] = "$7A"
chars["┐"] = "$7B"
chars["│"] = "$7C"
chars["└"] = "$7D"
chars["┘"] = "$7E"

chars["№"] = "$74"

chars[" "] = "$7F"
chars["A"] = "$80"
chars["B"] = "$81"
chars["C"] = "$82"
chars["D"] = "$83"
chars["E"] = "$84"
chars["F"] = "$85"
chars["G"] = "$86"
chars["H"] = "$87"
chars["I"] = "$88"
chars["J"] = "$89"
chars["K"] = "$8A"
chars["L"] = "$8B"
chars["M"] = "$8C"
chars["N"] = "$8D"
chars["O"] = "$8E"
chars["P"] = "$8F"
chars["Q"] = "$90"
chars["R"] = "$91"
chars["S"] = "$92"
chars["T"] = "$93"
chars["U"] = "$94"
chars["V"] = "$95"
chars["W"] = "$96"
chars["X"] = "$97"
chars["Y"] = "$98"
chars["Z"] = "$99"
chars["("] = "$9A"
chars[")"] = "$9B"
chars[":"] = "$9C"
chars[";"] = "$9D"
chars["["] = "$9E"
chars["]"] = "$9F"
chars["a"] = "$A0"
chars["b"] = "$A1"
chars["c"] = "$A2"
chars["d"] = "$A3"
chars["e"] = "$A4"
chars["f"] = "$A5"
chars["g"] = "$A6"
chars["h"] = "$A7"
chars["i"] = "$A8"
chars["j"] = "$A9"
chars["k"] = "$AA"
chars["l"] = "$AB"
chars["m"] = "$AC"
chars["n"] = "$AD"
chars["o"] = "$AE"
chars["p"] = "$AF"
chars["q"] = "$B0"
chars["r"] = "$B1"
chars["s"] = "$B2"
chars["t"] = "$B3"
chars["u"] = "$B4"
chars["v"] = "$B5"
chars["w"] = "$B6"
chars["x"] = "$B7"
chars["y"] = "$B8"
chars["z"] = "$B9"
chars["é"] = "$BA"
chars["'d"] = "$BB"
chars["'l"] = "$BC"
chars["'s"] = "$BD"
chars["'t"] = "$BE"
chars["'v"] = "$BF"
chars["'"] = "$E0"
chars["-"] = "$E3"
chars["'r"] = "$E4"
chars["'m"] = "$E5"
chars["?"] = "$E6"
chars["!"] = "$E7"
chars["."] = "$E8"
chars["♂"] = "$EF"
chars["¥"] = "$F0"
chars["/"] = "$F3"
chars[","] = "$F4"
chars["♀"] = "$F5"
chars["0"] = "$F6"
chars["1"] = "$F7"
chars["2"] = "$F8"
chars["3"] = "$F9"
chars["4"] = "$FA"
chars["5"] = "$FB"
chars["6"] = "$FC"
chars["7"] = "$FD"
chars["8"] = "$FE"
chars["9"] = "$FF"

for l in sys.stdin:

    # strip comments
    line = l.partition(";")
    i = 0
    asm = ""
    while i < len(line) and l[0] != ";":
        asm = asm + line[i]
        i = i + 1

    # skip asm with no quotes
    if "\"" not in asm:
        sys.stdout.write(l)
        continue

    # split by quotes
    asms = asm.split("\"")

    # skip asm that actually does use ASCII in quotes
    lowasm = asms[0].lower()
    if "section" in lowasm \
    or "include" in lowasm \
    or "incbin" in lowasm:
        sys.stdout.write(l)
        continue

    even = False
    i = 0
    for token in asms:
        i = i + 1
        if even:
            # token is a string to convert to byte values

            while len(token):
                # read a single UTF-8 codepoint
                char = token[0]
                if ord(char) >= 0xFC:
                    char = char + token[1:6]
                    token = token[6:]
                elif ord(char) >= 0xF8:
                    char = char + token[1:5]
                    token = token[5:]
                elif ord(char) >= 0xF0:
                    char = char + token[1:4]
                    token = token[4:]
                elif ord(char) >= 0xE0:
                    char = char + token[1:3]
                    token = token[3:]
                elif ord(char) >= 0xC0:
                    char = char + token[1:2]
                    token = token[2:]
                else:
                    token = token[1:]

                    # certain apostrophe-letter pairs are only a single byte
                    if char == "'" and \
                        (token[0] == "d" or \
                         token[0] == "l" or \
                         token[0] == "m" or \
                         token[0] == "r" or \
                         token[0] == "s" or \
                         token[0] == "t" or \
                         token[0] == "v"):
                        char = char + token[0]
                        token = token[1:]

                sys.stdout.write(chars[char])

                if len(token):
                    sys.stdout.write(", ")

        else:
            sys.stdout.write(token)
        even = not even
