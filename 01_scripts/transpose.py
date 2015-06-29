#!/usr/bin/python

import sys

in_file = sys.argv[1]
out_file = sys.argv[2]

lst_sp = []
with open(in_file, "rU") as in_f:
    with open(out_file, "w") as out_f:
        for line in in_f:
            line = line.strip()
            lst_sp.append(line)
        out_f.write("\t" + "\t".join(lst_sp) + "\n")
