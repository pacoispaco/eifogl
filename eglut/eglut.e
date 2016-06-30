note
    description: "Main wrapper class of GLUT 3.7.3. All other EGLUT_* classes%
    %except EGLUT_CONSTANTS inherit from this."
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2, SmallEiffel -0.74"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999, 2016 Paul Cohen, see file forum.txt"

class EGLUT

inherit
    EGL

feature -- Debugging sub-API

    glut_report_errors
        do
            glut_api.glut_report_errors
        end

feature -- Pre-built models sub-API

    glut_solid_sphere (radius: DOUBLE; slices, stacks: INTEGER)
            -- Render a solid sphere where
            -- `radius': Radius of the sphere
            -- `slices': The number of subdivisions around the
            --           Z-axis (similar to the lines of logitude)
            -- `stacks': The number of subdivisions along the
            --           Z-axis (similar to lines of latitude)
        do
            glut_api.glut_solid_sphere (radius, slices, stacks)
        end

    glut_wire_sphere (radius: DOUBLE; slices, stacks: INTEGER)
            -- Render a wire sphere where
            -- `radius': Radius of the sphere
            -- `slices': The number of subdivisions around the
            --           Z-axis (similar to the lines of logitude)
            -- `stacks': The number of subdivisions along the
            --           Z-axis (similar to lines of latitude)
        do
            glut_api.glut_wire_sphere (radius, slices, stacks)
        end

    glut_solid_cube (size: DOUBLE)
            -- Render a solid cube where `size' is the side of the
            -- cube.
        do
            glut_api.glut_solid_cube (size)
        end

    glut_wire_cube (size: DOUBLE)
            -- Render a wire cube where `size' is the side of the
            -- cube.
        do
            glut_api.glut_wire_cube (size)
        end

    glut_solid_torus (inner_radius, outer_radius: DOUBLE; nsides, rings: INTEGER)
            -- Render a solid torus with the given `inner_radius',
            -- `outer_radius', `nsides' and `rings'.
        do
            glut_api.glut_solid_torus (inner_radius, outer_radius, nsides, rings)
        end

    glut_solid_octahedron
            -- Render a solid octahedron.
        do
            glut_api.glut_solid_octahedron
        end

    glut_solid_teapot (size: DOUBLE)
            -- Render a solid teapot where `size': Size of the
            -- teapot.
        do
            glut_api.glut_solid_teapot (size)
        end

feature -- Basic graphics operations sub-API

    glut_swap_buffers
            -- Swap the buffers of the current window if double buffered
        do
            glut_api.glut_swap_buffers
        end

    glut_set_color (index: INTEGER; red, green, blue: REAL)
            -- Sets the color in the color map of the entry at
            -- position `index'. Note: the values of `red', `green'
            -- and `blue' are normalized to lie in the range
            -- [0.0, 1.0].
        do
            glut_api.glut_set_color (index, red, green, blue)
        end

feature -- Basic GLUT operations

    glut_init_displaymode (mode: INTEGER)
            -- Set the initial display mode. NOTA BENE! The feature
            -- name is not mispelled. There exists a constant with
            -- the name `glut_init_display_mode'!  See
            -- EGLUT_CONSTANTS for possible values on `mode'.
        do
            glut_api.glut_init_display_mode (mode)
        end

    frozen eglut_quit, quit (i: INTEGER)
            -- Quit the EGLUT application with exit code `i'. Note:
            -- The feature name `quit' is to be removed but at a
            -- later time since it will break all EGLUT example
            -- programs.
        do
            glut_api.eglut_quit (i)
        end

feature {NONE} -- Implementation

    glut_api: GLUT
            -- The raw Eiffel encapsulation of the GLUT API
        once
            create Result
        end

end
