#author: Bryan Bishop <kanzure@gmail.com>
#date: 2012-01-16
from optparse import OptionParser
from analyze_texts import text_pretty_printer_at

def main():
    usage = "usage: %prog address label"
    parser = OptionParser(usage)
    (options, args) = parser.parse_args()
    if len(args) == 1:
        print "usage: python pretty_text.py address label"
        args.append("UnnamedText_" + (args[0].replace("0x", "")))
    elif len(args) != 2:
        parser.error("we need both an address and a label")
    address = int(args[0], 16)
    label = args[1]

    text_pretty_printer_at(address, label)

if __name__ == "__main__":
    main()
