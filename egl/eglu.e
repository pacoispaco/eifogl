indexing
	description: "Eiffelized wrapping of the OpenGL GLU library"
	library: "EGL - Eiffel wrapping of OpenGL"
	compilers: "All Eiffel compilers"
	platforms: "All platforms that have OpenGL implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:38 $"
	revision: "$Revision: 1.1 $"

class EGLU
	
inherit	
	GLU_CONSTANTS
	
feature -- Basic operations (Error handling)
	
	eglu_error_string (i: INTEGER): STRING is
			-- Retrieves a string that describes the error code `i'.
		do
			!! Result.make (0)
			Result.from_c (glu_api.glu_error_string(i))
		end
			
feature -- Basic operations (Quadrics: rendering spheres, cylinders and disks)
	
	eglu_cylinder (qobj: EGLU_QUADRIC; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER) is
			-- Draw a cylinder oriented along the z-axis, with the
			-- base of the cylinder at z = 0 and the top of the
			-- cylinder at z = `height'. The cylinder is subdivided
			-- around the z-axis into a number of `slices' and
			-- along the z-axis into a number of `stacks'. `base_radius' 
			-- the radius of the cylinder at z = `height'. If `top_radius' 
			-- set to 0, then a cone is generated.
		require
			qobj_not_void: qobj /= Void
			valid_base_radius: base_radius >= 0.0
			valid_top_radius: top_radius >= 0.0
			valid_height: height >= 0.0
			valid_slices: slices >= 0
			valid_stacks: stacks >= 0
		do
			glu_api.glu_cylinder (qobj.item, base_radius, top_radius, height, slices, stacks)
		end
		
	eglu_sphere (qobj: EGLU_QUADRIC; radius: DOUBLE; slices, stacks: INTEGER) is
			-- Draw a sphere of the given `radius', centered
			-- aroundthe origin (0, 0, 0). The sphere is
			-- subdivided round the x-axis into a number of slices
			-- (similar to longitude) and along the x-axis into a
			-- number of `stacks' (latitude).
		require
			qobj_not_void: qobj /= Void
			valid_radius: radius >= 0.0
			valid_slices: slices >= 0
			valid_stacks: stacks >= 0
		do
			glu_api.glu_sphere (qobj.item, radius, slices, stacks)
		end

feature -- Basic operations (Positioning)
      
	eglu_perspective (fov_y, aspect, z_near, z_far: DOUBLE) is
			-- Defines a viewing perspective Projection
			-- matrix. `fov_y' is the field of view in degrees, in
			-- the y direction, `aspect' is the aspect ratio
			-- (width/height), `z_near' and `z_far' denote the
			-- distance from the viewer to the near and far
			-- clipping plane.
		require
			valid_field_of_view: fov_y >= 0.0 and fov_y <= 180.0
			valid_z_near: z_near >= 0.0
			valid_z_far: z_far >= 0.0
		do
			glu_api.glu_perspective (fov_y, aspect, z_near, z_far)
		end
		
	eglu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE) is
			-- Defines a viewing matrix and multplies it to the
			-- right of the current matrix. The desired viewpoint
			-- is specified by `eyex', `eyey' and `eyez'. The
			-- `centerx', `centery' and `centerz' arguments specify
			-- any point along the desired line of sight, but
			-- typically they specify some point in the center of
			-- the scene being looked at. The `upx', `upy' and
			-- `upz' arguments indicate which direction is up.
		do
			glu_api.glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz)
		end

feature {NONE} -- Implementation 	
	
	glu_api: expanded GLU 
			-- The raw Eiffel encapsulation of the OpenGL glu API

end -- class EGLU

-- begin dictionary
-- Eiffelized OpenGL glu interface
-- end dictionary
