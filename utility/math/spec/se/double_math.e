indexing
	description: "Basic mathematical operations, double-precision.%
	%Based on ISEs DOUBLE_MATH class."
	library: "Eiffel portable math (EiffelOpenGL utility)"
	compiler: "SmallEiffel 0.74 (lcc-win32 3.8)"
	author: "Paul Cohen"
	copyright: "Copyright (c) 2002 Paul Cohen, see file forum.txt"
	date: "$Date: 2002/12/08 11:54:47 $"
	revision: "$Revision: 1.1 $"

class
	DOUBLE_MATH

inherit

	MATH_CONST

feature -- Access

	log_2 (v: DOUBLE): DOUBLE is
			-- Base 2 logarithm of `v'
		local
			a: DOUBLE
		do
			a := 2.0
			Result := log (v) / log (a)
		end

	cosine (v: DOUBLE): DOUBLE is
			-- Trigonometric cosine of radian `v' approximated
			-- in the range [-pi/4, +pi/4]
		do
			Result := v.cos
		end

	arc_cosine (v: DOUBLE): DOUBLE is
			-- Trigonometric arccosine of radian `v'
			-- in the range [0, pi]
		do
			Result := v.acos
		end

	sine (v: DOUBLE): DOUBLE is
			-- Trigonometric sine of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		do
			Result := v.sin
		end

	arc_sine (v: DOUBLE): DOUBLE is
			-- Trigonometric arcsine of radian `v'
			-- in the range [-pi/2, +pi/2]
		do
			Result := v.asin
		end

	tangent (v: DOUBLE): DOUBLE is
			-- Trigonometric tangent of radian `v' approximated
			-- in range [-pi/4, +pi/4]
		do
			Result := v.tan
		end

	arc_tangent (v: DOUBLE): DOUBLE is
			-- Trigonometric arctangent of radian `v'
			-- in the range [-pi/2, +pi/2]
		do
			Result := v.atan
		end

	sqrt (v: DOUBLE): DOUBLE is
			-- Square root of `v'
		do
			Result := v.sqrt
		end

	exp (x: DOUBLE): DOUBLE is
			-- Exponential of `v'.
		do
			Result := v.exp
		end

	log (v: DOUBLE): DOUBLE is
			-- Natural logarithm of `v'
		do
			Result := v.log
		end

	log10 (v: DOUBLE): DOUBLE is
			-- Base 10 logarithm of `v'
		do
			Result := v.log10
		end

	floor (v: DOUBLE): DOUBLE is
			-- Greatest integral less than or equal to `v'
		do
			Result := v.floor
		end

	ceiling (v: DOUBLE): DOUBLE is
			-- Least integral greater than or equal to `v'
		do
			Result := v.ceiling
		end

	dabs (v: DOUBLE): DOUBLE is
			-- Absolute of `v'
		do
			Result := v.abs
		end

end -- class DOUBLE_MATH

-- begin documentation
-- 
-- end documentation


