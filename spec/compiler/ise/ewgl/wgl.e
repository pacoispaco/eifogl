indexing
	description: "Interface class for the wgl functions"
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "Win32"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class WGL
	
feature {OPENGL_RENDERING_CONTEXT} -- Externals (Basic wgl functions)
	
	wgl_make_current (hdc, h_glrc: POINTER): INTEGER is
		external
	        	"C [macro <wingdi.h>] (HDC, HGLRC): BOOL"
		alias
			"wglMakeCurrent"
		end
	
	wgl_delete_context (h_glrc: POINTER):INTEGER  is
		external
			"C [macro <wingdi.h>] (HGLRC): BOOL"
		alias
			"wglDeleteContext"
		end
	
	wgl_create_context (hdc: POINTER): POINTER is
		external
			"C [macro <wingdi.h>] (HDC): HGLRC"
		alias
			"wglCreateContext"
		end
	
	wgl_get_current_context (h_glrc: POINTER): POINTER is
		external
			"C [macro <wingdi.h>] (HGLRC): HGLRC"
		alias
			"wglGetCurrentContext"
		end
	
feature {EWGL_WIN32_DEVICE_CONTEXT} -- External (WGL buffer function)

	wingdi_swap_buffers (hdc: POINTER): INTEGER is
			-- Quickly copies the contents of the back buffer of a
			-- window to the front buffer (foreground). Returns 1
			-- (True) if the buffers were swapped, else 0 (False).
		external
			"C [macro <wingdi.h>] (HDC): BOOL"
		alias
			"SwapBuffers"
		end


feature {EWGL_WIN32_DEVICE_CONTEXT} -- Externals (PFD basic functions)

	wingdi_get_enh_meta_file_pixel_format (hemf: POINTER; cbBuffer: INTEGER; ppfd: POINTER): INTEGER is
			-- Retrieves pixel format information for an enhanced
			-- metafile. Returns the size of the metafile's pixel
			-- format or 0 on failure.
			-- hemf:     Identifies the enhanced metafile. 
			-- cbBuffer: Specifies the size, in bytes, of the buffer 
			--           into which the pixel format information is 
			--           copied.
			-- ppfd:     Pointer to a PIXEL_FORMAT_DESCRIPTOR structure
			--           that contains the logical pixel format 
			--           specification. The metafile uses this structure 
			--           to record the logical pixel format specification.
		external
			"C [macro <wingdi.h>] (HENHMETAFILE, DWORD, CONST PIXELFORMATDESCRIPTOR *): UNIT"
		alias
			"GetEnhMetaFilePixelFormat"
		end
	
	wingdi_choose_pixel_format (hdc, ppfd: POINTER): INTEGER is
			-- Selects the pixel format descriptor closest to that
			-- specified by the supplied PIXEL_FORMAT_DESCRIPTOR
			-- (ppfd), and that can be supported by the given
			-- device context (hdc). Returns the index of the
			-- nearest matching pixel format, or zero if no
			-- suitable pixel format could be found.
			-- hdc:  Handle to a WEL_DC (dc.item)
			-- ppfd: Pointer to a PIXEL_FORMAT_DESCRIPTOR (pfd.item)
		external
			"C [macro <wingdi.h>] (HDC, CONST PIXELFORMATDESCRIPTOR *): int"
		alias
			 "ChoosePixelFormat"
		end
	
	wingdi_set_pixel_format (hdc: POINTER; i: INTEGER; ppfd: POINTER): INTEGER is
			-- Sets the device context's (hdc) pixel format. Once
			-- the pixel format has been selected for a given
			-- device context it cannot be changed. This function
			-- must be called before creating an OpenGL rendering
			-- context. Returns 1 (True) if the specified pixel
			-- format was set for the given device context. Returns
			-- 0 (False) if an error occured.
			-- hdc:  Handle to a WEL_DC (dc.item)
			-- i:    Index to the pixel format of interest
			-- ppfd: Pointer to a PIXEL_FORMAT_DESCRIPTOR (pfd.item)
		external
			"C [macro <wingdi.h>] (HDC, int, CONST PIXELFORMATDESCRIPTOR *): BOOL"
		alias
			"SetPixelFormat"
		end
	
	wingdi_get_pixel_format (hdc: POINTER): INTEGER is
			-- Obtains the index of the currently selected pixel
			-- format of the specified device context. Returns the
			-- currently selected pixel format index of the
			-- specified device context. This is a positive,
			-- one-based index value or 0 on failure.
			-- hdc: Specifies the device context of the currently
			--      selected pixel format index returned by the 
			--      function. I.e. this is filled in by this feature!
		external
			"C [macro <wingdi.h>] (HDC): int"
		alias
			"GetPixelFormat"
		end
	
	wingdi_describe_pixel_format (hdc: POINTER; i, n: INTEGER; ppfd: POINTER): INTEGER is
			-- Obtains detailed information about a pixel
			-- format. Returns the maximum pixel format supported
			-- by the specified devide context, or 0 on failure.
			-- hdc:  Handle to a WEL_DC (dc.item)
			-- i:    Index to the pixel format of interest
			-- n:    Size of the PIXEL_FORMAT_DESCRIPTOR (pfd.structure_size)
			-- ppfd: Pointer to a PIXEL_FORMAT_DESCRIPTOR (pfd.item)
		external
			"C [macro <wingdi.h>] (HDC, int, UINT, LPPIXELFORMATDESCRIPTOR *): int"
		alias
			"DescribePixelFormat"
		end

feature {PIXEL_FORMAT_DESCRIPTOR} -- Externals (PFD utility feature)
	
	c_size_of_pixelformatdescriptor: INTEGER is
		external
			"C [macro <wingdi.h>]"
		alias
			"sizeof (PIXELFORMATDESCRIPTOR)"
		end
	
feature {PIXEL_FORMAT_DESCRIPTOR} -- External (PFD access functions)
	
	cwigle_pfd_get_nsize (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_nversion (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
		
	cwigle_pfd_get_dwflags (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_ipixeltype (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_ccolorbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_credbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_credshift (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cgreenbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cgreenshift (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cbluebits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cblueshift (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_calphabits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_calphashift (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_caccumbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_caccumredbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_caccumgreenbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_caccumbluebits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_caccumalphabits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cdepthbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cstencilbits (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_cauxbuffers (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_ilayertype (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_breserved (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_dwlayermask (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_dwvisiblemask (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_get_dwdamagemask (ptr: POINTER): INTEGER is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_nsize (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_nversion (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_dwflags (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_ipixeltype (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_ccolorbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_credbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_credshift (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cgreenbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cgreenshift (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cbluebits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cblueshift (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_calphabits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_calphashift (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_caccumbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_caccumredbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_caccumgreenbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_caccumbluebits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_caccumalphabits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cdepthbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cstencilbits (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_cauxbuffers (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_ilayertype (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_breserved (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_dwlayermask (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_dwvisiblemask (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
	cwigle_pfd_set_dwdamagemask (ptr: POINTER; value: INTEGER) is
		external
			"C [macro <pfd.h>]"
		end
	
end -- class WGL

-- begin documentation
-- 
-- end documentation

