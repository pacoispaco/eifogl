indexing
	description: "Main window of the egl_primitives application"
        application: "single_sphere"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/30 22:50:49 $"
	revision: "$Revision: 1.1 $"

class MAIN_WINDOW

inherit
	EGLUT_TOP_LEVEL_WINDOW
		export
			{NONE} all
		redefine
			init,
			on_display,
			on_visibility
		end
	
creation
	make
	
feature {NONE} -- Initialization
	
	init is
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
	
	on_display is
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
			polygon_d: EGL_POLYGON [DOUBLE]
			f0, f1, f2: REAL
		do
			egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
			
			-- WORKS FINE:
--			!! points_d.make_2d
--			points_d.set_vertices (<<[0.2,0.2],[0.4,0.4],[0.6,0.6],[0.8,0.8],[1.0,1.0]>>)
--			points_d.draw
			
			-- WORKS FINE:
--			!! lines_i.make_2d
--			lines_i.set_vertices (<<[0,0],[1,1],[1,1],[1,2]>>)
--			lines_i.draw
			
			-- WORKS FINE:
--			!! lines_i.make_3d
--			lines_i.set_vertices (<<[0,0,0],[1,1,0],[1,1,0],[1,2,0]>>)
--			lines_i.draw
			
			-- WORKS FINE:
--			!! lines_i.make_3d_homogenoeus
--			lines_i.set_vertices (<<[0,0,0,1],[1,1,0,1],[1,1,0,1],[1,2,0,1]>>)
--			lines_i.draw
			
			-- DOES NOT WORK: 
			-- Integer expressions are always interpreted as being
			-- of type INTEGER. How should INTEGER_16 be handled? It
			-- does *not* work to declare INTEGER_16 entities and
			-- then assigning them values like s := 1!
--			!! lines_s.make_2d
--			lines_s.set_vertices (<<[0,0],[1,1],[1,1],[1,2]>>)
--			lines_s.draw
			
			-- DOES NOT WORK:
			-- Floating point expressions are always interpreted as
			-- being of type DOUBLE.
--			!! lines_f.make_2d
--			lines_f.set_vertices (<<[0.0,0.0],[1.0,1.0],[1.0,1.0],[1.0,1.5]>>)
--			lines_f.draw
			
			-- WORKS FINE:
--			!! lines_f.make_2d
--			f0 := 0
--			f1 := 1.0
--			f2 := 1.5
--			lines_f.add_vertex ([f0,f0])
--			lines_f.add_vertex ([f1,f1])
--			lines_f.add_vertex ([f1,f1])
--			lines_f.add_vertex ([f1,f2])
--			lines_f.draw
			
			-- WORKS FINE:
--			!! lines_f.make_3d
--			f0 := 0
--			f1 := 1.0
--			f2 := 1.5
--			lines_f.add_vertex ([f0,f0,f0])
--			lines_f.add_vertex ([f1,f1,f0])
--			lines_f.add_vertex ([f1,f1,f0])
--			lines_f.add_vertex ([f1,f2,f0])
--			lines_f.draw
			
			-- WORKS FINE:
--			!! lines_f.make_3d_homogenoeus
--			f0 := 0
--			f1 := 1.0
--			f2 := 1.5
--			lines_f.add_vertex ([f0,f0,f0,f1])
--			lines_f.add_vertex ([f1,f1,f0,f1])
--			lines_f.add_vertex ([f1,f1,f0,f1])
--			lines_f.add_vertex ([f1,f2,f0,f1])
--			lines_f.draw
			
			-- WORKS FINE:
--			!! lines_d.make_2d
--			lines_d.set_vertices (<<[0.0,0.0],[1.0,1.0],[1.0,1.0],[1.0,1.5]>>)
--			lines_d.draw
			
			-- WORKS FINE:
--			!! lines_d.make_3d
--			lines_d.set_vertices (<<[0.0,0.0,0.0],[1.0,1.0,0.0],[1.0,1.0,0.0],[1.0,1.5,0.0]>>)
--			lines_d.draw
			
			-- WORKS FINE:
--			!! lines_d.make_3d_homogenoeus
--			lines_d.set_vertices (<<[0.0,0.0,0.0,1.0],[1.0,1.0,0.0,1.0],[1.0,1.0,0.0,1.0],[1.0,1.5,0.0,1.0]>>)
--			lines_d.draw
			
			-- WORKS FINE:
--			!! line_strip_d.make_2d
--			line_strip_d.set_vertices (<<[0.1,0.2],[0.3,0.3],[0.4,0.5],[0.6,0.6],[0.7,0.8]>>)
--			line_strip_d.draw
			
			-- WORKS FINE:
--			!! line_loop_d.make_2d
--			line_loop_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0]>>)
--			line_loop_d.draw
			
			-- WORKS FINE:
--			!! triangles_d.make_2d
--			triangles_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0], [0.7,0.5]>>)
--			triangles_d.draw
			
			-- WORKS FINE:
--			!! triangle_strip_d.make_2d
--			triangle_strip_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0], [0.7,0.5]>>)
--			triangle_strip_d.draw
		
			-- WORKS FINE:
--			!! triangle_fan_d.make_2d
--			triangle_fan_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5]>>)
--			triangle_fan_d.draw
			
			-- WORKS FINE:
--			!! quads_d.make_2d
--			quads_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5],[1.0,1.2], [1.3,1.5]>>)
--			quads_d.draw
			
			-- WORKS FINE:
--			!! quad_strip_d.make_2d
--			quad_strip_d.set_vertices (<<[0.5,0.5],[0.8,0.5],[1.2,0.8],[0.8,1.2],[0.6,1.0],[0.7,0.5],[1.0,1.2], [1.3,1.5]>>)
--			quad_strip_d.draw
			
			-- WORKS FINE:
			!! polygon_d.make_2d
			polygon_d.set_vertices (<<[0.5,0.5],[1.5,0.5],[1.5,1.5],[0.5,1.5]>>)
			polygon_d.draw
			
			egl_flush
		end
		
	on_visibility (state: INTEGER) is
		do
			glut_post_redisplay
		end
	
feature {NONE} -- Implementation
	
	fly_pattern: EGL_POLYGON_STIPPLE_PATTERN is 
			-- Polygon stipple pattern
		once
			!! Result.make (<<00000000b, 00000000b, 00000000b, 00000000b,
					  00000000b, 00000000b, 00000000b, 00000000b,
					  00000011b, 10000000b, 00000001b, 11000000b,
					  00000110b, 11000000b, 00000011b, 01100000b,
					  00000100b, 01100000b, 00000110b, 00100000b,
					  00000100b, 00110000b, 00001100b, 00100000b,
					  00000100b, 00011000b, 00011000b, 00100000b,
					  00000100b, 00001100b, 00110000b, 00100000b,
					  00000100b, 00000110b, 01100000b, 00100000b,
					  01000100b, 00000011b, 11000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01000100b, 00000001b, 10000000b, 00100010b,
					  01100110b, 00000001b, 10000000b, 01100110b,
					  00110011b, 00000001b, 10000000b, 11001100b,
					  00011001b, 10000001b, 10000001b, 10011000b,
					  00001100b, 11000001b, 10000011b, 00110000b,
					  00000111b, 11100001b, 10000111b, 11100000b,
					  00000011b, 00111111b, 11111100b, 11000000b,
					  00000011b, 00110001b, 10001100b, 11000000b,
					  00000011b, 00110011b, 11001100b, 11000000b,
					  00000110b, 01100100b, 00100110b, 01100000b,
					  00001100b, 11001100b, 00110011b, 00110000b,
					  00011000b, 11001100b, 00110011b, 00011000b,
					  00010000b, 11000100b, 00100011b, 00001000b,
					  00010000b, 01100011b, 11000110b, 00001000b,
					  00010000b, 00110000b, 00001100b, 00001000b,
					  00010000b, 00011000b, 00011000b, 00001000b,
					  00010000b, 00000000b, 00000000b, 00001000b
					  >>)
		end	
	
end -- class MAIN_WINDOW

