indexing
	description: "An OpenGL AUX application window"
	library: "EGLAUX - Eiffel wrapping of the OpenGL Auxillary library"
	compilers: "ISE 4.3, ISE4.5"
	platforms: "All platforms that have OpenGL AUX implementations."
	author: "Paul Cohen"
	copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
	date: "$Date: 2001/01/14 14:23:40 $"
	revision: "$Revision: 1.1 $"

deferred class EGLAUX_WINDOW
	
inherit
    GLAUX

    GLAUX_CONSTANTS
	
    GL_CONSTANTS

feature {NONE} -- Initialization
	
	make is
			-- Create an EGLAUX application window.
		do
			-- Initialize the application
			init
			
			-- Initialize the EGLAUX API
			aux_init_display_mode (initial_display_mode)
			aux_init_position (initial_x, initial_y, initial_width, initial_height)
			eglaux_init_window (eglaux_window_title)			
			
			-- Set the application object in the EGLAUX C interface
			eglaux_set_application_object (ceif_adopt (Current))
			
			-- Set up which events to subscribe to
			init_event_subscriptions
			
			-- Start the EGLAUX application main loop
			subscribe_to_main_loop
		end
	
	init is
			-- Initialize the EGLAUX application.
		deferred
		end
	
	init_event_subscriptions is
			-- Specify which events to subscribe to.
		deferred
		end
	
feature -- Access (Initial values)
	
	initial_display_mode: INTEGER is
			-- The initial display mode of the EGLAUX application
			-- window
		do
			Result := Aux_single + Aux_rgba
		end
	
	initial_x: INTEGER is
			-- The initial x position of the EGLAUX application
			-- window
		do
			Result := 100		
		end
	
	initial_y: INTEGER is
			-- The initial y position of the EGLAUX application
			-- window
		do
			Result := 100		
		end

	initial_width: INTEGER is
			-- The initial width of the EGLAUX application window
		do
			Result := 250
		end

	initial_height: INTEGER is
			-- The initial height of the EGLAUX application window
		do
			Result := 250
		end
	
	eglaux_window_title: STRING is
			-- The title of the EGLAUX application window
		do
			Result := "EGLAUX application"
		end
	
feature {NONE} -- Implementation (Main loop invoked from EGLAUX)
	
	main_loop is 
		deferred
		end
	
feature {NONE} -- Implementation (Callback triggered features invoked from EGLAUX)
	
	on_expose (i1, i2: INTEGER) is
		do
		end
	
	on_reshape (width, height: INTEGER) is
		do
		end
	
	on_idle is
		do
		end
	
	on_mouse (ae: AUX_EVENTREC) is
		require
			ae_not_void: ae /= Void
		do
		end

	on_key (key_code: INTEGER) is
		do
		end
	
feature -- Implementation (Main callback function)
	
	frozen main_application_callback (event_code, i1, i2: INTEGER) is
			-- Main application callback entry point. 'event_code´
			-- denotes what sort of event triggered the callback
			-- to be called, and `i1' and `i2' are possibly
			-- interesting parameters depending on the event
		local
			ae: AUX_EVENTREC
		do
			if event_code = Eglaux_main_loop_event then
				main_loop
			elseif event_code = Eglaux_expose_event then
				on_expose (i1, i2)
			elseif event_code = Eglaux_reshape_event then
				on_reshape (i1, i2)
			elseif event_code = Eglaux_idle_event then
				on_idle
			elseif event_code = Eglaux_mouse_event then
				!! ae.make_by_pointer (cwel_integer_to_pointer (i1))
				on_mouse (ae)
			elseif event_code = Eglaux_key_event then
				on_key (i1)
			end
		end
	
feature {NONE} -- Implementation
	
 	subscribe_to_main_loop is
		external
			"C [macro <eglaux.h>]"
		alias
			"eglaux_set_main_loop_proc"
		end
	
	unsubscribe_to_main_loop is
			-- Nonsensical?!?! Just here for symmetry!
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_main_loop_proc_to_null"
		end
	
 	subscribe_to_expose_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_expose_proc"
		end
	
	unsubscribe_to_expose_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_expose_proc_to_null"
		end
	
 	subscribe_to_reshape_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_reshape_proc"
		end
	
	unsubscribe_to_reshape_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_reshape_proc_to_null"
		end
	
 	subscribe_to_idle_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_idle_proc"
		end
	
	unsubscribe_to_idle_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_idle_proc_to_null"
		end
	
 	subscribe_to_mouse_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_mouse_proc"
		end
	
	unsubscribe_to_mouse_events is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_set_mouse_proc_to_null"
		end
	
 	subscribe_to_key_events (key_code: INTEGER) is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_subscribe_to_key_events"
		end
	
	unsubscribe_to_key_events (key_code: INTEGER) is
		external
			"C [macro <eglaux.h>]"
		alias			
			"eglaux_unsubscribe_to_key_events"
		end
	
feature --- Implementation (Eiffelized wrappers)
	
	eglaux_init_window (title: STRING) is
			-- Initializes and displays the OpenGL rendering window
		require
			title_not_void: title /= Void
		local
			a: ANY
		do		
			a := title.to_c
			aux_init_window ($a)
		end
	
feature --- Implementation (Raw wrappers)
	
	aux_init_display_mode (mask: INTEGER) is
			-- Initializes the display mode of the AUX library
			-- OpenGL window.
		external
			"C [macro <glaux.h>] (GLbitfield)"
		alias
			"auxInitDisplayMode"
		end
	
	aux_init_position (x, y, width, height: INTEGER) is
			-- Sets the window position used by aux_init_window.
		external
			"C [macro <glaux.h>] (GLint, GLint, GLsizei, GLsizei)"
		alias
			"auxInitPosition"
		end
	
	aux_init_window (title_string: POINTER) is
			-- Initializes and displays the OpenGL rendering window
		external
			"C [macro <glaux.h>] (GLbyte *)"
		alias
			"auxInitWindow"
		end
	
	aux_set_one_color (index: INTEGER; red, green, blue: REAL) is
			-- Sets a single color in the color-index mode palette.
		external
			"C [macro <glaux.h>] (int, float, float, float)"
		alias
			"auxSetOneColor"
		end
	
feature {NONE} -- Implementation (Callback event constants)
	
	Eglaux_main_loop_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_MAIN_LOOP_EVENT"
		end
	
	Eglaux_expose_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_EXPOSE_EVENT"
		end
	
	Eglaux_reshape_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_RESHAPE_EVENT"
		end
	
	Eglaux_idle_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_IDLE_EVENT"
		end
	
	Eglaux_mouse_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_MOUSE_EVENT"
		end
	
	Eglaux_key_event: INTEGER is
		external
			"C [macro <eglaux.h>]"
		alias
			"EGLAUX_KEY_EVENT"
		end
	
feature {NONE} -- Implementation (EGLUT C interface)	
	
	frozen eglaux_set_application_object (p: POINTER) is
			-- Set the application object in the EGLAUX C interface
		external
			"C [macro <eglaux.h>] (EIF_OBJ)"
		end

feature {NONE} -- Implementation (CECIL stuff)	
	
	ceif_adopt (object: ANY): POINTER is
		external
			"C [macro <eif_eiffel.h>] (EIF_OBJ):EIF_POINTER"
		alias
			"eif_adopt"
		end

feature {NONE} -- Implenetation (Type conversion)
	
	cwel_integer_to_pointer (i: INTEGER): POINTER is
			-- Converts an integer `i' to a pointer
		external
			"C [macro <wel.h>]"
		end
	
end -- class EGLAUX_WINDOW

--| begin documentation
-- 
--| end documentation

