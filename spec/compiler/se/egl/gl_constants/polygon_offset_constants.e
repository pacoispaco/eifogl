indexing
	note:"Automatically generated code, don't edit"

class POLYGON_OFFSET_CONSTANTS

feature -- Access

	gl_polygon_offset_factor: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_POLYGON_OFFSET_FACTOR"
		end

	gl_polygon_offset_units: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_POLYGON_OFFSET_UNITS"
		end

	gl_polygon_offset_point: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_POLYGON_OFFSET_POINT"
		end

	gl_polygon_offset_line: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_POLYGON_OFFSET_LINE"
		end

	gl_polygon_offset_fill: INTEGER is
		external
			"C macro use <gl.h>"
		alias
			"GL_POLYGON_OFFSET_FILL"
		end

end -- class POLYGON_OFFSET_CONSTANTS
