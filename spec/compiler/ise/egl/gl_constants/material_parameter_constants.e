indexing
	note:"Automatically generated code, don't edit"

class MATERIAL_PARAMETER_CONSTANTS

feature -- Access

	gl_emission: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_EMISSION"
		end

	gl_shininess: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_SHININESS"
		end

	gl_ambient_and_diffuse: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_AMBIENT_AND_DIFFUSE"
		end

	gl_color_indexes: INTEGER is
		external
			"C [macro <gl.h>]"
		alias
			"GL_COLOR_INDEXES"
		end

end -- class MATERIAL_PARAMETER_CONSTANTS
