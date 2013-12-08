# coding: utf-8
"""
Starting a new python process to preprocess each source file creates too much
overhead. Instead, a list of files to preprocess is fed into a script run from
a single process.
"""

import os
import sys

import preprocessor

def preprocess_queue(filenames=sys.argv[1:]):

    stdin  = sys.stdin
    stdout = sys.stdout

    processor = preprocessor.setup_processor()

    for source in filenames:
        dest = os.path.splitext(source)[0] + '.tx'
        sys.stdin  = open(source, 'r')
        sys.stdout = open(dest, 'w')
        processor.preprocess()

    processor.update_globals()

    sys.stdin  = stdin
    sys.stdout = stdout

def main():
    filenames = list(set(sys.argv[1:]))
    if filenames:
        num_files = len(filenames)
        s = '' if num_files == 1 else 's'
        sys.stdout.write('Preprocessing {0} file{1}...\n'.format(num_files, s))
	preprocess_queue(filenames)

if __name__ == '__main__':
    main()
