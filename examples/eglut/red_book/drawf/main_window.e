note
    description: "Main window"
    application: "drawf"
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

            egl_pixel_store_i (Gl_unpack_alignment, 1)
            egl_clear_color (0.0, 0.0, 0.0, 0.0)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: drawf"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit)
            egl_color_3f (1.0, 1.0, 1.0)
            egl_raster_pos_2i (20, 20)
            egl_bitmap (10, 12, 0.0, 0.0, 11.0, 0.0, rasters)
            egl_bitmap (10, 12, 0.0, 0.0, 11.0, 0.0, rasters)
            egl_bitmap (10, 12, 0.0, 0.0, 11.0, 0.0, rasters)
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
            egl_ortho (0, width, 0, height, -1.0, 1.0)
            egl_matrix_mode (Gl_modelview)
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    rasters: EGL_BITMAP
        once
            create Result.make (<<192, 0, 192, 0, 192, 0, 192, 0, 192, 0,
                      255, 0, 255, 0, 192, 0, 192, 0, 192, 0,
                      255, 0, 255, 00>>)
        end

end
