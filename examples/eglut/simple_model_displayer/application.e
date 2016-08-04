note
    description: "EGLUT example application that reads in 3d models%
    %from a text file"
    application: "3d_model_displayer"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

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
