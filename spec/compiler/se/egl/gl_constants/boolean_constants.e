indexing
	note:"Automatically generated code, don't edit"

class BOOLEAN_CONSTANTS

feature -- Access

	gl_true: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TRUE"
		end

	gl_false: INTEGER is
		external
			"C macro use gl.h>"
		alias
			"GL_FALSE"
		end

end -- class BOOLEAN_CONSTANTS
