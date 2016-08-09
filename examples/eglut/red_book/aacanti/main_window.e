note
    description: "Main window"
    application: "aacanti"
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
            on_keyboard,
            on_reshape,
            on_visibility
        end

    EGLU

    ARRAY_OPERATIONS

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            mat_ambient: ARRAY [REAL]
            mat_specular: ARRAY [REAL]
            light_position: ARRAY [REAL]
            lm_ambient: ARRAY [REAL]
        do
            subscribe_to_visibility_events
            subscribe_to_keyboard_events
            subscribe_to_reshape_events
            subscribe_to_display_events

            mat_ambient := <<1.0, 1.0, 1.0, 1.0>>
            mat_specular := <<1.0, 1.0, 1.0, 1.0>>
            light_position := <<0.0, 0.0, 10.0, 1.0>>
            lm_ambient := <<0.2, 0.2, 0.2, 1.0>>

            egl_material_fv (Gl_front, Gl_ambient, mat_ambient)
            egl_material_fv (Gl_front, Gl_specular, mat_specular)
            egl_material_f (Gl_front, Gl_shininess, 50.0)
            egl_light_fv (Gl_light0, Gl_position, light_position)
            egl_light_model_fv (Gl_light_model_ambient, lm_ambient)

            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)
            egl_enable (Gl_depth_test)
            egl_shade_model (Gl_flat)

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_clear_accum (0.0, 0.0, 0.0, 0.0)
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: aacanti"
        end

    default_width: INTEGER = 250

    default_height: INTEGER = 250

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
        local
            viewport: ARRAY [INTEGER]
            i, index: INTEGER
        do
            viewport := egl_get_integer_v (Gl_viewport)

            egl_clear (Gl_accum_buffer_bit)
            from
                i := 1
            until
                i > Ac_size
            loop
                index := i * 2 - 1
                egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
                egl_push_matrix

                -- Note that 4.5 is the distance in world space between
                -- left and right and bottom and top.
                -- This formula converts fractional pixel movement to
                -- world coordinates.
                egl_translate_f (jitter @ index * 4.5 / viewport @ 3, jitter @ (index + 1) * 4.5 / viewport @ 4, 0.0)
                display_objects
                egl_pop_matrix
                egl_accum (Gl_accum, {REAL_32} 1.0 / Ac_size)

                i := i + 1
            end
            egl_accum (Gl_return, 1.0)
            egl_flush
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
            when '%/27/' then -- Escape character
                quit (0)
            end
        end

    on_reshape (width, height: INTEGER)
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            if (width <= height) then
                egl_ortho (-2.25, 2.25, -2.25*height/width, 2.25*height/width, -10.0, 10.0)
            else
                egl_ortho (-2.25*width/height, 2.25*width/height, -2.25, 2.25, -10.0, 10.0)
            end
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    display_objects
        local
            torus_diffuse: ARRAY [REAL]
            cube_diffuse: ARRAY [REAL]
            sphere_diffuse: ARRAY [REAL]
            octa_diffuse: ARRAY [REAL]
        do
            torus_diffuse := <<0.7, 0.7, 0.0, 1.0>>
            cube_diffuse := <<0.0, 0.7, 0.7, 1.0>>
            sphere_diffuse := <<0.7, 0.0, 0.7, 1.0>>
            octa_diffuse := <<0.7, 0.4, 0.4, 1.0>>

            egl_push_matrix
            egl_rotate_f (30.0, 1.0, 0.0, 0.0)

            egl_push_matrix
            egl_translate_f (-0.80, 0.35, 0.0)
            egl_rotate_f (100.0, 1.0, 0.0, 0.0)
            egl_material_fv (Gl_front, Gl_diffuse, torus_diffuse)
            glut_solid_torus (0.275, 0.85, 16, 16)
            egl_pop_matrix

            egl_push_matrix
            egl_translate_f (-0.75, -0.50, 0.0)
            egl_rotate_f (45.0, 0.0, 0.0, 1.0)
            egl_rotate_f (45.0, 1.0, 0.0, 0.0)
            egl_material_fv (Gl_front, Gl_diffuse, cube_diffuse)
            glut_solid_cube (1.5)
            egl_pop_matrix

            egl_push_matrix
            egl_translate_f (0.75, 0.60, 0.0)
            egl_rotate_f (30.0, 1.0, 0.0, 0.0)
            egl_material_fv (Gl_front, Gl_diffuse, sphere_diffuse)
            glut_solid_sphere (1.0, 16, 16)
            egl_pop_matrix

            egl_push_matrix
            egl_translate_f (0.70, -0.90, 0.25)
            egl_material_fv (Gl_front, Gl_diffuse, octa_diffuse)
            glut_solid_octahedron
            egl_pop_matrix

            egl_pop_matrix
        end

    Ac_size: INTEGER = 8

    jitter: ARRAY [REAL]
            -- An array defining 8 jitter points (x, y)
        once
            Result := <<-0.334818,  0.435331,
                         0.286438, -0.393495,
                         0.459462,  0.141540,
                        -0.414498, -0.192829,
                        -0.183790,  0.082102,
                        -0.079263, -0.317383,
                         0.102254,  0.299133,
                         0.164216, -0.054399>>
        end

end
