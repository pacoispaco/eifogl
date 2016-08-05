note
    description: "Main window"
    application: "lesson7"
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
            on_special,
            on_visibility
        end

    EGLU

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            light_ambient: ARRAY [REAL]
            light_diffuse: ARRAY [REAL]
            light_position: ARRAY [REAL]
            tga: TGA_FILE
        do
            subscribe_to_idle_events
            subscribe_to_visibility_events
            subscribe_to_reshape_events
            subscribe_to_display_events
            subscribe_to_keyboard_events
            subscribe_to_special_events

            light_ambient := <<0.5, 0.5, 0.5, 1.0>>
            light_diffuse := <<1.0, 1.0, 1.0, 1.0>>
            light_position := <<0.0, 0.0, 2.0, 1.0>>

            egl_shade_model (Gl_smooth)
            egl_clear_color (0.0, 0.0, 0.0, 0.5)
            egl_enable (Gl_color_material)
            egl_color_material (Gl_front, Gl_ambient_and_diffuse)

            -- Enable 2D texturing
            egl_enable (Gl_texture_2d)
            -- Tell OpenGL how image data is arranged
            egl_pixel_store_i (Gl_unpack_alignment, 1)

            -- Create a TGA_FILE object and read up the image in the
            -- named file to memory. We will use this image to
            -- create our textures!
            create tga.make (texture_file_name)
            tga.open_read
            tga.read_header_and_image
            print (tga.pretty_format)

            -- Let OpenGL generate a number of texture names
            -- (actually unique integer values) that we can use for
            -- our textures
            texture_names := egl_gen_textures (no_of_textures)

            -- Bind the first texture name to the current
            -- texture. All subesequent OpenGL texture commands
            -- will be applied to this named texture
            egl_bind_texture (Gl_texture_2d, texture_names @ 1)
            -- Use the fastest, but crudest, filter operation
            -- (Gl_nearest) for this texture. Use it both when the
            -- texture mapped surface is magnifed to be larger than
            -- the texture and when the texture mapped surface
            -- minimized to be smaller than the texture.
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_mag_filter, Gl_nearest)
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_min_filter, Gl_nearest)
            -- Create the OpenGL 2D texture from the tga image
            egl_tex_image_2D (Gl_texture_2D, 0, Gl_rgb, tga.image_spec_width, tga.image_spec_height, 0, Gl_rgb, Gl_unsigned_byte, tga.image_data)

            -- Bind the second texture name to the current
            -- texture.
            egl_bind_texture (Gl_texture_2d, texture_names @ 2)
            -- Use a better, but more computing intensive, filter
            -- operation (Gl_linear) for this texture. Use it both
            -- when the texture mapped surface is magnifed to be
            -- larger than the texture and when the texture mapped
            -- surface is minimized to be smaller than the texture.
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_mag_filter, Gl_linear)
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_min_filter, Gl_linear)
            -- Create the OpenGL 2D texture from the tga image
            egl_tex_image_2D (Gl_texture_2D, 0, Gl_rgb, tga.image_spec_width, tga.image_spec_height, 0, Gl_rgb, Gl_unsigned_byte, tga.image_data)

            -- Bind the third texture name to the current
            -- texture.
            egl_bind_texture (Gl_texture_2d, texture_names @ 3)
            -- We'll be using a mipmapped texture in this
            -- case. Mipmapping is good when the textured image
            -- going to be viewed from different distances. The
            -- filtering functions used for the two textures above
            -- can generate ugly aliasing effects which mipmapping
            -- handles much better. Of course, mipmapping costs,
            -- both in memory usage and computing time. We tell
            -- OpenGL to always choose the nearest mipmap and then
            -- use linear filtering for that mipmap
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_mag_filter, Gl_linear)
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_min_filter, Gl_linear_mipmap_nearest)

            -- Create the texture mipmaps from the tga image
            eglu_build_2D_mipmaps (Gl_texture_2D, Gl_rgb, tga.image_spec_width, tga.image_spec_height, Gl_rgb, Gl_unsigned_byte, tga.image_data)

            -- Bind the fourth texture name to the current
            -- texture.
            egl_bind_texture (Gl_texture_2d, texture_names @ 4)
            -- For our final texture we again use a mipmapped
            -- texture, but now we tell OpenGL to always use
            -- linear interpolation between the closest mipmaps and
            -- then use linear filtering for that mipmap. This costs
            -- most but is the most visually pleasing option!
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_mag_filter, Gl_linear)
            egl_tex_parameter_i (Gl_texture_2d, Gl_texture_min_filter, Gl_linear_mipmap_linear)

            -- Create the texture mipmaps from the tga image
            eglu_build_2D_mipmaps (Gl_texture_2D, Gl_rgb, tga.image_spec_width, tga.image_spec_height, Gl_rgb, Gl_unsigned_byte, tga.image_data)
            egl_enable (Gl_cull_face)

            egl_hint (Gl_perspective_correction_hint, Gl_nicest)

            egl_light_fv (Gl_light1, Gl_ambient, light_ambient)
            egl_light_fv (Gl_light1, Gl_diffuse, light_diffuse)
            egl_light_fv (Gl_light1, Gl_position, light_position)
            egl_enable (Gl_light1)

            current_texture_no := 1
            z := -5.0
        end

feature -- Access

    default_window_title: STRING
        once
            Result := "EGLUT: NeHe lesson7"
        end

    default_width: INTEGER = 500

    default_height: INTEGER = 500

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        local
            t1, t2: DT_TIME
        do
            t1 := system_clock.time_now

            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
            egl_load_identity

            egl_push_matrix
            egl_translate_f (0.0, 0.0, z)
            egl_rotate_f (x_rotation, 1.0, 0.0, 0.0)
            egl_rotate_f (y_rotation, 0.0, 1.0, 0.0)

            egl_bind_texture (Gl_texture_2d, texture_names @ current_texture_no)

            egl_begin (Gl_quads)

            -- Front Face
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (-1.0, -1.0, 1.0)
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (1.0, -1.0, 1.0)
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (1.0, 1.0, 1.0)
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (-1.0, 1.0, 1.0)
            -- Back Face
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (-1.0, -1.0, -1.0)
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (-1.0, 1.0, -1.0)
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (1.0, 1.0, -1.0)
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (1.0, -1.0, -1.0)
            -- Top Face
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (-1.0, 1.0, -1.0)
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (-1.0, 1.0, 1.0)
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (1.0, 1.0, 1.0)
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (1.0, 1.0, -1.0)
            -- Bottom Face
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (-1.0, -1.0, -1.0)
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (1.0, -1.0, -1.0)
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (1.0, -1.0, 1.0)
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (-1.0, -1.0, 1.0)
            -- Right face
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (1.0, -1.0, -1.0)
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (1.0, 1.0, -1.0)
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (1.0, 1.0, 1.0)
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (1.0, -1.0, 1.0)
            -- Left Face
            egl_tex_coord_2f (0.0, 0.0)
            egl_vertex_3f (-1.0, -1.0, -1.0)
            egl_tex_coord_2f (1.0, 0.0)
            egl_vertex_3f (-1.0, -1.0, 1.0)
            egl_tex_coord_2f (1.0, 1.0)
            egl_vertex_3f (-1.0, 1.0, 1.0)
            egl_tex_coord_2f (0.0, 1.0)
            egl_vertex_3f (-1.0, 1.0, -1.0)
            egl_end
            egl_pop_matrix
            x_rotation := x_rotation + x_speed
            y_rotation := y_rotation + y_speed

            glut_swap_buffers

            t2 := system_clock.time_now

            display_count := display_count + 1
            display_time := display_time + (t2.millisecond_count - t1.millisecond_count)/1000

            if display_count \\ 1000 = 0 then
                print_stats
            end
        end

    on_keyboard (char: CHARACTER; modifier, x, y: INTEGER)
        do
            inspect char
            when 't' then
                current_texture_no := current_texture_no + 1
                if current_texture_no > texture_names.count then
                    current_texture_no := 1
                end
            when 'l' then
                light_is_on := not light_is_on
                if not light_is_on then
                    egl_disable (Gl_lighting)
                else
                    egl_enable (Gl_lighting)
                end
            when 's' then
                print_stats
            when '%/27/' then -- Escape character
                quit (0)
            else
            end
        end

    on_reshape (width, height: INTEGER)
        local
            ratio: DOUBLE
        do
            if (height /= 0) then
                ratio := 1.0 * width / height
            else
                ratio := 1.0 * width
            end

            egl_matrix_mode (Gl_projection)
            egl_load_identity

            -- Set the viewport to be the entire window
            egl_viewport (0, 0, width, height)

            -- Set the clipping volume
            eglu_perspective (80, ratio, 1, 200)
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
            eglu_look_at (0, 0, 30, 0, 0, 10, 0.0, 1.0, 0.0)
        end

    on_visibility (state: INTEGER)
        do
            glut_post_redisplay
        end

    on_special (key, modifier, x, y: INTEGER)
        do
            if key = Glut_key_up then -- When Up Arrow Is Pressed ...
                x_speed := x_speed - 0.01
            elseif key = Glut_key_down then -- When Down Arrow Is Pressed ...
                x_speed := x_speed + 0.01
            elseif key = Glut_key_right then
                y_speed := y_speed + 0.01
            elseif key = Glut_key_left then
                y_speed := y_speed - 0.01
            elseif key = Glut_key_home then
                if z < -3.0 then
                    z := z + 0.1
                end
            elseif key = Glut_key_end then
                z := z - 0.1
            elseif key = Glut_key_f1 then
                glut_full_screen
            elseif key = Glut_key_f2 then
                glut_reshape_window (default_width, default_height)
            end
        end

    on_idle
        do
            glut_post_redisplay
        end

feature {NONE} -- Implementation

    no_of_textures: INTEGER = 4
            -- Number of textures used

    texture_names: ARRAY [INTEGER]
            -- Array containing the unique texture names (actually
            -- just integer values) generated by `egl_gen_textures'

    current_texture_no: INTEGER
            -- Index into `texture_names' that decides which texture
            -- to used on the cube

    x_rotation: REAL
            -- X rotation
    y_rotation: REAL
            -- Y rotation
    x_speed: REAL
            -- X rotation speed
    y_speed: REAL
            -- Y rotation speed

    z: REAL
            -- Depth into the screen where the cube is displayed

    light_is_on: BOOLEAN
            -- Is lighting turned on?

    texture_file_name: STRING
        once
            Result := "./data/crate_bgr.tga"
        end

feature -- Test & Debug

    system_clock: DT_SYSTEM_CLOCK
        once
             create Result.make
        end

    display_durations: LINKED_LIST [TIME_DURATION]
        once
            create Result.make
        end

    display_time: DOUBLE
            -- Total time spent displaying

    display_count: INTEGER
            -- Total number of displays

    print_stats
        do
            print ("**************************************%N")
            print ("Number of displays: ")
            print (display_count)
            print ("%N")
            print ("Total display time (s): ")
            print (display_time)
            print ("%N")
            print ("Frames/second: ")
            print (display_count/display_time)
            print ("%N")
        end

invariant
    consistent_no_of_textures: texture_names /= Void implies texture_names.count = no_of_textures

end
