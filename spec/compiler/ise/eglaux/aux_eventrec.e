indexing
	description: "An AUX event structure"
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

class AUX_EVENTREC

inherit
	WEL_STRUCTURE
	
creation
	make_by_pointer
	
feature -- Access
	
	event: INTEGER is
		do
			Result := c_event (item)
		end

	data_1: INTEGER is
		do
			Result := c_data_1 (item)
		end
	
	data_2: INTEGER is
		do
			Result := c_data_2 (item)
		end
	
	data_3: INTEGER is
		do
			Result := c_data_3 (item)
		end
	
	data_4: INTEGER is
		do
			Result := c_data_4 (item)
		end

feature -- Status setting
	
	set_event (i: INTEGER) is
		do
			c_set_event (item , i)
		end

	set_data_1 (i: INTEGER) is
		do
			c_set_data_1 (item , i)
		end
	
	set_data_2 (i: INTEGER) is
		do
			c_set_data_2 (item , i)
		end
	
	set_data_3 (i: INTEGER) is
		do
			c_set_data_3 (item , i)
		end
	
	set_data_4 (i: INTEGER) is
		do
			c_set_data_4 (item , i)
		end

feature -- Measurement	
	
	structure_size: INTEGER is
			-- Size to allocate (in bytes)
		do
			Result := c_structure_size
		end
	
feature {NONE} -- Implementation (Measurement)
	
	c_structure_size: INTEGER is
			-- Size to allocate (in bytes)
		external
			"C [macro <glaux.h>]"
		alias
			"sizeof (AUX_EVENTREC)"
		end
	
feature {NONE} -- Implementation
	
	c_event (p: POINTER): INTEGER is
		external
			"C [macro <erec.h>]"
		alias
			"eglaux_erec_get_event"
		end

	c_data_1 (p: POINTER): INTEGER is
		external
			"C [macro <erec.h>]"
		alias
			"eglaux_erec_get_data_1"
		end
	
	c_data_2 (p: POINTER): INTEGER is
		external
			"C [macro <erec.h>]"
		alias
			"eglaux_erec_get_data_2"
		end
	
	c_data_3 (p: POINTER): INTEGER is
		external
			"C [macro <erec.h>]"
		alias
			"eglaux_erec_get_data_3"
		end
	
	c_data_4 (p: POINTER): INTEGER is
		external
			"C [macro <erec.h>]"
		alias
			"eglaux_erec_get_data_4"
		end
	
	c_set_event (p: POINTER; i: INTEGER) is
		external
			"C [macro <erec.h>] (char *, GLint)"
		alias
			"eglaux_erec_set_event"
		end

	c_set_data_1 (p: POINTER; i: INTEGER) is
		external
			"C [macro <erec.h>] (char *, GLint)"
		alias
			"eglaux_erec_set_data_1"
		end
	
	c_set_data_2 (p: POINTER; i: INTEGER) is
		external
			"C [macro <erec.h>] (char *, GLint)"
		alias
			"eglaux_erec_set_data_2"
		end
	
	c_set_data_3 (p: POINTER; i: INTEGER) is
		external
			"C [macro <erec.h>] (char *, GLint)"
		alias
			"eglaux_erec_set_data_3"
		end
	
	c_set_data_4 (p: POINTER; i: INTEGER) is
		external
			"C [macro <erec.h>] (char *, GLint)"
		alias
			"eglaux_erec_set_data_4"
		end

end -- class AUX_EVENTREC

--| begin documentation
-- 
--| end documentation


