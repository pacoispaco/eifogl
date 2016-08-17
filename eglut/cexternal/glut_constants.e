note
    description: "Wrapping of GLUT constants"
    library: "EGLUT - Eiffel wrapping of the OpenGL GLUT library"
    compilers: "ISE 5.2"
    platforms: "All platforms that have GLUT implementations."
    author: "Paul Cohen"
    copyright: "Copyright (c) 2002, 2016 Paul Cohen, see file forum.txt"

class GLUT_CONSTANTS

feature -- Access (Display mode bit masks)

    glut_rgb: INTEGER
            -- An alias for `glut_rgba'
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_RGB"
        end

    glut_rgba: INTEGER
            -- Bit mask to select an RGBA mode window. This is the
            -- default if neither ?glut_rgba' or ?glut_index' are
            -- specfied when calling ?glut_init_displaymode'
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_RGBA"
        end

    glut_index: INTEGER
            -- Bit mask to select a color index mode window. This
            -- overrides ?glut_rgba' if it also is specified
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_INDEX"
        end

    glut_single: INTEGER
            -- Bit mask to select a single buffered window. This
            -- the default if neither glut_double or glut_single
            -- are explicitly specified
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_SINGLE"
        end

    glut_double: INTEGER
            -- Bit mask to select a double buffered window.
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_DOUBLE"
        end

    glut_accum: INTEGER
            -- #define GLUT_ACCUM           4
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_ACCUM"
        end

    glut_alpha: INTEGER
            --#define GLUT_ALPHA            8
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_ALPHA"
        end

    glut_depth: INTEGER
            -- Bit mask to select a window with a depth buffer
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_DEPTH"
        end

    glut_stencil: INTEGER
            --#define GLUT_STENCIL          32
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_STENCIL"
        end

    glut_multisample: INTEGER
            --#define GLUT_MULTISAMPLE      128
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_MULTISAMPLE"
        end

    glut_stereo: INTEGER
            --#define GLUT_STEREO           256
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_STEREO"
        end

    glut_luminance: INTEGER
            --#define GLUT_LUMINANCE        512
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_LUMINANCE"
        end

feature -- Access (Mouse buttons)

    Glut_left_button: INTEGER
            -- Left button
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_LEFT_BUTTON"
        end

    Glut_middle_button: INTEGER
            -- Middle button
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_MIDDLE_BUTTON"
        end

    Glut_right_button: INTEGER
            -- Right button
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_RIGHT_BUTTON"
        end

feature -- Access (Mouse button callback states)

    Glut_down: INTEGER
            -- Button is down
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_DOWN"
        end

    Glut_up: INTEGER
            -- Button is up
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_UP"
        end

feature -- Access (Function keys)

    Glut_key_f1: INTEGER
            -- #define GLUT_KEY_F1          1
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F1"
        end

    Glut_key_f2: INTEGER
            -- #define GLUT_KEY_F2          2
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F2"
        end

    Glut_key_f3: INTEGER
            -- #define GLUT_KEY_F3          3
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F3"
        end

    Glut_key_f4: INTEGER
            -- #define GLUT_KEY_F4          4
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F4"
        end

    Glut_key_f5: INTEGER
            -- #define GLUT_KEY_F5          5
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F5"
        end

    Glut_key_f6: INTEGER
            -- #define GLUT_KEY_F6          6
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F6"
        end

    Glut_key_f7: INTEGER
            -- #define GLUT_KEY_F7          7
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F7"
        end

    Glut_key_f8: INTEGER
            -- #define GLUT_KEY_F8          8
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F8"
        end

    Glut_key_f9: INTEGER
            -- #define GLUT_KEY_F9          9
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F9"
        end

    Glut_key_f10: INTEGER
            -- #define GLUT_KEY_F10         10
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F10"
        end

    Glut_key_f11: INTEGER
            -- #define GLUT_KEY_F11         11
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F11"
        end

    Glut_key_f12: INTEGER
            -- #define GLUT_KEY_F12         12
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_F12"
        end

feature -- Access (Directional keys)

    Glut_key_left: INTEGER
            -- #define GLUT_KEY_LEFT            100
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_LEFT"
        end

    Glut_key_up: INTEGER
            -- #define GLUT_KEY_UP          101
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_UP"
        end

    Glut_key_right: INTEGER
            -- #define GLUT_KEY_RIGHT           102
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_RIGHT"
        end

    Glut_key_down: INTEGER
            -- #define GLUT_KEY_DOWN            103
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_DOWN"
        end

    Glut_key_page_up: INTEGER
            -- #define GLUT_KEY_PAGE_UP     104
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_PAGE_UP"
        end

    Glut_key_page_down: INTEGER
            -- #define GLUT_KEY_PAGE_DOWN       105
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_PAGE_DOWN"
        end

    Glut_key_home: INTEGER
            -- #define GLUT_KEY_HOME            106
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_HOME"
        end

    Glut_key_end: INTEGER
            -- #define GLUT_KEY_END         107
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_END"
        end

    Glut_key_insert: INTEGER
            -- #define GLUT_KEY_INSERT          108
        external
            "C [macro <glut.h>]"
        alias
            "GLUT_KEY_INSERT"
        end

feature -- Access (Entry/exit callback states)

feature -- Access (Visibility callback states)

feature -- Access (Color index component selection values)

feature -- Access (Layers for use)

feature -- Access (Stroke font constants)

feature -- Access (Bitmap font constants)

feature -- Access (?glut_get' parameters)

feature -- Access (?glut_device_get' parameters)

feature -- Access (?glut_layer_get' parameters)

feature -- Access (?glut_use_layer' parameters)

feature -- Access (?glut_get_modifiers' return masks)

    glut_active_shift: INTEGER
            -- Set if the shift modifier or the Caps Lock is active
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_ACTIVE_SHIFT"
        end

    glut_active_ctrl: INTEGER
            -- Set if the Ctrl modifier is active
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_ACTIVE_CTRL"
        end

    glut_active_alt: INTEGER
            -- Set if the Alt modifier is active
        external
            "C [macro <glut.h>]: INTEGER"
        alias
            "GLUT_ACTIVE_ALT"
        end

feature -- Access (?glut_set_cursor' parameters)

feature -- Access (?glut_set_cursor' parameters)

end
