note
	description: "Automatically generated code, don't edit"

class GET_TEXTURE_PARAMETER_CONSTANTS

feature -- Access

	gl_texture_width: INTEGER
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_WIDTH"
		end

	gl_texture_height: INTEGER
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_HEIGHT"
		end

	gl_texture_internal_format: INTEGER
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_INTERNAL_FORMAT"
		end

	gl_texture_border_color: INTEGER
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_BORDER_COLOR"
		end

	gl_texture_border: INTEGER
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_BORDER"
		end

end
