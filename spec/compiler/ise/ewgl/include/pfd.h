 /*
 * PFD.H
 *
 * description: "C header file for the Eiffel class PIXEL_FORMAT_DESCRIPTOR"
 * library: "EWGL - Eiffel wrapping of the Win32 OpenGL extensions"
 * author: "Paul Cohen"
 * copyright: "Copyright (c) 1999 Paul Cohen, see file forum.txt"
 * date: "$Date: 2001/01/14 14:23:41 $"
 * revision: "$Revision: 1.1 $"
 *
 */

#ifndef __PFD__
#define __PFD__

#ifndef _WINGDI_
#include <wingdi.h>
#endif

 /* Get macros */
#define cwigle_pfd_get_nsize(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->nSize)
#define	cwigle_pfd_get_nversion(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->nVersion)
#define cwigle_pfd_get_dwflags(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwFlags)
#define cwigle_pfd_get_ipixeltype(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->iPixelType)
#define cwigle_pfd_get_ccolorbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cColorBits)
#define cwigle_pfd_get_credbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cRedBits)
#define cwigle_pfd_get_credshift(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cRedShift)
#define cwigle_pfd_get_cgreenbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cGreenBits)
#define cwigle_pfd_get_cgreenshift(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cGreenShift)
#define cwigle_pfd_get_cbluebits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cBlueBits)
#define cwigle_pfd_get_cblueshift(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cBlueShift)
#define cwigle_pfd_get_calphabits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAlphaBits)
#define cwigle_pfd_get_calphashift(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAlphaShift)
#define cwigle_pfd_get_caccumbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumBits)
#define cwigle_pfd_get_caccumredbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumRedBits)
#define cwigle_pfd_get_caccumgreenbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumGreenBits)
#define cwigle_pfd_get_caccumbluebits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumBlueBits)
#define cwigle_pfd_get_caccumalphabits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumAlphaBits)
#define cwigle_pfd_get_cdepthbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cDepthBits)
#define cwigle_pfd_get_cstencilbits(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cStencilBits)
#define cwigle_pfd_get_cauxbuffers(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAuxBuffers)
#define cwigle_pfd_get_ilayertype(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->iLayerType)
#define cwigle_pfd_get_breserved(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->bReserved)
#define cwigle_pfd_get_dwlayermask(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwLayerMask)
#define cwigle_pfd_get_dwvisiblemask(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwVisibleMask)
#define cwigle_pfd_get_dwdamagemask(_ptr_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwDamageMask)

/* Set macros */ 
#define cwigle_pfd_set_nsize(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->nSize = (WORD) (_value_))
#define cwigle_pfd_set_nversion(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->nVersion = (WORD) (_value_))
#define cwigle_pfd_set_dwflags(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwFlags  = (DWORD) (_value_))
#define cwigle_pfd_set_ipixeltype(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->iPixelType  = (BYTE) (_value_))
#define cwigle_pfd_set_ccolorbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cColorBits  = (BYTE) (_value_))
#define cwigle_pfd_set_credbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cRedBits  = (BYTE) (_value_))
#define cwigle_pfd_set_credshift(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cRedShift  = (BYTE) (_value_))
#define cwigle_pfd_set_cgreenbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cGreenBits  = (BYTE) (_value_))
#define cwigle_pfd_set_cgreenshift(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cGreenShift  = (BYTE) (_value_))
#define cwigle_pfd_set_cbluebits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cBlueBits  = (BYTE) (_value_))
#define cwigle_pfd_set_cblueshift(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cBlueShift  = (BYTE) (_value_))
#define cwigle_pfd_set_calphabits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAlphaBits  = (BYTE) (_value_))
#define cwigle_pfd_set_calphashift(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAlphaShift  = (BYTE) (_value_))
#define cwigle_pfd_set_caccumbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumBits  = (BYTE) (_value_))
#define cwigle_pfd_set_caccumredbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumRedBits  = (BYTE) (_value_))
#define cwigle_pfd_set_caccumgreenbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumGreenBits  = (BYTE) (_value_))
#define cwigle_pfd_set_caccumbluebits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumBlueBits  = (BYTE) (_value_))
#define cwigle_pfd_set_caccumalphabits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAccumAlphaBits  = (BYTE) (_value_))
#define cwigle_pfd_set_cdepthbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cDepthBits  = (BYTE) (_value_))
#define cwigle_pfd_set_cstencilbits(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cStencilBits  = (BYTE) (_value_))
#define cwigle_pfd_set_cauxbuffers(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->cAuxBuffers  = (BYTE) (_value_))
#define cwigle_pfd_set_ilayertype(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->iLayerType  = (BYTE) (_value_))
#define cwigle_pfd_set_breserved(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->bReserved  = (BYTE) (_value_))
#define cwigle_pfd_set_dwlayermask(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwLayerMask  = (DWORD) (_value_))
#define cwigle_pfd_set_dwvisiblemask(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwVisibleMask  = (DWORD) (_value_))
#define cwigle_pfd_set_dwdamagemask(_ptr_, _value_) (((PIXELFORMATDESCRIPTOR *) _ptr_)->dwDamageMask  = (DWORD) (_value_))

#endif /* __PFD__ */

