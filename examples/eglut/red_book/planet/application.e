note
    description: "EGLUT example application based on Example 3-6 in%
    %the OpenGL Programming Guide, 3rd edition."
    application: "planet"
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
            -- The initial display mode. Redefine this in
        do
            Result := glut_double + glut_rgb
        end

    main_window: MAIN_WINDOW
            -- The EGLUT application's main window

end
