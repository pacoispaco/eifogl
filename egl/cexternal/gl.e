note
    description: "Wrapper class for the OpenGL API"
    library: "EGL - Eiffel wrapping of OpenGL"
    compilers: "ISE 4.3, ISE 4.5, ISE 5.0 (MSVC++ 6.0)"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class GL

feature -- OpenGL API

    gl_polygon_offset (factor, units: REAL)
        external
--          "C (GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat)"
        alias
            "glPolygonOffset"
        end

    gl_edge_flag (flag: BOOLEAN)
        external
--          "C (GLboolean) | <gl.h> "
            "C [macro <gl.h>] (GLboolean)"
        alias
            "glEdgeFlag"
        end

    gl_point_size (size: REAL)
        external
--          "C (GLfloat) | <gl.h> "
            "C [macro <gl.h>] (GLfloat)"
        alias
            "glPointSize"
        end

    gl_line_width (width: REAL)
        external
--          "C (GLfloat) | <gl.h> "
            "C [macro <gl.h>] (GLfloat)"
        alias
            "glLineWidth"
        end

    gl_line_stipple (factor: INTEGER; pattern: INTEGER)
        external
--          "C (GLint, GLushort) | <gl.h> "
            "C [macro <gl.h>] (GLint, GLushort)"
        alias
            "glLineStipple"
        end

    gl_polygon_mode (face, mode: INTEGER)
        external
--          "C (GLenum, GLenum) | <gl.h> "
            "C [macro <gl.h>] (GLenum, GLenum)"
        alias
            "glPolygonMode"
        end

    c_gl_polygon_stipple (mask: POINTER)
        external
--          "C (GLubyte *) | <gl.h> "
            "C [macro <gl.h>] (GLubyte *)"
        alias
            "glPolygonStipple"
        end

    gl_polygon_stipple (mask: STRING)
        local
            a: ANY
        do
            a := mask.to_c
            c_gl_polygon_stipple ($a)
        end

    gl_get_boolean_v (pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLboolean *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLboolean *)"
        alias
            "glGetBooleanv"
        end

    gl_get_float_v (pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLfloat *)"
        alias
            "glGetFloatv"
        end

    gl_get_double_v (pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLdouble *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLdouble *)"
        alias
            "glGetDoublev"
        end

    gl_get_integer_v (pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLint *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLint *)"
        alias
            "glGetIntegerv"
        end

    gl_clear_accum (r, g, b, a: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h> "
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glClearAccum"
        end

    gl_clear_color (red, green, blue, alpha: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h> "
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glClearColor"
        end

    gl_clear_index (c: REAL)
        external
--          "C (GLfloat) | <gl.h> "
            "C [macro <gl.h>] (GLfloat)"
        alias
            "glClearIndex"
        end

    gl_clear (buffer: INTEGER)
        external
--          "C (GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint)"
        alias
            "glClear"
        end

    gl_color_3f (red, green, blue: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
        alias
            "glColor3f"
        end

    gl_color_4f (red, green, blue, alpha: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat,) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glColor4f"
        end

    gl_color_4fv (v: POINTER)
        external
--          "C (const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (const GLfloat *)"
        alias
            "glColor4fv"
        end

    gl_depth_mask (flag: INTEGER)
        external
--          "C (GLboolean) | <gl.h>"
            "C [macro <gl.h>] (GLboolean)"
        alias
            "glDepthMask"
        end

    gl_accum (op: INTEGER; value: REAL)
        external
--          "C (GLenum, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLfloat)"
        alias
            "glAccum"
        end

    gl_map_1f (target: INTEGER; u1, u2: DOUBLE; stride, order: INTEGER; points: POINTER)
        external
--          "C (GLenum, GLfloat, GLfloat, GLint, GLint, const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLfloat, GLfloat, GLint, GLint, const GLfloat *)"
        alias
            "glMap1f"
        end

    gl_eval_coord_1f (u: REAL)
        external
--          "C (GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat)"
        alias
            "glEvalCoord1f"
        end

    gl_flush
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glFlush"
            "glFlush()"
        end

    gl_hint (target, mode: INTEGER)
        external
--          "C (GLenum, GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum)"
        alias
            "glHint"
        end

    gl_vertex_2i (x, y: INTEGER)
        external
--          "C (GLint, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLint)"
        alias
            "glVertex2i"
        end

    gl_vertex_2s (x, y: INTEGER_16)
        external
--          "C (GLshort, GLshort) | <gl.h>"
            "C [macro <gl.h>] (GLshort, GLshort)"
        alias
            "glVertex2s"
        end

    gl_vertex_2f (x, y: REAL)
        external
--          "C (GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat)"
        alias
            "glVertex2f"
        end

    gl_vertex_2d (x, y: DOUBLE)
        external
--          "C (GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble)"
        alias
            "glVertex2d"
        end

    gl_vertex_3i (x, y, z: INTEGER)
        external
--          "C (GLint, GLint, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLint, GLint)"
        alias
            "glVertex3i"
        end

    gl_vertex_3s (x, y, z: INTEGER_16)
        external
--          "C (GLshort, GLshort, GLshort) | <gl.h>"
            "C [macro <gl.h>] (GLshort, GLshort, GLshort)"
        alias
            "glVertex3s"
        end

    gl_vertex_3f (x, y, z: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
        alias
            "glVertex3f"
        end

    gl_vertex_3fv (v: POINTER)
        external
--          "C (const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (const GLfloat *)"
        alias
            "glVertex3fv"
        end

    gl_vertex_3d (x, y, z: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
        alias
            "glVertex3d"
        end

    gl_vertex_3dv (v: POINTER)
        external
--          "C (const GLdouble *) | <gl.h>"
            "C [macro <gl.h>] (const GLdouble *)"
        alias
            "glVertex3dv"
        end

    gl_vertex_4i (x, y, z, w: INTEGER)
        external
--          "C (GLint, GLint, GLint, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLint, GLint, GLint)"
        alias
            "glVertex4i"
        end

    gl_vertex_4s (x, y, z, w: INTEGER_16)
        external
--          "C (GLshort, GLshort, GLshort, GLshort) | <gl.h>"
            "C [macro <gl.h>] (GLshort, GLshort, GLshort, GLshort)"
        alias
            "glVertex4s"
        end

    gl_vertex_4f (x, y, z, w: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glVertex4f"
        end

    gl_vertex_4d (x, y, z, w: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "glVertex4d"
        end

    gl_rect_f (x1, y1, x2, y2: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glRectf"
        end

    gl_front_face (mode: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glFrontFace"
        end

    gl_cull_face (mode: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glCullFace"
        end

    gl_viewport (x, y, width, height: INTEGER)
        external
--          "C (GLint, GLint, GLint, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLint, GLint, GLint)"
        alias
            "glViewport"
        end

    gl_frustum (left, right, bottom, top, near, far: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble,) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble,)"
        alias
            "glFrustum"
        end

    gl_load_identity
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glLoadIdentity"
            "glLoadIdentity()"
        end

    gl_load_matrix_f (m: POINTER)
        external
--          "C (const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (const GLfloat *)"
        alias
            "glLoadMatrixf"
        end

    gl_load_matrix_d (m: POINTER)
        external
--          "C (const GLdouble *) | <gl.h>"
            "C [macro <gl.h>] (const GLdouble *)"
        alias
            "glLoadMatrixd"
        end

    gl_mult_matrix_f (m: POINTER)
        external
--          "C (const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (const GLfloat *)"
        alias
            "glMultMatrixf"
        end

    gl_mult_matrix_d (m: POINTER)
        external
--          "C (const GLdouble *) | <gl.h>"
            "C [macro <gl.h>] (const GLdouble *)"
        alias
            "glMultMatrixd"
        end

    gl_ortho (left, right, bottom, top, near, far: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "glOrtho"
        end

    gl_shade_model (mode: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glShadeModel"
        end

    gl_enable (cap: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glEnable"
        end

    gl_disable (cap: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glDisable"
        end

    gl_enable_client_state (array: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glEnableClientState"
        end

    gl_disable_client_state (array: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glDisableClientState"
        end

    gl_vertex_pointer (size, type, stride: INTEGER; pointer: POINTER)
        external
--          "C (GLint, GLenum, GLsizei, GLvoid *) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLenum, GLsizei, GLvoid *)"
        alias
            "glVertexPointer"
        end

    gl_color_pointer (size, type, stride: INTEGER; pointer: POINTER)
        external
--          "C (GLint, GLenum, GLsizei, GLvoid *) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLenum, GLsizei, GLvoid *)"
        alias
            "glColorPointer"
        end

    gl_material_fv (face, pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLenum, const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
        alias
            "glMaterialfv"
        end

    gl_material_f (face, pname: INTEGER; param: REAL)
        external
--          "C (GLenum, GLenum, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum, GLfloat)"
        alias
            "glMaterialf"
        end

    gl_light_fv (light, pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, GLenum, const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum, const GLfloat *)"
        alias
            "glLightfv"
        end

    gl_light_model_fv (pname: INTEGER; params: POINTER)
        external
--          "C (GLenum, const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, const GLfloat *)"
        alias
            "glLightModelfv"
        end

    gl_color_material (face, mode: INTEGER)
        external
--          "C (GLenum, GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum)"
        alias
            "glColorMaterial"
        end

    gl_matrix_mode (mode: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glMatrixMode"
        end

    gl_translate_f (x, y, z: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
        alias
            "glTranslatef"
        end

    gl_translate_d (x, y, z: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
        alias
            "glTranslated"
        end

    gl_scale_f (x, y, z: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
        alias
            "glScalef"
        end

    gl_pixel_store_i (pname, param: INTEGER)
        external
--          "C (GLenum, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLint)"
        alias
            "glPixelStorei"
        end

    gl_tex_parameter_i (target, pname, param: INTEGER)
        external
--          "C (GLenum, GLenum, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum, GLint)"
        alias
            "glTexParameteri"
        end

    gl_tex_coord_2f (s, t: REAL)
        external
--          "C (GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat)"
        alias
            "glTexCoord2f"
        end

    c_gl_tex_image_2D (target, level, internal_format, witdh, height, border, format, type: INTEGER; pixels: POINTER)
        external
--          "C (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLint, GLint, GLsizei, GLsizei, GLint, GLenum, GLenum, const GLvoid *)"
        alias
            "glTexImage2D"
        end

    c_gl_tex_image_2D_pixels: PIXEL_DATA_MAP
            -- We need to keep a reference to the Pixel Data Map so
            -- that it and its memory segment aren't garbage collected!

    gl_tex_image_2D (target, level, internal_format, witdh, height, border, format, type: INTEGER; pixels: PIXEL_DATA_MAP)
        do
            c_gl_tex_image_2D_pixels := pixels
            c_gl_tex_image_2D (target, level, internal_format, witdh, height, border, format, type, pixels.pointer)
        end

    gl_bind_texture (target, texture: INTEGER)
        external
--          "C (GLenum, GLuint) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLuint)"
        alias
            "glBindTexture"
        end

    gl_gen_textures (n: INTEGER; textures: POINTER)
        external
--          "C (GLsizei, GLuint *) | <gl.h>"
            "C [macro <gl.h>] (GLsizei, GLuint *)"
        alias
            "glGenTextures"
        end

        gl_clip_plane (plane: INTEGER; e: POINTER)
                external
--                      "C (GLenum, const GLdouble *) | <gl.h>"
                        "C [macro <gl.h>] (GLenum, const GLdouble *)"
                alias
                        "glClipPlane"
                end

    gl_raster_pos_2i (x, y: INTEGER)
        external
--          "C (GLint, GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint, GLint)"
        alias
            "glRasterPos2i"
        end

    gl_bitmap (width, height: INTEGER; xbo, ybo, xbi, ybi: REAL; bitmap: POINTER)
        external
--          "C (GLsizei, GLsizei, GLfloat, GLfloat, GLfloat, GLfloat, const GLubyte *) | <gl.h>"
                "C [macro <gl.h>] (GLsizei, GLsizei, GLfloat, GLfloat, GLfloat, GLfloat, const GLubyte *)"
        alias
            "glBitmap"
        end

    gl_blend_func (sfactor, dfactor: INTEGER)
        external
--          "C (GLenum, GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLenum)"
        alias
            "glBlendFunc"
        end

    gl_gen_lists (range: INTEGER): INTEGER
        external
--          "C (GLsizei) | <gl.h>"
            "C [macro <gl.h>] (GLsizei): GLuint"
        alias
            "glGenLists"
        end

    gl_new_list (list, mode: INTEGER)
        external
--          "C (GLuint, GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLuint, GLenum)"
        alias
            "glNewList"
        end

    gl_end_list
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glEndList"
            "glEndList()"
        end

    gl_is_list (list: INTEGER): BOOLEAN
        external
--          "C (GLuint): GLboolean | <gl.h>"
            "C [macro <gl.h>] (GLuint): GLboolean"
        alias
            "glIsList"
        end

    gl_call_list (list: INTEGER)
        external
--          "C (GLuint) | <gl.h>"
            "C [macro <gl.h>] (GLuint)"
        alias
            "glCallList"
        end

    gl_call_lists (n, type: INTEGER; lists: POINTER)
        external
--          "C (GLsizei, GLenum, const GLvoid *) | <gl.h>"
            "C [macro <gl.h>] (GLsizei, GLenum, const GLvoid *)"
        alias
            "glCallLists"
        end

    gl_list_base (base: INTEGER)
        external
--          "C (GLuint) | <gl.h>"
            "C [macro <gl.h>] (GLuint)"
        alias
            "glListBase"
        end

    gl_begin (mode: INTEGER)
        external
--          "C (GLenum) | <gl.h>"
            "C [macro <gl.h>] (GLenum)"
        alias
            "glBegin"
        end

    gl_end
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glEnd"
            "glEnd()"
        end

    gl_draw_elements (mode, count, type: INTEGER; pointer: POINTER)
        external
--          "C (GLenum, GLsizei, GLenum, void *) | <gl.h>"
            "C [macro <gl.h>] (GLenum, GLsizei, GLenum, void *)"
        alias
            "glDrawElements"
        end

    gl_finish
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glFinish"
            "glFinish()"
        end

    gl_index_i (c: INTEGER)
        external
--          "C (GLint) | <gl.h>"
            "C [macro <gl.h>] (GLint)"
        alias
            "glIndexi"
        end

    gl_normal_3f (nx, ny, nz: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat)"
        alias
            "glNormal3f"
        end

    gl_normal_3fv (p: POINTER)
        external
--          "C (const GLfloat *) | <gl.h>"
            "C [macro <gl.h>] (const GLfloat *)"
        alias
            "glNormal3fv"
        end

    gl_normal_3d (nx, ny, nz: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble)"
        alias
            "glNormal3d"
        end

    gl_normal_3dv (p: POINTER)
        external
--          "C (const GLdouble *) | <gl.h>"
            "C [macro <gl.h>] (const GLdouble *)"
        alias
            "glNormal3dv"
        end

    gl_push_matrix
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glPushMatrix"
            "glPushMatrix()"
        end

    gl_pop_matrix
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glPopMatrix"
            "glPopMatrix()"
        end

    gl_push_attrib (mask: INTEGER)
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] (GLbitfield)"
        alias
--          "glPushAttrib"
            "glPushAttrib"
        end

    gl_pop_attrib
        external
--          "C | <gl.h>"
            "C [macro <gl.h>] ()"
        alias
--          "glPopAttrib"
            "glPopAttrib()"
        end

    gl_rotate_f (angle, x, y, z: REAL)
        external
--          "C (GLfloat, GLfloat, GLfloat, GLfloat) | <gl.h>"
            "C [macro <gl.h>] (GLfloat, GLfloat, GLfloat, GLfloat)"
        alias
            "glRotatef"
        end

    gl_rotate_d (angle, x, y, z: DOUBLE)
        external
--          "C (GLdouble, GLdouble, GLdouble, GLdouble) | <gl.h>"
            "C [macro <gl.h>] (GLdouble, GLdouble, GLdouble, GLdouble)"
        alias
            "glRotated"
        end

    gl_get_error: INTEGER
        external
--          "C : GLenum | <gl.h>"
            "C [macro <gl.h>] (): GLenum"
        alias
--          "glGetError"
            "glGetError()"
        end

    gl_get_string (name: INTEGER): POINTER
        external
--          "C (GLenum): GLubyte* | <gl.h>"
            "C [macro <gl.h>] (GLenum): GLubyte*"
        alias
            "glGetString"
        end

end

--| begin documentation
--| There is currently a problem with the ISE 4.3 and 4.5
--| versions of bench. If external features are declared
--| as proper external C functions the application will
--| not behave well when run in bench. It will compile
--| and run nicely in finalized mode but it is difficult
--| to debug and test if one cannot run the application
--| in frozen bench mode! :-( Therefore all external C
--| function calls are temporarily changed to external
--| C macros, which seems to work fine in both frozen
--| and finalized mode.
--| end documentation


