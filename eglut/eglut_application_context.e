note
    description: "The context of an EGLUT application. Keeps a hash%
                      %table of all EGLUT window objects in the EGLUT%
                      %application hashed by GLUT window id."
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGLUT_APPLICATION_CONTEXT

inherit
    EGLUT

    EGLUT_CONSTANTS

feature -- Access

    frozen current_window: EGLUT_WINDOW
            -- Current EGLUT window
        do
            Result := windows @ glut_get_window
        end

    frozen windows: DS_HASH_TABLE [EGLUT_WINDOW, INTEGER]
            -- Hash table containing all the applications EGLUT
            -- windows hashed by the unique GLUT window id:s.
        once
            create Result.make (10)
        end

feature {NONE} -- Implementation

    glut_get_window: INTEGER
            -- Unique identifier of the current GLUT window
        do
            Result := glut_api.glut_get_window
        end

end
