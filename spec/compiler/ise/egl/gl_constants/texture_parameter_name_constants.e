indexing
	note:"Automatically generated code, don't edit"

class TEXTURE_PARAMETER_NAME_CONSTANTS

feature -- Access

	gl_texture_mag_filter: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_MAG_FILTER"
		end

	gl_texture_min_filter: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_MIN_FILTER"
		end

	gl_texture_wrap_s: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_WRAP_S"
		end

	gl_texture_wrap_t: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_WRAP_T"
		end

end -- class TEXTURE_PARAMETER_NAME_CONSTANTS
