indexing
	description: "An OpenGL GLboolean C array"
	library: "EGL"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 06:54:40 $"
	revision: "$Revision: 1.1 $"

class EGL_GLBOOLEAN_C_ARRAY
	
inherit	
	C_STRUCTURE
	EGL_CONSTANTS
	
creation
	make_empty, make_from_array
	
feature {NONE} -- Initialization
	
	make_empty (size: INTEGER) is
			-- Create an empty GLuint C array with the given `size'. 
		require
			valid_size: size > 0
		do
			count := size
			c_array_size := count * gl_type_size
			make
		end
	
	make_from_array (a: ARRAY [BOOLEAN]) is
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
				c_put_boolean_in_glboolean_array (pointer, c_index, a @ i)
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
			-- OpenGL Type. NOT DEFINED FOR GLBOOLEAN!
		do
			Result := 0 
		end

	contents: ARRAY [BOOLEAN] is
			-- Contents
		local
			i: INTEGER
		do
			!! Result.make (1, count)
			from
				i := 0
			until
				i = count
			loop
				Result.put (c_boolean_in_glboolean_array (pointer, i), i + 1)
				i := i + 1
			end			
		end

feature {NONE} -- Implementation	
	
	c_array_size: INTEGER 
			-- Required memory size, in bytes, for the C array 
	
feature -- Basic operations	
	
	array_has_convertable_values (a: ARRAY [BOOLEAN]): BOOLEAN is
			-- Are all the Eiffel BOOLEANs in `a' convertible to C
			-- GLboolean? 
		do
			-- Assuming Eiffel BOOLEAN = C unsigned char and GLboolean =
			-- unsigned char on the current platform!
			Result := True
		end
	
feature {NONE} -- Implementation	
	
	gl_type_size: INTEGER is
			-- Size, in bytes, of the C type GLboolean
		external
			"C [macro <gl.h>] (): long"
		alias
			"sizeof (GLboolean)"
		end
	
	c_put_boolean_in_glboolean_array (p: POINTER; i: INTEGER; b: BOOLEAN) is
			-- Put the Eiffel BOOLEAN `b' at position `i' in the C
			-- array pointed to by `p'.
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLboolean **, long , GLboolean)"
		alias
			"c_put_boolean_in_glboolean_array"		
		end
	
	c_boolean_in_glboolean_array (p: POINTER; i: INTEGER): BOOLEAN is
			-- Returns the Eiffel BOOLEAN value at index `i' in the C
			-- array pointed to by `p' 
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLboolean **, long): GLboolean"
		alias
			"c_boolean_in_glboolean_array"
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
				print (c_boolean_in_glboolean_array (pointer, i))
				print ("%N")
				i := i + 1
			end
		end
	
end -- class EGL_GLBOOLEAN_C_ARRAY

--| begin documentation
-- This class enables one to create C type arrays of GLboolean.
-- It is used when an OpenGL function expects a C array of type
-- GLuint * as an formal parameter in the function signature.
-- 
-- Example of use:
--
--     a: ARRAY [INTEGER]
--     ac: EGL_GLBOOLEAN_C_ARRAY
--     ...
--     a := <<True, False, True>>
--     !! ac.make_from_array (a)
--     some_opengl_function (a.pointer)
--
-- where some_opengl_function is an Eiffel external feature,
-- that wraps an OpenGL function expecting an array of GLboolean,
-- that would looklike this:
--
--     some_opengl_function (p: POINTER) is
--         external
--             "C [macro %"gl.h%"] (GLboolean *)
--         end
--| end documentation
