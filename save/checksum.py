import os
import sys

def checksum_get(s):
    c = 0;
    f = open(s, "rb")
    s = f.read();
    for b in s[8:]:
        c += ord(b)
    f.close()
    print "%08X" % c

if (len(sys.argv) != 2):
    print "MHTri Save Checksum Calculator"
    print "Usage: %s <save file>" % sys.argv[0]
else:
    try:
        checksum_get(sys.argv[1])
    except Exception, e:
        print e