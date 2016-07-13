note
    description: "Main window"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2016 Paul Cohen, see file forum.txt"

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
            on_display
        end

    EGLU

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        do
            egl_clear_color (0.0, 0.0, 0.0, 0.0)

            subscribe_to_display_events

            egl_matrix_mode (Gl_projection)
            egl_load_identity ()
            egl_ortho (0.0, 1.0, 0.0, 1.0, -1.0, 1.0)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: Hello"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit)
            egl_color_3f (1.0, 1.0, 1.0)
            egl_begin (Gl_polygon)
            egl_vertex_3f (0.25, 0.25, 0.0)
            egl_vertex_3f (0.75, 0.25, 0.0)
            egl_vertex_3f (0.75, 0.75, 0.0)
            egl_vertex_3f (0.25, 0.75, 0.0)
            egl_end ()
            egl_flush
        end

end
