#!/usr/bin/env python
# -*- coding: utf-8 -*-
# Description: Script for generating Eiffel wrappers of C header files.
# Authors: Paul Cohen
# Copyright: Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt

import os.path
from optparse import OptionParser

def eiffel_class_name (efile, hfilename):
    """Eiffel class name for Eiffel file 'efile', or if that is None, for the
       given C header file 'hfilename'."""
    if efile:
        return efile.split (".e")[0].upper ()
    else:
        return hfilename.split (".h")[0].upper () + "_C_HEADER_FILE"

def eiffel_c_define (line, hfilename):
    """Eiffel wrapper of C define in 'line'."""
    items = line.split ()
    if len (items) == 3:
        symbol = items[1]
        value = items[2]
        result = """    %s: INTEGER
        external
            "C [macro <%s>]"
        alias
            "%s"
        end""" % (symbol.lower (), hfilename, symbol.upper ())
    else:
        result = ""
    return result

def generate_efile (hfile, efile, startline):
    """Generate the Eiffel file 'efile' from the C header file 'hfile'. Begin
       generating wrapper features after the line matching 'startline'."""
    f = open (hfile)
    lines = f.read().splitlines()
    f.close ()
    start = False
    hfilename = os.path.basename (hfile)
    result = 'note\n    description: "Automatically generated code. Don\'t edit."\n\nclass %s\n\nfeature\n\n' % (eiffel_class_name (efile, hfilename))
    i = 0
    for l in lines:
        if start:
            if l[0:7] == "#define":
                result += eiffel_c_define (l, hfilename) + "\n\n"
        else:
            start = i == startline
        i += 1
    if start:
        result += "end -- class %s" % (eiffel_class_name (efile, hfilename))
    if efile:
        f = open (efile, 'w')
        f.write (result)
        f.close ()
    else:
        print result

def main():
    """Main entry point of program."""
    parser = OptionParser (usage="usage: %prog [options] filename",
                           description="Generate an Eiffel wrapper class for the C header file 'filename'.",
                           version="%prog 0.1")
    parser.add_option ("-e", "--eiffel-file-name",
                       action="store",
                       type="string",
                       dest="efile",
                       default=None,
                       help="specify the name of the Eiffel file to generate. The file will be overwritten. If no file name is specified, output is written to stdout.")
    parser.add_option ("-l", "--first-line",
                       action="store",
                       type="string",
                       dest="startline",
                       default=0,
                       help="line in C header file where generation of Eiffel code begins",)
    (options, args) = parser.parse_args ()

    if len (args) != 1:
        parser.error ("A single C header file must be specified as argument")
    if not os.path.exists (args[0]):
        parser.error ("File '%s' does not exist" % (args[0]))
    if not os.path.isfile (args[0]):
        parser.error ("'%s' is not a file" % (args[0]))

    generate_efile (args[0], options.efile, options.startline)

if __name__ == '__main__':
    main()
