indexing
	note:"Automatically generated code, don't edit"

class TEXTURE_OBJECT_CONSTANTS

feature -- Access

	gl_texture_priority: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_PRIORITY"
		end

	gl_texture_resident: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_RESIDENT"
		end

	gl_texture_binding_1d: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_BINDING_1D"
		end

	gl_texture_binding_2d: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_BINDING_2D"
		end

end -- class TEXTURE_OBJECT_CONSTANTS
