indexing
	description: "An OpenGL AUX window with minimal functionality"
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

class AUX_WINDOW_MINIMAL

creation
	make
	
feature {NONE} -- Initialization
	
	make is
		do
			aux_init_display_mode (Aux_single + Aux_rgba)
			aux_init_position (100, 100, 250, 250)
			aux_init_window ("AUX minimal window")
			
			gl_clear_color (0.0, 0.0, 1.0, 1.0)
			gl_clear (Gl_color_buffer_bit)
			
			gl_flush
			
			print ("Press any key to exit!")
			io.readline
		end
	
feature {NONE} -- Implementation	
	
	aux_init_display_mode (mask: INTEGER) is
			-- Initializes the display mode of the AUX library
			-- OpenGL window.
		external
			"C [macro <glaux.h>] (GLbitfield)"
		alias
			"auxInitDisplayMode"
		end
	
	aux_init_position (x, y, width, height: INTEGER) is
			-- Sets the window position used by aux_init_window.
		external
			"C [macro <glaux.h>] (Glint, GLint, GLsizei, GLsizei)"
		alias
			"auxInitPosition"
		end
	
	aux_init_window (title_string: STRING) is
		require
			title_string_not_void: title_string /= Void
		do
			c_aux_init_window ($title_string.area)
		end
	
	c_aux_init_window (p: POINTER) is
			-- Initializes and displays the OpenGL rendering window
		external
			"C [macro <glaux.h>] (GLbyte *)"
		alias
			"auxInitWindow"
		end

end -- class AUX_WINDOW_MINIMAL

--| begin documentation
-- 
--| end documentation

