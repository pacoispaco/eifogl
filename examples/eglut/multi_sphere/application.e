note
    description: "EGLUT test application"
    application: "multi_sphere"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

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
            create top_level_window_2.make
        end

feature -- Access

    main_window: MAIN_WINDOW
            -- The GLUT application's main window

    top_level_window_2: TOP_LEVEL_WINDOW_2
            -- A second top level window!

end
