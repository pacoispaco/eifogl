indexing
	note:"Automatically generated code, don't edit"

class BLENDING_FACTOR_SRC_CONSTANTS

feature -- Access

	gl_dst_color: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_DST_COLOR"
		end

	gl_one_minus_dst_color: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_ONE_MINUS_DST_COLOR"
		end

	gl_src_alpha_saturate: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_SRC_ALPHA_SATURATE"
		end

end -- class BLENDING_FACTOR_SRC_CONSTANTS
