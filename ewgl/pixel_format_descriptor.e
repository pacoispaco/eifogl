indexing
	description: "Eiffelized wrapping of the WGL C struct PIXELFORMATDESCRIPTOR"
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "All Eiffel compilers"
	platforms: "Win32"
 	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class PIXEL_FORMAT_DESCRIPTOR

inherit
	WEL_STRUCTURE
		redefine
			make
		end
	
--	WGL

	PFD_CONSTANTS
			
creation
	make
	
feature -- Initialization
	
	make is
			-- Allocate structure and initialize some structure
			-- members.
		do
			-- Allocate structure:
			precursor
			set_n_size (structure_size)
			
			-- According to OpenGL documentation:
			set_n_version (1)
			
			-- For Win32 API only:
			set_i_layer_type (Pfd_main_plane)
		end
	
feature -- Access
	
	n_size: INTEGER is
			-- Size of the structure
		once
			Result := wgl.cwigle_pfd_get_nsize (item)
		end
	
	n_version: INTEGER is
			-- Version number of this structure. Should always be 1
		do
			Result := wgl.cwigle_pfd_get_nversion (item)
		ensure
			valid_result: Result = 1
		end
	
	dw_flags: INTEGER is
			-- A set of bit flags that describe properties of the
			-- pixel format. See PFD_CONSTANTS for valid bit flag
			-- values
		do
			Result := wgl.cwigle_pfd_get_dwflags (item)
		end
	
	i_pixel_type: INTEGER is
			-- Type of pixel data. See PFD_CONSTANTS for valid
			-- values
		do
			Result := wgl.cwigle_pfd_get_ipixeltype (item)
		end
	
	c_color_bits: INTEGER is
			-- Number of color bitplanes used by the color buffer,
			-- excluding the alpha bitplanes in RGBA mode. In
			-- color index mode it specifies the size of the color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_ccolorbits (item)
		end
	
	c_red_bits: INTEGER is
			-- Number of red color bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_credbits (item)
		end
	
	c_red_shift: INTEGER is
			-- Shift count for red bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_credshift (item)
		end
	
	c_green_bits: INTEGER is
			-- Number of green color bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_cgreenbits (item)
		end
	
	c_green_shift: INTEGER is
			-- Shift count for green bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_cgreenshift (item)
		end
	
	c_blue_bits: INTEGER is
			-- Number of blue color bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_cbluebits (item)
		end
	
	c_blue_shift: INTEGER is
			-- Shift count for blue bitplanes in each RGBA color
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_cblueshift (item)
		end
	
	c_alpha_bits: INTEGER is
			-- Number of alpha bitplanes in each RGBA color
			-- buffer. NOTA BENE: This is not supported by the
			-- Microsoft implementation of OpenGL!
		do
			Result := wgl.cwigle_pfd_get_calphabits (item)
		end
	
	c_alpha_shift: INTEGER is
			-- Shift count for alpha bitplanes in each RGBA color
			-- buffer. NOTA BENE: This is not supported by the
			-- Microsoft implementation of OpenGL!
		do
			Result := wgl.cwigle_pfd_get_calphashift (item)
		end
	
	c_accum_bits: INTEGER is
			-- Total number of bitplanes in the accumulation buffer
		do
			Result := wgl.cwigle_pfd_get_caccumbits (item)
		end
	
	c_accum_red_bits: INTEGER is
			-- Total number of red bitplanes in the accumulation
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_caccumredbits (item)
		end
	
	c_accum_green_bits: INTEGER is
			-- Total number of green bitplanes in the accumulation
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_caccumgreenbits (item)
		end
	
	c_accum_blue_bits: INTEGER is
			-- Total number of blue bitplanes in the accumulation
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_caccumbluebits (item)
		end
	
	c_accum_alpha_bits: INTEGER is
			-- Total number of alpha bitplanes in the accumulation
			-- buffer
		do
			Result := wgl.cwigle_pfd_get_caccumalphabits (item)
		end
	
	c_depth_bits: INTEGER is
			-- Depth of the depth buffer
		do
			Result := wgl.cwigle_pfd_get_cdepthbits (item)
		end
	
	c_stencil_bits: INTEGER is
			-- Depth of the stencil buffer
		do
			Result := wgl.cwigle_pfd_get_cstencilbits (item)
		end
	
	c_aux_buffers: INTEGER is
			-- Number of auxillary buffers. NOTA BENE: This is not
			-- supported by the Microsoft implementation of OpenGL!
		do
			Result := wgl.cwigle_pfd_get_cauxbuffers (item)
		end
	
	i_layer_type: INTEGER is
			-- Type of layer. See PFD_CONSTANTS for valid
			-- values. NOTA BENE: Only the `Pfd_main_plane' value
			-- is supported by the Microsoft implementation of
			-- OpenGL!
		do
			Result := wgl.cwigle_pfd_get_ilayertype (item)
		end
	
	b_reserved: INTEGER is
			-- Reserved and should not be used
		do
			Result := wgl.cwigle_pfd_get_breserved (item)
		end
	
	dw_layer_mask: INTEGER is
			-- Used in conjunction with `dw_visible_mask' to
			-- determine if one layer overlays another. NOTA BENE:
			-- Layers are not supported by the Microsoft
			-- implementation of OpenGL!
		do
			Result := wgl.cwigle_pfd_get_dwlayermask (item)
		end
	
	dw_visible_mask: INTEGER is
			-- Used in conjunction with `dw_layer_mask' to
			-- determine if one layer overlays another. NOTA BENE:
			-- Layers are not supported by the Microsoft
			-- implementation of OpenGL!
		do
			Result := wgl.cwigle_pfd_get_dwvisiblemask (item)
		end
	
	dw_damage_mask: INTEGER is
			-- Indicates when more than one pixel format shares
			-- thesame frame buffer. If the bitwise AND of the
			-- `dw_damage_mask' members of the two pixel formats
			-- are non-zero, then they share the same frame buffer
		do
			Result := wgl.cwigle_pfd_get_dwdamagemask (item)
		end
	
feature -- Element change
	
	set_n_size (i: INTEGER) is
			-- Set the size of this structure.
		require
			valid_i: i = structure_size
		do
			wgl.cwigle_pfd_set_nsize (item, i)
		end
	
	set_n_version (i: INTEGER) is
			-- Set version number of this structure. It should
			-- always be set to 1.
		require
			valid_i: i = 1
		do
			wgl.cwigle_pfd_set_nversion (item, 1)
		end
	
	set_dw_flags (i: INTEGER) is
			-- Set the bit flags that describe properties of the
			-- pixel format. See PFD_CONSTANTS for valid bit flag
			-- values.
		require
			valid_i: is_valid_dw_flags (i)
		do
			wgl.cwigle_pfd_set_dwflags (item, i)
		end
	
	set_i_pixel_type (i: INTEGER) is
			-- Set type of pixel data. See PFD_CONSTANTS for valid
			-- values.
		require
			valid_i: is_valid_i_pixel_type (i)
		do
			wgl.cwigle_pfd_set_ipixeltype (item, i)
		end
 	
	set_c_color_bits (i: INTEGER) is
			-- Set the number of color bitplanes used by the color
			-- buffer, excluding the alpha bitplanes in RGBA
			-- mode. In color index mode it specifies the size of
			-- the color buffer.
		require
			valid_i: i > 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_ccolorbits (item, i)
		end
	
	set_c_red_bits (i: INTEGER) is
			-- Set the number of red color bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i > 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_credbits (item, i)
		end
	
	set_c_red_shift (i: INTEGER) is
			-- Set the shift count for red bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_credshift (item, i)
		end
	
	set_c_green_bits (i: INTEGER) is
			-- Set the number of green color bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i > 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_cgreenbits (item, i)
		end
	
	set_c_green_shift (i: INTEGER) is
			-- Set the shift count for green bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_cgreenshift (item, i)
		end
	
	set_c_blue_bits (i: INTEGER) is
			-- Set the number of blue color bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i > 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_cbluebits (item, i)
		end
	
	set_c_blue_shift (i: INTEGER) is
			-- Set the shift count for blue bitplanes in each RGBA
			-- color buffer.
		require		
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_cblueshift (item, i)
		end
	
	set_c_alpha_bits (i: INTEGER) is
			-- Set the number of alpha bitplanes in each RGBA color
			-- buffer. NOTA BENE: This is not supported by the
			-- Microsoft implementation of OpenGL!
		require		
			valid_i: i > 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_calphabits (item, i)
		end
	
	set_c_alpha_shift (i: INTEGER) is
			-- Set the shift count for alpha bitplanes in each RGBA
			-- color buffer. NOTA BENE: This is not supported by
			-- the Microsoft implementation of OpenGL!
		require
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_calphashift (item, i)
		end
	
	set_c_accum_bits (i: INTEGER) is
			-- Set the total number of bitplanes in the
			-- accumulation buffer.
		require
			valid_i: i >= 0 -- Seems reasonable!		
		do
			wgl.cwigle_pfd_set_caccumbits (item, i)
		end
	
	set_c_accum_red_bits (i: INTEGER) is
			-- Set the total number of red bitplanes in the
			-- accumulation buffer.
		require
			valid_i: i >= 0 -- Seems reasonable!		
		do
			wgl.cwigle_pfd_set_caccumredbits (item, i)
		end
	
	set_c_accum_green_bits (i: INTEGER) is
			-- Set the total number of green bitplanes in the
			-- accumulation buffer.		
		require
			valid_i: i >= 0 -- Seems reasonable!		
		do
			wgl.cwigle_pfd_set_caccumgreenbits (item, i)
		end
	
	set_c_accum_blue_bits (i: INTEGER) is
			-- Set the total number of blue bitplanes in the
			-- accumulation buffer.		
		require
			valid_i: i >= 0 -- Seems reasonable!		
		do
			wgl.cwigle_pfd_set_caccumbluebits (item, i)
		end
	
	set_c_accum_alpha_bits (i: INTEGER) is
			-- Set the total number of alpha bitplanes in the
			-- accumulation buffer.		
		require
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_caccumalphabits (item, i)
		end
	
	set_c_depth_bits (i: INTEGER) is
			-- Set the depth of the depth buffer.
		require
			valid_i: i >= 0 -- Seems reasonable!
		do
			wgl.cwigle_pfd_set_cdepthbits (item, i)
		end
	
	set_c_stencil_bits (i: INTEGER) is
			-- Set the depth of the stencil buffer.
		require
			valid_i: i >= 0 -- Seems reasonable!		
		do
			wgl.cwigle_pfd_set_cstencilbits (item, i)
		end
	
	set_c_aux_buffers (i: INTEGER) is
			-- Set the number of auxillary buffers. NOTA BENE: This
			-- is not supported by the Microsoft implementation of
			-- OpenGL!
		require
			not_applicable: False
		do
			wgl.cwigle_pfd_set_cauxbuffers (item, i)
		end
	
	set_i_layer_type (i: INTEGER) is
			-- Type of layer. See PFD_CONSTANTS for valid
			-- values. NOTA BENE: Only the `Pfd_main_plane' value
			-- is supported by the Microsoft implementation of
			-- OpenGL!
		require
			valid_i: is_valid_i_layer_type (i)
		do
			wgl.cwigle_pfd_set_ilayertype (item, i)
		end
	
	set_b_reserved (i: INTEGER) is
			-- Reserved and should not be used.
		require
			not_applicable: False
		do
			wgl.cwigle_pfd_set_breserved (item, i)
		end
	
	set_dw_layer_mask (i: INTEGER) is
			-- Set this in conjunction with `dw_visible_mask' to
			-- determine if one layer overlays another. NOTA BENE:
			-- Layers are not supported by the Microsoft
			-- implementation of OpenGL!
		require
			not_applicable: False
		do
			wgl.cwigle_pfd_set_dwlayermask (item, i)
		end
	
	set_dw_visible_mask (i: INTEGER) is
			-- Set this in conjunction with `dw_layer_mask' to
			-- determine if one layer overlays another. NOTA BENE:
			-- Layers are not supported by the Microsoft
			-- implementation of OpenGL!
		require
			not_applicable: False
		do
			wgl.cwigle_pfd_set_dwvisiblemask (item, i)
		end
	
	set_dw_damage_mask (i: INTEGER) is
		do
			wgl.cwigle_pfd_set_dwdamagemask (item, i)
		end

feature -- Measurement
	
	structure_size: INTEGER is
			-- Size to allocate (in bytes)
		once
			Result := wgl.c_size_of_pixelformatdescriptor
		end
	
feature {NONE} -- Implementation (Internals)

	wgl: WGL is 
		once
			!! Result
		end

end -- class PIXEL_FORMAT_DESCRIPTOR

--| begin documentation
-- The pixel format descriptor is an extension to the Win32 API 
-- (GDI) to support OpenGL functionality. 
--
-- All feature comments from OpenGL Superbible by Richard S. 
-- Wright Jr. and Michael Sweet.
--| end documentation


