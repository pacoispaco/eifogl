note
    description: "A simple EGLUT example application"
    application: "single_sphere"
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
        end

feature -- Access

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
