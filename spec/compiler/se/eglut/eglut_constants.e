indexing
	description: "Wrapping of GLUT constants"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/04/03 20:56:21 $"
	revision: "$Revision: 1.1 $"

class EGLUT_CONSTANTS

feature -- Access (Display mode bit masks)
	
	glut_rgb: INTEGER is
			-- An alias for `glut_rgba'
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_RGB"
		end
	
	glut_rgba: INTEGER is
			-- Bit mask to select an RGBA mode window. This is the
			-- default if neither ´glut_rgba' or ´glut_index' are
			-- specfied when calling ´glut_init_displaymode'
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_RGBA"
		end
	
	glut_index: INTEGER is
			-- Bit mask to select a color index mode window. This
			-- overrides ´glut_rgba' if it also is specified
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_INDEX"
		end
	
	glut_single: INTEGER is
			-- Bit mask to select a single buffered window. This is
			-- the default if neither glut_double or glut_single
			-- are explicitly specified
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_SINGLE"
		end
	
	glut_double: INTEGER is
			-- Bit mask to select a double buffered window.
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_DOUBLE"
		end
	
	glut_accum: INTEGER is
			-- #define GLUT_ACCUM			4
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_ACCUM"
		end
	
	glut_alpha: INTEGER is
			--#define GLUT_ALPHA			8
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_ALPHA"
		end
	
	glut_depth: INTEGER is
			-- Bit mask to select a window with a depth buffer
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_DEPTH"
		end
	
	glut_stencil: INTEGER is
			--#define GLUT_STENCIL			32
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_STENCIL"
		end
			
	glut_multisample: INTEGER is	
			--#define GLUT_MULTISAMPLE		128
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_MULTISAMPLE"
		end
			
	glut_stereo: INTEGER is	
			--#define GLUT_STEREO			256
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_STEREO"
		end
			
	glut_luminance: INTEGER is	
			--#define GLUT_LUMINANCE		512
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_LUMINANCE"
		end
		
feature -- Access (Mouse buttons)
	
	Glut_left_button: INTEGER is
			-- Left button
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_LEFT_BUTTON"
		end

	Glut_middle_button: INTEGER is
			-- Middle button
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_MIDDLE_BUTTON"
		end

	Glut_right_button: INTEGER is
			-- Right button
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_RIGHT_BUTTON"
		end

feature -- Access (Mouse button callback states)
	
	Glut_down: INTEGER is
			-- Button is down
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_DOWN"
		end

	Glut_up: INTEGER is
			-- Button is up
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_UP"
		end
	
feature -- Access (Function keys)	
	
	Glut_key_f1: INTEGER is
			-- #define GLUT_KEY_F1			1
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F1"
		end
	
	Glut_key_f2: INTEGER is
			-- #define GLUT_KEY_F2			2
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F2"
		end
	
	Glut_key_f3: INTEGER is
			-- #define GLUT_KEY_F3			3
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F3"
		end
	
	Glut_key_f4: INTEGER is
			-- #define GLUT_KEY_F4			4
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F4"
		end
	
	Glut_key_f5: INTEGER is
			-- #define GLUT_KEY_F5			5
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F5"
		end
	
	Glut_key_f6: INTEGER is
			-- #define GLUT_KEY_F6			6
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F6"
		end
	
	Glut_key_f7: INTEGER is
			-- #define GLUT_KEY_F7			7
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F7"
		end
	
	Glut_key_f8: INTEGER is
			-- #define GLUT_KEY_F8			8
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F8"
		end
	
	Glut_key_f9: INTEGER is
			-- #define GLUT_KEY_F9			9
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F9"
		end
	
	Glut_key_f10: INTEGER is
			-- #define GLUT_KEY_F10			10
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F10"
		end
	
	Glut_key_f11: INTEGER is
			-- #define GLUT_KEY_F11			11
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F11"
		end
	
	Glut_key_f12: INTEGER is
			-- #define GLUT_KEY_F12			12
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_F12"
		end
		
feature -- Access (Directional keys)	
	
	Glut_key_left: INTEGER is
			-- #define GLUT_KEY_LEFT			100
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_LEFT"
		end
	
	Glut_key_up: INTEGER is
			-- #define GLUT_KEY_UP			101
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_UP"
		end
	
	Glut_key_right: INTEGER is
			-- #define GLUT_KEY_RIGHT			102
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_RIGHT"
		end
	
	Glut_key_down: INTEGER is
			-- #define GLUT_KEY_DOWN			103
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_DOWN"
		end
	
	Glut_key_page_up: INTEGER is
			-- #define GLUT_KEY_PAGE_UP		104
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_PAGE_UP"
		end
	
	Glut_key_page_down: INTEGER is
			-- #define GLUT_KEY_PAGE_DOWN		105
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_PAGE_DOWN"
		end
	
	Glut_key_home: INTEGER is
			-- #define GLUT_KEY_HOME			106
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_HOME"
		end
	
	Glut_key_end: INTEGER is
			-- #define GLUT_KEY_END			107
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_END"
		end
	
	Glut_key_insert: INTEGER is
			-- #define GLUT_KEY_INSERT			108
		external
--			"C [macro <glut.h>]"
			"C macro use <glut.h>"
		alias
			"GLUT_KEY_INSERT"
		end
	
feature -- Access (Entry/exit callback states)	

feature -- Access (Visibility callback states)	

feature -- Access (Color index component selection values)	

feature -- Access (Layers for use)	

feature -- Access (Stroke font constants)	

feature -- Access (Bitmap font constants)	

feature -- Access (´glut_get' parameters)

feature -- Access (´glut_device_get' parameters)

feature -- Access (´glut_layer_get' parameters)

feature -- Access (´glut_use_layer' parameters)

feature -- Access (´glut_get_modifiers' return masks)
	
	glut_active_shift: INTEGER is
			-- Set if the shift modifier or the Caps Lock is active
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_ACTIVE_SHIFT"
		end
	
	glut_active_ctrl: INTEGER is
			-- Set if the Ctrl modifier is active
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_ACTIVE_CTRL"
		end
	
	glut_active_alt: INTEGER is
			-- Set if the Alt modifier is active
		external
--			"C [macro <glut.h>]: INTEGER"
			"C macro use <glut.h>"
		alias
			"GLUT_ACTIVE_ALT"
		end

feature -- Access (´glut_set_cursor' parameters)

feature -- Access (´glut_set_cursor' parameters)

end -- class EGLUT_CONSTANTS

--| begin documentation
--
--| end documentation

