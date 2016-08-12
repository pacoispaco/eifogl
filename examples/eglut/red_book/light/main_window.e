note
    description: "Main window"
    application: "light"
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
        local
            mat_specular: ARRAY [REAL]
            mat_shininess: ARRAY [REAL]
            light_position: ARRAY [REAL]
        do
            subscribe_to_visibility_events
            subscribe_to_reshape_events
            subscribe_to_display_events
            subscribe_to_keyboard_events

            mat_specular := <<1.0, 1.0, 1.0, 1.0>>
            mat_shininess := <<50.0>>
            light_position := <<1.0, 1.0, 1.0, 0.0>>

            egl_material_fv (Gl_front, Gl_specular, mat_specular);
            egl_material_fv (Gl_front, Gl_shininess, mat_shininess);
            egl_light_fv (Gl_light0, Gl_position, light_position);

            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)
            egl_enable (Gl_depth_test)

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_smooth)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: light"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
            glut_solid_sphere (1.0, 20, 16)
            egl_flush
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
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
                egl_ortho (-1.5, 1.5, -1.5*height/width, 1.5*height/width, -10.0, 10.0)
            else
                egl_ortho (-1.5*width/height, 1.5*width/height, -1.5, 1.5, -10.0, 10.0)
            end
            egl_matrix_mode(Gl_modelview)
            egl_load_identity
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

end
