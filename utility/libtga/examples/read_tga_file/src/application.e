note
	description: "Test of the ETGA library"
    application: "read_tga_file"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class
	APPLICATION
	
inherit
	TGA_FILE_CONSTANTS
	
create
	make
		
feature -- Initialization
	
	make
		local
			tga_file: TGA_FILE
		do
			print ("Creating a TGA_FILE object with name %"")
			print (tga_file_name)
			print ("%"%N")
			create tga_file.make (tga_file_name)
--			tga_file.read_info
			tga_file.read (Tga_image_data) 
			tga_file.dump
		end
	
	tga_file_name: STRING
		once
--			Result := "..\..\..\data\CRATE.tga"
--			Result := "..\..\..\data\rb_surface.tga"		
			Result := "..\..\..\data\crate2.tga"			
		end
	
end
