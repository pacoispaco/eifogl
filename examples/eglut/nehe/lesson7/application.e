note
    description: "EGLUT example application translated from NeHe lesson7"
    application: "lesson7"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

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
            Result := glut_double + glut_rgb + glut_depth
        end

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
