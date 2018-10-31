#!/usr/bin/env python
import sys
import datetime
import os
import re

version = '%%VERSION%%-%%RELEASE%%'

    
def imcdate():
    now = datetime.datetime.now()
    return now.strftime("%Y.%m.%d-%H.%M.%S")

def main():
    if len(sys.argv) != 1:
        if re.search(r'-v', sys.argv[1], re.I):
            print 'hello.py ' + str(version)
            return 0

    myHome = os.environ.get('HOME')
    myLogDir = myHome + '/log/hello.py/' + imcdate()
    if not os.path.exists(myLogDir):
        os.makedirs(myLogDir)

    LOG = open(myLogDir + '/hello.log', 'w')

    LOG.write(imcdate() + ' : INFO : ' + "Hello World!\n")
    print 'Hello World!'
    return 0

if __name__ == '__main__':
    sys.exit(main())
