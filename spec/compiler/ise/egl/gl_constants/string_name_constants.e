indexing
	note:"Automatically generated code, don't edit"

class STRING_NAME_CONSTANTS

feature -- Access

	gl_vendor: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_VENDOR"
		end

	gl_renderer: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_RENDERER"
		end

	gl_version: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_VERSION"
		end

	gl_extensions: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_EXTENSIONS"
		end

end -- class STRING_NAME_CONSTANTS
