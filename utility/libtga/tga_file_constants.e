note
    description: "libtga constants"
    library: "EiffelOpenGL utility/libtga"
    platform: "All"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class TGA_FILE_CONSTANTS

feature -- Access (TGA File type constants)

    Tga_no_image_data_included: INTEGER = 0
    Tga_uncompressed_color_mapped_image: INTEGER = 1
    Tga_uncompressed_true_color_image: INTEGER = 2
    Tga_uncompressed_black_and_white_image: INTEGER = 3
    Tga_run_length_encoded_color_mapped_image: INTEGER = 9
    Tga_run_length_true_color_image: INTEGER = 10
    Tga_run_length_black_and_white_image: INTEGER = 11

    tga_file_type_names: HASH_TABLE [STRING, INTEGER]
        once
            create Result.make (7)
            Result.put ("No image data included", Tga_no_image_data_included)
            Result.put ("Uncompressed, color-mapped image", Tga_uncompressed_color_mapped_image)
            Result.put ("Uncompressed, true-color image", Tga_uncompressed_true_color_image)
            Result.put ("Uncompressed, black-and-white image", Tga_uncompressed_black_and_white_image)
            Result.put ("Run-length encoded, color-mapped image", Tga_run_length_encoded_color_mapped_image)
            Result.put ("Run-length encoded, true-color image", Tga_run_length_true_color_image)
            Result.put ("Run-length encoded, black-and-white image", Tga_run_length_black_and_white_image)
        end

feature -- Access (libtga constants - file sections)

    Tga_image_data: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_IMAGE_DATA"
        end

    Tga_image_id: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_IMAGE_ID"
        end

    Tga_color_map: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_COLOR_MAP"
        end

feature -- Access (libtga constants - image orientation)

    Tga_bottom: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_BOTTOM"
        end

    Tga_top: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_TOP"
        end

    Tga_left: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_LEFT"
        end

    Tga_right: INTEGER
        external
            "C [macro %"tga.h%"] :long"
        alias
            "TGA_RIGHT"
        end

end
