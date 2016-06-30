note
    description: "An OpenGL geometric drawing primitive"
    library: "EGL - Eiffel wrapping of OpenGL"
    compiler: "All"
    platforms: "All platforms that have OpenGL implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2001, 2016 Paul Cohen, see file forum.txt"

deferred class EGL_PRIMITIVE [G->NUMERIC]

inherit
    EGL
        export
            {NONE} all
            {EGL} deep_twin,
                  is_deep_equal,
                  standard_is_equal
        end

    EGL_CONSTANTS
        export
            {NONE} all
        end

feature {NONE} -- Initialization

    make (n: INTEGER)
            -- Create the geometric drawing primitive with vertices
            -- specified by `n' coordinates.
        require
            valid_number_of_coordinates: 2 <= n and n <= 4
        local
            g: G
        do
            no_of_vertice_coordinates := n
            inspect no_of_vertice_coordinates
            when 2 then
                if g.generator.is_equal ("INTEGER") then
                    vertex_draw_procedure := agent egl_vertex_2i (?, ?)
                elseif g.generator.is_equal ("INTEGER_16") then
                    vertex_draw_procedure := agent egl_vertex_2s (?, ?)
                elseif g.generator.is_equal ("REAL") then
                    vertex_draw_procedure := agent egl_vertex_2f (?, ?)
                elseif g.generator.is_equal ("DOUBLE") then
                    vertex_draw_procedure := agent egl_vertex_2d (?, ?)
                end
            when 3 then
                if g.generator.is_equal ("INTEGER") then
                    vertex_draw_procedure := agent egl_vertex_3i (?, ?, ?)
                elseif g.generator.is_equal ("INTEGER_16") then
                    vertex_draw_procedure := agent egl_vertex_3s (?, ?, ?)
                elseif g.generator.is_equal ("REAL") then
                    vertex_draw_procedure := agent egl_vertex_3f (?, ?, ?)
                elseif g.generator.is_equal ("DOUBLE") then
                    vertex_draw_procedure := agent egl_vertex_3d (?, ?, ?)
                end
            when 4 then
                if g.generator.is_equal ("INTEGER") then
                    vertex_draw_procedure := agent egl_vertex_4i (?, ?, ?, ?)
                elseif g.generator.is_equal ("INTEGER_16") then
                    vertex_draw_procedure := agent egl_vertex_4s (?, ?, ?, ?)
                elseif g.generator.is_equal ("REAL") then
                    vertex_draw_procedure := agent egl_vertex_4f (?, ?, ?, ?)
                elseif g.generator.is_equal ("DOUBLE") then
                    vertex_draw_procedure := agent egl_vertex_4d (?, ?, ?, ?)
                end
            end
            create vertices.make (1, resize_step)
            no_of_vertices := 0
        end

    make_2d
            -- Create the geometric drawing primitive with vertices
            -- specified by 2D coordinates.
        do
            make (2)
        end

    make_3d
            -- Create the geometric drawing primitive with vertices
            -- specified by 3D coordinates.
        do
            make (3)
        end

    make_3d_homogeneous
            -- Create the geometric drawing primitive with vertices
            -- specified by homogeneous 3D coordinates.
        do
            make (4)
        end

feature -- Access

    no_of_vertice_coordinates: INTEGER
            -- No of coordinates used in the vertice specifications

    vertices: ARRAY [TUPLE[G]]
            -- Vertices

    no_of_vertices: INTEGER
            -- Number of vertices specified for this primitive

    opengl_primitive_type: INTEGER
            -- Type of OpenGL geometric primitive
        deferred
        end

feature -- Status setting

    add_vertex (v: TUPLE[G])
            -- Add the vertex `v' to the vertices.
        require
            v_not_void: v /= Void
            correct_no_of_coordinates: v.count = no_of_vertice_coordinates
        do
            if no_of_vertices = vertices.count then
                vertices.resize (1, vertices.count + resize_step)
            end
            no_of_vertices := no_of_vertices + 1
            vertices.put (v, no_of_vertices)
        end

    set_vertices (av: ARRAY [TUPLE[G]])
            -- Set the vertices to `av'.
        require
            av_not_void: av /= Void
            av_has_consistent_coordinates: has_consistent_coordinates (av)
            av_has_valid_number_of_vertices: is_valid_number_of_vertices (av.count)
            av_is_valid: is_valid_vertices (av)
        do
            no_of_vertices := av.count
            vertices := av
        end

feature -- Basic operations

    draw
            -- Draw the primitive.
        require
            has_vertices: no_of_vertices > 0
            has_valid_number_of_vertices: is_valid_number_of_vertices (no_of_vertices)
            has_valid_vertices: is_valid_vertices (vertices)
        local
            i: INTEGER
            g: G
        do
            egl_begin (opengl_primitive_type)
            from
                i := 1
            until
                i > no_of_vertices
            loop
                vertex_draw_procedure.call (vertices @ i)
                i := i + 1
            end
            egl_end
        end

feature -- Miscellaneous (Contracts)

    has_consistent_coordinates (v: ARRAY [TUPLE[G]]): BOOLEAN
            -- Does `v' have vertice coordinates that are consistent
            -- with this primitive? Checks if all TUPLEs in `v' have
            -- the correct number of coordinates.
        require
            v_not_void: v /= Void
        local
            i: INTEGER
        do
            from
                Result := True
                i := 1
            until
                not Result or i > v.count
            loop
                Result := (v @ i).count = no_of_vertice_coordinates
                i := i + 1
            end
        end

    is_valid_number_of_vertices (i: INTEGER): BOOLEAN
            -- Is `i' a valid number of vertices for this primitive?
        require
            i_positive: i > 0
        deferred
        end

    is_valid_vertices (v: ARRAY [TUPLE[G]]): BOOLEAN
            -- Does `v' contain semantically valid vertices for this
            -- primitive?
        do
            Result := True
        end

feature {NONE} -- Implementation

    vertex_draw_procedure: PROCEDURE [EGL, TUPLE]
            -- The function to invoke when drawing the primitive

    resize_step: INTEGER = 10
            -- Defines how much the vertices array is to be resized

end
