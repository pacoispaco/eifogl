indexing
	description: "An OpenGL rendering context"
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "All Eiffel compilers"
	platforms: "Win32"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/01/19 22:28:14 $"
	revision: "$Revision: 1.2 $"

class OPENGL_RENDERING_CONTEXT

inherit
	WEL_ANY
		rename
			item as hglrc
		export
			{NONE} set_item
		end
	
	WEL_ERROR
		export
			{NONE} all
		end
	
creation
	create_new, create_from_current_context
	
feature {NONE} -- Initialization
	
	create_new (dc: EWGL_WIN32_DEVICE_CONTEXT) is
			-- Create a rendering context from a Windows device
			-- context.
		require
			dc_not_void: dc /= Void
			dc_has_pixel_format_set: dc.pixel_format_is_set
		do
			make_by_pointer (wgl.wgl_create_context (dc.item))
			is_current := (hglrc /= Void)			
		end
	
	create_from_current_context is
			-- Create a rendering context object from the current
			-- thread's rendering context. Check `hglrc' after
			-- calling this to see if the current thread has a
			-- OpenGL rendering context. If not, `hglrc' is Void.
		do
			make_by_pointer (wgl.wgl_get_current_context (Void))
			is_current := (hglrc /= Void)
		end
	
feature -- Status report
	
	is_current: BOOLEAN
			-- Is this rendering context the current one?
	
	is_deleted: BOOLEAN 
			-- Is this rendering context deleted?
	
feature -- Basic operations
	
	make_current (dc: EWGL_WIN32_DEVICE_CONTEXT) is
			-- Make the rendering context current for the calling
			-- thread.
		require
			not_current: is_current
		local
			ret_val: INTEGER
		do
			ret_val := wgl.wgl_make_current (dc.item, hglrc)
			is_current := (ret_val = 1)
		ensure
			is_current: is_current
		end
	
	make_not_current is
			-- Make the rendering context not current for the
			-- calling thread.
		require
			is_current: is_current
		local
			ret_val: INTEGER
		do
			ret_val := wgl.wgl_make_current (default_pointer, default_pointer)
			is_current := not (ret_val = 1)
		ensure
			not_current: not is_current
		end
	
	delete is
			-- Delete the rendering context
		require
			is_current: is_current
		local
			ret_val: INTEGER
		do
			ret_val := wgl.wgl_delete_context (hglrc)
			is_deleted := (ret_val = 1)
		ensure
			is_deleted: is_deleted
		end
	
	destroy_item is
		do
			delete
		end

feature {NONE} -- Implementation (Internals)

	wgl: WGL is 
		once
			!! Result
		end

end -- class OPENGL_RENDERING_CONTEXT

--| begin documentation
-- The only accquaintance an Windows OpenGL application programmer
-- ever has with the GL rendering context is in the form of a
-- Windows handle, or more precisely the HGLRC handle. This handle
-- is used when calling the wiggle functions, but the struct GLRC 
-- is never directly accessed in itself. 
--| end documentation

