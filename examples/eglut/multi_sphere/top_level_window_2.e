note
    description: "Second window of the application"
    application: "multi_sphere"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class TOP_LEVEL_WINDOW_2

inherit
    EGLUT_TOP_LEVEL_WINDOW
        redefine
            init,
            default_x,
            default_y,
            default_window_title,
            on_display,
            on_reshape,
            on_mouse,
            on_keyboard
        end

creation
    make

feature -- Initialization

    init
            -- Initialize the window
        local
            mat_specular: ARRAY [REAL]
            light_position: ARRAY [REAL]
        do
            subscribe_to_reshape_events
            subscribe_to_mouse_events
            subscribe_to_keyboard_events

            diffuse_material := <<0.0, 0.0, 1.0, 1.0>>
            mat_specular := <<0.5, 0.5, 0.5, 1.0>>
            light_position := <<1.0, 1.0, 1.0, 0.0>>

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_smooth)
            egl_enable (Gl_depth_test)
            egl_material_fv (Gl_front, Gl_diffuse, diffuse_material)
            egl_material_fv (Gl_front, Gl_specular, mat_specular)
            egl_material_f (Gl_front, Gl_shininess, 50.0)
            egl_light_fv (Gl_light0, Gl_position, light_position)
            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)

            -- Modifications for web bullets!
            egl_enable (Gl_light1)
            egl_light_fv (Gl_light1, Gl_ambient, <<1.0, 1.0, 1.0, 1.0>>)
            egl_light_fv (Gl_light1, Gl_position, <<0.0, 5.0, 0.0, 0.0>>)

            egl_color_material (Gl_front, Gl_diffuse)
            egl_enable (Gl_color_material)

            create sub_window.make (id, 0, 0, 100, 100)
        end

feature -- Access

    default_x: INTEGER
            -- Default x position
        once
            Result := 300
        end

    default_y: INTEGER
            -- Default y position
        once
            Result := 300
        end

    default_window_title: STRING
        once
            Result := "EGLUT window 2"
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
            glut_solid_sphere (1.0, 80, 64)
            egl_flush
        end

    on_reshape (width, height: INTEGER)
            -- The window has been reshaped
        do
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
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
            -- A keboard event has been recieved
        do
            if char.code = 27 then
                print ("I want to exit!")
                quit (0)
            end
        end

    on_mouse (button, state, x, y: INTEGER)
            -- A mouse event has been recieved
        do
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

feature -- Implementation

    diffuse_material: ARRAY [REAL]
            -- Diffuse material

    sub_window: SUB_WINDOW
            -- A sub window

end
