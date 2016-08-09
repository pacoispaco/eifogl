note
    description: "Main window"
    application: "aaindex"
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

    ARRAY_OPERATIONS

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            i: INTEGER
            shade: REAL_64
        do
            subscribe_to_visibility_events
            subscribe_to_keyboard_events
            subscribe_to_reshape_events
            subscribe_to_display_events

            rot_angle := 0.0

            from
                i := 0
            until
                i = Rampsize
            loop
                shade := i / Rampsize
                glut_set_color (Ramp1start + i, 0.0, shade.truncated_to_real, 0.0)
                glut_set_color (Ramp2start + i, 0.0, 0.0, shade.truncated_to_real)
                i := i + 1
            end

            egl_enable (Gl_line_smooth)
            egl_hint (Gl_line_smooth_hint, Gl_dont_care)
            egl_line_width (1.5)

            egl_clear_index (Ramp1start)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: aaindex"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
        do
            egl_clear (Gl_color_buffer_bit)

            egl_index_i (Ramp1start)
            egl_push_matrix
            egl_rotate_f (-rot_angle, 0.0, 0.0, 0.1)
            egl_begin (Gl_lines)
            egl_vertex_2f (-0.5, 0.5)
            egl_vertex_2f (0.5, -0.5)
            egl_end
            egl_pop_matrix

            egl_index_i (Ramp2start)
            egl_push_matrix
            egl_rotate_f (rot_angle, 0.0, 0.0, 0.1)
            egl_begin (Gl_lines)
            egl_vertex_2f (0.5, 0.5)
            egl_vertex_2f (-0.5, -0.5)
            egl_end
            egl_pop_matrix

            egl_flush
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
            when 'r', 'R' then
                rot_angle := rot_angle + 20.0
                if rot_angle >= 360 then
                    rot_angle := 0
                end
                glut_post_redisplay
            when '%/27/' then -- Escape character
                quit (0)
            end
        end

    on_reshape (width, height: INTEGER)
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            if (width <= height) then
                eglu_ortho_2D (-1.0, 1.0, -1.0*height/width, 1.0*height/width)
            else
                eglu_ortho_2D (-1.0*width/height, 1.0*width/height, -1.0, 1.0)
            end
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    Rampsize: INTEGER = 16

    Ramp1start: INTEGER = 32

    Ramp2start: INTEGER = 48

    rot_angle: REAL

end
