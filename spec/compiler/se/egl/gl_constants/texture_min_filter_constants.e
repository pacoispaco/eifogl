indexing
	note:"Automatically generated code, don't edit"

class TEXTURE_MIN_FILTER_CONSTANTS

feature -- Access

	gl_nearest_mipmap_nearest: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_NEAREST_MIPMAP_NEAREST"
		end

	gl_linear_mipmap_nearest: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_LINEAR_MIPMAP_NEAREST"
		end

	gl_nearest_mipmap_linear: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_NEAREST_MIPMAP_LINEAR"
		end

	gl_linear_mipmap_linear: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_LINEAR_MIPMAP_LINEAR"
		end

end -- class TEXTURE_MIN_FILTER_CONSTANTS
