note
    description: "Red book example application: aapoly"
    application: "aapoly"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class
    APPLICATION

inherit

    EGLUT_APPLICATION
        redefine
            initial_displaymode,
            main_window
        end

create

    make

feature -- Initialization

    init_gl
        do
        end

    init_application
        do
        end

feature -- Access

    initial_displaymode: INTEGER
            -- The initial display mode.
        do
            Result := Glut_single + Glut_rgb + Glut_alpha + Glut_depth
        end

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
