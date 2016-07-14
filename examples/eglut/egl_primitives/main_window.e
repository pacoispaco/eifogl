note
    description: "Main window of the egl_primitives application"
    application: "single_sphere"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class MAIN_WINDOW

inherit
    EGLUT_TOP_LEVEL_WINDOW
        redefine
            init,
            on_display,
            on_visibility
        end

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        do
            subscribe_to_visibility_events

            glut_init_displaymode (Glut_single + Glut_rgb)

            egl_ortho (0.0, 2.0, 0.0, 2.0, -1.0, 1.0)
            egl_clear_color (0.0, 0.0, 0.0, 0.0)

            egl_enable (Gl_polygon_stipple)

            egl_polygon_stipple (fly_pattern)
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        local
            points_d: EGL_POINTS [DOUBLE]
            lines_i: EGL_LINES [INTEGER]
            lines_s: EGL_LINES [INTEGER_16]
            lines_f: EGL_LINES [REAL]
            lines_d: EGL_LINES [DOUBLE]
            line_strip_d: EGL_LINE_STRIP [DOUBLE]
            line_loop_d: EGL_LINE_LOOP [DOUBLE]
            triangles_d: EGL_TRIANGLES [DOUBLE]
            triangle_strip_d: EGL_TRIANGLE_STRIP [DOUBLE]
            triangle_fan_d: EGL_TRIANGLE_FAN [DOUBLE]
            quads_d: EGL_QUADS [DOUBLE]
            quad_strip_d: EGL_QUAD_STRIP [DOUBLE]
            polygon_s: EGL_POLYGON [INTEGER_16]
            polygon_i: EGL_POLYGON [INTEGER]
            polygon_f: EGL_POLYGON [REAL]
            polygon_d: EGL_POLYGON [DOUBLE]
            f0, f1, f2: REAL
        do
            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)

            -- WORKS FINE:
--          create points_d.make_2d
--          points_d.set_vertices (<<[0.2,0.2],[0.4,0.4],[0.6,0.6],[0.8,0.8],[1.0,1.0]>>)
--          points_d.draw

            -- WORKS FINE:
--          create lines_i.make_2d
--          lines_i.set_vertices (<<[0,0],[1,1],[1,1],[1,2]>>)
--          lines_i.draw

            -- WORKS FINE:
--          create lines_i.make_3d
--          lines_i.set_vertices (<<[0,0,0],[1,1,0],[1,1,0],[1,2,0]>>)
--          lines_i.draw

            -- WORKS FINE:
--          create lines_i.make_3d_homogenoeus
--          lines_i.set_vertices (<<[0,0,0,1],[1,1,0,1],[1,1,0,1],[1,2,0,1]>>)
--          lines_i.draw

            -- DOES NOT WORK:
            -- Integer expressions are always interpreted as being
            -- of type INTEGER. How should INTEGER_16 be handled? It
            -- does *not* work to declare INTEGER_16 entities and
            -- then assigning them values like s := 1!
--          create lines_s.make_2d
--          lines_s.set_vertices (<<[0,0],[1,1],[1,1],[1,2]>>)
--          lines_s.draw

            -- DOES NOT WORK:
            -- Floating point expressions are always interpreted as
            -- being of type DOUBLE.
--          create lines_f.make_2d
--          lines_f.set_vertices (<<[0.0,0.0],[1.0,1.0],[1.0,1.0],[1.0,1.5]>>)
--          lines_f.draw

            -- WORKS FINE:
--          create lines_f.make_2d
--          f0 := 0
--          f1 := 1.0
--          f2 := 1.5
--          lines_f.add_vertex ([f0,f0])
--          lines_f.add_vertex ([f1,f1])
--          lines_f.add_vertex ([f1,f1])
--          lines_f.add_vertex ([f1,f2])
--          lines_f.draw

            -- WORKS FINE:
--          create lines_f.make_3d
--          f0 := 0
--          f1 := 1.0
--          f2 := 1.5
--          lines_f.add_vertex ([f0,f0,f0])
--          lines_f.add_vertex ([f1,f1,f0])
--          lines_f.add_vertex ([f1,f1,f0])
--          lines_f.add_vertex ([f1,f2,f0])
--          lines_f.draw

            -- WORKS FINE:
--          create lines_f.make_3d_homogenoeus
--          f0 := 0
--          f1 := 1.0
--          f2 := 1.5
--          lines_f.add_vertex ([f0,f0,f0,f1])
--          lines_f.add_vertex ([f1,f1,f0,f1])
--          lines_f.add_vertex ([f1,f1,f0,f1])
--          lines_f.add_vertex ([f1,f2,f0,f1])
--          lines_f.draw

            -- WORKS FINE:
--          create lines_d.make_2d
--          lines_d.set_vertices (<<[0.0,0.0],[1.0,1.0],[1.0,1.0],[1.0,1.5]>>)
--          lines_d.draw

            -- WORKS FINE:
--          create lines_d.make_3d
--          lines_d.set_vertices (<<[0.0,0.0,0.0],[1.0,1.0,0.0],[1.0,1.0,0.0],[1.0,1.5,0.0]>>)
--          lines_d.draw

            -- WORKS FINE:
--          create lines_d.make_3d_homogenoeus
--          lines_d.set_vertices (<<[0.0,0.0,0.0,1.0],[1.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[1.0,1.5,0.0,1.0]>>)
--          lines_d.draw

            -- WORKS FINE:
--          create line_strip_d.make_2d
--          line_strip_d.set_vertices (<<[0.1,0.2],[0.3,0.3],[0.4,0.5],[0.6,0.6],[0.7,0.8]>>)
--          line_strip_d.draw

            -- WORKS FINE:
--          create line_loop_d.make_2d
--          line_loop_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0]>>)
--          line_loop_d.draw

            -- WORKS FINE:
--          create triangles_d.make_2d
--          triangles_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0], [0.7,0.5]>>)
--          triangles_d.draw

            -- WORKS FINE:
--          create triangle_strip_d.make_2d
--          triangle_strip_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0], [0.7,0.5]>>)
--          triangle_strip_d.draw

            -- WORKS FINE:
--          create triangle_fan_d.make_2d
--          triangle_fan_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5]>>)
--          triangle_fan_d.draw

            -- WORKS FINE:
--          create quads_d.make_2d
--          quads_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5],[1.0,1.2], [1.3,1.5]>>)
--          quads_d.draw

            -- WORKS FINE:
--          create quad_strip_d.make_2d
--          quad_strip_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5],[1.0,1.2], [1.3,1.5]>>)
--          quad_strip_d.draw

            -- WORKS FINE:
            create polygon_s.make_2d
            polygon_s.set_vertices (<<[{INTEGER_16} 1, {INTEGER_16} 1],[{INTEGER_16} 2, {INTEGER_16} 1],[{INTEGER_16} 2, {INTEGER_16} 2],[{INTEGER_16} 1, {INTEGER_16} 2]>>)
            polygon_s.draw

            create polygon_i.make_2d
            polygon_i.set_vertices (<<[0, 0],[1, 0],[1, 1],[0, 1]>>)
            polygon_i.draw

            create polygon_f.make_2d
            polygon_f.set_vertices (<<[{REAL} 0.5, {REAL} 0.5],[{REAL} 1.5, {REAL} 0.5],[{REAL} 1.5, {REAL} 1.5],[{REAL} 0.5, {REAL} 1.5]>>)
            polygon_f.draw

            create polygon_d.make_2d
            polygon_d.set_vertices (<<[0.5,0.5],[1.5,0.5],[1.5,1.5],[0.5,1.5]>>)
            polygon_d.draw

            egl_flush
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    fly_pattern: EGL_POLYGON_STIPPLE_PATTERN
            -- Polygon stipple pattern
        once
             create Result.make (<<0b00000000, 0b00000000, 0b00000000, 0b00000000,
                                   0b00000000, 0b00000000, 0b00000000, 0b00000000,
                                   0b00000011, 0b10000000, 0b00000001, 0b11000000,
                                   0b00000110, 0b11000000, 0b00000011, 0b01100000,
                                   0b00000100, 0b01100000, 0b00000110, 0b00100000,
                                   0b00000100, 0b00110000, 0b00001100, 0b00100000,
                                   0b00000100, 0b00011000, 0b00011000, 0b00100000,
                                   0b00000100, 0b00001100, 0b00110000, 0b00100000,
                                   0b00000100, 0b00000110, 0b01100000, 0b00100000,
                                   0b01000100, 0b00000011, 0b11000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01000100, 0b00000001, 0b10000000, 0b00100010,
                                   0b01100110, 0b00000001, 0b10000000, 0b01100110,
                                   0b00110011, 0b00000001, 0b10000000, 0b11001100,
                                   0b00011001, 0b10000001, 0b10000001, 0b10011000,
                                   0b00001100, 0b11000001, 0b10000011, 0b00110000,
                                   0b00000111, 0b11100001, 0b10000111, 0b11100000,
                                   0b00000011, 0b00111111, 0b11111100, 0b11000000,
                                   0b00000011, 0b00110001, 0b10001100, 0b11000000,
                                   0b00000011, 0b00110011, 0b11001100, 0b11000000,
                                   0b00000110, 0b01100100, 0b00100110, 0b01100000,
                                   0b00001100, 0b11001100, 0b00110011, 0b00110000,
                                   0b00011000, 0b11001100, 0b00110011, 0b00011000,
                                   0b00010000, 0b11000100, 0b00100011, 0b00001000,
                                   0b00010000, 0b01100011, 0b11000110, 0b00001000,
                                   0b00010000, 0b00110000, 0b00001100, 0b00001000,
                                   0b00010000, 0b00011000, 0b00011000, 0b00001000,
                                   0b00010000, 0b00000000, 0b00000000, 0b00001000>>)
        end

end
