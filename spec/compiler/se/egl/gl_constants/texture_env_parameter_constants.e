indexing
	note:"Automatically generated code, don't edit"

class TEXTURE_ENV_PARAMETER_CONSTANTS

feature -- Access

	gl_texture_env_mode: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_ENV_MODE"
		end

	gl_texture_env_color: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_TEXTURE_ENV_COLOR"
		end

end -- class TEXTURE_ENV_PARAMETER_CONSTANTS
