indexing
	note:"Automatically generated code, don't edit"

class TESS_PROPERTY_CONSTANTS

feature -- Access

	glu_tess_winding_rule: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GLU_TESS_WINDING_RULE"
		end

	glu_tess_boundary_only: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GLU_TESS_BOUNDARY_ONLY"
		end

	glu_tess_tolerance: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GLU_TESS_TOLERANCE"
		end

end -- class TESS_PROPERTY_CONSTANTS
