indexing
	note:"Automatically generated code, don't edit"

class MATRIX_MODE_CONSTANTS

feature -- Access

	gl_modelview: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_MODELVIEW"
		end

	gl_projection: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_PROJECTION"
		end

	gl_texture: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE"
		end

end -- class MATRIX_MODE_CONSTANTS
