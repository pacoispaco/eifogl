indexing
	description: "An Windows Client DC for OpenGL rendering that%
                     %can be used with ISE Eiffels WEL library."
	library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
	compilers: "ISE 4.3, ISE4.5, ISE 5.0.24 See dependencies."
	platforms: "Win32"
	dependencies: "ISE's WEL, which means it will only work with ISE compilers."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999, 2000 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:57:10 $"
	revision: "$Revision: 1.2 $"

class EWGL_WEL_CLIENT_DC

inherit
	
	WEL_CLIENT_DC
	
	EWGL_WIN32_DEVICE_CONTEXT
	
creation
	make, make_by_pointer

end -- class EWGL_WEL_CLIENT_DC

--| begin documentation
-- The deferred feature `item' in class EWGL_WIN32_DEVICE_CONTEXT
-- is implemented through inheritance from WEL_CLIENT_DC! It is
-- a handle to a Windows Device Context.
--| end documentation

