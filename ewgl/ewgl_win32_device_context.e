indexing
	description: "Eiffelized wrapping of the WGL functions"
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "All Eiffel compilers"
	platforms: "Win32"
 	author: "Paul Cohen"
	copyright: "Copyright (c) 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/11/11 15:27:47 $"
	revision: "$Revision: 1.1 $"

deferred class EWGL_WIN32_DEVICE_CONTEXT

feature -- Buffer functions

	swap_buffers is
			-- Quickly copies the contents of the back buffer of a
			-- window to the front buffer (foreground). 
		require
			item_not_void: item /= Void
		do
			if wgl.wingdi_swap_buffers (item) = 0 then
				swap_buffers_failed := True
			else
				swap_buffers_failed := False
			end
		end
	
	swap_buffers_failed: BOOLEAN
 			-- Did the last call of `swap_buffers' fail?
	
feature -- Basic operations	
	
	choose_pixel_format (pfd: PIXEL_FORMAT_DESCRIPTOR) is
			-- Selects the pixel format descriptor closest to that
			-- specified by the supplied PIXEL_FORMAT_DESCRIPTOR
			-- (pfd), and that can be supported by this device
			-- context. `chosen_pixel_format_index' returns the
			-- index of the chosen pixel format, if any.
		require
			pfd_not_void: pfd /= Void
			item_not_void: item /= Void
		do
			chosen_pixel_format_index := wgl.wingdi_choose_pixel_format (item, pfd.item)
			if chosen_pixel_format_index = 0 then
				choose_pixel_format_index_failed := True
			else
				choose_pixel_format_index_failed := False
			end
		end
	
	chosen_pixel_format_index: INTEGER
			-- The pixel format index of the chosen pixel
			-- format. This is the one that is the closest match to
			-- the PIXEL_FORMAT_DESCRIPTOR supplied to
			-- `choose_pixel_format'. Returns 0 if the last call
			-- to choose_pixel_format failed.
	
	choose_pixel_format_index_failed: BOOLEAN
			-- Did the last call of `choose_pixel_format_index'
			-- fail?
	
	set_pixel_format (i: INTEGER; pfd: PIXEL_FORMAT_DESCRIPTOR) is
			-- Sets the pixel format of this device context. Once
			-- the pixel format has been selected for a given
			-- device context it cannot be changed. This function
			-- must be called before creating an OpenGL rendering
			-- context.
		require
			pfd_not_void: pfd /= Void
			pixel_format_not_set: not pixel_format_is_set
			item_not_void: item /= Void
		do
			if wgl.wingdi_set_pixel_format (item, i, pfd.item) = 0 then
				set_pixel_format_failed := True
			else
				set_pixel_format_failed := False
				pixel_format_is_set := True
			end
		ensure
			pixel_format_set_if_no_failure: not set_pixel_format_failed implies
							pixel_format_is_set
			pixel_format_not_set_if_failure: set_pixel_format_failed implies
							not pixel_format_is_set
		end
	
	pixel_format_is_set: BOOLEAN
			-- Has the pixel format been set?
	
	set_pixel_format_failed: BOOLEAN
 			-- Did the last call of `set_pixel_format' fail?
	
	current_pixel_format_index: INTEGER is
			-- Returns the index of the currently selected pixel
			-- format of this device context. On failure 0 is
			-- returned.
		require
			pixel_format_is_set: pixel_format_is_set
			item_not_void: item /= Void
		do
			Result := wgl.wingdi_get_pixel_format (item)
		end
	
	describe_pixel_format (i: INTEGER): PIXEL_FORMAT_DESCRIPTOR is
			-- Returns detailed information about the pixel
			-- format with index `i'.
		require
			item_not_void: item /= Void
		do
			!! Result.make
			-- res is actually the maximum number of supported pixel
			-- formats. We ignore this. If the client wants that
			-- information it should call `maximum_pixel_format_index'.
			if wgl.wingdi_describe_pixel_format (item, i, Result.n_size, Result.item) = 0 then
				describe_pixel_format_failed := True
			else
				describe_pixel_format_failed := False
			end
		end
	
	describe_pixel_format_failed: BOOLEAN
 			-- Did the last call of `describe_pixel_format' fail?
	
	maximum_pixel_format_index: INTEGER is
			-- Maximum pixel format index, ie. the number of
			-- supported pixel formats. Returns 0 if it fails to
			-- retrieve this information.
		require
			item_not_void: item /= Void
		local
			pfd: PIXEL_FORMAT_DESCRIPTOR
		do
			!! pfd.make
			-- We call the function with index = 1, assuming that
			-- at least one pixel format is supported.
			Result := wgl.wingdi_describe_pixel_format (item, 1, pfd.n_size, pfd.item)
		end
	
feature -- Implementation	
	
	item: POINTER is 
			-- A pointer to the the Windows DC, ie. a Windows handle
		deferred
		end

feature {NONE} -- Implementation (Internals)

	wgl: WGL is 
		once
			!! Result
		end

end -- class EWGL_WIN32_DEVICE_CONTEXT

--| begin documentation
--| end documentation


