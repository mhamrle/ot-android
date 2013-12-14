#ifndef _INCLUDE_OTLIB_OT_CONFIG_H
#define _INCLUDE_OTLIB_OT_CONFIG_H 1
 
/* include/otlib/ot_config.h. Generated automatically at end of configure. */
/* config.h.  Generated from config.h.in by configure.  */
/* config.h.in.  Generated from configure.ac by autoheader.  */

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
/* #undef CRAY_STACKSEG_END */

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Building in Debug Mode */
/* #undef DEBUG */

/* Define to 1 if you have `alloca', as a function or macro. */
#ifndef OPENTXS_HAVE_ALLOCA
#define OPENTXS_HAVE_ALLOCA 1
#endif

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
#ifndef OPENTXS_HAVE_ALLOCA_H
#define OPENTXS_HAVE_ALLOCA_H 1
#endif

/* Define to 1 if you have the <arpa/inet.h> header file. */
#ifndef OPENTXS_HAVE_ARPA_INET_H
#define OPENTXS_HAVE_ARPA_INET_H 1
#endif

/* Building with C++11 */
/* #undef HAVE_CXX11 */

/* Define to 1 if you have the declaration of `strerror_r', and to 0 if you
   don't. */
#ifndef OPENTXS_HAVE_DECL_STRERROR_R
#define OPENTXS_HAVE_DECL_STRERROR_R 1
#endif

/* Define to 1 if you have the <dlfcn.h> header file. */
#ifndef OPENTXS_HAVE_DLFCN_H
#define OPENTXS_HAVE_DLFCN_H 1
#endif

/* Define to 1 if you have the <float.h> header file. */
#ifndef OPENTXS_HAVE_FLOAT_H
#define OPENTXS_HAVE_FLOAT_H 1
#endif

/* Define to 1 if you have the `getpass' function. */
//#ifndef OPENTXS_HAVE_GETPASS
//#define OPENTXS_HAVE_GETPASS 1
//#endif

/* Define to 1 if you have the `gettimeofday' function. */
#ifndef OPENTXS_HAVE_GETTIMEOFDAY
#define OPENTXS_HAVE_GETTIMEOFDAY 1
#endif

/* Define to 1 if you have the <inttypes.h> header file. */
#ifndef OPENTXS_HAVE_INTTYPES_H
#define OPENTXS_HAVE_INTTYPES_H 1
#endif

/* Define to 1 if you have the <limits.h> header file. */
#ifndef OPENTXS_HAVE_LIMITS_H
#define OPENTXS_HAVE_LIMITS_H 1
#endif

/* Define to 1 if your system has a GNU libc compatible `malloc' function, and
   to 0 otherwise. */
#ifndef OPENTXS_HAVE_MALLOC
#define OPENTXS_HAVE_MALLOC 1
#endif

/* Define to 1 if you have the <malloc.h> header file. */
/* #undef HAVE_MALLOC_H */

/* Define to 1 if you have the <memory.h> header file. */
#ifndef OPENTXS_HAVE_MEMORY_H
#define OPENTXS_HAVE_MEMORY_H 1
#endif

/* Define to 1 if you have the `mkdir' function. */
#ifndef OPENTXS_HAVE_MKDIR
#define OPENTXS_HAVE_MKDIR 1
#endif

/* Define to 1 if you have the <msgpack.h> header file. */
//#ifndef OPENTXS_HAVE_MSGPACK_H
//#define OPENTXS_HAVE_MSGPACK_H 1
//#endif

/* Define to 1 if you have the <netinet/in.h> header file. */
#ifndef OPENTXS_HAVE_NETINET_IN_H
#define OPENTXS_HAVE_NETINET_IN_H 1
#endif

/* We have openSSL */
#ifndef OPENTXS_HAVE_OPENSSL
#define OPENTXS_HAVE_OPENSSL 1
#endif

/* Define if you have POSIX threads libraries and header files. */
#ifndef OPENTXS_HAVE_PTHREAD
#define OPENTXS_HAVE_PTHREAD 1
#endif

/* Have PTHREAD_PRIO_INHERIT. */
//#ifndef OPENTXS_HAVE_PTHREAD_PRIO_INHERIT
//#define OPENTXS_HAVE_PTHREAD_PRIO_INHERIT 1
//#endif

/* Define to 1 if the system has the type `ptrdiff_t'. */
#ifndef OPENTXS_HAVE_PTRDIFF_T
#define OPENTXS_HAVE_PTRDIFF_T 1
#endif

/* If available, contains the Python version number currently in use. */
/* #undef HAVE_PYTHON */

/* Define to 1 if your system has a GNU libc compatible `realloc' function,
   and to 0 otherwise. */
#ifndef OPENTXS_HAVE_REALLOC
#define OPENTXS_HAVE_REALLOC 0
#endif

/* Define to 1 if you have the `socket' function. */
#ifndef OPENTXS_HAVE_SOCKET
#define OPENTXS_HAVE_SOCKET 1
#endif

/* Define to 1 if stdbool.h conforms to C99. */
#ifndef OPENTXS_HAVE_STDBOOL_H
#define OPENTXS_HAVE_STDBOOL_H 1
#endif

/* Define to 1 if you have the <stddef.h> header file. */
#ifndef OPENTXS_HAVE_STDDEF_H
#define OPENTXS_HAVE_STDDEF_H 1
#endif

/* Define to 1 if you have the <stdint.h> header file. */
#ifndef OPENTXS_HAVE_STDINT_H
#define OPENTXS_HAVE_STDINT_H 1
#endif

/* Define to 1 if you have the <stdlib.h> header file. */
#ifndef OPENTXS_HAVE_STDLIB_H
#define OPENTXS_HAVE_STDLIB_H 1
#endif

/* Define to 1 if you have the `strerror_r' function. */
#ifndef OPENTXS_HAVE_STRERROR_R
#define OPENTXS_HAVE_STRERROR_R 1
#endif

/* Define to 1 if you have the <strings.h> header file. */
#ifndef OPENTXS_HAVE_STRINGS_H
#define OPENTXS_HAVE_STRINGS_H 1
#endif

/* Define to 1 if you have the <string.h> header file. */
#ifndef OPENTXS_HAVE_STRING_H
#define OPENTXS_HAVE_STRING_H 1
#endif

/* Define to 1 if you have the `strtol' function. */
#ifndef OPENTXS_HAVE_STRTOL
#define OPENTXS_HAVE_STRTOL 1
#endif

/* Define to 1 if you have the `strtoul' function. */
#ifndef OPENTXS_HAVE_STRTOUL
#define OPENTXS_HAVE_STRTOUL 1
#endif

/* Define to 1 if you have the <sys/stat.h> header file. */
#ifndef OPENTXS_HAVE_SYS_STAT_H
#define OPENTXS_HAVE_SYS_STAT_H 1
#endif

/* Define to 1 if you have the <sys/timeb.h> header file. */
#ifndef OPENTXS_HAVE_SYS_TIMEB_H
#define OPENTXS_HAVE_SYS_TIMEB_H 1
#endif

/* Define to 1 if you have the <sys/time.h> header file. */
#ifndef OPENTXS_HAVE_SYS_TIME_H
#define OPENTXS_HAVE_SYS_TIME_H 1
#endif

/* Define to 1 if you have the <sys/types.h> header file. */
#ifndef OPENTXS_HAVE_SYS_TYPES_H
#define OPENTXS_HAVE_SYS_TYPES_H 1
#endif

/* Define to 1 if you have the <unistd.h> header file. */
#ifndef OPENTXS_HAVE_UNISTD_H
#define OPENTXS_HAVE_UNISTD_H 1
#endif

/* Define to 1 if you have the <wchar.h> header file. */
#ifndef OPENTXS_HAVE_WCHAR_H
#define OPENTXS_HAVE_WCHAR_H 1
#endif

/* Define to 1 if you have the <zmq.hpp> header file. */
#ifndef OPENTXS_HAVE_ZMQ_HPP
#define OPENTXS_HAVE_ZMQ_HPP 1
#endif

/* Define to 1 if the system has the type `_Bool'. */
#ifndef OPENTXS_HAVE__BOOL
#define OPENTXS_HAVE__BOOL 1
#endif

/* Using Gnome Keyring */
/* #undef KEYRING_GNOME */

/* Using KWallet Keyring */
/* #undef KEYRING_KWALLET */

/* Using Mac Keyring */
/* #undef KEYRING_MAC */

/* Using Windows Keyring */
/* #undef KEYRING_WINDOWS */

/* Define to the sub-directory in which libtool stores uninstalled libraries.
   */
#ifndef OPENTXS_LT_OBJDIR
#define OPENTXS_LT_OBJDIR ".libs/"
#endif

/* Define to 1 if your C compiler doesn't accept -c and -o together. */
/* #undef NO_MINUS_C_MINUS_O */

/* Using OT Signal Handling */
/* #undef OT_SIGNAL_HANDLING */

/* Name of package */
#ifndef OPENTXS_PACKAGE
#define OPENTXS_PACKAGE "opentxs"
#endif

/* Define to the address where bug reports for this package should be sent. */
#ifndef OPENTXS_PACKAGE_BUGREPORT
#define OPENTXS_PACKAGE_BUGREPORT "Fellow-Traveler"
#endif

/* Define to the full name of this package. */
#ifndef OPENTXS_PACKAGE_NAME
#define OPENTXS_PACKAGE_NAME "opentxs"
#endif

/* Define to the full name and version of this package. */
#ifndef OPENTXS_PACKAGE_STRING
#define OPENTXS_PACKAGE_STRING "opentxs 0.90.b"
#endif

/* Define to the one symbol short name of this package. */
#ifndef OPENTXS_PACKAGE_TARNAME
#define OPENTXS_PACKAGE_TARNAME "opentxs"
#endif

/* Define to the home page for this package. */
#ifndef OPENTXS_PACKAGE_URL
#define OPENTXS_PACKAGE_URL "https://github.com/FellowTraveler/Open-Transactions"
#endif

/* Define to the version of this package. */
#ifndef OPENTXS_PACKAGE_VERSION
#define OPENTXS_PACKAGE_VERSION "0.90.b"
#endif

/* Define to necessary symbol if this constant uses a non-standard name on
   your system. */
/* #undef PTHREAD_CREATE_JOINABLE */

/* Building in Release Mode */
#ifndef OPENTXS_RELEASE
#define OPENTXS_RELEASE 1
#endif

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Define to 1 if you have the ANSI C header files. */
#ifndef OPENTXS_STDC_HEADERS
#define OPENTXS_STDC_HEADERS 1
#endif

/* Define to 1 if strerror_r returns char *. */
/* #undef STRERROR_R_CHAR_P */

/* Using ZMQ Transport */
#ifndef OPENTXS_TRANSPORT_ZMQ
#define OPENTXS_TRANSPORT_ZMQ 1
#endif

/* Enable extensions on AIX 3, Interix.  */
#ifndef _ALL_SOURCE
# define _ALL_SOURCE 1
#endif
/* Enable GNU extensions on systems that have them.  */
#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif
/* Enable threading extensions on Solaris.  */
#ifndef _POSIX_PTHREAD_SEMANTICS
# define _POSIX_PTHREAD_SEMANTICS 1
#endif
/* Enable extensions on HP NonStop.  */
#ifndef _TANDEM_SOURCE
# define _TANDEM_SOURCE 1
#endif
/* Enable general extensions on Solaris.  */
#ifndef __EXTENSIONS__
# define __EXTENSIONS__ 1
#endif


/* Version number of package */
#ifndef OPENTXS_VERSION
#define OPENTXS_VERSION "0.90.b"
#endif

/* Define to 1 if on MINIX. */
/* #undef _MINIX */

/* Define to 2 if the system does not provide POSIX.1 features except with
   this defined. */
/* #undef _POSIX_1_SOURCE */

/* Define to 1 if you need to in order for `stat' and other things to work. */
/* #undef _POSIX_SOURCE */

/* Define for Solaris 2.5.1 so the uint32_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT32_T */

/* Define for Solaris 2.5.1 so the uint64_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT64_T */

/* Define for Solaris 2.5.1 so the uint8_t typedef from <sys/synch.h>,
   <pthread.h>, or <semaphore.h> is not used. If the typedef were allowed, the
   #define below would cause a syntax error. */
/* #undef _UINT8_T */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
#ifndef __cplusplus
/* #undef inline */
#endif

/* Define to the type of a signed integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef int32_t */

/* Define to rpl_malloc if the replacement function should be used. */
/* #undef malloc */

/* Define to rpl_realloc if the replacement function should be used. */
/* #undef realloc */

/* Define to the equivalent of the C99 'restrict' keyword, or to
   nothing if this is not supported.  Do not define if restrict is
   supported directly.  */
#ifndef _opentxs_restrict
#define _opentxs_restrict __restrict
#endif
/* Work around a bug in Sun C++: it does not support _Restrict or
   __restrict__, even though the corresponding Sun C compiler ends up with
   "#define restrict _Restrict" or "#define restrict __restrict__" in the
   previous line.  Perhaps some future version of Sun C++ will work with
   restrict; if so, hopefully it defines __RESTRICT like Sun C does.  */
#if defined __SUNPRO_CC && !defined __RESTRICT
# define _Restrict
# define __restrict__
#endif

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

/* Define to the type of an unsigned integer type of width exactly 16 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint16_t */

/* Define to the type of an unsigned integer type of width exactly 32 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint32_t */

/* Define to the type of an unsigned integer type of width exactly 64 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint64_t */

/* Define to the type of an unsigned integer type of width exactly 8 bits if
   such a type exists and the standard includes do not define it. */
/* #undef uint8_t */
 
/* once: _INCLUDE_OTLIB_OT_CONFIG_H */
#endif
