indexing
	description: "A 3D point"
        application: "dragnet2k"
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/08 11:23:55 $"
	revision: "$Revision: 1.2 $"

class POINT_3D

feature -- Access
	
	x: DOUBLE
	
	y: DOUBLE
	
	z: DOUBLE
	
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

