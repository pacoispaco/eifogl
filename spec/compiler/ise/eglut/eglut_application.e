indexing
	description: "An EGLUT application. There is only one instance%
		     %of this class in any EGLUT application. All EGLUT%
                     %applications must have one class that inherits%
                     %from this class."
	library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have GLUT implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

deferred class
	EGLUT_APPLICATION
	
inherit	
	ARGUMENTS
		export
			{NONE} all
		end
	
	EGLUT_APPLICATION_CONTEXT
		export
			{NONE} all
		end
	
feature {NONE} -- Initialization
	
	make is
			-- Create an EGLUT application, initialize the GLUT API
			-- and set up the GLUT event loop.
		once
			eglut_init (argument_count + 1, argument_array)
			glut_init_displaymode (initial_displaymode)
			glut_init_window_size (initial_width, initial_height)
			glut_init_window_position (initial_x, initial_y)
			
			-- Initialize the gl state machine
			init_gl
			
			-- Set the application object in the EGLUT C interface
			eglut_set_application_object (ceif_adopt (Current))
			
			-- Create the main window
			!! main_window.make
			
			-- Initialize the application
			init_application
			
			-- Start the GLUT main event loop
			glut_main_loop
		end
	
	init_gl is
			-- Initialize the gl state machine for the
			-- application.
		deferred
		end
	
	init_application is
			-- Initialize the application
		deferred
		end
	
feature	-- Access
	
	main_window: EGLUT_TOP_LEVEL_WINDOW
			-- The applications main window
	
	initial_window_title: STRING is
			-- The initial title of all EGLUT windows
		do
			Result := "EGLUT application"
		end
	
	initial_displaymode: INTEGER is
			-- The initial display mode. Redefine this in
		do
			Result := Glut_single + Glut_rgb + Glut_depth
		end
	
	initial_width: INTEGER is
			-- The initial width of all created EGLUT windows
		do
			Result := 500
		end
	
	initial_height: INTEGER is
			-- The initial height of all created EGLUT windows
		do
			Result := 500
		end
	
	initial_x: INTEGER is
			-- The initial x position of all created EGLUT windows
		do
			Result := 100
		end
	
	initial_y: INTEGER is
			-- The initial y position of all created EGLUT windows
		do
			Result := 100
		end
	
feature {NONE} -- Implementation (Callbacks)
	
	frozen main_application_callback (event, i1, i2, i3, i4: INTEGER; c: CHARACTER) is
			-- The main application callback feature. `event'
			-- denotes the type of event that has occured. `i1',
			-- `i2', `i3', `i4' and `c' are event parameters that
			-- are interpreted according to the specific
			-- `event'. This feature is only invoked from the EGLUT
			-- C interface when a callback is recieved!
		local
			i: INTEGER
		do
			inspect event
			when Display_event then
				current_window.on_display
			when Reshape_event then
				-- i1 = width, i2 = height
				current_window.on_reshape (i1, i2)
			when Keyboard_event then
				-- Get current modifiers 
				-- (Shift, Ctrl and/or Alt)
				i := glut_get_modifiers
				-- i1 = x, i2 = y, c = char
				current_window.on_keyboard (c, i, i1, i2)
			when Mouse_event then
				-- i1 = mouse, i2 = state, i3 = x, i4 = y
				current_window.on_mouse (i1, i2, i3, i4)
			when Motion_event then
				-- i1 = x, i2 = y
				current_window.on_motion (i1, i2)
			when Passive_motion_event then
				-- i1 = x, i2 = y
				current_window.on_passive_motion (i1, i2)
			when Visibility_event then
				-- i1 = state
				current_window.on_visibility (i1)
			when Entry_event then
				-- i1 = state
				current_window.on_entry (i1)
			when Special_event then
				-- Get current modifiers 
				-- (Shift, Ctrl and/or Alt)
				i := glut_get_modifiers
				-- i1 = key, i2 = x, i3 = y
				current_window.on_special (i1, i, i2, i3)
			when
				Idle_event then
				current_window.on_idle
			end
		end
	
feature -- Implementation (Callback event constants)
	
	-- NOTA BENE! These Eiffel constants MUST be correspond exactly to
	-- those in the C #define:s in the eglut.h file! The reason that these
	-- constants are not accessed, via external, from the eglut.h file is
	-- that it is then able to write an "inspect" clause in the
	-- `main_application_callback' feature, which is faster than a big "if"
	-- clause.
	
	frozen Display_event: INTEGER is 1
	
	frozen Reshape_event: INTEGER is 2
	
	frozen Keyboard_event: INTEGER is 3
	
	frozen Mouse_event: INTEGER is 4
	
	frozen Motion_event: INTEGER is 5
	
	frozen Passive_motion_event: INTEGER is 6
	
	frozen Visibility_event: INTEGER is 7
	
	frozen Entry_event: INTEGER is 8
	
	frozen Special_event: INTEGER is 9
	
	frozen Idle_event: INTEGER is 10 
	
feature {NONE} -- Implementation (GLUT wrappers)
	
	glut_get_modifiers: INTEGER is
			-- The modifier key state when certain callbacks were
			-- generated
		external
			"C [macro <glut.h>] (): int"
		alias
			"glutGetModifiers ()"
		end
	
	eglut_init (argcp: INTEGER; argv: ARRAY [STRING]) is
			-- Initialize the GLUT library. Note that GLUT library
			-- will extract any command line options intended for
			-- the GLUT library, and thus may modify both `argcp'
			-- and `argv'. Nice isn't it!? X Window specific
			-- command line options are:
			-- -display DISPLAY
			-- -geometry WxH+X+Y
			-- -iconic
			-- -indirect
			-- -direct
			-- -gldebug
			-- -sync
		require
			consistent_params: argcp = argv.count
		local
			a: CHAR_PP
			s: SPECIAL [POINTER]
		do
			!! a.make (argv)
			s := a.area
			glut_init ($argcp, $s)
		end
	
	glut_init (argcp, argv: POINTER) is
		external
			"C [macro <glut.h>] (int *, char **)"
		alias
			"glutInit"
		end
	
	glut_init_window_size (width, height: INTEGER) is
			-- Set the initial window size to `width' and `height'.
		require
			valid_size: width > 0 and height > 0
		external
			"C [macro <glut.h>] (int, int)"
		alias
			"glutInitWindowSize"
		end
	
	glut_init_window_position (x, y: INTEGER) is
			-- Set the initial window position to `x' and `y'.
		require
			valid_position: x > 0 and y > 0
		external
			"C [macro <glut.h>] (int, int)"
		alias
			"glutInitWindowPosition"
		end

	glut_main_loop is
			-- Start the GLUT main event loop.
		external
			"C [macro <glut.h>] ()"			
		alias
			"glutMainLoop()"
		end
	
feature {NONE} -- Implementation (EGLUT C interface)	
	
	frozen eglut_set_application_object (p: POINTER) is
			-- Set the application object in the EGLUT C interface
		external
			"C [macro <eglut.h>] (EIF_OBJ)"
		end
	
feature {NONE} -- Implementation (CECIL stuff)	
	
	ceif_adopt (object: ANY): POINTER is
		external
			"C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
		alias
			"eif_adopt"
		end
	
end -- class EGLUT_APPLICATION

