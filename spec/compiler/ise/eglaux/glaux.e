indexing
	description: "Encapsulation of the OpenGL Auxilliary (AUX) library"
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

class GLAUX

inherit
	EGL

feature -- Basic operations	

	aux_solid_box (width, height, depth: REAL) is
			-- Draws a solid box.
		external
			"C [macro <glaux.h>] (GLdouble, GLdouble, GLdouble)"
		alias
			"auxSolidBox"
		end

	aux_solid_cone (radius, height: REAL) is
			-- Draws a solid cone.
		external
			"C [macro <glaux.h>] (GLdouble, GLdouble)"
		alias
			"auxSolidCone"
		end

	aux_solid_cube (width: REAL) is
			-- Draws a solid cube.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidCube"
		end

	aux_solid_cylinder (radius, height: REAL) is
			-- Draws a solid cylinder.
		external
			"C [macro <glaux.h>] (GLdouble, GLdouble)"
		alias
			"auxSolidCube"
		end

	aux_solid_dodecahedron (radius: REAL) is
			-- Draws a solid dodecahedron.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidDodecahedron"
		end

	aux_solid_icosahedron (radius: REAL) is
			-- Draws a solid icosahedron.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidIcosahedron"
		end

	aux_solid_octahedron (radius: REAL) is
			-- Draws a solid octahedron.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidOctahedron"
		end

	aux_solid_sphere (radius: REAL) is
			-- Draws a solid sphere.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidSphere"
		end

	aux_solid_teapot (size: REAL) is
			-- Draws a solid teapot.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidTeapot"
		end

	aux_solid_tetrahedron (radius: REAL) is
			-- Draws a solid tetrahedron.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxSolidTetrahedron"
		end

	aux_solid_torus (inner_radius, outer_radius: REAL) is
			-- Draws a solid torus (doughnut shape).
		external
			"C [macro <glaux.h>] (GLdouble, GLdouble)"
		alias
			"auxSolidTorus"
		end
	
	aux_wire_teapot (size: REAL) is
			-- Draws a wireframe teapot.
		external
			"C [macro <glaux.h>] (GLdouble)"
		alias
			"auxWireTeapot"
		end
	
	aux_swap_buffers is
			-- Switches drawing buffer to screen during
			-- double-buffered drawing.
		external
			"C [macro <glaux.h>] ()"
		alias
			"auxSwapBuffers()"
		end

	aux_wire_box (width, height, depth: REAL) is
			-- Draws a wireframe box.
		external
			"C [macro <glaux.h>] (GLdouble, GLdouble, GLdouble)"
		alias
			"auxWireBox"
		end

end -- class GLAUX

--| begin documentation
-- 
--| end documentation

--| Copyright (C) 1999, Paul Cohen
