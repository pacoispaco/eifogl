note
    description: "A 3D point"
    application: "dragnet2k"
    author: "Paul Cohen"
    copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"

class POINT_3D

feature -- Access

    x: DOUBLE

    y: DOUBLE

    z: DOUBLE

feature -- Status setting

    set_x (r: DOUBLE)
        do
            x := r
        end

    set_y (r: DOUBLE)
        do
            y := r
        end

    set_z (r: DOUBLE)
        do
            z := r
        end

end
