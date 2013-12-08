# coding: utf-8
"""
Starting a new python process to preprocess each source file creates too much
overhead. Instead, a list of files to preprocess is fed into a script run from
a single process.
"""

import os
import sys

import preprocessor

def main():
    processor = preprocessor.setup_processor()

    stdin  = sys.stdin
    stdout = sys.stdout

    for source in sys.argv[1:]:
        dest = os.path.splitext(source)[0] + '.tx'
        sys.stdin  = open(source, 'r')
        sys.stdout = open(dest, 'w')
        processor.preprocess()

    processor.update_globals()

    sys.stdin  = stdin
    sys.stdout = stdout


if __name__ == '__main__':
    main()
