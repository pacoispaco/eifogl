indexing
	description: "A 3D point"
        application: "dragnet2k"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:39 $"
	revision: "$Revision: 1.1 $"

class POINT_3D

feature -- Access
	
	x: REAL
	
	y: REAL
	
	z: REAL
	
feature -- Status setting
	
	set_x (r: REAL) is
		do
			x := r
		end
	
	set_y (r: REAL) is
		do
			y := r
		end
	
	set_z (r: REAL) is
		do
			z := r
		end

end -- class POINT_3D

