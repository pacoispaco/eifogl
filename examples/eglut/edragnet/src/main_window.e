note
    description: "Main window of the application"
    application: "dragnet2k"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 201, 20166 Paul Cohen, see file forum.txt"

class MAIN_WINDOW

inherit
    EGLUT_TOP_LEVEL_WINDOW
        redefine
            default_height,
            default_width,
            default_window_title,
            init,
            on_idle,
            on_display,
            on_reshape,
            on_keyboard,
            on_motion
        end

    GLU

    DOUBLE_MATH

create
    make

feature {NONE} -- Initialization

    init
            -- Initialize the window
        local
            i: INTEGER
            mat_specular: ARRAY [REAL]
            mat_shininess: ARRAY [REAL]
            light_position: ARRAY [REAL]
        do
            subscribe_to_display_events
            subscribe_to_reshape_events
            subscribe_to_keyboard_events
            subscribe_to_motion_events
            subscribe_to_idle_events

            x := 0.0
            y := 0.0
            z := 0.7
            spin_x := 0.0
            spin_y := -50.0
            spin_z := 0.0
            disp_list := 1
            material := False
            anim := True
            spin := False

            mat_specular := <<0.8, 0.8, 0.8, 1.0>>
            mat_shininess := <<80.0>>
            light_position := <<-3.0, 0.0, 1.5, 1.0>>

            egl_clear_color (0.0, 0.0, 0.0, 0.0)
            egl_shade_model (Gl_smooth)
            egl_enable (Gl_depth_test)

            egl_material_fv (Gl_front, Gl_specular, mat_specular)
            egl_material_fv (Gl_front, Gl_shininess, mat_shininess)
            egl_light_fv (Gl_light0, Gl_position, light_position)
            egl_enable (Gl_lighting)
            egl_enable (Gl_light0)

            from
                i := 0
            until
                i = Animlen
            loop
                print ("Calling init_display_list (")
                print (i)
                print (")%N")
                init_display_list (i)
                i := i + 1
            end
        end

feature -- Access (Metrics)

    default_width: INTEGER
            -- Default width
        once
            Result := 500
        end

    default_height: INTEGER
            -- Default height
        once
            Result := 500
        end

    default_window_title: STRING
            -- Default window title
        once
            Result := "EGLUT demo application: dragnet2k"
        end

feature {NONE} -- Implementation (GLUT callbacks)

    on_display
            -- The window has been displayed
        do
            egl_clear (Gl_color_buffer_bit + Gl_depth_buffer_bit)
            egl_push_matrix
            egl_rotate_d (spin_y, 1.0, 0.0, 0.0)
            egl_rotate_d (spin_x, 0.0, 1.0, 0.0)
            egl_rotate_d (spin_z, 0.0, 0.0, 1.0)
            egl_call_list (disp_list)
            egl_pop_matrix
            egl_finish
            glut_swap_buffers
        end

    on_reshape (width, height: INTEGER)
            -- The window has been reshaped
        do
            egl_viewport (0, 0, width, height)
            egl_matrix_mode (Gl_projection)
            egl_load_identity
            glu_perspective (60.0, width / height, 1.0, 20.0)
            egl_matrix_mode (Gl_modelview)
            egl_load_identity
            egl_translate_f (0.0, 0.0, -3.5)
        end

    on_keyboard (char: CHARACTER; modifier, x_pos, y_pos: INTEGER)
            -- A keboard event has been recieved
        do
            if char.code = 27 then
                quit (0)
            end
            if char.code = ('1').code then
                x := x - 1.0
            end
            if char.code = ('2').code then
                x := 0.0
            end
            if char.code = ('3').code then
                x := x + 1.0
            end
            if char.code = ('q').code then
                y := y - 1.0
            end
            if char.code = ('w').code then
                y := 0.0
            end
            if char.code = ('e').code then
                y := y + 1.0
            end
            if char.code = ('a').code then
                z := z - 1.0
            end
            if char.code = ('s').code then
                z := 0.0
            end
            if char.code = ('d').code then
                z := z + 1.0
            end
            if char.code = ('x').code then
                anim := not anim
            end
            if char.code = ('z').code then
                spin := not spin
            end
        end

    on_motion (x_pos, y_pos: INTEGER)
            -- The mouse has moved within the window while at least
            -- one of the mouse buttons was pressed
        do
            x := 0.0
            y := 0.0
            spin_x := x_pos
            spin_y := y_pos
        end

    on_idle
        do
            if spin then
                spin_x := spin_x + x
                if spin_x >= 360.0 then
                    spin_x := spin_x - 360.0
                end
                spin_y := spin_y + y
                if spin_y >= 360.0 then
                    spin_y := spin_y -360.0
                end
                spin_z := spin_z + z
                if spin_z >= 360.0 then
                    spin_z := spin_z -360.0
                end
            end

            if anim then
                disp_list := disp_list - 1
                if disp_list = 0 then
                    disp_list := Animlen
                end
            end

            glut_post_redisplay
        end

feature {NONE} -- Implementation

    init_display_list (animate: INTEGER)
            -- Initialize the display list. (animate = anim in c code)
        local
            i, j, k: INTEGER
            xx, yy, zz: DOUBLE
            temp: DOUBLE
            v1, v2, normal: ARRAY [DOUBLE]
            point: POINT_3D
        do
            from
                yy := Startcoord
                j := 1
            until
                j = Points_per_side + 1
            loop
                from
                    xx := - Startcoord
                    k := 1
                until
                    k = Points_per_side + 1
                loop
                    !! point
                    point.set_x (xx)
                    point.set_y (yy)

                    debug ("trace_values")
                        ptf.put_string ("j = ")
                        ptf.put_string (j.out)
                        ptf.put_string (", k = ")
                        ptf.put_string (k.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  xx = ")
                        ptf.put_string (xx.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  yy = ")
                        ptf.put_string (yy.out)
                        ptf.put_string ("%N")
                        temp := sqrt (xx*Space*xx*Space + yy*Space*yy*Space)
                        ptf.put_string ("sqrt (xx*Space*xx*Space + yy*Space*yy*Space) = ")
                        ptf.put_string (temp.out)
                        ptf.put_string ("%N")
                        temp := animate * 2.0 * Pi / Animlen
                        ptf.put_string ("animate * 2.0 * Pi / Animlen = ")
                        ptf.put_string (temp.out)
                        ptf.put_string ("%N")
                        temp := sine (0.1 * temp)
                        ptf.put_string ("sine (0.1 * temp) = ")
                        ptf.put_string (temp.out)
                        ptf.put_string ("%N")
                    end

                    zz := 0.30 * sine (0.1 * sqrt (xx*Space*xx*Space + yy*Space*yy*Space) +
                              (animate * 2.0 * Pi / Animlen))
                    point.set_z (zz)

                    debug ("trace_values")
                        ptf.put_string ("  zz = ")
                        ptf.put_string (zz.out)
                        ptf.put_string ("%N")
                    end

                    points.put (point, k, j)

                    xx := xx + Edgelen
                    k := k + 1
                end
                yy := yy - Edgelen
                j := j + 1
            end

            egl_new_list (animate + 1, Gl_compile)
            reset_material

            from
                j := 1
            until
                j = Points_per_side
            loop
                from
                    i := 1
                until
                    i = Points_per_side
                loop
                    change_material
                    egl_begin (Gl_quads)

                    !! v1.make (1, 3)
                    !! v2.make (1, 3)
                    !! normal.make (1, 3)

                    -- Do the normal vector
                    v1.put (points.item (j, i).x - points.item (j+1, i).x, 1)
                    v1.put (points.item (j, i).y - points.item (j+1, i).y, 2)
                    v1.put (points.item (j, i).z - points.item (j+1, i).z, 3)

                    v2.put (points.item (j+1, i+1).x - points.item (j+1, i).x, 1)
                    v2.put (points.item (j+1, i+1).y - points.item (j+1, i).y, 2)
                    v2.put (points.item (j+1, i+1).z - points.item (j+1, i).z, 3)

                    normal := norm_cross_prod (v1, v2, normal)
                    egl_normal_3dv (normal)

                    debug ("trace_display_list")
                        ptf.put_string ("Display list no ")
                        ptf.put_string ((animate + 1).out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  Gl_quad vertexes for j=")
                        ptf.put_string (j.out)
                        ptf.put_string (", i=")
                        ptf.put_string (i.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  points.item (j, i).x, points.item (j, i).y, points.item (j, i).z%N")
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i).x.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i).y.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i).z.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  points.item (j+1, i).x, points.item (j+1, i).y, points.item (j+1, i).z%N")
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i).x.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i).y.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i).z.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  points.item (j+1, i+1).x, points.item (j+1, i+1).y, points.item (j+1, i+1).z%N")
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i+1).x.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i+1).y.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j+1, i+1).z.out)
                        ptf.put_string ("%N")
                        ptf.put_string ("  points.item (j, i+1).x, points.item (j, i+1).y, points.item (j, i+1).z%N")
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i+1).x.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i+1).y.out)
                        ptf.put_string ("             ")
                        ptf.put_string (points.item (j, i+1).z.out)
                        ptf.put_string ("%N")
                    end

                    -- Vertexes
                    egl_vertex_3d (points.item (j, i).x,
                              points.item (j, i).y,
                              points.item (j, i).z)
                    egl_vertex_3d (points.item (j+1, i).x,
                              points.item (j+1, i).y,
                              points.item (j+1, i).z)
                    egl_vertex_3d (points.item (j+1, i+1).x,
                              points.item (j+1, i+1).y,
                              points.item (j+1, i+1).z)
                    egl_vertex_3d (points.item (j, i+1).x,
                              points.item (j, i+1).y,
                              points.item (j, i+1).z)
                    egl_end

                    i := i + 1
                end
                j := j + 1
            end
            egl_end_list
        end

    normalize (v: ARRAY [DOUBLE])
        require
            v_not_void: v /= Void
            v_has_3_items: v.count = 3
        local
            d: DOUBLE
        do
            d := sqrt (v @ 1 * v @ 1 + v @ 2 * v @ 2 + v @ 3 * v @ 3)
            if d > 0.0 then
                v.put (v @ 1 / d, 1)
                v.put (v @ 2 / d, 2)
                v.put (v @ 3 / d, 3)
            end
        end

    norm_cross_prod (v1, v2, res: ARRAY [DOUBLE]): ARRAY [DOUBLE]
        require
            v1_not_void: v1 /= Void
            v1_has_3_items: v1.count = 3
            v2_not_void: v2 /= Void
            v2_has_3_items: v2.count = 3
            res_not_void: res/= Void
        do
            res.put ((v1 @ 2) * (v2 @ 3) - (v1 @ 3) * (v2 @ 2), 1)
            res.put ((v1 @ 3) * (v2 @ 1) - (v1 @ 1) * (v2 @ 3), 2)
            res.put ((v1 @ 1) * (v2 @ 2) - (v1 @ 2) * (v2 @ 1), 3)
            normalize (res)
            Result := res
        end

    change_material
        do
            if material then
                egl_material_fv (Gl_front_and_back, Gl_ambient_and_diffuse, material_1)
            else
                egl_material_fv (Gl_front_and_back, Gl_ambient_and_diffuse, material_2)
            end
            material := not material
        end

    reset_material
        do
            material := False
            change_material
            material := False
        end

feature {NONE} -- Implementation (Application constants)

    Space: DOUBLE = 35.0

    Edgelen: DOUBLE = 0.08

    Points_per_side: INTEGER = 32

    startcoord: DOUBLE
        do
            Result := (Points_per_side - 1) * Edgelen / 2
        end

    Animlen: INTEGER = 100

feature {NONE} -- Implementation (Application entities)

--  points: ARRAY2 [POINT_3D]
--          -- p in dragnet2k.c
--      once
--          create Result.make (Points_per_side, Points_per_side)
--      end

    points: ARRAY_2 [POINT_3D]
        once
            create Result.make (1, Points_per_side, 1, Points_per_side)
        end

    material_1: ARRAY [REAL]
        once
            Result := <<0.1, 0.5, 0.8, 1.0>>
        end

    material_2: ARRAY [REAL]
        once
            Result := <<0.8, 0.8, 0.8, 1.0>>
        end

    spin_x: DOUBLE

    spin_y: DOUBLE

    spin_z: DOUBLE

    x: DOUBLE

    y: DOUBLE

    z: DOUBLE

    disp_list: INTEGER

    material: BOOLEAN

    anim: BOOLEAN

    spin: BOOLEAN

feature -- Debug

    ptf: PLAIN_TEXT_FILE
        once
            create Result.make_open_write ("dragnet2k.out")
        end

end
