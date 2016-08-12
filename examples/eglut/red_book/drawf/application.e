note
    description: "EGLUT example application based on the drawf example in%
    %the OpenGL Programming Guide, 3rd edition."
    application: "light"
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
            Result := glut_single + glut_rgb
        end

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
