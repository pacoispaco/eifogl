note
    description: "EGLUT example application"
    application: "dragnet2k"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class
    APPLICATION

inherit

    EGLUT_APPLICATION
        redefine
            main_window,
            initial_displaymode
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

    main_window: MAIN_WINDOW
            -- The GLUT application's main window

    initial_displaymode: INTEGER
            -- The initial display mode. Redefine this in
        do
            Result := Glut_double + Glut_rgb + Glut_depth
        end

end
