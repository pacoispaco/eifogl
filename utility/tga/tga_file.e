indexing
	description: "TGA/Targa file (Version 2.0)"
	library: "Eiffel Image File Formats (EiffelOpenGL utility)"
	compiler: "All"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:41:50 $"
	revision: "$Revision: 1.1 $"

class
	TGA_FILE
	
inherit	
	
	KL_BINARY_INPUT_FILE
		rename
			read_character as read_byte,
			last_character as last_byte
		redefine
			make
		end
	
creation
	make
	
feature -- Initialization
	
	make (a_name: like name) is
		do
           		precursor (a_name)
                        size := count
		end
	
feature -- Basic operations
	
	read_all is 
			-- Read everything in the file, including the footer and
			-- developer and extension areas (if any).
		do
			read_header
			read_color_map_data
			read_image
			-- The Footer must be read before the developer and
			-- extension area in order to find out where they are
			-- located in the file! 
			read_footer
			-- The extension area must be read before the developer
			-- area in order to find out how large the extension
			-- area is and from that calculate the size of the
			-- developer area! 
			read_extension_area
			read_developer_area
		end
	
	read_header_and_image is
			-- Read the Header and the Image. Skip the Footer and
			-- developer and extension areas.
		do
			read_header
			read_color_map_data
			read_image
		end
	
feature {NONE} -- Basic operations
	
	read_header is
			-- Read header (general info) and the image ID (if any).
		local
			byte1, byte2: INTEGER
		do
			-- Field 1 (ID Length)
                        read_byte
			id_length := last_byte.code		
			if id_length > 0 then
				image_id_included := True
			end
			
			-- Field 2 (Color Map Type)
                        read_byte
			color_map_type := last_byte.code
			if color_map_type = 1 then
				color_map_included := True
			end
			
			-- Field 3 (Image Type)
                        read_byte
			image_type := last_byte.code
			
			-- Field 4 (Color Map Specification)
			-- Field 4.1 (Color Map Entry Index)
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			color_map_first_entry_index := byte2 * 256 + byte1
		
			-- Field 4.2 (Color Map Length) 
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			color_map_length := byte2 * 256 + byte1

			-- Field 4.3 (Color Map Entry Size)
			read_byte
			color_map_entry_size := last_byte.code
			
			-- Field 5 (Image Specification)
			-- Field 5.1 (X-origin of Image)
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			image_spec_x_origin := byte2 * 256 + byte1

			-- Field 5.2 (Y-origin of Image)
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			image_spec_y_origin := byte2 * 256 + byte1
			
			-- Field 5.3 (Image Width)
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			image_spec_width := byte2 * 256 + byte1
			
			-- Field 5.4 (Image Height)
			read_byte
			byte1 := last_byte.code
			read_byte
			byte2 := last_byte.code
			image_spec_height := byte2 * 256 + byte1

			-- Field 5.5 (Pixel Depth)
			read_byte
			image_spec_pixel_depth := last_byte.code
		
			-- Field 5.6 (Image Descriptors)
			-- This byte-field is divided into three bit-level
			-- sections as follows:
			read_byte
			byte1 := last_byte.code
			image_spec_desc_unused := byte1.bit_test (7).to_integer * 2 +
				                  byte1.bit_test (6).to_integer
			image_spec_desc_image_origin := byte1.bit_test (5).to_integer * 2 +
				                        byte1.bit_test (4).to_integer
			image_spec_desc_alpha_channel_bits := byte1.bit_test (3).to_integer * 8 + 
				                              byte1.bit_test (2).to_integer * 4 + 
							      byte1.bit_test (1).to_integer * 2 + 
							      byte1.bit_test (0).to_integer
						      
			-- Field 6 (Image ID)
			if image_id_included then
				read_string (id_length)
				image_id := clone (last_string)
			end			
		end
	
	read_color_map_data is
			-- Read the color map data.
		do
			-- Field 7 (Color Map)
			if color_map_included then
				read_string (color_map_length * color_map_entry_size)
				color_map_data := clone (last_string)
			end
		end
	
	read_image is
			-- Read the image data.
		do
			-- Field 8 (Image Data)
			read_string (image_size)
                        create image_data.make_from_string (last_string, image_spec_width, 
                                                            image_spec_height, image_spec_pixel_depth,
					                    image_spec_desc_alpha_channel_bits)		
		end
	
	read_developer_area is
			-- Read the developer area.
		require
			footer_read: footer_read
		do
			if developer_area_included then
				go (developer_directory_offset)
				read_string (size - footer_size - extension_size)
				developer_area := clone (last_string)			
			end
		end
	
	read_extension_area is
			-- Read the extension area.
		require
			footer_read: footer_read
		local
			byte1, byte2: INTEGER
		do
			if extension_area_included then
				go (extension_area_offset)
				
				read_byte
				byte1 := last_byte.code
				read_byte
				byte2 := last_byte.code
				extension_size := byte2 * 255 + byte1
				
				read_string (41)
				author_name := clone (last_string)
				
				read_string (324)
				author_comments := clone (last_string)
				
				-- More TBD!
			end
		end
	
	read_footer is
			-- Read the footer.
		do
			go (size - footer_size + 1)
			
			read_integer
			extension_area_offset := last_integer
			if extension_area_offset > 0 then
				extension_area_included := True
			end
			
			read_integer
			developer_directory_offset := last_integer
			if developer_directory_offset > 0 then
				developer_area_included := True
			end
			
			read_string (16)
			signature := clone (last_string)
			
			read_byte
			reserved_character := last_byte
			
			read_byte
			binary_string_zero_terminator := last_byte
			
			footer_read := True
		ensure
			footer_read: footer_read
		end
	
feature -- Access (General) 
	
	size: INTEGER
			-- Totyal size in bytes
	
feature -- Access (Header and Image ID) 
	
	id_length: INTEGER
			-- Field 1 (1 byte). 
			-- The 255 defined valeus are:
			-- 1) 0 means that no image ID (field 6) is included
			-- with the image. 
			-- 2) Any other value is the number of characters
			-- (bytes) that are included in the Image ID (field 6)
	
	color_map_type: INTEGER
			-- Field 2 (1 byte). 
			-- The 2 defined values are:
			-- 1) 0 means that no color map data (field 7) is
			-- included with the image. 
			-- 2) 1 means that a color map data is included. 
			-- Values 0-127 are reserved by Truevision. Values
			-- 128-255 may be used for developer applications
	
	image_type: INTEGER
			-- Field 3 (1 byte). 
			-- The 7 defined values are:
			-- 1) 0  = No image data (field 8) included.
			-- 2) 1  = Uncompressed, Color-mapped image.
			-- 3) 2  = Uncompressed, True-color image.
			-- 4) 3  = Uncompressed, Black-and-white image.
			-- 5) 9  = Run-length encoded, Color-mapped image.
			-- 6) 10 = Run-length encoded, True-color image.
			-- 7) 11 = Run-length encoded, Black-and-white image.
			-- Values 0-127 are reserved by Truevision. Values
			-- 128-255 may be used for developer applications 
	
	color_map_first_entry_index: INTEGER
			-- Field 4.1 (2 bytes).
			-- Index of the first color map entry
	
	color_map_length: INTEGER
			-- Field 4.2 (2 bytes).
			-- Total number of color map entries included
	
	color_map_entry_size: INTEGER
			-- Field 4.3 (1 byte).
			-- Number of bits per entry. Usually 15, 16, 24 or 32
	
	image_spec_x_origin: INTEGER
			-- Field 5.1 (2 bytes).
			-- Absolute horizontal coordinate for the lower left
			-- corner of the image as it is positioned on a display
			-- device having an origin at the lower left of the
			-- screen (eg. the Targa series)
	
	image_spec_y_origin: INTEGER
			-- Field 5.2 (2 bytes).
			-- Absolute vertical coordinate for the lower left
			-- corner of the image as it is positioned on a display
			-- device having an origin at the lower left of the
			-- screen (eg. the Targa series)
	
	image_spec_width: INTEGER
			-- Field 5.3 (2 bytes).
			-- Width of the image in pixels
	
	image_spec_height: INTEGER
			-- Field 5.4 (2 bytes).
			-- Height of the image in pixels
	
	image_spec_pixel_depth: INTEGER
			-- Field 5.5 (1 byte).
			-- Bits per pixel. This number includes the attribute or
			-- alpha channel bits. Common values are 8, 16, 24 and
			-- 32 but other pixel depths could be used
	
	image_spec_desc_unused: INTEGER 
			-- Field 5.6 (1 byte, bits 7 & 6)
			-- Unused and should always be 0
	
	image_spec_desc_image_origin: INTEGER
			-- Field 5.6 (1 byte, bits 5 & 4).
			-- Image Origin. The screen destination of first pixel
			-- in image as defined by:
			-- 1) 0, 0 = Bottom left.
			-- 2) 0, 1 = Bottom right.
			-- 3) 1, 0 = Top left.
			-- 4) 1, 1 = Top right.
	
	image_spec_desc_alpha_channel_bits: INTEGER
			-- Field 5.6 (1 byte, bits 3, 2, 1 & 0).
			-- Attribute/Alpha bits per pixel
	
	image_id: STRING
			-- Field 6 (0-255 bytes).
			-- Optional field containing identifying inromation
			-- about the image
	
feature -- Access (Color Map Data) 
	
	color_map_data: STRING
			-- Field 7 (0-N bytes).
			-- String containing the color map data
	
feature -- Access (Image Data) 	
	
	image_data: PIXEL_DATA_MAP
			-- Field 8 (0-N bytes).
			-- String containing width x hieght pixels. Each pixel
			-- specifies image data in one of the following formats: 
			-- a) Color-map indices for Pseudo-color.
			-- b) Attribute, Red, Green and Blue ordered data for
			-- True-color. Note that color values are stored in BGR
			-- order! 
			-- c) Independent Color-map indices for Direct-color.
		
feature -- Access (Developer Area) 	
	
	developer_area: STRING
			-- Field 9 (0-N bytes).
			-- String containing the developer area
	
feature -- Access (Extension Area) 	
	
	extension_size: INTEGER
			-- Field 10 (2 bytes).
			-- SHORT field specifying the number of bytes in the
			-- fixed-length portion of the Extension Data area. For
			-- version 2.0 of the TGA/Targa format this number
			-- should be set to 495
	
	author_name: STRING
			-- Field 11 (41 bytes).
			-- ASCII field where last byte must be the null
			-- character (binary zero)
	
	author_comments: STRING
			-- Field 12 (324 bytes).
			-- ASCII field consisting of four lines of 80 characters
			-- each, each terminated by a null character (binary
			-- zero)
	
	date_time_stamp: ARRAY [INTEGER] 
			-- Field 13 (12 bytes).
			-- Six SHORT values representing in order:
			-- SHORT 0: Month (1-12)
			-- SHORT 1: Day (1-31)
			-- SHORT 2: Year (4-digit, ie. 1989)
			-- SHORT 3: Hour (0-23)
			-- SHORT 4: Minute (0-59)
			-- SHORT 5: Second (0-59)
	
	job_name_id: STRING
			-- Field 14 (41 bytes).
			-- ASCII field where the last byte must be a null
			-- character (binary 0)
	
	job_time: ARRAY [INTEGER]
			-- Field 15 (6 bytes).
			-- Three SHORT values representing in order:
			-- SHORT 0: Hours (65535)
			-- SHORT 1: Minutes (0-59)
			-- SHORT 2: Seconds (0-59)
	
	software_id: STRING
			-- Field 16 (41 bytes).
			-- ASCII field where the last byte must be a null
			-- character (binary 0)
	
	software_version_number: INTEGER 
			-- Field 17 - Version number part (2 bytes).
			-- One SHORT field containing th eversion number as a
			-- binary integer times 100. Therefore, software version
			-- 4,17 would be the integer value 417. If not used this
			-- should be set to 0
	
	software_version_letter: CHARACTER
			-- Field 17 - Version letter part (1 byte).
			-- A version tag to be combined with the
			-- `software_version_number' above. This allows us to
			-- register software versions like 4.17b
	
	key_color: INTEGER
			-- Field 18 (4 bytes).
			-- A LONG value that is the key color in effect at the
			-- time the image is saved. The format is A:R:G:B where
			-- A (most significant byte) is the alpha channel key
			-- color 
	
	pixel_aspect_ratio_width: INTEGER
			-- Field 19 - Pixel width part (4 bytes).
			-- Pixel ratio numerator (pixel width). Together with
			-- `pixel_aspect_ratio_height' speicifes the pixel size
			-- ratio
	
	pixel_aspect_ratio_height: INTEGER
			-- Field 19 - Pixel height part (4 bytes).
			-- Pixel ratio denumerator (pixel height). Together with
			-- `pixel_aspect_ratio_width' speicifes the pixel size
			-- ratio
	
	gamma_value_numerator: INTEGER
			-- Field 20 - Gamma value numerator part (4 bytes).
			-- When taken together with the
			-- `gamma_value_denumerator' to provide a fractional
			-- gamma value the resulting avlue should be in the
			-- range 0.0 - 10.0
	
	gamma_value_denumerator: INTEGER
			-- Field 20 - Gamma value denumerator part (4 bytes).
			-- When taken together with the
			-- `gamma_value_numerator' to provide a fractional
			-- gamma value the resulting avlue should be in the
			-- range 0.0 - 10.0. If these are not used this should
			-- be set to 0
	
	color_correction_offset: INTEGER
			-- Field 21 (4 bytes).
			-- Offset from beginning of file to the start of the
			-- color correction table. If there is no color
			-- correction table this value should be set to 0
	
	postage_stamp_offset: INTEGER
			-- Field 22 (4 bytes).
			-- Offset from beginning of file to the start of the
			-- postage stamp image. If there is no postage
			-- stamp image this value should be set to 0
	
	scan_line_offset: INTEGER 
			-- Field 23 (4 bytes).
			-- Offset from beginning of file to the start of the
			-- scan line table

	
	attributes_type: INTEGER
			-- Field 24 (1 byte).
			-- Specifies the type of alpha channel data contained in
			-- the file. The following avlues are defined:
	
	
	scan_line_table: STRING
			-- Field 25 (Variable).
	
	postage_stamp_image: STRING
			-- Field 26 (Variable).
	
	color_correction_table: STRING
			-- Field 25 (2K bytes).
	
feature -- Access (Footer)	
	
	footer_size: INTEGER is 26
			-- Size of Footer
	
	extension_area_offset: INTEGER
			-- Bytes 0-3 of the footer
	
	developer_directory_offset: INTEGER
			-- Bytes 4-7 of the footer
	
	signature: STRING
			-- Bytes 8-23 of the footer
	
	reserved_character: CHARACTER
	
	binary_string_zero_terminator: CHARACTER
	
feature {NONE} -- Implementation	
	
	image_data_string: STRING
	
feature -- Status report
	
	image_id_included: BOOLEAN
			-- Is an Image ID included?
	
	color_map_included: BOOLEAN
			-- Is a Color Map included?
	
	developer_area_included: BOOLEAN
			-- Is the developer area included?
	
	extension_area_included: BOOLEAN
			-- Is the extension area included?
	
	footer_read: BOOLEAN
			-- Has the footer been read?
	
	image_size: INTEGER is
			-- Size of image
		do
			Result := image_spec_width * image_spec_height * 
				  (image_spec_pixel_depth + image_spec_desc_alpha_channel_bits) // 8
		end
	
feature -- Test & Debug
	
	pretty_format: STRING is
			-- A pretty formatted (sort of) string representation of
			-- the printable contents 
		do
			print ("Pretty print of TGA/Targa file %"")
			print (name)
			print ("%"%N")
			
			print ("Field 1 - ID length (1 byte): " + id_length.out + "%N")
			print ("    0 means that no image ID field is included with the image (ie. field 6 isn't included).%N")
			print ("    Any other value is the number of characters (bytes) that are included in field 6 - Image ID.%N")

			print ("Field 2 - Color Map Type (1 byte): " + color_map_type.out + "%N")
			print ("    0 means that no color map data is included with the image (ie. field 7 isn't included).%N")
			print ("    1 means that no color map data is included in field 7 - Color Map Data.%N")
			print ("    Any other values is an invalid value. (ie. it is not a valid TGA/Targa file.)%N")
		
			print ("Field 3 - Image Type (1 byte): " + image_type.out + "%N")
			print ("    Values 0 - 127 are reserved by Truevision (Targa) for general applications.%N")
			print ("    Values 128 - 255 may be used by developer applications.%N")
			print ("    These are the current reserved values:%N")
			print ("    0  = No image data included (ie. field 8 isn't included).%N")
			print ("    1  = Uncompressed, Color-mapped image.%N")
			print ("    2  = Uncompressed, True-color image.%N")
			print ("    3  = Uncompressed, Black-and-white image.%N")
			print ("    9  = Run-length encoded, Color-mapped image.%N")
			print ("    10 = Run-length encoded, True-color image.%N")
			print ("    11 = Run-length encoded, Black-and-white image.%N")
		
			print ("Field 4 - Color Map Specification (5 bytes)%N")
			print ("    If field 2 (Color Map Type) is 0 then this field (ie. all subfields below) should be set to 0%N")
			print ("Field 4.1 - First Entry Index (2 bytes): " + color_map_first_entry_index.out + "%N")
			print ("    Index of the first color map entry.%N")
			print ("Field 4.2 - Color Map Length (2 bytes): " + color_map_length.out + "%N")
			print ("    Total number of color map entries included.%N")
			print ("Field 4.3 - Color Map Entry Size (1 byte): " + color_map_entry_size.out + "%N")
			print ("    Number of bits per entry. Usually 15, 16, 24 or 32.%N")
			
			print ("Field 5 - Image Specification (10 bytes)%N")
			print ("    This field is always present and consists of the following subfields.%N")
			print ("Field 5.1 - X-origin of Image (2 bytes): " + image_spec_x_origin.out + "%N")
			print ("    Absolute horizontal coordinate for the lower left corner of the image as it is positioned on a display device having an origin at the lower left of the screen (eg. the Targa series).%N")
			print ("Field 5.2 - Y-origin of Image (2 bytes): " + image_spec_y_origin.out + "%N")
			print ("    Absolute vertical coordinate for the lower left corner of the image as it is positioned on a display device having an origin at the lower left of the screen (eg. the Targa series).%N")
			print ("Field 5.3 - Image Width (2 bytes): " + image_spec_width.out + "%N")
			print ("    Width of the image in pixels.%N")
			print ("Field 5.4 - Image Height (2 bytes): " + image_spec_height.out + "%N")
			print ("    Height of the image in pixels.%N")
			print ("Field 5.5 - Pixel Depth (1 byte): " + image_spec_pixel_depth.out + "%N")
			print ("    Bits per pixel. This number includes the attribute or alpha channel bits. Common values are 8, 16, 24 and 32 but other pixel depths could be used.%N")
			print ("Field 5.6 - Image Descriptor (1 byte)%N")
			print ("    This byte-field is divided into three bit-level sections as follwos.%N")
			print ("Field 5.6 (bit 7, bit 6): " + image_spec_desc_unused.out + "%N")
			print ("    Unused. Must be zero.%N")
			print ("Field 5.6 (bit 5, bit 4): " + image_spec_desc_image_origin.out + "%N")
			print ("    Image Origin. The screen destination of first pixel in image:%N")
			print ("    0 = Bottom left.%N")
			print ("    1 = Bottom right.%N")
			print ("    2 = Top left.%N")
			print ("    3 = Top right.%N")
			print ("Field 5.6 (bit 3, bit 2, bit 1, bit 0): " + image_spec_desc_alpha_channel_bits.out + "%N")
			print ("    Alpha Channel Bits. Attribute/Alpha bits per pixel.%N")
			
			print ("Field 6 - Image ID (Variable number of bytes): ") 
			print ("    Optional field containing identifying information about the image. The maximum lenth of this field is 256. See Field 1 - ID length.%N")
			if image_id_included then
				print ("    Image ID: %"")
				print (image_id)
				print ("%"%N")
			else
				print ("    Image ID not present!%N")
			end
			
			print ("Field 7 - Color Map (Variable number of bytes):%N")
			if color_map_included then
				print ("    Color Map present!%N")
			else
				print ("    Color Map not present!%N")
			end
			print ("    The Color Map Data. See field 2 - Color Map Type.%N")
		
			print ("Field 8 - Image Data (Variable number of bytes): %N")
			print ("    This field contains width x hieght pixels. Each pixel specifies image data in one of the following formats:%N")
			print ("    a) Color-map indices for Pseudo-color.%N")
			print ("    b) Attribute, Red, Green and Blue ordered data for True-color.%N")
			print ("    c) Independent Color-map indices for Direct-color.%N")
			if image_data /= Void then
				print ("    Image Data present!%N")
			else
				print ("    Image Data not present!%N")
			end
			
			if footer_read then
				print ("Field 9 - Developer Area (Variable number of bytes): %N")
				print ("    This field can be used to store any type of data.%N")
				print ("%N")
				if developer_area_included then
					print ("    Developer Area present!%N")
				else
					print ("    Devloper Area not present!%N")
				end
				
				print ("Field 10 - Extension Area (495 bytes): %N")
				print ("%N")
				if extension_area_included then
					print ("    Developer Area present!%N")
				else
					print ("    Devloper Area not present!%N")
				end
				
				print ("Footer - Extension Area Offset (4 bytes): " + extension_area_offset.out + "%N")
				print ("    If this field is 0 then there is no Extension Area in the file.%N")
				
				print ("Footer - Developer Directory Offset (4 bytes): " + developer_directory_offset.out + "%N")
				print ("    If this field is 0 then there is no Developer Area in the file.%N")
				
				print ("Footer - Signature (16 bytes): %"" + signature + "%"%N")
				print ("    This filed should always be equal to %"TRUEVISION-XFILE%".%N")
				
				print ("Footer - Reserved Character (1 byte): '" + reserved_character.out + "'%N")
				print ("    This character should always be '.' (ASCII period).%N")
				
				print ("Footer - Reserved Character (1 byte): '" + reserved_character.out + "'%N")
				print ("    This character should always be a binary zero.%N")
			else
				print ("Footer, developer and extension areas have not been read!%N")
			end
		end
	
invariant
	valid_id_length: 0 <= id_length and id_length <= 255 
	valid_color_map_type: 0 <= color_map_type and color_map_type <= 255 
	valid_image_type: 0 <= image_type and image_type <= 255 
	valid_color_map_first_entry_index: 0 <= color_map_first_entry_index and 
                                           color_map_first_entry_index <= 65535
	valid_color_map_length: 0 <= color_map_length and color_map_length <= 65535
	valid_color_map_entry_size: 0 <= color_map_entry_size and 
	                            color_map_entry_size <= 255
	consistent_color_map_info: color_map_type = 0 implies
	                           color_map_first_entry_index = 0 and
				   color_map_length = 0 and
				   color_map_entry_size = 0
	valid_image_spec_x_origin: 0 <= image_spec_x_origin and image_spec_x_origin <= 65535
	valid_image_spec_y_origin: 0 <= image_spec_y_origin and image_spec_y_origin <= 65535
	valid_image_spec_width: 0 <= image_spec_width and image_spec_width <= 65535
	valid_image_spec_height: 0 <= image_spec_height and image_spec_height <= 65535
	valid_image_spec_pixel_depth: 0 <= image_spec_pixel_depth and 
	                              image_spec_pixel_depth <= 255
	valid_image_spec_desc_unused: image_spec_desc_unused = 0
	valid_image_spec_desc_image_origin: 0 <= image_spec_desc_image_origin and
	                                    image_spec_desc_image_origin <= 3
	valid_image_spec_desc_alpha_channel_bits: 0 <= image_spec_desc_alpha_channel_bits and
	                                          image_spec_desc_alpha_channel_bits <= 15
	consistent_image_id_info: id_length > 0 implies 
	                          image_id /= Void and image_id.count = id_length
	                          

end -- class TGA_FILE

--| begin documentation
-- This class is based on the TGA/Targa specification in "TGA File Format"
-- that can be found at:
-- http://www.ludorg.net/amnesia/TGA_File_Format_Spec.html
-- 
-- TODO/MISSING from this class:
-- No support for decoding RLE-encoded images.
-- No support for changing BGR to RGB. TGA stores pixel data in BGR order.
--
-- NOTA BENE!
-- 1. RGB images are stored in BGR order in TGA/Targa files!
-- 2. It seems that some programs that generate TGA files do not fill in 
-- the Footer area correctly. Therefore a client, that knows this can just
-- read the Header and Image part of the file. The spec. actually says:
-- "Note: DEVELOPERS ARE NOT REQUIRED TO READ, WRITE OR USE THE EXTENSION 
-- OR DEVELOPER AREAS; THEY ARE OPTIONAL. EVEN IF THESE AREAS ARE NOT USED, 
-- IT IS RECOMMENDED THAT A TGA FILE FOOTER STILL BE INCLUDED WITH THE FILE."
-- So, filling in the footer area is only recommended, not required.
--| end documentation
