indexing
	description: "A 3D point"
        application: "dragnet2k"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/23 21:13:57 $"
	revision: "$Revision: 1.3 $"

class POINT_3D

feature -- Access
	
	x: DOUBLE
	
	y: DOUBLE
	
	z: DOUBLE
	
feature -- Status setting
	
	set_x (r: DOUBLE) is
		do
			x := r
		end
	
	set_y (r: DOUBLE) is
		do
			y := r
		end
	
	set_z (r: DOUBLE) is
		do
			z := r
		end

end -- class POINT_3D

