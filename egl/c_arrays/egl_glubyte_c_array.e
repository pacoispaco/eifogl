indexing
	description: "An OpenGL GLubyte C array"
	library: "EGL"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/01/27 18:20:31 $"
	revision: "$Revision: 1.1 $"

class EGL_GLUBYTE_C_ARRAY
	
inherit	
	C_STRUCTURE
	EGL_CONSTANTS
	
creation
	make_from_array
	
feature {NONE} -- Initialization
	
	make_from_array (a: ARRAY [INTEGER]) is
			-- Create from the Eiffel ARRAY `a'.
		require
			a_not_void: a /= Void
			array_has_convertable_values: array_has_convertable_values (a)
		local
			i, c_index: INTEGER
		do
			count := a.count
			c_array_size := count * gl_type_size
			make
			from
				c_index := 0
				i := a.lower
			until
				i > a.upper
			loop
				c_put_integer_in_glubyte_array (pointer, c_index, a @ i)
				c_index := c_index + 1
				i := i + 1
			end
		end
	
feature -- Access	
	
	count: INTEGER
			-- Number of items
	
	structure_size: INTEGER is
			-- Memory size in bytes
		do
			Result := c_array_size
		end
	
	gl_type: INTEGER is
			-- OpenGL Type
		do
			Result := Gl_unsigned_byte
		end

feature {NONE} -- Implementation	
	
	c_array_size: INTEGER 
			-- Required memory size, in bytes, for the C array 
	
feature -- Basic operations	
	
	array_has_convertable_values (a: ARRAY [INTEGER]): BOOLEAN is
			-- Are all the Eiffel INTEGERs in `a' convertible to C
			-- GLubyte? 
		local
			i: INTEGER
		do
			Result := True
			from 
				i := a.lower
			until 
				not Result or i > a.upper
			loop
				Result := (a @ i <= 255)
				i := i + 1
			end
		end
	
feature {NONE} -- Implementation	
	
	gl_type_size: INTEGER is
			-- Size, in bytes, of the C type GLubyte
		external
			"C [macro <gl.h>] (): long"
		alias
			"sizeof (GLubyte)"
		end
	
	c_put_integer_in_glubyte_array (p: POINTER; i: INTEGER; r: INTEGER) is
			-- Put the Eiffel INTEGER `r' at position `i' in the C
			-- array pointed to by `p'.
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLubyte **, long , GLubyte)"
		alias
			"c_put_integer_in_glubyte_array"		
		end
	
	c_integer_in_glubyte_array (p: POINTER; i: INTEGER): INTEGER is
			-- Returns the Eiffel INTEGER value at index `i' in the C
			-- array pointed to by `p' 
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLubyte **, long): GLubyte"
		alias
			"c_integer_in_glubyte_array"
		end
		
feature -- Test & debug	
	
	test1 is
		local
			i: INTEGER
		do
			print ("Number of items: ")
			print (count)
			print ("%N")
			from
				i := 0
			until
				i > count
			loop
				print ("Item ") 
				print (i)
				print (": ")
				print (c_integer_in_glubyte_array (pointer, i))
				print ("%N")
				i := i + 1
			end
		end
	
end -- class EGL_GLUBYTE_C_ARRAY

--| begin documentation
-- This class enables one to create C type arrays of GLubyte.
-- It is used when an OpenGL function expects a C array of type
-- GLubyte * as an formal parameter in the function signature.
-- 
-- Example of use:
--
--     a: ARRAY [INTEGER]
--     ac: EGL_GLUBYTE_C_ARRAY
--     ...
--     a := <<1, 2, 3>>
--     !! ac.make_from_array (a)
--     some_opengl_function (a.pointer)
--
-- where some_opengl_function is an Eiffel external feature,
-- that wraps an OpenGL function expecting an array of GLubyte,
-- that would looklike this:
--
--     some_opengl_function (p: POINTER) is
--         external
--             "C [macro %"gl.h%"] (GLbyte *)
--         end
--| end documentation
