note
    description: "Main window"
    application: "alpha3D"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class MAIN_WINDOW

inherit
    EGLUT_TOP_LEVEL_WINDOW
        export
            {NONE} all
        redefine
            default_window_title,
            default_width,
            default_height,
            init,
            on_display,
            on_idle,
            on_keyboard,
            on_reshape,
            on_visibility
        end

    EGLU

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            mat_specular: ARRAY [REAL]
            mat_shininess: ARRAY [REAL]
            position: ARRAY [REAL]
        do
            subscribe_to_visibility_events
            subscribe_to_reshape_events
            subscribe_to_display_events
            subscribe_to_keyboard_events

            solid_z := Max_z
            transparent_z := Min_z

            mat_specular := <<1.0, 1.0, 1.0, 0.15>>
            mat_shininess := <<100.0>>
            position := <<0.5, 0.5, 1.0, 0.0>>

            egl_material_fv (Gl_front, Gl_specular, mat_specular)
            egl_material_fv (Gl_front, Gl_shininess, mat_shininess)
            egl_light_fv (Gl_light0, Gl_position, position)

            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)
            egl_enable (Gl_depth_test)

            sphere_list := egl_gen_lists (1)
            egl_new_list (sphere_list, Gl_compile)
            glut_solid_sphere (0.4, 16, 16)
            egl_end_list

            cube_list := egl_gen_lists (1)
            egl_new_list (cube_list, Gl_compile)
            glut_solid_cube (0.6)
            egl_end_list
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: alpha3D"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        local
            mat_solid: ARRAY [REAL]
            mat_zero: ARRAY [REAL]
            mat_transparent: ARRAY [REAL]
            mat_emission: ARRAY [REAL]
        do
            mat_solid := <<0.75, 0.75, 0.0, 1.0>>
            mat_zero := <<0.0, 0.0, 0.0, 1.0>>
            mat_transparent := <<0.0, 0.8, 0.8, 0.6>>
            mat_emission := <<0.0, 0.3, 0.3, 0.6>>

            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)

            egl_push_matrix
            egl_translate_f (-0.15, -0.15, solid_z)
            egl_material_fv (Gl_front, Gl_emission, mat_zero)
            egl_material_fv (Gl_front, Gl_diffuse, mat_solid)
            egl_call_list (sphere_list)
            egl_pop_matrix

            egl_push_matrix
            egl_translate_f (0.15, 0.15, transparent_z)
            egl_rotate_f (15.0, 1.0, 1.0, 0.0)
            egl_rotate_f (30.0, 0.0, 1.0, 0.0)
            egl_material_fv (Gl_front, Gl_emission, mat_emission)
            egl_material_fv (Gl_front, Gl_diffuse, mat_transparent)
            egl_enable (Gl_blend)
            egl_depth_mask (Gl_false)
            egl_blend_func (Gl_src_alpha, Gl_one)
            egl_call_list (cube_list)
            egl_depth_mask (Gl_true)
            egl_disable (Gl_blend)
            egl_pop_matrix

            glut_swap_buffers
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
            when 'a', 'A' then
                solid_z := Max_z
                transparent_z := Min_z
                subscribe_to_idle_events
            when 'r', 'R' then
                solid_z := Max_z
                transparent_z := Min_z
                glut_post_redisplay
            when '%/27/' then -- Escape character
                quit (0)
            else
            end
        end

    on_reshape (width, height: INTEGER)
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            if (width <= height) then
                egl_ortho (-1.5, 1.5, -1.5*height/width,1.5*height/width, -10.0, 10.0)
            else
                egl_Ortho (-1.5*width/height, 1.5*width/height, -1.5, 1.5, -10.0, 10.0)
                egl_matrix_mode (Gl_modelview)
                egl_load_identity
            end
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

    on_idle
        do
            animate
        end

feature {NONE} -- Implementation

    Max_z: REAL = 8.0
    Min_z: REAL = -8.0
    Z_inc: REAL = 0.4

    solid_z: REAL
    transparent_z: REAL
    sphere_list: INTEGER
    cube_list: INTEGER

    animate
        do
            if (solid_z <= Min_z or transparent_z >= Max_z) then
                unsubscribe_to_idle_events
            else
                solid_z := solid_z - Z_inc
                transparent_z := transparent_z + Z_inc
                glut_post_redisplay
            end
        end

end
