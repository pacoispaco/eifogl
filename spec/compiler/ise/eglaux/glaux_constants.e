indexing
	description: "OpenGL AUX constants"
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

class GLAUX_CONSTANTS

feature -- Access (ToolKit Window Types)
	
	Aux_rgb: INTEGER is
		external
			"C [macro <glaux.h>]"
		alias
			"AUX_RGB"
		end
	
	Aux_rgba: INTEGER is
		external
			"C [macro <glaux.h>]"
		alias
			"AUX_RGBA"
		end
	
	Aux_index: INTEGER is
		external
			"C [macro <glaux.h>]"
		alias
			"AUX_INDEX" 
		end
	
	Aux_single: INTEGER is
		external
			"C [macro <glaux.h>]"
		alias
			"AUX_SINGLE"
		end
	
	Aux_double: INTEGER is
		external
			"C [macro <glaux.h>]"
		alias
			"AUX_DOUBLE"
		end
	
-- AUX_DIRECT          0
-- AUX_INDIRECT        4

-- AUX_ACCUM           8
-- AUX_ALPHA           16
-- AUX_DEPTH24         32      /* 24-bit depth buffer */
-- AUX_STENCIL         64
-- AUX_AUX             128
-- AUX_DEPTH16         256     /* 16-bit depth buffer */
-- AUX_FIXED_332_PAL   512
-- AUX_DEPTH           AUX_DEPTH16 /* default is 16-bit depth buffer */
	
end -- class GLAUX_CONSTANTS

--| begin documentation
-- 
--| end documentation

