indexing
	description: "Wrapping of GLUT constants"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:52:07 $"
	revision: "$Revision: 1.2 $"

class EGLUT_CONSTANTS

feature -- Access (Display mode bit masks)
	
	glut_rgb: INTEGER is
			-- An alias for `glut_rgba'
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_RGB"
		end
	
	glut_rgba: INTEGER is
			-- Bit mask to select an RGBA mode window. This is the
			-- default if neither �glut_rgba' or �glut_index' are
			-- specfied when calling �glut_init_displaymode'
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_RGBA"
		end
	
	glut_index: INTEGER is
			-- Bit mask to select a color index mode window. This
			-- overrides �glut_rgba' if it also is specified
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_INDEX"
		end
	
	glut_single: INTEGER is
			-- Bit mask to select a single buffered window. This is
			-- the default if neither glut_double or glut_single
			-- are explicitly specified
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_SINGLE"
		end
	
	glut_double: INTEGER is
			-- Bit mask to select a double buffered window.
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_DOUBLE"
		end
	
	glut_accum: INTEGER is
			-- #define GLUT_ACCUM			4
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_ACCUM"
		end
	
	glut_alpha: INTEGER is
			--#define GLUT_ALPHA			8
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_ALPHA"
		end
	
	glut_depth: INTEGER is
			-- Bit mask to select a window with a depth buffer
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_DEPTH"
		end
	
	glut_stencil: INTEGER is
			--#define GLUT_STENCIL			32
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_STENCIL"
		end
			
	glut_multisample: INTEGER is	
			--#define GLUT_MULTISAMPLE		128
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_MULTISAMPLE"
		end
			
	glut_stereo: INTEGER is	
			--#define GLUT_STEREO			256
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_STEREO"
		end
			
	glut_luminance: INTEGER is	
			--#define GLUT_LUMINANCE		512
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_LUMINANCE"
		end
		
feature -- Access (Mouse buttons)
	
	Glut_left_button: INTEGER is
			-- Left button
		external
			"C [macro <glut.h>]"
		alias
			"GLUT_LEFT_BUTTON"
		end

	Glut_middle_button: INTEGER is
			-- Middle button
		external
			"C [macro <glut.h>]"
		alias
			"GLUT_MIDDLE_BUTTON"
		end

	Glut_right_button: INTEGER is
			-- Right button
		external
			"C [macro <glut.h>]"
		alias
			"GLUT_RIGHT_BUTTON"
		end

feature -- Access (Mouse button callback states)
	
	Glut_down: INTEGER is
			-- Button is down
		external
			"C [macro <glut.h>]"
		alias
			"GLUT_DOWN"
		end

	Glut_up: INTEGER is
			-- Button is up
		external
			"C [macro <glut.h>]"
		alias
			"GLUT_UP"
		end
	
feature -- Access (Function keys)	
	
feature -- Access (Directional keys)	

feature -- Access (Entry/exit callback states)	

feature -- Access (Visibility callback states)	

feature -- Access (Color index component selection values)	

feature -- Access (Layers for use)	

feature -- Access (Stroke font constants)	

feature -- Access (Bitmap font constants)	

feature -- Access (�glut_get' parameters)

feature -- Access (�glut_device_get' parameters)

feature -- Access (�glut_layer_get' parameters)

feature -- Access (�glut_use_layer' parameters)

feature -- Access (�glut_get_modifiers' return masks)
	
	glut_active_shift: INTEGER is
			-- Set if the shift modifier or the Caps Lock is active
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_ACTIVE_SHIFT"
		end
	
	glut_active_ctrl: INTEGER is
			-- Set if the Ctrl modifier is active
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_ACTIVE_CTRL"
		end
	
	glut_active_alt: INTEGER is
			-- Set if the Alt modifier is active
		external
			"C [macro <glut.h>]: INTEGER"
		alias
			"GLUT_ACTIVE_ALT"
		end

feature -- Access (�glut_set_cursor' parameters)

feature -- Access (�glut_set_cursor' parameters)

end -- class EGLUT_CONSTANTS

--| begin documentation
-- Encapsulation of all GLUT constant-like macros
--| end documentation

