note
    description: "Main window"
    application: "bezcurve"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

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
            on_keyboard,
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
            subscribe_to_keyboard_events

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_flat)
            egl_map_1f (Gl_map1_vertex_3, 0.0, 1.0, control_points)
            egl_enable (Gl_map1_vertex_3)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: bezcurve"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        local
            i: INTEGER
        do
            egl_clear (Gl_color_buffer_bit)
            egl_color_3f (1.0, 1.0, 1.0)
            egl_begin (Gl_line_strip)
            from
                i := 0
            until
                i > 30
            loop
                egl_eval_coord_1f ((i/30.0).truncated_to_real)
                i := i +1
            end
            egl_end

            -- The following code displays the control points as dots.
            egl_point_size (5.0)
            egl_color_3f (1.0, 1.0, 0.0)
            egl_begin (Gl_points)
            from
                i := 1
            until
                i = 5
            loop
                egl_vertex_3fv (control_points @ i)
                i := i + 1
            end
            egl_end
            egl_flush
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
            when '%/27/' then -- Escape character
                quit (0)
            else
            end
        end

    on_reshape (width, height: INTEGER)
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            if (width <= height) then
                egl_ortho (-5.0, 5.0, -5.0 * height/width, 5.0 * width/height, -5.0, 5.0)
            else
                egl_ortho (-5.0 * width/height, 5.0 * width/height, -5.0, 5.0, -5.0, 5.0)
            end
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    control_points: ARRAY [ARRAY [REAL]]
        once
            Result := << <<-4.0, -4.0, 0.0>>,
                       <<-2.0, 4.0, 0.0>>,
                       <<2.0, -4.0, 0.0>>,
                       <<4.0, 4.0, 0.0>> >>
        end

end
