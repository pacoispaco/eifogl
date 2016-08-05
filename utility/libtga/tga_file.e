note
    description: "Wrapping of the libtga library for handling TGA (TARGA) files"
    library: "EiffelOpenGL"
    platform: "All"
    status: "See notice at end of file"
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class TGA_FILE

inherit
    RAW_FILE

    TGA_FILE_CONSTANTS

create
    make

feature -- Access (Color map information)

    has_colormap: BOOLEAN
            -- Is a colormap included with the image? (Field 2 of
            -- the TGA file header)
        do
            if tga_info.map_t = 1 then
                Result := True
            else
                Result := False
            end
        end

    first_entry_index: INTEGER
            -- Index of the first color map entry
        do
            Result := tga_info.map_first_entry
        end

    color_map_length: INTEGER
            -- Total number of color map entries included
        do
            Result := tga_info.map_len
        end

    color_map_entry_size: INTEGER
            -- Number of bits per entry. Typically 16, 24 or 32
        do
            Result := tga_info.map_entry_size
        end

feature -- Access (Color map data)

    color_map: POINTER
            -- Color map
        do
            Result := tga.color_map
        end

feature -- Access (Image information)

    x_origin_of_image: INTEGER
            -- Absolute horizontal coordinate for the lower left
            -- corner of the image
        do
            Result := tga_info.x
        end

    y_origin_of_image: INTEGER
            -- Absolute vertical coordinate for the lower left
            -- corner of the image
        do
            Result := tga_info.y
        end

    x_orientation_is_left: BOOLEAN
            -- Does the x orientation start at the left? If not, it
            -- starts at the right.
        do
            if c_tga_get_x_orientation (tga_info.pointer) = Tga_left then
                Result := True
            else
                Result := False
            end
        end

    y_orientation_is_bottom: BOOLEAN
            -- Does the y orientation start at the bottom? If not,
            -- it starts at the top.
        do
            if c_tga_get_y_orientation (tga_info.pointer) = Tga_bottom then
                Result := True
            else
                Result := False
            end
        end

    image_width: INTEGER
            -- Width of image in pixels
        do
            Result := tga_info.width
        end

    image_height: INTEGER
            -- Height of image in pixels
        do
            Result := tga_info.height
        end

    pixel_depth: INTEGER
            -- Bits per pixel
        do
            Result := tga_info.depth
        end

    image_descriptor: INTEGER
            -- One byte code [7, 6, 5, 4, 3, 2, 1, 0]:
            -- 3-0: Number of attribute bits per pixel.
            -- 5-4: Indicates order in which pixel data
            -- transferred from the file to the screen.
            -- 7-6: Must be zero to insure future compatibility.
        do
            Result := tga_info.desc
        end

    image_type: INTEGER
            -- Image type (Field 3 of the TGA file header)
        do
            Result := tga_info.img_t
        ensure
            valid_type: Result = Tga_no_image_data_included or
                    Result = Tga_uncompressed_color_mapped_image or
                    Result = Tga_uncompressed_true_color_image or
                    Result = Tga_uncompressed_black_and_white_image or
                    Result = Tga_run_length_encoded_color_mapped_image or
                    Result = Tga_run_length_true_color_image or
                    Result = Tga_run_length_black_and_white_image
        end

    image_id: STRING
            -- Image id
        do
            Result := tga.img_id
        ensure
            result_not_void: Result /= Void
            max_count: Result.count <= 255
        end

feature -- Access (Image data)

    image_data: POINTER
            -- Pointer to image data area. Note that if the image
            -- is uncompressed then the pixel data is in BGR(A)
            -- format. If the image is run-length encoded the pixel
            -- data is in (A)BGR format. It should be transformed to
            -- BGR(A) for run-length encoded images but that should
            -- be done in libtga an not in this wrapping!
        do
            Result := tga.img_data
        end

feature -- Access (Signature)

    signature: STRING
            -- If equal to "TRUEVISION-XFILE" the file can be
            -- assumed to be in the new TGA format. If that signature
            -- isn't found, the file should be assumed to be in the
            -- old TGA format.
        do
            Result := tga.sig
        ensure
            valid_result: Result.is_equal ("TRUEVISION-XFILE") or
                      Result.is_equal ("")
        end

feature -- Basic operations (Reading)

    read (flags: INTEGER)
            -- Read image header and all sections specified in
            -- `flags'. `flags' can be any combination of
            -- `Tga_image_data', `Tga_image_id' or `Tga_color_map'.
        local
            fd: POINTER
            a: ANY
        do
            a := name.to_c
            fd := file_open ($a, 0)
            tga.set_io_ptr (fd)
            c_tga_read_tga (tga.pointer, tga_info.pointer, flags)
            file_close (fd)
        end

    read_info
            -- Read image header at beginning of file.
        local
            flags: INTEGER
            fd: POINTER
            a: ANY
        do
            a := name.to_c
            fd := file_open ($a, 0)
            tga.set_io_ptr (fd)
            c_tga_read_info (tga.pointer, tga_info.pointer, flags)
            file_close (fd)
        end

feature {NONE} -- Implementation

    tga_info: TGA_INFO_STRUCTURE
            -- A tga_info C structure
        once
            create Result.make
        end

    tga: TGA_STRUCTURE
            -- A tga C structure
        once
            create Result.make
        end

feature {NONE} -- Implementation (externals)

    c_tga_read_tga (ptr, info: POINTER; flags: INTEGER)
        external
            "C [macro %"tga.h%"] (tga_ptr, tga_info_ptr, tga_uint_32)"
        alias
            "tga_read_tga"
        end

    c_tga_read_info (ptr, info: POINTER; flags: INTEGER)
        external
            "C [macro %"tga.h%"] (tga_ptr, tga_info_ptr, tga_uint_32)"
        alias
            "tga_read_info"
        end

    c_tga_get_x_orientation (info: POINTER) : INTEGER
        external
            "C [macro %"tga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "tga_get_x_orientation"
        end

    c_tga_get_y_orientation (info: POINTER): INTEGER
        external
            "C [macro %"tga.h%"] (tga_info_ptr): tga_uint_8"
        alias
            "tga_get_y_orientation"
        end

feature -- Test & Debug

    dump
            -- Do a pretty dump on stdout.
        do
            print ("***** Dumping a TGA_FILE *****%N")
            print ("Name:%T%T%T")
            print (name)
            print ("%N")
            print ("Has color map:%T%T")
            if has_colormap then
                print ("Yes")
            else
                print ("No")
            end
            print ("%N")
            print ("Image type:%T%T")
            print (image_type)
            print (" (")
            print (tga_file_type_names @ image_type)
            print (")")
            print ("%N")
            print ("First entry index:%T")
            print (first_entry_index)
            print ("%N")
            print ("Color map length:%T")
            print (color_map_length)
            print ("%N")
            print ("Color map entry size:%T")
            print (color_map_entry_size)
            print ("%N")
            print ("X origin of image:%T")
            print (x_origin_of_image)
            print ("%N")
            print ("Y origin of image:%T")
            print (y_origin_of_image)
            print ("%N")
            print ("X orientation of image:%T")
            if x_orientation_is_left then
                print ("Left")
            else
                print ("Right")
            end
            print ("%N")
            print ("Y orientation of image:%T")
            if y_orientation_is_bottom then
                print ("Bottom")
            else
                print ("Top")
            end
            print ("%N")
            print ("Image width:%T%T")
            print (image_width)
            print ("%N")
            print ("Image height:%T%T")
            print (image_height)
            print ("%N")
            print ("Pixel depth:%T%T")
            print (pixel_depth)
            print ("%N")
            print ("Image descriptor:%T")
            print (image_descriptor)
            print ("%N")
            print ("Color map (pointer):%T")
            print (color_map)
            print ("%N")
            print ("Image id:%T%T")
            if image_id.count = 0 then
                print ("(none)")
            else
                print (image_id)
            end
            print ("%N")
            print ("Image data (pointer):%T")
            print (image_data)
            print ("%N")
            print ("Signature):%T%T")
            if signature.count = 0 then
                print ("(No signature found => file is in old TGA format)")
            else
                print (signature)
                print ("(file is in new TGA format)")
            end
            print ("%N")
            print ("******************************%N")
            print ("%N")
        end

end

--| begin documentation
-- The TGA format is one of the most widely used bitmap file formats for
-- storage of 24- and 32-bit truecolor images. TGA supports colomaps,
-- alpha channel, gamma value, postage stamp image, textual information,
-- and developer-definable data.
--
-- See:
-- http://www.faqs.org/faqs/graphics/fileformats-faq/part3/section-146.html
-- for more information
--| end documentation

