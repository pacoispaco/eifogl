indexing
	description: "Wrapping of GLUT"
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/09/11 08:34:21 $"
	revision: "$Revision: 1.4 $"

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
		
	glut_solid_torus (inner_radius, outer_radius: DOUBLE; nsides, rings: INTEGER) is
			-- Render a solid torus with the given `inner_radius',
			-- `outer_radius', `nsides' and `rings'.
		external
			"C [macro <glut.h>] (GLdouble, GLdouble, GLint, GLint)"
		alias
			"glutSolidTorus"
		end
	
	glut_solid_octahedron is
			-- Render a solid octahedron.
		external
			"C [macro <glut.h>] ()"
		alias
			"glutSolidOctahedron()"
		end
	
	glut_solid_teapot (size: DOUBLE) is
			-- Render a solid teapot where `size': Size of the
			-- teapot.
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
	
	glut_set_color (index: INTEGER; red, green, blue: REAL) is
			-- Sets the color in the color map of the entry at
			-- position `index'. Note: the values of `red', `green'
			-- and `blue' are normalized to lie in the range 
			-- [0.0, 1.0]. 
		external
			"C [macro <glut.h>] (GLint, GLfloat, GLfloat, GLfloat)"
		alias
			"glutSetColor"
		end
		
end -- class EGLUT

-- begin documentation
-- Eiffel GLUT encapsulation
-- end documentation

