indexing
	description: "Test of the ETGA library"
        application: "read_tga_file"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/03/23 18:01:54 $"
	revision: "$Revision: 1.1 $"

class
	APPLICATION
	
inherit
	TGA_FILE_CONSTANTS
	
creation
	make
		
feature -- Initialization
	
	make is
		local
			tga_file: TGA_FILE
		do
			print ("Creating a TGA_FILE object with name %"")
			print (tga_file_name)
			print ("%"%N")
			!! tga_file.make (tga_file_name)
--			tga_file.read_info
			tga_file.read (Tga_image_data) 
			tga_file.dump
		end
	
	tga_file_name: STRING is 
		once
--			Result := "..\..\..\data\CRATE.tga"
--			Result := "..\..\..\data\rb_surface.tga"		
			Result := "..\..\..\data\crate2.tga"			
		end
	
end -- class APPLICATION

