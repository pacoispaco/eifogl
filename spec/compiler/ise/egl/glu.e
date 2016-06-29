note
    description: "Raw wrapper class for the OpenGL GLU library."
    library: "EGL - Eiffel wrapping of OpenGL"
    compilers: "ISE 5.2"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class GLU

feature -- OpenGL glu API.

    glu_ortho_2d (left, right, bottom, top: DOUBLE)
        external
            "C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "gluOrtho2D"
        end

    c_glu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: POINTER)
        external
            "C [macro <glu.h>] (GLenum, GLint, GLsizei, GLsizei, GLenum, GLenum, const void *)"
        alias
            "gluBuild2DMipmaps"
        end

    c_glu_build_2D_mipmaps_data: PIXEL_DATA_MAP
            -- We need to keep a reference to the Pixel Data Map so
            -- that it and its memory segment aren't garbage collected!

    glu_build_2D_mipmaps (target, internal_format, width, height, format, type: INTEGER; data: PIXEL_DATA_MAP)
        do
            c_glu_build_2D_mipmaps_data := data
            c_glu_build_2D_mipmaps (target, internal_format, width, height, format, type, data.pointer)
        end

    glu_new_quadric: POINTER
        external
            "C [macro <glu.h>] (): GLUquadricObj *"
        alias
            "gluNewQuadric()"
        end

    glu_quadric_draw_style (qobj: POINTER; draw_style: INTEGER)
        external
            "C [macro <glu.h>] (GLUquadric *, GLenum)"
        alias
            "gluQuadricDrawStyle"
        end

    glu_quadric_orientation (qobj: POINTER; orientation: INTEGER)
        external
            "C [macro <glu.h>] (GLUquadric *, GLenum)"
        alias
            "gluQuadricOrientation"
        end

    glu_quadric_normals (qobj: POINTER; normals: INTEGER)
        external
            "C [macro <glu.h>] (GLUquadric *, GLenum)"
        alias
            "gluQuadricNormals"
        end

    glu_delete_quadric (qobj: POINTER)
        external
            "C [macro <glu.h>] (GLUquadric *)"
        alias
            "gluDeleteQuadric"
        end

    glu_cylinder (qobj: POINTER; base_radius, top_radius, height: DOUBLE; slices, stacks: INTEGER)
        external
            "C [macro <glu.h>] (GLUquadric *, GLdouble, GLdouble, GLdouble, GLint, GLint)"
        alias
            "gluCylinder"
        end

    glu_sphere (qobj: POINTER; radius: DOUBLE; slices, stacks: INTEGER)
        external
            "C [macro <glu.h>] (GLUquadric *, GLdouble, GLint, GLint)"
        alias
            "gluSphere"
        end

    glu_perspective (fov_y, aspect, z_near, z_far: DOUBLE)
        external
            "C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "gluPerspective"
        end

    glu_look_at (eyex, eyey, eyez, centerx, centery, centerz, upx, upy, upz: DOUBLE)
        external
            "C [macro <glu.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "gluLookAt"
        end

    glu_error_string (i: INTEGER): POINTER
        external
            "C [macro <glu.h>] (int): static char *"
        alias
            "gluErrorString"
        end

    glu_new_nurbs_renderer: POINTER
        external
            "C [macro <glu.h>] (): GLUnurbsObj *"
        alias
            "gluNewNurbsRenderer()"
        end

    glu_nurbs_property (nurb: POINTER; property: INTEGER; value: DOUBLE)
        external
            "C [macro <glu.h>] (GLUnurbsObj *, GLenum, GLfloat)"
        alias
            "gluNurbsProperty"
        end

    glu_begin_surface (nurb: POINTER)
        external
            "C [macro <glu.h>] (GLUnurbsObj *)"
        alias
            "gluBeginSurface"
        end

    glu_end_surface (nurb: POINTER)
        external
            "C [macro <glu.h>] (GLUnurbsObj *)"
        alias
            "gluEndSurface"
        end

    glu_nurbs_surface (nurb: POINTER;
                u_knot_count: INTEGER; u_knot: POINTER;
                v_knot_count: INTEGER; v_knot: POINTER;
                u_knot_stride, v_knot_stride: INTEGER;
                ctl_array: POINTER;
                u_order, v_order: INTEGER;
                type: INTEGER)
        external
            "C [macro <glu.h>] (GLUnurbsObj *, GLint, GLfloat *, GLint, GLfloat *, GLint, GLint, GLfloat *, GLint, GLint, GLenum)"
        alias
            "gluNurbsSurface"
        end

feature {EGLU} -- EGLU NURBS C interface

    eglu_init_nurbs_api (eglu: EGLU)
            -- Initialize the GLU NURBS C API. The Eiffel object
            -- `eglu' is needed to pass over to the C interface so
            -- that it can make qualified calls back to Eiffel.
        require
            eglu_not_void: eglu /= Void
        do
            eglu_set_nurbs_object (ceif_adopt (eglu))
        end

    frozen eglu_set_nurbs_object (p: POINTER)
            -- Set the EGLU_NURBS object in the EGLU NURBS C
            -- interface.
        external
            "C [macro <eglu_nurbs.h>] (EIF_OBJ)"
        end

    eglu_set_nurbs_error_callback_function (nurb: POINTER)
            -- Set the the GLU NURBS error callback function
        external
            "C [macro <eglu_nurbs.h>] (GLUnurbsObj *)"
        alias
            "eglu_set_nurbs_error_callback_function"
        end

    eglu_set_nurbs_error_callback_function_to_null (nurb: POINTER)
            -- Set the the GLU NURBS error callback function
        external
            "C [macro <eglu_nurbs.h>] (GLUnurbsObj *)"
        alias
            "eglu_set_nurbs_error_callback_function_to_null"
        end

feature {NONE} -- Implementation (CECIL stuff)

    ceif_adopt (object: ANY): POINTER
        external
            "C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
        alias
            "eif_adopt"
        end

end
