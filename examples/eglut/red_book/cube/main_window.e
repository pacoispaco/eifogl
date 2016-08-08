note
    description: "Main window"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class MAIN_WINDOW

inherit
    EGLUT_TOP_LEVEL_WINDOW
        export
            {NONE} all
        redefine
            default_window_title,
            default_width,
            default_height,
            init,
            on_display,
            on_reshape,
            on_visibility
        end

    EGLU

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        do
            subscribe_to_visibility_events
            subscribe_to_reshape_events
            subscribe_to_display_events

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_flat)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: cube"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit)
            egl_color_3f (1.0, 1.0, 1.0)
            egl_load_identity
            -- Try switching between `eglu_look_at' and `egl_translate_f'!
            -- One moves the "eye" and the other moves the model!
--          eglu_look_at (0.0, 0.0, 5.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0)
            egl_translate_f (0.0, 0.0, -5.0)
            egl_scale_f (1.0, 2.0, 1.0)
            glut_wire_cube (1.0)
            egl_flush
        end

    on_reshape (width, height: INTEGER)
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            -- Try switching between `egl_frustum' and `eglu_perspective'!
            -- Experiment with different values in
            -- `eglu_perspective', especially for ?fovy' and
            -- `aspect'!
--          egl_frustum (-1.0, 1.0, -1.0, 1.0, 1.5, 20.0)
            eglu_perspective (60.0, 1.0, 1.5, 20.0)
            egl_matrix_mode (Gl_modelview)
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

end
