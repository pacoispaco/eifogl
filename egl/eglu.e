note
    description: "Eiffelized wrapping of the OpenGL GLU library"
    library: "EGL - Eiffel wrapping of OpenGL"
    compilers: "All Eiffel compilers"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGLU

inherit
    EGL_CONSTANTS
    EGLU_CONSTANTS

feature -- Basic operations (Error handling)

    eglu_error_string (i: INTEGER): STRING
            -- Retrieves a string that describes the error code `i'.
        do
            create Result.make (0)
            Result.from_c (glu_api.glu_error_string(i))
        end

feature -- Basic operations (Setting up the viewing volume)

    eglu_ortho_2d (left, right, bottom, top: DOUBLE)
            -- Create a matrix for projecting two-dimensional
            -- coordinates onto the screen and multiplies the
            -- current projection matrix by it. The clipping
            -- rectangle is a rectangle with the lower left corner
            -- at (`left', `bottom') and the upper right hand corner
            -- at (`right', `top').
        do
            glu_api.glu_ortho_2d (left, right, bottom, top)
        end

feature -- Basic operations (Textures)

    eglu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: PIXEL_DATA_MAP)
            -- Specify a two-dimensional mipmap.
        require
            valid_target: target = Gl_texture_2D
--          valid_internal_format:
            valid_width: width > 0
            valid_height: height > 0
--          valid_format:
--          valid_type:
            data_not_void: data /= Void
        do
            glu_api.glu_build_2D_mipmaps (target, internal_format, width, height, format, type, data)
        end

feature -- Basic operations (Quadrics: rendering spheres, cylinders and disks)

    eglu_cylinder (qobj: EGLU_QUADRIC; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER)
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
            glu_api.glu_cylinder (qobj.pointer, base_radius, top_radius, height, slices, stacks)
        end

    eglu_sphere (qobj: EGLU_QUADRIC; radius: DOUBLE; slices, stacks: INTEGER)
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
            glu_api.glu_sphere (qobj.pointer, radius, slices, stacks)
        end

feature -- Basic operations (Positioning)

    eglu_perspective (fov_y, aspect, z_near, z_far: DOUBLE)
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

    eglu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE)
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

feature -- Basic operations (NURBS)

    eglu_init_nurbs_api
            -- Initialize the GLU NURBS C API.
        require
            not_initialized: not eglu_nurbs_api_is_initialized
        do
            glu_api.eglu_init_nurbs_api (Current)
            eglu_nurbs_api_is_initialized := True
        ensure
            initialized: eglu_nurbs_api_is_initialized
        end

    eglu_nurbs_api_is_initialized: BOOLEAN
            -- Has the GLU NURBS C API been initialized?

    eglu_new_nurbs_renderer: EGLU_NURBS
            -- Create a new NURBS object. Returns void if OpenGL
            -- cannot allocate memory for a new NURBS object.
        require
            initialized: eglu_nurbs_api_is_initialized
        do
            create Result.make_shared (glu_api.glu_new_nurbs_renderer)
        end

    eglu_nurbs_property (nurb: EGLU_NURBS; property: INTEGER; value: DOUBLE)
            -- Set the `value' of the give `property' in the given
            -- NURBS object `nurb'.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= Void
            valid_property: property = Glu_display_mode or
--                  property = Glu_nurbs_mode or
                    property = Glu_culling or
                    property = Glu_sampling_method or
                    property = Glu_sampling_tolerance or
                    property = Glu_parametric_tolerance or
                    property = Glu_u_step or
                    property = Glu_v_step or
                    property = Glu_auto_load_matrix
        do
            glu_api.glu_nurbs_property (nurb.pointer, property, value)
        end

    eglu_begin_surface (nurb: EGLU_NURBS)
            -- Start creating a NURBS surface.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= Void
        do
            glu_api.glu_begin_surface (nurb.pointer)
        end

    eglu_end_surface (nurb: EGLU_NURBS)
            -- Stop creating a NURBS surface.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= Void
        do
            glu_api.glu_end_surface (nurb.pointer)
        end

    eglu_nurbs_surface (nurb: EGLU_NURBS;
                u_knot, v_knot: ARRAY [REAL];
                u_knot_stride, v_knot_stride: INTEGER;
                ctl_array: ARRAY [REAL];
                u_order, v_order: INTEGER;
                type: INTEGER)
            -- Describe the vertices (or surface normals or texture
            -- coordinates) of the NURBS surface `nurb'.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= Void
            u_knot_not_void: u_knot /= Void
            v_knot_not_void: v_knot /= Void
            valid_u_knot_stride: u_knot_stride > 0
            valid_v_knot_stride: v_knot_stride > 0
            ctl_array_not_void: ctl_array /= Void
            valid_u_order: u_order > 0
            valid_v_order: v_order > 0
            valid_type: type = Gl_map2_vertex_3 or
                    type = Gl_map2_vertex_4 or
                    type = Gl_map2_texture_coord_1 or
                    type = Gl_map2_texture_coord_2 or
                    type = Gl_map2_texture_coord_3 or
                    type = Gl_map2_texture_coord_4 or
                    type = Gl_map2_normal
        local
            u_knot_c_array, v_knot_c_array: EGL_GLFLOAT_C_ARRAY
            ctl_c_array: EGL_GLFLOAT_C_ARRAY
        do
            create u_knot_c_array.make_from_array (u_knot)
            create v_knot_c_array.make_from_array (v_knot)
            create ctl_c_array.make_from_array (ctl_array)
            glu_api.glu_nurbs_surface (nurb.pointer,
                           u_knot.count, u_knot_c_array.pointer,
                           v_knot.count, v_knot_c_array.pointer,
                           u_knot_stride, v_knot_stride,
                           ctl_c_array.pointer,
                           u_order, v_order,
                           type)
        end

feature -- Basic operations (NURBS callbacks)

    nurbs_error_callback_activated: BOOLEAN
            -- Is the GLU NURBS error callback activated?

    activate_nurbs_error_callback (nurb: EGLU_NURBS)
            -- Activate the NURBS error callback for the given
            -- `nurb'.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= void
        do
            nurbs_error_callback_activated := True
            glu_api.eglu_set_nurbs_error_callback_function (nurb.pointer)
        ensure
            nurbs_error_callback_activated: nurbs_error_callback_activated
        end

    deactivate_nurbs_error_callback (nurb: EGLU_NURBS)
            -- Deactivate the NURBS error callback for the given
            -- `nurb'.
        require
            initialized: eglu_nurbs_api_is_initialized
            nurb_not_void: nurb /= void
        do
            nurbs_error_callback_activated := False
            glu_api.eglu_set_nurbs_error_callback_function_to_null (nurb.pointer)
        ensure
            nurbs_error_callback_is_not_activated: not nurbs_error_callback_activated
        end

    on_nurbs_error (error_code: INTEGER)
            -- A NURBS error notification has been
            -- recieved. `error_code' indicates the type of error.
        require
            callback_activated: nurbs_error_callback_activated
        do
            debug ("nurbs_callback")
                print ("on_nurbs_error")
                print ("%N")
                print ("  error_code: ")
                print (error_code)
                print ("%N")
                print ("  Meaning: ")
                print (eglu_error_string (error_code))
                print ("%N")
            end
        end

    frozen main_nurbs_callback (nurbs_callback, glenum: INTEGER; glfloat: DOUBLE; userdata: POINTER)
            -- The EGLU_NURBS callback feature. This feature is only
            -- invoked from the EGLU_NURBS C interface. All 13 GLU
            -- NURBS callback functions enter here! `nurbs_callback'
            -- indicates the NURBS callback function. `glenum',
            -- `glfloat' and `userdata' are parameters that are
            -- interpreted differently depending on the NURBS
            -- callback function.
        do
            inspect nurbs_callback
            when eglu_nurbs_error then
                on_nurbs_error (glenum)
            when eglu_nurbs_begin then
            when eglu_nurbs_begin_data then
            when eglu_nurbs_texture_coord then
            when eglu_nurbs_texture_coord_data then
            when eglu_nurbs_color then
            when eglu_nurbs_color_data then
            when eglu_nurbs_normal then
            when eglu_nurbs_normal_data then
            when eglu_nurbs_vertex then
            when eglu_nurbs_vertex_data then
            when eglu_nurbs_end then
            when eglu_nurbs_end_data then
            end
        end

feature -- Implementation (NURBS callback function constants)
-- NOTA BENE! These Eiffel constants MUST be correspond exactly to
-- those in the C #define:s in the eglu_nurbs.h file! The reason that these
-- constants are not accessed, via external, from the eglu_nurbs.h file is
-- that it is then able to write an "inspect" clause in the
-- `nurbs_callback' feature.

    frozen Eglu_nurbs_error: INTEGER = 1

    frozen Eglu_nurbs_begin: INTEGER = 2

    frozen Eglu_nurbs_begin_data: INTEGER = 3

    frozen Eglu_nurbs_texture_coord: INTEGER = 4

    frozen Eglu_nurbs_texture_coord_data: INTEGER = 5

    frozen Eglu_nurbs_color: INTEGER = 6

    frozen Eglu_nurbs_color_data: INTEGER = 7

    frozen Eglu_nurbs_normal: INTEGER = 8

    frozen Eglu_nurbs_normal_data: INTEGER = 9

    frozen Eglu_nurbs_vertex: INTEGER = 10

    frozen Eglu_nurbs_vertex_data: INTEGER = 11

    frozen Eglu_nurbs_end: INTEGER = 12

    frozen Eglu_nurbs_end_data: INTEGER = 13

feature {NONE} -- Implementation

    glu_api: GLU
            -- The raw Eiffel encapsulation of the OpenGL glu API
        once
            create Result
        end

end
