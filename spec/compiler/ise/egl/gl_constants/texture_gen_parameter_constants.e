indexing
	note:"Automatically generated code, don't edit"

class TEXTURE_GEN_PARAMETER_CONSTANTS

feature -- Access

	gl_texture_gen_mode: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_TEXTURE_GEN_MODE"
		end

	gl_object_plane: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_OBJECT_PLANE"
		end

	gl_eye_plane: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_EYE_PLANE"
		end

end -- class TEXTURE_GEN_PARAMETER_CONSTANTS
