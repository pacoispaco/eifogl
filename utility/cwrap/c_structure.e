indexing
	description: "An encapsulated C struct"
	library: "Eiffel C wrapper utilities"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/10/26 23:07:28 $"
	revision: "$Revision: 1.2 $"

deferred class C_STRUCTURE
	
inherit	
	MEMORY
		redefine
			dispose
		end
	
	C_FUNCTIONS
	
feature -- Initialiazation
	
	make is
			-- Create and allocate memory. When garbage collected,
			-- free the allocated memory.
		do
			pointer := c_calloc (1, structure_size)
			if pointer = default_pointer then
				-- Memory allocation problem
				-- c_enomem
			end
			shared := False			
		ensure
			not_shared: not shared
		end
	
	make_unshared (p: POINTER) is
			-- Create with pointer `p' pointing to already allocated
			-- memory. When garbage collected, free the allocated
			-- memory.
		require
			p_not_void: p /= Void
		do
			pointer := p
			shared := False
		ensure
			not_shared: not shared
		end
	
	make_shared (p: POINTER) is
			-- Create with pointer `p' pointing to already allocated
			-- memory. When garbage collected, do not free the
			-- allocated memory.
		require
			p_not_void: p /= Void
		do
			pointer := p
			shared := True
		ensure
			shared: shared
		end
	
feature -- Access	
	
	pointer: POINTER
			-- Pointer to the allocated memory for this
			-- C_STRUCTURE object.
	
	structure_size: INTEGER is
			-- Memory size in bytes
		deferred
		end
	
feature -- Status report
	
	shared: BOOLEAN
			-- Is the memory that this C_STRUCTURE object refers
			-- toalso referred to by some other C_STRUCTURE object
			-- or C pointer?
	
	exists: BOOLEAN is
			-- Is `pointer' not a C NULL pointer?
		do
			Result := pointer /= default_pointer
		end
	
feature {NONE} -- Memory cleanup 	
	
	dispose is
		do
			if not shared then
				c_free (pointer)
			end
		end
	
invariant	
	pointer_valid: pointer /= Void

end -- class C_STRUCTURE


-- begin documentation
--
-- end documentation

