indexing
	description: "PIXELFORMATDESCRIPTOR constants"
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "Win32"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class PFD_CONSTANTS

feature -- Access (dwFlags constants)
	
	Pfd_draw_to_window: INTEGER is
			-- The buffer is used to draw to a window or device
			-- surface such as a printer
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_DRAW_TO_WINDOW"
		end
		
	Pfd_draw_to_bitmap: INTEGER is
			-- The buffer is used to draw to a memory bitmap
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_DRAW_TO_BITMAP"
		end

	Pfd_support_gdi: INTEGER is
			-- The buffer supportingg GDI drawing. This flag is
			-- mutually exclusive with `Pfd_doublebuffer'
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_SUPPORT_GDI"
		end
		
	Pfd_support_opengl: INTEGER is
			-- The buffer supporting OpenGL drawing
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_SUPPORT_OPENGL"
		end
		
	Pfd_generic_format: INTEGER is
			-- The pixel format is a generic implementation
			-- (supported by GDI emulation). If this flag is not
			-- set, the pixel format is supported by hardware or a
			-- device driver
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_GENERIC_FORMAT"
		end
		
	Pfd_need_palette: INTEGER is
			-- The pixel format requires the use of logical
			-- palettes
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_NEED_PALETTE"
		end
		
	Pfd_need_system_palette: INTEGER is
			-- Used for nongeneric implementations that support
			-- only one hardware palette. This function forces the
			-- hardware palette to a one-to-one mapping to the
			-- logical palette
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_NEED_SYSTEM_PALETTE"
		end
		
	Pfd_doublebuffer: INTEGER is
			-- The pixel format is double buffered. This flag is
			-- mutually exclusive with `Pfd_support_gdi'.
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_DOUBLEBUFFER"
		end
		
	Pfd_stereo: INTEGER is
			-- The buffer is stereoscopic. This is analogous to
			-- front and back buffers in double buffering, only
			-- there are left and right buffers. NOTA BENE: Not
			-- supported by Microsoft's generic implementation of
			-- OpenGL
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_STEREO"
		end
		
	Pfd_doublebuffer_dontcare: INTEGER is
			-- When choosing a pixel format, the format may be
			-- either single or double buffered, without preference
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_DOUBLEBUFFER_DONTCARE"
		end
		
	Pfd_stereo_dontcare: INTEGER is
			-- When choosing a pixel format, the view may be
			-- either stereoscopic or monoscopic, without preference
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_STEREO_DONTCARE"
		end
		
feature -- Access (iPixelType constants)

	Pfd_type_rgba: INTEGER is
			-- RGBA color mode. Each pixel is selected by
			-- specifying the red, green, blue and alpha components
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_TYPE_RGBA"
		end

	Pfd_type_colorindex: INTEGER is
			-- Color index mode. Each pixel is selected by an
			-- indexinto a palette (color table)
			-- 
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_TYPE_COLORINDEX"
		end

feature -- Access (iLayerType constants)
	
	Pfd_main_plane: INTEGER is
			-- Layer is the main plane
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_MAIN_PLANE"
		end

	Pfd_overlay_plane: INTEGER is
			-- Layer is the overlay plane
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_OVERLAY_PLANE"
		end

	Pfd_underlay_plane: INTEGER is
			-- Layer is the underlay plane
		external
			"C [macro <wingdi.h>]"
		alias
			"PFD_UNDERLAY_PLANE"
		end

feature -- Basic operations (Constant validation)
	
	is_valid_dw_flags (i: INTEGER): BOOLEAN is
			-- Is `i' a valid sum of dwFlags?
		do
			Result := True
		end
	
	is_valid_i_pixel_type (i:INTEGER): BOOLEAN is
			-- Is `i' a valid iPixelType?
		do
			Result := True
		end

	is_valid_i_layer_type (i:INTEGER): BOOLEAN is
			-- Is `i' a valid iLayerType?
		do
			Result := (i = pfd_main_plane)
		end

end -- class PFD_CONSTANTS

--| begin documentation
-- "PRD_" prefixed constants used in PIXEL_FORMAT_DESCRIPTOR.
--
-- All feature comments from the OpenGL Superbible by Richard S. 
-- Wright Jr. and Michael Sweet.
--| end documentation

