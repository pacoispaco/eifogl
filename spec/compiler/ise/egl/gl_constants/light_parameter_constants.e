indexing
	note:"Automatically generated code, don't edit"

class LIGHT_PARAMETER_CONSTANTS

feature -- Access

	gl_ambient: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_AMBIENT"
		end

	gl_diffuse: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_DIFFUSE"
		end

	gl_specular: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_SPECULAR"
		end

	gl_position: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_POSITION"
		end

	gl_spot_direction: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_SPOT_DIRECTION"
		end

	gl_spot_exponent: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_SPOT_EXPONENT"
		end

	gl_spot_cutoff: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_SPOT_CUTOFF"
		end

	gl_constant_attenuation: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_CONSTANT_ATTENUATION"
		end

	gl_linear_attenuation: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_LINEAR_ATTENUATION"
		end

	gl_quadratic_attenuation: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_QUADRATIC_ATTENUATION"
		end

end -- class LIGHT_PARAMETER_CONSTANTS
