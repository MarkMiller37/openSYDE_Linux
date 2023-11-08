//----------------------------------------------------------------------------------------------------------------------
/*!
   \file
   \brief       Precompiled header (header)

   Contains a list of header files to be pre-compiled.

   \copyright   Copyright 2016 Sensor-Technik Wiedemann GmbH. All rights reserved.
*/
//----------------------------------------------------------------------------------------------------------------------
#ifndef  PRECOMP_HEADERS_CORE_HPP
#define  PRECOMP_HEADERS_CORE_HPP

//lint -esym(766,"precomp_headers.hpp")   effectively not used in lint "builds"; but that's exactly what we want
#ifndef _lint //speed up linting: don't include all of the headers for each linted .cpp file

/* -- Includes ------------------------------------------------------------------------------------------------------ */

/* Add C includes here */

#if defined __cplusplus

/* Add C++ includes here */
#include <vector>
#include <cmath>
#include <cstddef>
#include <cstring>
#include <iostream>
#ifdef _WIN32
#include <winsock2.h>
#include <windows.h>
#endif

#endif

#endif

#endif
