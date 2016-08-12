note
    description: "The Red Book (GLUT-based) torus example program"
    application: "torus"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2000, 2016 Paul Cohen, see file forum.txt"

class
    APPLICATION

inherit

    EGLUT_APPLICATION
        redefine
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

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
