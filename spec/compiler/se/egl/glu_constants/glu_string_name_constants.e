indexing
	note:"Automatically generated code, don't edit"

class GLU_STRING_NAME_CONSTANTS

feature -- Access

	glu_version: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GLU_VERSION"
		end

	glu_extensions: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GLU_EXTENSIONS"
		end

end -- class GLU_STRING_NAME_CONSTANTS
