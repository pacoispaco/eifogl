indexing
	description: "Wrapping of GLUT"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

class EGLUT

inherit
	EGL
		export
			{NONE} all
		end

feature -- GLUT	debugging sub-API
	
	glut_report_errors is
		external
			"C [macro <glut.h>] ()"
		alias
			"glutReportErrors()"
		end

feature	-- GLUT	pre-built models sub-API -- Could/should be put in separate class!?
	
	glut_solid_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
			-- Render a solid sphere where
			-- `radius': Radius of the sphere
			-- `slices': The number of subdivisions around the
			--           Z-axis (similar to the lines of logitude)
			-- `stacks': The number of subdivisions along the
			--           Z-axis (similar to lines of latitude)
		external
			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
		alias
			"glutSolidSphere"
		end
	
	glut_swap_buffers is
			-- Swap the buffers of the current window if double buffered
		external
			"C [macro <glut.h>] ()"
		alias
			"glutSwapBuffers()"
		end
	
	
end -- class EGLUT

-- begin documentation
-- Eiffel GLUT encapsulation
-- end documentation

