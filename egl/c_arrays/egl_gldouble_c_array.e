indexing
	description: "An OpenGL GLdouble C array"
	library: "EGL"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/02/03 17:41:39 $"
	revision: "$Revision: 1.2 $"

class EGL_GLDOUBLE_C_ARRAY
	
inherit	
	C_STRUCTURE
	EGL_CONSTANTS
	
creation
	make_empty, make_from_array
	
feature {NONE} -- Initialization
	
	make_empty (size: INTEGER) is
			-- Create an empty GLdouble C array with the given `size'. 
		require
			valid_size: size > 0
		do
			count := size
			c_array_size := count * gl_type_size
			make
		end
	
	make_from_array (a: ARRAY [DOUBLE]) is
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
				c_put_double_in_gldouble_array (pointer, c_index, a @ i)
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
			Result := Gl_double
		end
	
	contents : ARRAY [DOUBLE] is
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
				Result.put (c_double_in_gldouble_array (pointer, i), i + 1)
				i := i + 1
			end			
		end

feature {NONE} -- Implementation	
	
	c_array_size: INTEGER 
			-- Required memory size, in bytes, for the C array 
	
feature -- Basic operations	
	
	array_has_convertable_values (a: ARRAY [DOUBLE]): BOOLEAN is
			-- Are all the Eiffel DOUBLEs in `a' convertible to C
			-- GLdoubles? 
		do
			-- Assuming Eiffel DOUBLE = C double and GLdouble =
			-- double on the current platform!
			Result := True
		end
	
feature {NONE} -- Implementation	
	
	gl_type_size: INTEGER is
			-- Size, in bytes, of the C type GLdouble
		external
			"C [macro <gl.h>] (): long"
		alias
			"sizeof (GLdouble)"
		end
	
	c_put_double_in_gldouble_array (p: POINTER; i: INTEGER; d: DOUBLE) is
			-- Put the Eiffel DOUBLE `d' at position `i' in the C
			-- array pointed to by `p'.
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLdouble **, long , GLdouble)"
		alias
			"c_put_double_in_gldouble_array"		
		end
	
	c_double_in_gldouble_array (p: POINTER; i: INTEGER): DOUBLE is
			-- Returns the Eiffel DOUBLE value at index `i' in the C
			-- array pointed to by `p' 
		require
			c_array_exists: p /= default_pointer
			valid_i: i >= 0 and i < count
		external
			"C [macro <egl.h>] (GLdouble **, long): GLdouble"
		alias
			"c_double_in_gldouble_array"
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
				print (c_double_in_gldouble_array (pointer, i))
				print ("%N")
				i := i + 1
			end
		end
	
end -- class EGL_GLDOUBLE_C_ARRAY

--| begin documentation
-- This class enables one to create C type arrays of GLdouble.
-- It is used when an OpenGL function expects a C array of type
-- GLdouble * as an formal parameter in the function signature.
-- 
-- Example of use:
--
--     a: ARRAY [DOUBLE]
--     ac: EGL_GLDOUBLE_C_ARRAY
--     ...
--     a := <<0.1, 0.2, 0.3>>
--     !! ac.make_from_array (a)
--     some_opengl_function (a.pointer)
--
-- where some_opengl_function is an Eiffel external feature,
-- that wraps an OpenGL function expecting an array of GLdouble,
-- that would looklike this:
--
--     some_opengl_function (p: POINTER) is
--         external
--             "C [macro %"gl.h%"] (GLdouble *)
--         end
--| end documentation
