note
    description: "Wrapping of the tga C structure"
    library: "EiffelOpenGL"
    platform: "All"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class TGA_STRUCTURE

inherit
    C_STRUCTURE

create
    make

feature -- Access

    img_id: STRING
        local
            p: POINTER
        do
            p := c_img_id (pointer)
            if p /= default_pointer then
                create Result.make_from_c (c_img_id (pointer))
            else
                Result := ""
            end
        ensure
            result_not_void: Result /= Void
        end

    img_data: POINTER
        do
            Result := c_img_data (pointer)
        end

    color_map: POINTER
        do
            Result := c_color_map (pointer)
        end

    flags: INTEGER
        do
            Result := c_flags (pointer)
        end

    sig: STRING
        local
            p: POINTER
        do
            p := c_img_id (pointer)
            if p /= default_pointer then
                create Result.make_from_c (c_sig (pointer))
            else
                Result := ""
            end
        ensure
            result_not_void: Result /= Void
        end

    io_ptr: POINTER
        do
            Result := c_io_ptr (pointer)
        end

    structure_size: INTEGER
        do
            Result := c_structure_size
        end

feature -- Status setting

    set_img_id (s: STRING)
        require
            s_not_void: s /= Void
        local
            a: ANY
        do
            a := s.to_c
            c_set_img_id (pointer, $a)
        end

    set_img_data (p: POINTER)
        require
            p_not_null: p /= default_pointer
        do
            c_set_img_data (pointer, p)
        end

    set_color_map (p: POINTER)
        require
            p_not_null: p /= default_pointer
        do
            c_set_color_map (pointer, p)
        end

    set_flags (i: INTEGER)
        do
            c_set_flags (pointer, i)
        end

    set_sig (s: STRING)
        require
            s_not_void: s /= Void
        local
            a: ANY
        do
            a := s.to_c
            c_set_sig (pointer, $a)
        end

    set_io_ptr (p: POINTER)
        require
            p_not_null: p /= default_pointer
        do
            c_set_io_ptr (pointer, p)
        end

feature {NONE} -- Implementation

    c_structure_size: INTEGER
        external
            "C [macro %"etga.h%"] ():long"
        alias
            "sizeof(struct tga)"
        end

    c_img_id (p: POINTER): POINTER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_uint_8 *"
        alias
            "c_img_id"
        end

    c_set_img_id (p: POINTER; ptri: POINTER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_uint_8 *)"
        alias
            "c_set_img_id"
        end

    c_img_data (p: POINTER): POINTER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_uint_8 *"
        alias
            "c_img_data"
        end

    c_set_img_data (p: POINTER; ptri: POINTER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_uint_8 *)"
        alias
            "c_set_img_data"
        end

    c_color_map (p: POINTER): POINTER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_uint_8 *"
        alias
            "c_color_map"
        end

    c_set_color_map (p: POINTER; ptri: POINTER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_uint_8 *)"
        alias
            "c_set_color_map"
        end

    c_flags (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_uint_32"
        alias
            "c_flags"
        end

    c_set_flags (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_uint_32)"
        alias
            "c_set_flags"
        end

    c_sig (p: POINTER): POINTER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_byte *"
        alias
            "c_sig"
        end

    c_set_sig (p: POINTER; ptri: POINTER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_byte *)"
        alias
            "c_set_sig"
        end

    c_io_ptr (p: POINTER): POINTER
        external
            "C [macro %"etga.h%"] (tga_ptr): tga_byte *"
        alias
            "c_io_ptr"
        end

    c_set_io_ptr (p: POINTER; ptri: POINTER)
        external
            "C [macro %"etga.h%"] (tga_ptr, tga_byte *)"
        alias
            "c_set_io_ptr"
        end

end
