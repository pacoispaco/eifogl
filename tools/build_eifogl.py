####################################################################
# Description:	Python script for building eifogl
# Version:      0.1.0
# Author:	Paul Cohen
# Date:		$Date: 2001/11/01 20:13:44 $
# Revision:	$Revision: 1.1 $
# History:
#     0.1.0:    First release.
####################################################################

import sys
import os
import socket
import ebuild

#### Main script ###################################################

program_name = sys.argv[0]
print "\n" + program_name + ": Python script for building eifogl. Version 0.1.0."
print "Building on machine: " + socket.gethostname() 

if len (sys.argv) != 2:
    print "Failure: you must specify a build instruction file."
else:
    try:
        print "Checking environment variables:"
        print "ISE_EIFFEL ...",
        env = os.environ ["ISE_EIFFEL"]
        print "found (" + env + ")."
        print "EIFOGL ...",
        env = os.environ ["EIFOGL"]
        print "found (" + env + ")."
        print "EIFFEL_COMPILER ...",
        env = os.environ ["EIFFEL_COMPILER"]
        print "found (" + env + ")."
        print "GL ...",
        env = os.environ ["GL"]
        print "found (" + env + ")."
        print "GLUT ...",
        env = os.environ ["GLUT"]
        print "found (" + env + ")."
        
        ebuild_file = sys.argv[1]
        ebuild.start_building (ebuild_file)
    except KeyError, e:
        print "not found. Build stopped."
####################################################################
