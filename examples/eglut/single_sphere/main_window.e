note
    description: "Main window of the single_sphere application"
    application: "single_sphere"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class MAIN_WINDOW

inherit
    EGLUT_TOP_LEVEL_WINDOW
        redefine
            init,
            on_display,
            on_reshape,
            on_mouse,
            on_keyboard,
            on_visibility
        end

creation
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            mat_specular: ARRAY [REAL]
            light_position: ARRAY [REAL]
        do
            subscribe_to_reshape_events
            subscribe_to_mouse_events
            subscribe_to_keyboard_events
            subscribe_to_visibility_events
            subscribe_to_entry_events
            subscribe_to_motion_events
            subscribe_to_passive_motion_events
            subscribe_to_special_events

--          glut_init_displaymode (Glut_double + Glut_rgb + Glut_depth)

            diffuse_material := <<0.5, 0.5, 0.5, 1.0>>
            mat_specular := <<1.0, 1.0, 1.0, 1.0>>
            light_position := <<1.0, 1.0, 0.0, 0.0>>

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_smooth)
            egl_enable (Gl_depth_test)
            egl_material_fv (Gl_front, Gl_diffuse, diffuse_material)
            egl_material_fv (Gl_front, Gl_specular, mat_specular)
            egl_material_f (Gl_front, Gl_shininess, 25.0)
            egl_light_fv (Gl_light0, Gl_position, light_position)
            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)

            egl_color_material (Gl_front, Gl_diffuse)
            egl_enable (Gl_color_material)
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            precursor
            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
                glut_solid_sphere (1.0, 80, 64)
            egl_flush
--          glut_set_window (id)
--          glut_swap_buffers
        end

    on_reshape (width, height: INTEGER)
            -- The window has been reshaped
        do
            precursor (width, height)
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            if width <= height then
                egl_ortho (-1.5, 1.5, -1.5 * height / width,
                            1.5 * height / width, -10.0, 10.0)
            else
                egl_ortho (-1.5 * width / height, 1.5 * width / height,
                           -1.5, 1.5, -10.0, 10.0)
            end
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
--          glut_set_window (id)
--          glut_swap_buffers
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
            -- A keboard event has been recieved
        do
            precursor (char, modifier, x, y)
            if char.code = 27 then
                print ("I want to exit!")
                quit (0)
            end
        end

    on_mouse (button, state, x, y: INTEGER)
            -- A mouse event has been recieved
        do
            precursor (button, state, x, y)
            if button = Glut_left_button and then state = Glut_down then
                diffuse_material.put (diffuse_material @ 1 + 0.1, 1)
                if diffuse_material @ 1 > 1.0 then
                    diffuse_material.put (0.0, 1)
                end
                egl_color_4fv (diffuse_material)
                glut_post_redisplay
            elseif button = Glut_middle_button and then state = Glut_down then
                diffuse_material.put (diffuse_material @ 2 + 0.1, 2)
                if diffuse_material @ 2 > 1.0 then
                    diffuse_material.put (0.0, 2)
                end
                egl_color_4fv (diffuse_material)
                glut_post_redisplay
            elseif button = Glut_right_button and then state = Glut_down then
                diffuse_material.put (diffuse_material @ 3 + 0.1, 3)
                if diffuse_material @ 3 > 1.0 then
                    diffuse_material.put (0.0, 3)
                end
                egl_color_4fv (diffuse_material)
                glut_post_redisplay
            end
        end

    on_visibility (state: INTEGER)
        do
            precursor (state)
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    diffuse_material: ARRAY [REAL]
            -- Diffuse material

end
