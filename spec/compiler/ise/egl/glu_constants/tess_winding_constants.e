indexing
	note:"Automatically generated code, don't edit"

class TESS_WINDING_CONSTANTS

feature -- Access

	glu_tess_winding_odd: INTEGER is
		external
			"C [macro <glu.h>]"
		alias
			"GLU_TESS_WINDING_ODD"
		end

	glu_tess_winding_nonzero: INTEGER is
		external
			"C [macro <glu.h>]"
		alias
			"GLU_TESS_WINDING_NONZERO"
		end

	glu_tess_winding_positive: INTEGER is
		external
			"C [macro <glu.h>]"
		alias
			"GLU_TESS_WINDING_POSITIVE"
		end

	glu_tess_winding_negative: INTEGER is
		external
			"C [macro <glu.h>]"
		alias
			"GLU_TESS_WINDING_NEGATIVE"
		end

	glu_tess_winding_abs_geq_two: INTEGER is
		external
			"C [macro <glu.h>]"
		alias
			"GLU_TESS_WINDING_ABS_GEQ_TWO"
		end

end -- class TESS_WINDING_CONSTANTS
