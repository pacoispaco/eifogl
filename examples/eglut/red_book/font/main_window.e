note
    description: "Main window"
    application: "font"
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

            egl_shade_model (Gl_flat)
            make_raster_font
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: font"
        end

    default_width: INTEGER = 300

    default_height: INTEGER = 150

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit)
            egl_color_3f (1.0, 1.0, 1.0)
            egl_raster_pos_2i (20, 60)
            print_string ("THE QUICK BROWN FOX JUMPS")
            egl_raster_pos_2i (20, 40)
            print_string ("OVER A LAZY DOG")
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

    letters: ARRAY [EGL_BITMAP]
            -- An array containg 25 bitmaps representing the letters
            -- 'A' ... 'Z'. Each bitmap is 8x13 (width x height) bits
        local
            bitmap: EGL_BITMAP
        once
            create Result.make (1, 26)
            create bitmap.make (<<0, 0, 195, 195, 195, 195, 255, 195, 195, 195, 102, 60, 24>>)
            Result.put (bitmap, 1) -- A
            create bitmap.make (<<0, 0, 254, 199, 195, 195, 199, 254, 199, 195 ,195, 199, 254>>)
            Result.put (bitmap, 2) -- B
            create bitmap.make (<<0, 0, 126, 231, 192, 192, 192, 192, 192, 192 ,192, 231, 126>>)
            Result.put (bitmap, 3) -- C
            create bitmap.make (<<0, 0, 252, 206, 199, 195, 195, 195, 195, 195 ,199, 206, 252>>)
            Result.put (bitmap, 4) -- D
            create bitmap.make (<<0, 0, 255, 192, 192, 192, 192, 252, 192, 192 ,192, 192, 255>>)
            Result.put (bitmap, 5) -- E
            create bitmap.make (<<0, 0, 192, 192, 192, 192, 192, 192, 252, 192 ,192, 192, 255>>)
            Result.put (bitmap, 6) -- F
            create bitmap.make (<<0, 0, 126, 126, 195, 195, 207, 192, 192, 192 ,192, 231, 126>>)
            Result.put (bitmap, 7) -- G
            create bitmap.make (<<0, 0, 195, 195, 195, 195, 195, 255, 195, 195 ,195, 195, 195>>)
            Result.put (bitmap, 8) -- H
            create bitmap.make (<<0, 0, 126, 24, 24, 24, 24, 24, 24, 24 ,24, 24, 126>>)
            Result.put (bitmap, 9) -- I
            create bitmap.make (<<0, 0, 124, 238, 198, 6, 6, 6, 6, 6 , 6, 6, 6>>)
            Result.put (bitmap, 10) -- J
            create bitmap.make (<<0, 0, 195, 198, 204, 216, 240, 224, 240, 216, 204, 198, 195>>)
            Result.put (bitmap, 11) -- K
            create bitmap.make (<<0, 0, 255, 192, 192, 192, 192, 192, 192, 192, 192, 192, 192>>)
            Result.put (bitmap, 12) -- L
            create bitmap.make (<<0, 0, 195, 195, 195, 195, 195, 195, 219, 255, 255, 231, 195>>)
            Result.put (bitmap, 13) -- M
            create bitmap.make (<<0, 0, 199, 199, 207, 207, 223, 219, 251, 243, 243, 227, 227>>)
            Result.put (bitmap, 14) -- N
            create bitmap.make (<<0, 0, 126, 231, 195, 195, 195, 195, 195, 195, 195, 231, 126>>)
            Result.put (bitmap, 15) -- O
            create bitmap.make (<<0, 0, 192, 192, 192, 192, 192, 254, 199, 195, 195, 199, 254>>)
            Result.put (bitmap, 16) -- P
            create bitmap.make (<<0, 0, 63, 110, 223, 219, 195, 195, 195, 195, 195, 102, 60>>)
            Result.put (bitmap, 17) -- Q
            create bitmap.make (<<0, 0, 195, 198, 204, 216, 240, 254, 199, 195, 195, 199, 254>>)
            Result.put (bitmap, 18) -- R
            create bitmap.make (<<0, 0, 126, 231, 3, 3, 7, 126, 224, 192, 192, 231, 126>>)
            Result.put (bitmap, 19) -- S
            create bitmap.make (<<0, 0, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 255>>)
            Result.put (bitmap, 20) -- T
            create bitmap.make (<<0, 0, 126, 231, 195, 195, 195, 195, 195, 195, 195, 195, 195>>)
            Result.put (bitmap, 21) -- U
            create bitmap.make (<<0, 0, 24, 60, 60, 102, 102, 195, 195, 195, 195, 195, 195>>)
            Result.put (bitmap, 22) -- V
            create bitmap.make (<<0, 0, 195, 231, 255, 255, 219, 219, 195, 195, 195, 195, 195>>)
            Result.put (bitmap, 23) -- W
            create bitmap.make (<<0, 0, 195, 102, 102, 60, 60, 24, 60, 60, 102, 102, 195>>)
            Result.put (bitmap, 24) -- X
            create bitmap.make (<<0, 0, 24, 24, 24, 24, 24, 24, 60, 60, 102, 102, 195>>)
            Result.put (bitmap, 25) -- Y
            create bitmap.make (<<0, 0, 255, 192, 192, 96, 48, 126, 12, 6, 3, 3, 255>>)
            Result.put (bitmap, 26) -- Z
        end

    space: EGL_BITMAP
            -- The space character
        once
            create Result.make (<<0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>>)
        end

    font_offset: INTEGER

    make_raster_font
        local
            i, j: INTEGER
        do
            egl_pixel_store_i (Gl_unpack_alignment, 1)

            font_offset := egl_gen_lists (128)
            from
                i := 1
                j := 65
            until
                i = 27
            loop
                egl_new_list (font_offset + j, Gl_compile)
                egl_bitmap (8, 13, 0.0, 2.0, 10.0, 0.0, letters @ i)
                egl_end_list
                i := i + 1
                j := j + 1
            end

            -- Space character
            egl_new_list (font_offset + 32, Gl_compile)
            egl_bitmap (8, 13, 0.0, 2.0, 10.0, 0.0, space)
            egl_end_list
        end

    print_string (s: STRING)
        require
            s_not_void: s /= Void
        do
            egl_push_attrib (Gl_list_bit)
            egl_list_base (font_offset)
            egl_call_lists (s.count, string_to_array_of_integer (s))
            egl_pop_attrib
        end

    string_to_array_of_integer (s: STRING): ARRAY [INTEGER]
        local
            i: INTEGER
        do
            create Result.make (1, s.count)
            from
                i := 1
            until
                i > s.count
            loop
                Result.put (s.item_code (i), i)
                i := i + 1
            end
        end

end
