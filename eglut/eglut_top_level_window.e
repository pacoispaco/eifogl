note
    description: "An EGLUT top level window. All EGLUT applications%
                     %must have one class that inherits from this class%
                     %and that class must be the `main_window' of the%
                     %applications EGLUT_APPLICATION class."
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2002, 2016 Paul Cohen, see file forum.txt"

class EGLUT_TOP_LEVEL_WINDOW

inherit
    EGLUT_WINDOW

create
    make

feature {NONE} -- Initialization

    make
            -- Create a GLUT top level window
        do
            id := eglut_create_window (default_window_title)
            glut_position_window (default_x, default_y)
            glut_reshape_window (default_width, default_height)
            windows.put (Current, id)
            subscribe_to_display_events
            init
        end

    init
            -- Initialize the window
        do
        end

feature -- Access

    default_window_title: STRING
            -- Default window title
        once
            Result := "EGLUT top level window"
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            debug ("callback")
                print ("on_display not redefined!")
                print ("%N")
            end
        end

feature {NONE} -- Implementation (GLUT externals)

    eglut_create_window (title: STRING):INTEGER
            -- Create a top level window with the given `title'.
        require
            title_not_void: title /= Void
        do
            Result := glut_api.eglut_create_window (title)
        end

    glut_full_screen
        do
            glut_api.glut_full_screen
        end

end

