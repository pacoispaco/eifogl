indexing
	note:"Automatically generated code, don't edit"

class RENDERING_MODE_CONSTANTS

feature -- Access

	gl_render: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_RENDER"
		end

	gl_feedback: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_FEEDBACK"
		end

	gl_select: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_SELECT"
		end

end -- class RENDERING_MODE_CONSTANTS
