from sys import argv
import getopt
import re
from itertools import chain


def sex():
    p, argz = getopt.getopt(argv[1:], 'sx:')
    if len(argz) == 0:
        argz.append('f')
    return argz[0]


def clean(names):
    return sorted(set([name for name in [re.sub("\s\s+", " ", n.strip()) for n in names] if name is not None and len(name) > 2]))
