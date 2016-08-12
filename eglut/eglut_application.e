note
    description: "An EGLUT application. There is only one instance%
                 %of this class in any EGLUT application. All EGLUT%
                 %applications must have one class that inherits%
                 %from this class. NOTE: This class must be set as%
                 %visible in the .ecf file in order for the C callbacks%
                 % to work!"
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2002, 2016 Paul Cohen, see file forum.txt"

deferred class
    EGLUT_APPLICATION

inherit
    EGLUT_APPLICATION_CONTEXT

feature {NONE} -- Initialization

    make
            -- Create an EGLUT application, initialize the GLUT API
            -- and set up the GLUT event loop.
        do
            eglut_init
            glut_init_displaymode (initial_displaymode)
            glut_init_window_size (initial_width, initial_height)
            glut_init_window_position (initial_x, initial_y)

            -- Initialize OpenGL
            init_gl

            -- Create the main window
            create main_window.make

            -- Initialize the application
            init_application

            -- Start the GLUT main event loop
            glut_main_loop
        end

    init_gl
            -- Initialize the gl state machine for the
            -- application.
        deferred
        end

    init_application
            -- Initialize the application
        deferred
        end

feature -- Access

    main_window: EGLUT_TOP_LEVEL_WINDOW
            -- The applications main window

    initial_window_title: STRING
            -- The initial title of all EGLUT windows
        do
            Result := "EGLUT application"
        end

    initial_displaymode: INTEGER
            -- The initial display mode. Redefine this in
        do
            Result := Glut_single + Glut_rgb + Glut_depth
        end

    initial_width: INTEGER
            -- The initial width of all created EGLUT windows
        do
            Result := 500
        end

    initial_height: INTEGER
            -- The initial height of all created EGLUT windows
        do
            Result := 500
        end

    initial_x: INTEGER
            -- The initial x position of all created EGLUT windows
        do
            Result := 100
        end

    initial_y: INTEGER
            -- The initial y position of all created EGLUT windows
        do
            Result := 100
        end

feature -- Implementation (Callbacks)

    frozen main_application_callback (event, i1, i2, i3, i4: INTEGER; c: CHARACTER)
            -- The main application callback feature. `event'
            -- denotes the type of event that has occured. `i1',
            -- `i2', `i3', `i4' and `c' are event parameters that
            -- are interpreted according to the specific
            -- `event'. This feature is only meant to be invoked
            -- from the EGLUT C interface when a callback
            -- recieved!
        local
            i: INTEGER
        do
            inspect event
            when Display_event then
                current_window.on_display
            when Reshape_event then
                -- i1 = width, i2 = height
                current_window.on_reshape (i1, i2)
            when Keyboard_event then
                -- Get current modifiers
                -- (Shift, Ctrl and/or Alt)
                i := glut_get_modifiers
                -- i1 = x, i2 = y, c = char
                current_window.on_keyboard (c, i, i1, i2)
            when Mouse_event then
                -- i1 = mouse, i2 = state, i3 = x, i4 = y
                current_window.on_mouse (i1, i2, i3, i4)
            when Motion_event then
                -- i1 = x, i2 = y
                current_window.on_motion (i1, i2)
            when Passive_motion_event then
                -- i1 = x, i2 = y
                current_window.on_passive_motion (i1, i2)
            when Visibility_event then
                -- i1 = state
                current_window.on_visibility (i1)
            when Entry_event then
                -- i1 = state
                current_window.on_entry (i1)
            when Special_event then
                -- Get current modifiers
                -- (Shift, Ctrl and/or Alt)
                i := glut_get_modifiers
                -- i1 = key, i2 = x, i3 = y
                current_window.on_special (i1, i, i2, i3)
            when
                Idle_event then
                current_window.on_idle
            end
        end

feature -- Implementation (Callback event constants)

    -- NOTA BENE! These Eiffel constants MUST be correspond exactly to
    -- those in the C #define:s in the eglut.h file! The reason that these
    -- constants are not accessed, via external, from the eglut.h file
    -- that it is then able to write an "inspect" clause in the
    -- `main_application_callback' feature, which looks better and is faster
    -- than a big "if" clause.

    frozen Display_event: INTEGER = 1

    frozen Reshape_event: INTEGER = 2

    frozen Keyboard_event: INTEGER = 3

    frozen Mouse_event: INTEGER = 4

    frozen Motion_event: INTEGER = 5

    frozen Passive_motion_event: INTEGER = 6

    frozen Visibility_event: INTEGER = 7

    frozen Entry_event: INTEGER = 8

    frozen Special_event: INTEGER = 9

    frozen Idle_event: INTEGER = 10

feature -- Implementation

    glut_get_modifiers: INTEGER
            -- The modifier key state when certain callbacks were
            -- generated
        do
            Result := glut_api.glut_get_modifiers
        end

    glut_init_window_size (width, height: INTEGER)
            -- Set the initial window size to `width' and `height'.
        require
            valid_size: width > 0 and height > 0
        do
            glut_api.glut_init_window_size (width, height)
        end

    glut_init_window_position (x, y: INTEGER)
            -- Set the initial window position to `x' and `y'.
        require
            valid_position: x > 0 and y > 0
        do
            glut_api.glut_init_window_position (x, y)
        end

    glut_main_loop
            -- Start the GLUT main event loop.
        do
            glut_api.glut_main_loop
        end

feature {NONE} -- Implementation (EGLUT C interface)

    eglut_init
            -- Initialize the GLUT library.
        do
            glut_api.eglut_init (Current)
        end

end
