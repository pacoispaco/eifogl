note
    description: "Wrapping of the tga_info C structure"
    library: "EiffelOpenGL"
    platform: "All"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class TGA_INFO_STRUCTURE

inherit
    C_STRUCTURE

create
    make

feature -- Access

    id_len: INTEGER
        do
            Result := c_id_len (pointer)
        end

    map_t: INTEGER
        do
            Result := c_map_t (pointer)
        end

    img_t: INTEGER
        do
            Result := c_img_t (pointer)
        end

    map_first_entry: INTEGER
        do
            Result := c_map_first_entry (pointer)
        end

    map_len: INTEGER
        do
            Result := c_map_len (pointer)
        end

    map_entry_size: INTEGER
        do
            Result := c_map_entry_size (pointer)
        end

    x: INTEGER
        do
            Result := c_x (pointer)
        end

    y: INTEGER
        do
            Result := c_y (pointer)
        end

    width: INTEGER
        do
            Result := c_width (pointer)
        end

    height: INTEGER
        do
            Result := c_height (pointer)
        end

    depth: INTEGER
        do
            Result := c_depth (pointer)
        end

    desc: INTEGER
        do
            Result := c_desc (pointer)
        end

    structure_size: INTEGER
        do
            Result := c_structure_size
        end

feature -- Status setting

    set_id_len (i: INTEGER)
        do
            c_set_id_len (pointer, i)
        end

    set_map_t (i: INTEGER)
        do
            c_set_map_t (pointer, i)
        end

    set_img_t (i: INTEGER)
        do
            c_set_img_t (pointer, i)
        end

    set_map_first_entry (i: INTEGER)
        do
            c_set_map_first_entry (pointer, i)
        end

    set_map_len (i: INTEGER)
        do
            c_set_map_len (pointer, i)
        end

    set_map_entry_size (i: INTEGER)
        do
            c_set_map_entry_size (pointer, i)
        end

    set_x (i: INTEGER)
        do
            c_set_x (pointer, i)
        end

    set_y (i: INTEGER)
        do
            c_set_y (pointer, i)
        end

    set_width (i: INTEGER)
        do
            c_set_width (pointer, i)
        end

    set_height (i: INTEGER)
        do
            c_set_height (pointer, i)
        end

    set_depth (i: INTEGER)
        do
            c_set_depth (pointer, i)
        end

    set_desc (i: INTEGER)
        do
            c_set_desc (pointer, i)
        end

feature {NONE} -- Implementation

    c_structure_size: INTEGER
        external
            "C [macro %"etga.h%"] ():long"
        alias
            "sizeof(struct tga_info)"
        end

    c_id_len (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_id_len"
        end

    c_set_id_len (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_id_len"
        end

    c_map_t (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_map_t"
        end

    c_set_map_t (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_map_t"
        end

    c_img_t (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_img_t"
        end

    c_set_img_t (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_img_t"
        end

    c_map_first_entry (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_map_first_entry"
        end

    c_set_map_first_entry (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_map_first_entry"
        end

    c_map_len (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_map_len"
        end

    c_set_map_len (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_map_len"
        end

    c_map_entry_size (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_map_entry_size"
        end

    c_set_map_entry_size (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_map_entry_size"
        end

    c_x (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_x"
        end

    c_set_x (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_x"
        end

    c_y (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_y"
        end

    c_set_y (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_y"
        end

    c_width (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_width"
        end

    c_set_width (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_width"
        end

    c_height (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_16"
        alias
            "c_height"
        end

    c_set_height (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_16)"
        alias
            "c_set_height"
        end

    c_depth (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_depth"
        end

    c_set_depth (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_depth"
        end

    c_desc (p: POINTER): INTEGER
        external
            "C [macro %"etga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "c_desc"
        end

    c_set_desc (p: POINTER; i: INTEGER)
        external
            "C [macro %"etga.h%"] (tga_info_ptr, tga_uint_8)"
        alias
            "c_set_desc"
        end

end
