indexing
	description: "Eiffel wrapping of the OpenGL GLU NURBS functions"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2001 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 22:10:38 $"
	revision: "$Revision: 1.1 $"

class EGLU_NURBS
	
inherit	
	EGLU
	
feature -- Status report
	
	nurbs_c_interface_is_initialized: BOOLEAN
			-- Is the EGLU NURBS C interface initialized?
	
	nurbs_error_callback_activated: BOOLEAN
			-- Is the GLU NURBS error callback activated?
	
feature	-- Status setting
	
	init_nurbs_c_interface is
			-- Initialize the C side of the EGLU NURBS C interface. 
		do
			eglu_set_nurbs_object (ceif_adopt (Current))
			nurbs_c_interface_is_initialized := True
		ensure
			nurbs_c_interface_is_initialized: nurbs_c_interface_is_initialized
		end
	
feature	-- Status setting (Callbacks)
	
	activate_nurbs_error_callback (nurb: EGLU_NURBS_OBJ) is	
			-- Activate the NURBS error callback for th egiven
			-- `nurb'. 
		require
			nurbs_c_interface_is_initialized: nurbs_c_interface_is_initialized
			nurb_not_void: nurb /= Void
		do
			nurbs_error_callback_activated := True
			eglu_set_nurbs_error_callback_function (nurb.pointer)
		ensure
			nurbs_error_callback_activated: nurbs_error_callback_activated
		end
	
	deactivate_nurbs_error_callback (nurb: EGLU_NURBS_OBJ) is
			-- Deactivate the NURBS error callback for the given
			-- `nurb'. 
		require
			nurbs_c_interface_is_initialized: nurbs_c_interface_is_initialized
			nurb_not_void: nurb /= Void
		do
			nurbs_error_callback_activated := False
			eglu_set_nurbs_error_callback_function_to_null (nurb.pointer)
		ensure
			nurbs_error_callback_is_not_activated: not nurbs_error_callback_activated
		end
	
feature {NONE} -- Implementation (callbacks)	
	
	on_nurbs_error (error_code: INTEGER) is
			-- A NURBS error notification has been
			-- recieved. `error_code' indicates the type of error. 
		require
			callback_activated: nurbs_error_callback_activated
		do
			debug ("nurbs_callback")
				print ("on_nurbs_error")
				print ("%N")
				print ("  error_code: ")
				print (error_code)
				print ("%N")
				print ("  Meaning: ")
				print (eglu_error_string (error_code))
				print ("%N")
			end
		end
	
feature {NONE} -- Implementation (NURBS callbacks)
	
	frozen main_nurbs_callback (nurbs_callback, glenum: INTEGER; glfloat: DOUBLE; userdata: POINTER) is
			-- The EGLU_NURBS callback feature. This feature is only
			-- invoked from the EGLU_NURBS C interface. All 13 GLU
			-- NURBS callback functions enter here! `nurbs_callback'
			-- indicates the NURBS callback function. `glenum',
			-- `glfloat' and `userdata' are parameters that are
			-- interpreted differently depending on the NURBS
			-- callback function.
		do
			inspect nurbs_callback
			when eglu_nurbs_error then
				-- `glenum' is errorCode
				on_nurbs_error (glenum)
			when eglu_nurbs_begin then
				-- `glenum' is type
--				on_nurbs_begin (glenum)
			when eglu_nurbs_begin_data then
				-- `glenum' is type and `userdata' is *userData
--				on_nurbs_begin_data (glenum, userdata)
			when eglu_nurbs_texture_coord then
				-- `glfloat' is tCrd
--				on_nurbs_texture_coord (glfloat)
			when eglu_nurbs_texture_coord_data then
				-- `glfloat' is tCrd and `userdata' is *userData
--				on_nurbs_texture_coord_data (glfloat, userdata)
			when eglu_nurbs_color then
				-- `glfloat' is color
--				on_nurbs_color (glfloat)
			when eglu_nurbs_color_data then
				-- `glfloat' is color and `userdata' is *userData
--				on_nurbs_color_data (glfloat, userdata)
			when eglu_nurbs_normal then
				-- `glfloat' is *nml
--				on_nurbs_normal (glfloat)
			when eglu_nurbs_normal_data then
				-- `glfloat' is *nml and `userdata' is *userData
--				on_nurbs_normal_data (glfloat, userdata)
			when eglu_nurbs_vertex then
				-- `glfloat' is *vertex
--				on_nurbs_vertex (glfloat)
			when eglu_nurbs_vertex_data then
				-- `glfloat' is *vertex and `userdata' is *userData
--				on_nurbs_vertex_data (glfloat, userdata)
			when eglu_nurbs_end then
--				on_nurbs_end
			when eglu_nurbs_end_data then
				-- `userdata' is *userData
--				on_nurbs_end_data (userdata)
			end
		end
	
feature -- Implementation (Callback function constants)
	
	-- NOTA BENE! These Eiffel constants MUST be correspond exactly to
	-- those in the C #define:s in the eglu_nurbs.h file! The reason that these
	-- constants are not accessed, via external, from the eglu_nurbs.h file is
	-- that it is then able to write an "inspect" clause in the
	-- `nurbs_callback' feature.
	
	frozen eglu_nurbs_error: INTEGER is 1
	
	frozen eglu_nurbs_begin: INTEGER is 2
	
	frozen eglu_nurbs_begin_data: INTEGER is 3
	
	frozen eglu_nurbs_texture_coord: INTEGER is 4
	
	frozen eglu_nurbs_texture_coord_data: INTEGER is 5
	
	frozen eglu_nurbs_color: INTEGER is 6
	
	frozen eglu_nurbs_color_data: INTEGER is 7
	
	frozen eglu_nurbs_normal: INTEGER is 8
	
	frozen eglu_nurbs_normal_data: INTEGER is 9
	
	frozen eglu_nurbs_vertex: INTEGER is 10 
	
	frozen eglu_nurbs_vertex_data: INTEGER is 11 

	frozen eglu_nurbs_end: INTEGER is 12 
	
	frozen eglu_nurbs_end_data: INTEGER is 13
	
feature {NONE} -- Implementation (EGLU NURBS C interface externals)	
	
	eglu_set_nurbs_error_callback_function (nurb: POINTER) is
			-- Set the the GLU NURBS error callback function
		external
			"C [macro <eglu_nurbs.h>] (GLUnurbsObj *)"
		alias
			"eglu_set_nurbs_error_callback_function"
		end
	
	eglu_set_nurbs_error_callback_function_to_null (nurb: POINTER) is
			-- Set the the GLU NURBS error callback function
		external
			"C [macro <eglu_nurbs.h>] (GLUnurbsObj *)"
		alias
			"eglu_set_nurbs_error_callback_function_to_null"
		end
	
feature {NONE} -- Implementation (EGLU NURBS C interface)	
	
	frozen eglu_set_nurbs_object (p: POINTER) is
			-- Set the EGLU_NURBS object in the EGLU NURBS C
			-- interface. 
		external
			"C [macro <eglu_nurbs.h>] (EIF_OBJ)"
		end	
	
feature {NONE} -- Implementation (CECIL stuff)	
	
	ceif_adopt (object: ANY): POINTER is
		external
			"C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
		alias
			"eif_adopt"
		end
	
invariant	
	-- Force all classes who inherit from EGLU_NURBS to call
	-- `init_nurbs_c_interface' in their creation features.
	nurbs_c_interface_is_initialized: nurbs_c_interface_is_initialized
	
end -- class EGLU_NURBS


