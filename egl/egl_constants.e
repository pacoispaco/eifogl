note
    description: "OpenGL GL library constants"
    library: "EGL - Eiffel wrapping of OpenGL"
    compilers: "All Eiffel compilers"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGL_CONSTANTS

inherit
--    ACCUM_OP_CONSTANTS
--    ALPHA_FUNCTION_CONSTANTS
--    ATTRIB_MASK_CONSTANTS
--    BEGIN_MODE_CONSTANTS
--    BLENDING_FACTOR_DEST_CONSTANTS
--    BLENDING_FACTOR_SRC_CONSTANTS
--    BOOLEAN_CONSTANTS
--    CLIENT_ATTRIB_MASK_CONSTANTS
--    CLIP_PLANE_NAME_CONSTANTS
--    DATA_TYPE_CONSTANTS
--    DRAW_BUFFER_MODE_CONSTANTS
--    ERROR_CODE_CONSTANTS
--    EXT_BGRA_CONSTANTS
--    EXT_VERTEX_ARRAY_CONSTANTS
--    EXTENSIONS_CONSTANTS
--    FEED_BACK_MODE_CONSTANTS
--    FEED_BACK_TOKEN_CONSTANTS
--    FOG_MODE_CONSTANTS
--    FOR_COMPATIBILITY_WITH_OPEN_GL_V1__0_CONSTANTS
--    FRONT_FACE_DIRECTION_CONSTANTS
--    GET_MAP_TARGET_CONSTANTS
--    GET_TARGET_CONSTANTS
--    GET_TEXTURE_PARAMETER_CONSTANTS
--    HINT_MODE_CONSTANTS
--    LIGHT_NAME_CONSTANTS
--    LIGHT_PARAMETER_CONSTANTS
--    LIST_MODE_CONSTANTS
--    LOGIC_OP_CONSTANTS
--    MATERIAL_PARAMETER_CONSTANTS
--    MATRIX_MODE_CONSTANTS
--    PIXEL_COPY_TYPE_CONSTANTS
--    PIXEL_FORMAT_CONSTANTS
--    PIXEL_TYPE_CONSTANTS
--    POLYGON_MODE_CONSTANTS
--    POLYGON_OFFSET_CONSTANTS
--    RENDERING_MODE_CONSTANTS
--    SHADING_MODEL_CONSTANTS
--    STENCIL_OP_CONSTANTS
--    STRING_NAME_CONSTANTS
--    TEXTURE_CONSTANTS
--    TEXTURE_COORD_NAME_CONSTANTS
--    TEXTURE_ENV_MODE_CONSTANTS
--    TEXTURE_ENV_PARAMETER_CONSTANTS
--    TEXTURE_ENV_TARGET_CONSTANTS
--    TEXTURE_GEN_MODE_CONSTANTS
--    TEXTURE_GEN_PARAMETER_CONSTANTS
--    TEXTURE_MAG_FILTER_CONSTANTS
--    TEXTURE_MIN_FILTER_CONSTANTS
--    TEXTURE_OBJECT_CONSTANTS
--    TEXTURE_PARAMETER_NAME_CONSTANTS
--    TEXTURE_WRAP_MODE_CONSTANTS
--    THESE_MUST_MATCH_THE_GL_COLOR_TABLE_SGI_ENUMERANTS_CONSTANTS
--    VERSION_CONSTANTS
--    VERTEX_ARRAY_CONSTANTS
      GL_CONSTANTS

feature -- Status report

    is_valid_clearing_buffer (buffer: INTEGER): BOOLEAN
            -- Is `buffer' a valid clearing buffer constant or a
            -- valid combination of clearing buffer constants?
        do
            Result := (buffer = Gl_color_buffer_bit) or
                (buffer = Gl_depth_buffer_bit) or
                (buffer = Gl_accum_buffer_bit) or
                (buffer = Gl_stencil_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_depth_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_accum_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_depth_buffer_bit + Gl_accum_buffer_bit) or
                (buffer = Gl_depth_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_accum_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_depth_buffer_bit + Gl_accum_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_depth_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_accum_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_depth_buffer_bit + Gl_accum_buffer_bit + Gl_stencil_buffer_bit) or
                (buffer = Gl_color_buffer_bit + Gl_depth_buffer_bit + Gl_accum_buffer_bit + Gl_stencil_buffer_bit)
        end

    is_valid_geometric_primitive (mode: INTEGER): BOOLEAN
            -- Is `mode' a valid geometric primitive constant?
        do
            Result := (mode = Gl_points) or
                (mode = Gl_lines) or
                (mode = Gl_line_strip) or
                (mode = Gl_line_loop) or
                (mode = Gl_triangles) or
                (mode = Gl_triangle_strip) or
                (mode = Gl_triangle_fan) or
                (mode = Gl_quads) or
                (mode = Gl_quad_strip) or
                (mode = Gl_polygon)
        end

    is_valid_orientation_mode (mode: INTEGER): BOOLEAN
            -- Is `mode' a valid orientation mode constant for
            -- polygon vertices?
        do
            Result := (mode = Gl_ccw) or
                (mode = Gl_cw)
        end

    is_valid_face (face: INTEGER): BOOLEAN
            -- Is `face' a valid cull face mode constant?
        do
            Result := (face = Gl_front) or
                (face = Gl_back) or
                (face = Gl_front_and_back)
        end

    is_valid_matrix_mode (mode: INTEGER): BOOLEAN
            -- Is `mode' a valid matrix mode constant?
        do
            Result := (mode = Gl_modelview) or
                (mode = Gl_projection) or
                (mode = Gl_texture)
        end

    is_valid_shading_mode (mode: INTEGER): BOOLEAN
            -- Is `mode' a valid shading mode constant?
        do
            Result := (mode = Gl_smooth) or
                (mode = Gl_flat)
        end

    is_valid_material_property (property: INTEGER): BOOLEAN
            -- Is `property' a valid material property constant?
        do
            Result := (property = Gl_ambient) or
                (property = Gl_diffuse) or
                (property = Gl_ambient_and_diffuse) or
                (property = Gl_specular) or
                (property = Gl_shininess) or
                (property = Gl_emission) or
                (property = Gl_color_indexes)
        end

    is_valid_light (light: INTEGER): BOOLEAN
            -- Is `light' a valid light constant?
        do
            Result := (light = Gl_light0) or
                (light = Gl_light1) or
                (light = Gl_light2) or
                (light = Gl_light3) or
                (light = Gl_light4) or
                (light = Gl_light5) or
                (light = Gl_light6) or
                (light = Gl_light7)
        end

    is_valid_light_property (property: INTEGER): BOOLEAN
            -- Is `property' a valid light property constant?
        do
            Result := (property = Gl_ambient) or
                (property = Gl_diffuse) or
                (property = Gl_specular) or
                (property = Gl_position) or
                (property = Gl_spot_direction) or
                (property = Gl_spot_exponent) or
                (property = Gl_spot_cutoff) or
                (property = Gl_constant_attenuation) or
                (property = Gl_linear_attenuation) or
                (property = Gl_quadratic_attenuation)
        end

    is_valid_light_model_property (property: INTEGER): BOOLEAN
            -- Is `property' a valid light model property constant?
        do
            Result := (property = Gl_light_model_ambient) or
                (property = Gl_light_model_local_viewer) or
                (property = Gl_light_model_two_side) -- or
--              (property = Gl_light_model_color_control)
        end

    is_valid_material_color_mode (mode: INTEGER): BOOLEAN
            -- Is `mode' a valid material color mode constant?
        do
            Result := (mode = Gl_ambient) or
                (mode = Gl_diffuse) or
                (mode = Gl_specular) or
                (mode = Gl_ambient_and_diffuse) or
                (mode = Gl_emission)
        end

    is_valid_destination_blending_factor (factor: INTEGER): BOOLEAN
            -- Is ?factor' a valid destination blending factor constant?
        do
            Result := (factor = Gl_zero) or
                (factor = Gl_one) or
                (factor = Gl_src_color) or
                (factor = Gl_one_minus_src_color) or
                (factor = Gl_src_alpha) or
                (factor = Gl_one_minus_src_alpha) or
                (factor = Gl_dst_alpha) or
                (factor = Gl_one_minus_dst_alpha) --or
--              (factor = Gl_constant_color) or
--              (factor = Gl_one_minus_constant_color) or
--              (factor = Gl_constant_alpha) or
--              (factor = Gl_one_minus_constant_alpha)
        end

    is_valid_source_blending_factor (factor: INTEGER): BOOLEAN
            -- Is ?factor' a valid source blending factor constant?
        do
            Result := (factor = Gl_zero) or
                (factor = Gl_one) or
                (factor = Gl_dst_color) or
                (factor = Gl_one_minus_dst_color) or
                (factor = Gl_src_alpha) or
                (factor = Gl_one_minus_src_alpha) or
                (factor = Gl_dst_alpha) or
                (factor = Gl_one_minus_dst_alpha) or
                (factor = Gl_src_alpha_saturate) --or
--              (factor = Gl_constant_color) or
--              (factor = Gl_one_minus_constant_color) or
--              (factor = Gl_constant_alpha) or
--              (factor = Gl_one_minus_constant_alpha)
        end

    is_valid_client_state_array (array: INTEGER): BOOLEAN
            -- Is `array' a valid client state array constant?
        do
            Result := (array = Gl_vertex_array) or
                (array = Gl_color_array) or
                (array = Gl_index_array) or
                (array = Gl_normal_array) or
                (array = Gl_texture_coord_array) or
                (array = Gl_edge_flag_array)
        end

    is_valid_pixel_storage_parameter (name: INTEGER): BOOLEAN
            -- Is `name' a valid pixel storage parameter name?
        do
            Result := (name = Gl_unpack_swap_bytes) or
                (name = Gl_pack_swap_bytes) or
                (name = Gl_unpack_lsb_first) or
                (name = Gl_pack_lsb_first) or
                (name = Gl_unpack_row_length) or
                (name = Gl_pack_row_length) or
                (name = Gl_unpack_skip_rows) or
                (name = Gl_pack_skip_rows) or
                (name = Gl_unpack_skip_pixels) or
                (name = Gl_pack_skip_pixels) or
                (name = Gl_unpack_alignment) or
                (name = Gl_pack_alignment)
--              (name = Gl_unpack_image_height) or
--              (name = Gl_pack_image_height) or
--              (name = Gl_unpack_skip_images) or
--              (name = Gl_pack_skip_images)
        end

    is_valid_attrib_mask (mask: INTEGER): BOOLEAN
            -- Is `mask' a valid attribute mask?
        do
            Result := (mask = Gl_accum_buffer_bit) or
                (mask = Gl_all_attrib_bits) or
                (mask = Gl_color_buffer_bit) or
                (mask = Gl_current_bit) or
                (mask = Gl_depth_buffer_bit) or
                (mask = Gl_enable_bit) or
                (mask = Gl_eval_bit) or
                (mask = Gl_fog_bit) or
                (mask = Gl_hint_bit) or
                (mask = Gl_lighting_bit) or
                (mask = Gl_line_bit) or
                (mask = Gl_list_bit) or
                (mask = Gl_pixel_mode_bit) or
                (mask = Gl_point_bit) or
                (mask = Gl_polygon_bit) or
                (mask = Gl_polygon_stipple_bit) or
                (mask = Gl_scissor_bit) or
                (mask = Gl_stencil_buffer_bit) or
                (mask = Gl_texture_bit) or
                (mask = Gl_transform_bit) or
                (mask = Gl_viewport_bit)
        end

end
