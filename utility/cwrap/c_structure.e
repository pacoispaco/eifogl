indexing
	description: "An encapsulated C struct"
	library: "Eiffel C wrapper utilities"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:41 $"
	revision: "$Revision: 1.1 $"

class C_STRUCTURE

creation
	make, make_unshared, make_shared

feature -- Initialiazation
	
	make is
			-- Create and allocate memory. When garbage collected,
			-- free the allocated memory.
		do
			item := c_calloc (1, structure_size)
			if item = Void then
				-- Memory allocation problem
				-- c_enomem
			end
			shared := False			
		ensure
			not_shared: not shared
		end
	
	make_unshared (pointer: POINTER) is
			-- Create with `pointer' pointing to already allocated
			-- memory. When garbage collected, free the allocated
			-- memory.
		require
			pointer_not_void: pointer /= Void
		do
		ensure
			not_shared: not shared
		end
	
	make_shared (pointer: POINTER) is
			-- Create with `pointer' pointing to already allocated
			-- memory. When garbage collected, do not free the
			-- allocated memory.
		require
			pointer_not_void: pointer /= Void
		do
		ensure
			shared: shared
		end
	
feature -- Access	
	
	memory_pointer: POINTER
			-- Pointer to the allocated memory for this
			-- C_STRUCTURE object.
	
feature -- Status report
	
	shared: BOOLEAN
			-- Is the memory that this C_STRUCTURE object refers
			-- toalso referred to by some other C_STRUCTURE object
			-- or C pointer?

invariant	
	memory_pointer_valid: memory_pointer /= Void

end -- class C_STRUCTURE


-- begin documentation
--
-- end documentation

