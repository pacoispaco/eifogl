indexing
	description: "Wrapping of GLUT"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "SmallEiffel -0.74 beta #17 (lcc-win32 3.7)"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/04/03 20:56:21 $"
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
	
	glut_wire_sphere (radius: DOUBLE; slices, stacks: INTEGER) is
			-- Render a wire sphere where
			-- `radius': Radius of the sphere
			-- `slices': The number of subdivisions around the
			--           Z-axis (similar to the lines of logitude)
			-- `stacks': The number of subdivisions along the
			--           Z-axis (similar to lines of latitude)
		external
			"C [macro <glut.h>] (GLdouble, GLint, GLint)"
		alias
			"glutWireSphere"
		end
	
	glut_solid_cube (size: DOUBLE) is
			-- Render a solid cube where `size' is the side of the
			-- cube.
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutSolidCube"
		end
		
	glut_wire_cube (size: DOUBLE) is
			-- Render a wire cube where `size' is the side of the
			-- cube.
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutWireCube"
		end
		
	glut_solid_teapot (size: DOUBLE) is
			-- Render a solid teapot where
			-- `size': Size of the teapot
		external
			"C [macro <glut.h>] (GLdouble)"
		alias
			"glutSolidTeapot"
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
-- end documentation

