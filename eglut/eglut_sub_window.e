note
    description: "An EGLUT sub window."
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2002, 2016 Paul Cohen, see file forum.txt"

class EGLUT_SUB_WINDOW

inherit
    EGLUT_WINDOW

create
    make

feature {NONE} -- Initialization

    make (parent_id, x, y, width, height: INTEGER)
            -- Create a GLUT sub window
        require
            parent_id_exists: windows.has (parent_id)
            position_valid: x >= 0 and y >= 0
            size_valid: width > 0 and height > 0
        do
            id := glut_create_sub_window (parent_id, x, y, width, height)
            windows.put (Current, id)
            subscribe_to_display_events
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            debug ("callback")
                print ("on_display_procedure")
                print ("%N")
            end
        end

feature -- Implementation (GLUT externals)

    glut_create_sub_window (win, x, y, width, height: INTEGER): INTEGER
        do
            Result := glut_api.glut_create_sub_window (win, x, y, width, height)
        end

end
