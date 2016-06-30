note
    description: "Raw wrapper class for GLUT"
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class GLUT

inherit
    ARGUMENTS
        export
            {NONE} all
            {GLUT} deep_twin,
                   is_deep_equal,
                   standard_is_equal
        end

feature -- Raw GLUT API

    glut_init (argcp, argv: POINTER)
        external
            "C [macro <glut.h>] (int *, char **)"
        alias
            "glutInit"
        end

    glut_full_screen
        external
            "C [macro <glut.h>]"
        alias
            "glutFullScreen()"
        end

    glut_init_display_mode (mode: INTEGER)
        external
            "C [macro <glut.h>] (int)"
        alias
            "glutInitDisplayMode"
        end

    glut_init_window_size (width, height: INTEGER)
        external
            "C [macro <glut.h>] (int, int)"
        alias
            "glutInitWindowSize"
        end

    glut_init_window_position (x, y: INTEGER)
        external
            "C [macro <glut.h>] (int, int)"
        alias
            "glutInitWindowPosition"
        end

    glut_create_window (title: POINTER): INTEGER
        external
            "C [macro <glut.h>] (const char *): int"
        alias
            "glutCreateWindow"
        end

    glut_create_sub_window (win, x, y, width, height: INTEGER): INTEGER
        external
            "C [macro <glut.h>] (int, int, int, int, int): int"
        alias
            "glutCreateSubWindow"
        end

    glut_get_window: INTEGER
        external
            "C [macro <glut.h>]: int"
        alias
            "glutGetWindow()"
        end

    glut_set_window (i: INTEGER)
        external
            "C [macro <glut.h>] (int)"
        alias
            "glutSetWindow"
        end

    glut_position_window (x, y: INTEGER)
        external
            "C [macro <glut.h>] (int, int)"
        alias
            "glutPositionWindow"
        end

    glut_reshape_window (width, height: INTEGER)
        external
            "C [macro <glut.h>] (int, int)"
        alias
            "glutReshapeWindow"
        end

    glut_post_redisplay
        external
            "C [macro <glut.h>] ()"
        alias
            "glutPostRedisplay()"
        end

    glut_get_modifiers: INTEGER
        external
            "C [macro <glut.h>] (): int"
        alias
            "glutGetModifiers ()"
        end

    glut_report_errors
        external
            "C [macro <glut.h>] ()"
        alias
            "glutReportErrors()"
        end

    glut_main_loop
        external
            "C [macro <glut.h>] ()"
        alias
            "glutMainLoop()"
        end

    glut_solid_sphere (radius: DOUBLE; slices, stacks: INTEGER)
        external
            "C [macro <glut.h>] (GLdouble, GLint, GLint)"
        alias
            "glutSolidSphere"
        end

    glut_wire_sphere (radius: DOUBLE; slices, stacks: INTEGER)
        external
            "C [macro <glut.h>] (GLdouble, GLint, GLint)"
        alias
            "glutWireSphere"
        end

    glut_solid_cube (size: DOUBLE)
        external
            "C [macro <glut.h>] (GLdouble)"
        alias
            "glutSolidCube"
        end

    glut_wire_cube (size: DOUBLE)
        external
            "C [macro <glut.h>] (GLdouble)"
        alias
            "glutWireCube"
        end

    glut_solid_torus (inner_radius, outer_radius: DOUBLE; nsides, rings: INTEGER)
        external
            "C [macro <glut.h>] (GLdouble, GLdouble, GLint, GLint)"
        alias
            "glutSolidTorus"
        end

    glut_solid_octahedron
        external
            "C [macro <glut.h>] ()"
        alias
            "glutSolidOctahedron()"
        end

    glut_solid_teapot (size: DOUBLE)
        external
            "C [macro <glut.h>] (GLdouble)"
        alias
            "glutSolidTeapot"
        end

    glut_swap_buffers
        external
            "C [macro <glut.h>] ()"
        alias
            "glutSwapBuffers()"
        end

    glut_set_color (index: INTEGER; red, green, blue: REAL)
        external
            "C [macro <glut.h>] (GLint, GLfloat, GLfloat, GLfloat)"
        alias
            "glutSetColor"
        end

feature -- EGLUT C interface

    eglut_quit (i: INTEGER)
        external
            "C [macro <eglut.h>] (int)"
        alias
            "eglut_quit"
        end

feature {EGLUT_APPLICATION} -- EGLUT C interface

    eglut_init (app: EGLUT_APPLICATION)
            -- Initialize the GLUT library. The Eiffel object `app'
            -- is needed to pass over the C interface so that it
            -- can make qualified calls back to Eiffel.
            -- Note that GLUT library extracts any command line
            -- options intended for the GLUT library, and will
            -- modify both `argcp' and `argv'. Nice isn't it!? X
            -- Window specific command line options are:
            -- -display DISPLAY
            -- -geometry WxH+X+Y
            -- -iconic
            -- -indirect
            -- -direct
            -- -gldebug
            -- -sync
        require
            app_not_void: app /= Void
        local
            i: INTEGER
            a: ANY
        do
            i := argument_count + 1
            a := argument_array.to_c
            glut_init ($i, $a)
            eglut_set_application_object (ceif_adopt (app))
        end

    frozen eglut_set_application_object (p: POINTER)
            -- Set the application object in the EGLUT C interface
        external
            "C [macro <eglut.h>] (EIF_OBJ)"
        end

feature {EGLUT_TOP_LEVEL_WINDOW} -- EGLUT C interface

    eglut_create_window (title: STRING):INTEGER
            -- Create a top level window with the given `title'.
        require
            title_not_void: title /= Void
        local
            a: ANY
        do
            a := title.to_c
            Result := glut_create_window ($a)
        end

feature {EGLUT_WINDOW} -- EGLUT C interface

    eglut_set_display_func
            -- Set the the display callback function
        external
            "C [macro  <eglut.h>]"
        alias
            "eglut_set_display_func"
        end

    eglut_set_reshape_func
            -- Set the the reshape callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_keyboard_func
            -- Set the the keyboard callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_motion_func
            -- Set the the motion callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_passive_motion_func
            -- Set the the passive_motion callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_mouse_func
            -- Set the the mouse callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_visibility_func
            -- Set the the visibility callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_entry_func
            -- Set the the entry callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_special_func
            -- Set the the special callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_idle_func
            -- Set the the idle callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_reshape_func_to_null
            -- Set the the reshape callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_keyboard_func_to_null
            -- Set the the keyboard callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_motion_func_to_null
            -- Set the the motion callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_passive_motion_func_to_null
            -- Set the the passive_motion callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_mouse_func_to_null
            -- Set the the mouse callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_visibility_func_to_null
            -- Set the the visibility callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_entry_func_to_null
            -- Set the the entry callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_special_func_to_null
            -- Set the the special callback function
        external
            "C [macro <eglut.h>]"
        end

    eglut_set_idle_func_to_null
            -- Set the the idle callback function
        external
            "C [macro <eglut.h>]"
        end

feature {NONE} -- Implementation (CECIL stuff)

    ceif_adopt (object: ANY): POINTER
        external
            "C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
        alias
            "eif_adopt"
        end

end
