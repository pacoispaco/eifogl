note
    description: "The OpenGL geometric drawing primitive GL_LINES"
    library: "EGL - Eiffel wrapping of OpenGL"
    compiler: "All"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

class EGL_LINES [G->NUMERIC]

inherit
    EGL_PRIMITIVE [G]
        redefine
            opengl_primitive_type
        end

create
    make_2d, make_3d, make_3d_homogeneous

feature -- Access

    opengl_primitive_type: INTEGER
            -- Type of OpenGL geometric primitive
        do
            Result := Gl_lines
        end

feature -- Miscellaneous (Contracts)

    is_valid_number_of_vertices (i: INTEGER): BOOLEAN
            -- Is `i' a valid number of vertices for this primitive?
        do
            Result := i \\ 2 = 0
        ensure then
            validated_1: Result implies (i \\ 2 = 0)
            validated_2: not Result implies not (i \\ 2 = 0)
        end

end
