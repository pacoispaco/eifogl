indexing
	description: "libtga constants"
	library: "EiffelOpenGL"
	platform: "All"
	compiler: "ISE 5.0 MSVC++ 6.0"
	status: "See notice at end of file"
	author: "Paul Cohen"
	file: "$Workfile: $"
	date: "$Date: 2002/03/23 18:08:33 $"
	revision: "$Revision: 1.1 $"

class TGA_FILE_CONSTANTS
	
feature -- Access (TGA File type constants)
	
	Tga_no_image_data_included: INTEGER is 0
	Tga_uncompressed_color_mapped_image: INTEGER is 1
	Tga_uncompressed_true_color_image: INTEGER is 2
	Tga_uncompressed_black_and_white_image: INTEGER is 3
	Tga_run_length_encoded_color_mapped_image: INTEGER is 9
	Tga_run_length_true_color_image: INTEGER is 10
	Tga_run_length_black_and_white_image: INTEGER is 11
	
	tga_file_type_names: HASH_TABLE [STRING, INTEGER] is
		once
			!! Result.make (7)
			Result.put ("No image data included", Tga_no_image_data_included)
			Result.put ("Uncompressed, color-mapped image", Tga_uncompressed_color_mapped_image)
			Result.put ("Uncompressed, true-color image", Tga_uncompressed_true_color_image)
			Result.put ("Uncompressed, black-and-white image", Tga_uncompressed_black_and_white_image)
			Result.put ("Run-length encoded, color-mapped image", Tga_run_length_encoded_color_mapped_image)
			Result.put ("Run-length encoded, true-color image", Tga_run_length_true_color_image)
			Result.put ("Run-length encoded, black-and-white image", Tga_run_length_black_and_white_image)
		end
	
feature -- Access (libtga constants - file sections)	
	
	Tga_image_data: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_IMAGE_DATA"
		end
	
	Tga_image_id: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_IMAGE_ID"
		end
	
	Tga_color_map: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_COLOR_MAP"
		end
	
feature -- Access (libtga constants - image orientation)	
	
	Tga_bottom: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_BOTTOM"
		end
	
	Tga_top: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_TOP"
		end
	
	Tga_left: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_LEFT"
		end
	
	Tga_right: INTEGER is
		external
			"C [macro %"tga.h%"] :long"
		alias
			"TGA_RIGHT"
		end
	
end -- class TGA_FILE_CONSTANTS

--| begin documentation
--
--| end documentation
