note
    description: "General notion of a GLUT window"
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2002, 2016 Paul Cohen, see file forum.txt"

deferred class EGLUT_WINDOW

inherit

    EGLUT_APPLICATION_CONTEXT

feature -- Access

    id: INTEGER
            -- GLUT application unique window id

    subscribes_to_display_events: BOOLEAN
            -- Subscribes to display events?

    subscribes_to_reshape_events: BOOLEAN
            -- Subscribes to reshape events?

    subscribes_to_keyboard_events: BOOLEAN
            -- Subscribes to keyboard events?

    subscribes_to_motion_events: BOOLEAN
            -- Subscribes to motion events?

    subscribes_to_passive_motion_events: BOOLEAN
            -- Subscribes to passive motion events?

    subscribes_to_mouse_events: BOOLEAN
            -- Subscribes to mouse events?

    subscribes_to_visibility_events: BOOLEAN
            -- Subscribes to visibility events?

    subscribes_to_entry_events: BOOLEAN
            -- Subscribes to entry events?

    subscribes_to_special_events: BOOLEAN
            -- Subscribes to special events?

    subscribes_to_idle_events: BOOLEAN
            -- Subscribes to idle events?

feature -- Access (Metrics)

    default_x: INTEGER
            -- Default x position
        once
            Result := 100
        end

    default_y: INTEGER
            -- Default y position
        once
            Result := 100
        end

    default_width: INTEGER
            -- Default width
        once
            Result := 400
        end

    default_height: INTEGER
            -- Default height
        once
            Result := 400
        end

feature -- Status setting (Callbacks)

    subscribe_to_display_events
            -- Subscribe to display events
        do
            subscribes_to_display_events := True
            glut_set_window (id)
            glut_api.eglut_set_display_func
        ensure
            subscribes_to_display_events: subscribes_to_display_events
        end

    subscribe_to_reshape_events
            -- Subscribe to reshape events
        do
            subscribes_to_reshape_events := True
            glut_set_window (id)
            glut_api.eglut_set_reshape_func
        ensure
            subscribes_to_reshape_events: subscribes_to_reshape_events
        end

    subscribe_to_keyboard_events
            -- Subscribe to keyboard events
        do
            subscribes_to_keyboard_events := True
            glut_set_window (id)
            glut_api.eglut_set_keyboard_func
        ensure
            subscribes_to_keyboard_events: subscribes_to_keyboard_events
        end

    subscribe_to_motion_events
            -- Subscribe to motion events
        do
            subscribes_to_motion_events := True
            glut_set_window (id)
            glut_api.eglut_set_motion_func
        ensure
            subscribes_to_motion_events: subscribes_to_motion_events
        end

    subscribe_to_passive_motion_events
            -- Subscribe to passive_motion events
        do
            subscribes_to_passive_motion_events := True
            glut_set_window (id)
            glut_api.eglut_set_passive_motion_func
        ensure
            subscribes_to_passive_motion_events: subscribes_to_passive_motion_events
        end

    subscribe_to_mouse_events
            -- Subscribe to mouse events
        do
            subscribes_to_mouse_events := True
            glut_set_window (id)
            glut_api.eglut_set_mouse_func
        ensure
            subscribes_to_mouse_events: subscribes_to_mouse_events
        end

    subscribe_to_visibility_events
            -- Subscribe to visibility events
        do
            subscribes_to_visibility_events := True
            glut_set_window (id)
            glut_api.eglut_set_visibility_func
        ensure
            subscribes_to_visibility_events: subscribes_to_visibility_events
        end

    subscribe_to_entry_events
            -- Subscribe to entry events
        do
            subscribes_to_entry_events := True
            glut_set_window (id)
            glut_api.eglut_set_entry_func
        ensure
            subscribes_to_entry_events: subscribes_to_entry_events
        end

    subscribe_to_special_events
            -- Subscribe to special events
        do
            subscribes_to_special_events := True
            glut_set_window (id)
            glut_api.eglut_set_special_func
        ensure
            subscribes_to_special_events: subscribes_to_special_events
        end

    subscribe_to_idle_events
            -- Subscribe to idle events
        do
            subscribes_to_idle_events := True
            glut_set_window (id)
            glut_api.eglut_set_idle_func
        ensure
            subscribes_to_idle_events: subscribes_to_idle_events
        end

    unsubscribe_to_reshape_events
            -- Unsubscribe to reshape events
        do
            subscribes_to_reshape_events := False
            glut_set_window (id)
            glut_api.eglut_set_reshape_func_to_null
        ensure
            does_not_subscribe_to_reshape_events: not subscribes_to_reshape_events
        end

    unsubscribe_to_keyboard_events
            -- Unsubscribe to keyboard events
        do
            subscribes_to_keyboard_events := False
            glut_set_window (id)
            glut_api.eglut_set_keyboard_func_to_null
        ensure
            does_not_subscribe_to_keyboard_events: not subscribes_to_keyboard_events
        end

    unsubscribe_to_motion_events
            -- Unsubscribe to motion events
        do
            subscribes_to_motion_events := False
            glut_set_window (id)
            glut_api.eglut_set_motion_func_to_null
        ensure
            does_not_subscribes_to_motion_events: not subscribes_to_motion_events
        end

    unsubscribe_to_passive_motion_events
            -- Unsubscribe to passive_motion events
        do
            subscribes_to_passive_motion_events := False
            glut_set_window (id)
            glut_api.eglut_set_passive_motion_func_to_null
        ensure
            does_not_subscribe_to_passive_motion_events: not subscribes_to_passive_motion_events
        end

    unsubscribe_to_mouse_events
            -- Unsubscribe to mouse events
        do
            subscribes_to_mouse_events := False
            glut_set_window (id)
            glut_api.eglut_set_mouse_func
        ensure
            does_not_subscribe_to_mouse_events: not subscribes_to_mouse_events
        end

    unsubscribe_to_visibility_events
            -- Unsubscribe to visibility events
        do
            subscribes_to_visibility_events := False
            glut_set_window (id)
            glut_api.eglut_set_visibility_func_to_null
        ensure
            does_not_subscribe_to_visibility_events: not subscribes_to_visibility_events
        end

    unsubscribe_to_entry_events
            -- Unsubscribe to entry events
        do
            subscribes_to_entry_events := False
            glut_set_window (id)
            glut_api.eglut_set_entry_func_to_null
        ensure
            does_not_subscribe_to_entry_events: not subscribes_to_entry_events
        end

    unsubscribe_to_special_events
            -- Unsubscribe to special events
        do
            subscribes_to_special_events := False
            glut_set_window (id)
            glut_api.eglut_set_special_func_to_null
        ensure
            does_not_subscribe_to_special_events: not subscribes_to_special_events
        end

    unsubscribe_to_idle_events
            -- Unsubscribe to idle events
        do
            subscribes_to_idle_events := False
            glut_set_window (id)
            glut_api.eglut_set_idle_func_to_null
        ensure
            does_not_subscribe_to_idle_events: not subscribes_to_idle_events
        end

feature {EGLUT_APPLICATION} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        require
            subscribes_to_this_event: subscribes_to_display_events
        deferred
        end

    on_reshape (width, height: INTEGER)
            -- The window has been reshaped
        do
            debug ("callback")
                print ("on_reshape_procedure")
                print ("%N")
                print ("  width: ")
                print (width)
                print (", height: ")
                print (height)
                print ("%N")
            end
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
            -- A keboard event has been recieved
        do
            debug ("callback")
                print ("on_keyboard_procedure")
                print ("%N")
                print ("  char: ")
                print (char)
                print (", x: ")
                print (x)
                print (", y:")
                print (y)
                print ("%N")
                if modifier = glut_active_shift then
                    print (" Modifier: Shift pressed")
                    print ("%N")
                end
                if modifier = glut_active_ctrl then
                    print (" Modifier: Ctrl pressed")
                    print ("%N")
                end
                if modifier = glut_active_alt then
                    print (" Modifier: Alt pressed")
                    print ("%N")
                end
            end
        end

    on_mouse (button, state, x, y: INTEGER)
            -- A mouse event has been recieved
        do
            debug ("callback")
                print ("on_mouse_procedure")
                print ("%N")
                print ("  button: ")
                print (button)
                print (", state: ")
                print ("%N")
                print ("  x: ")
                print (x)
                print (", y: ")
                print (y)
                print (state)
                print ("%N")
            end
        end

    on_motion (x, y: INTEGER)
            -- The mouse has moved within the window while at least
            -- one of the mouse buttons was pressed
        do
            debug ("callback")
                print ("on_motion_procedure")
                print ("%N")
                print (", x: ")
                print (x)
                print (", y:")
                print (y)
                print ("%N")
            end
        end

    on_passive_motion (x, y: INTEGER)
            -- The mouse has moved within the window while none of
            -- the mouse buttons were pressed
        do
            debug ("callback")
                print ("on_passive_motion_procedure")
                print ("%N")
                print (", x: ")
                print (x)
                print (", y:")
                print (y)
                print ("%N")
            end
        end

    on_visibility (state: INTEGER)
            -- The visibility of the window has changed
        do
            debug ("callback")
                print ("on_visibility_procedure")
                print ("%N")
                print (", state: ")
                print (state)
                print ("%N")
            end
        end

    on_entry (state: INTEGER)
            -- The mouse pointer has entered or left the
            -- window according to the value of `state'
        do
            debug ("callback")
                print ("on_entry_procedure")
                print ("%N")
                print (", state: ")
                print (state)
                print ("%N")
            end
        end

    on_special (key, modifier, x, y: INTEGER)
            -- A keyboard function or directional key has been pressed
        do
            debug ("callback")
                print ("on_special_procedure")
                print ("%N")
                print (", key: ")
                print (key)
                print (", x: ")
                print (x)
                print (", y:")
                print (y)
                print ("%N")
                if modifier = glut_active_shift then
                    print (" Modifier: Shift pressed")
                    print ("%N")
                end
                if modifier = glut_active_ctrl then
                    print (" Modifier: Ctrl pressed")
                    print ("%N")
                end
                if modifier = glut_active_alt then
                    print (" Modifier: Alt pressed")
                    print ("%N")
                end
            end
        end

    on_idle
            -- An idle event has occured. Strictly speaking there
            -- is no such thing as an idle event, instead on_idle
            -- is simply called continuously when real events are
            -- not being recieved
        do
        end

feature {NONE} -- Implementation (GLUT)

    glut_set_window (i: INTEGER)
            -- Set the current window.
        require
            i_valid: i > 0
        do
            glut_api.glut_set_window (i)
        end

    glut_position_window (x, y: INTEGER)
            -- Change the position of the current window.
        do
            glut_api.glut_position_window (x, y)
        end

    glut_reshape_window (width, height: INTEGER)
            -- Reshape the current window.
        do
            glut_api.glut_reshape_window (width, height)
        end

    glut_post_redisplay
            -- Mark the current window as needing to redisplay.
        do
            glut_api.glut_post_redisplay
        end

invariant
    exists_in_the_applications_set_of_windows: windows.has_item (Current)
    has_a_valid_id: id > 0
    subscribes_to_display_events: subscribes_to_display_events

end
