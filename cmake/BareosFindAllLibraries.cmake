#   BAREOS�� - Backup Archiving REcovery Open Sourced
#
#   Copyright (C) 2017-2017 Bareos GmbH & Co. KG
#
#   This program is Free Software; you can redistribute it and/or
#   modify it under the terms of version three of the GNU Affero General Public
#   License as published by the Free Software Foundation and included
#   in the file LICENSE.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#   Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301, USA.


INCLUDE(systemdservice)
if (${SYSTEMD_FOUND})
   SET(HAVE_SYSTEMD 1)
endif()

# make sure we get python 2 not 3
set(Python_ADDITIONAL_VERSIONS 2.5 2.6 2.7 2.8 2.9)
find_package(PythonInterp)
INCLUDE(FindPythonLibs)
if (${PYTHONLIBS_FOUND})
   SET(HAVE_PYTHON 1)
endif()

INCLUDE(CMakeUserFindMySQL)
INCLUDE(FindPostgreSQL)

INCLUDE(FindOpenSSL)
if (${OPENSSL_FOUND})
   SET(HAVE_OPENSSL 1)
endif()

#INCLUDE(FindACL)

#INCLUDE(FindFastlz)
#INCLUDE(FindRados)
#INCLUDE(FindRadosStriper)
#INCLUDE(FindUtil)
##INCLUDE(${CMAKE_CURRENT_LIST_DIR}/cmake/BareosFindLibraryAndHeaders.cmake)


INCLUDE(BareosFindLibraryAndHeaders)

BareosFindLibraryAndHeaders("fastlz" "fastlzlib.h")
BareosFindLibraryAndHeaders("jansson" "jansson.h")
BareosFindLibraryAndHeaders("rados" "rados/librados.h")
BareosFindLibraryAndHeaders("radosstriper" "radosstriper/libradosstriper.h")
BareosFindLibraryAndHeaders("cephfs" "cephfs/libcephfs.h")
BareosFindLibraryAndHeaders("pthread" "pthread.h")
BareosFindLibraryAndHeaders("cap" "sys/capability.h")
BareosFindLibraryAndHeaders("gfapi" "glusterfs/api/glfs.h")

BareosFindLibraryAndHeaders("cmocka" "cmocka.h")
if (${CMOCKA_FOUND})
   SET(HAVE_CMOCKA 1)
   SET(HAVE_CMOCKA_H 1)
endif()

BareosFindLibraryAndHeaders("lzo2" "lzo/lzoconf.h")
if (${LZO2_FOUND})
   SET(HAVE_LZO 1)
endif()
#MESSAGE(FATAL_ERROR "exit")
INCLUDE(BareosFindLibrary)

BareosFindLibrary("util")
BareosFindLibrary("dl")
BareosFindLibrary("acl")
BareosFindLibrary("wrap")

if (${HAVE_CAP})
   SET(HAVE_LIBCAP 1)
endif()

find_package(ZLIB)
if (${ZLIB_FOUND})
   SET(HAVE_LIBZ 1)
endif()

find_package(Readline)
