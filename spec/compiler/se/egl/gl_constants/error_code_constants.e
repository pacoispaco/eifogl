indexing
	note:"Automatically generated code, don't edit"

class ERROR_CODE_CONSTANTS

feature -- Access

	gl_no_error: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_NO_ERROR"
		end

	gl_invalid_enum: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_INVALID_ENUM"
		end

	gl_invalid_value: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_INVALID_VALUE"
		end

	gl_invalid_operation: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_INVALID_OPERATION"
		end

	gl_stack_overflow: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_STACK_OVERFLOW"
		end

	gl_stack_underflow: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_STACK_UNDERFLOW"
		end

	gl_out_of_memory: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_OUT_OF_MEMORY"
		end

end -- class ERROR_CODE_CONSTANTS
