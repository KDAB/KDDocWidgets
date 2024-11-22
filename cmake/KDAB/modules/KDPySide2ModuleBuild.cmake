#
# SPDX-FileCopyrightText: 2019 Klarälvdalens Datakonsult AB, a KDAB Group company <info@kdab.com>
# Author: Renato Araujo Oliveira Filho <renato.araujo@kdab.com>
#
# SPDX-License-Identifier: BSD-3-Clause
#

# Save path to this cmake file (so it can be used later in the macros)
set(THIS_CMAKE_LIST_DIR ${CMAKE_CURRENT_LIST_DIR})

if(NOT ${PROJECT_NAME}_PYTHON_BINDINGS_INSTALL_PREFIX)
    # cmake-lint: disable=C0103
    set(${PROJECT_NAME}_PYTHON_BINDINGS_INSTALL_PREFIX
        ${CMAKE_INSTALL_PREFIX}
        CACHE FILEPATH "Custom path to install python bindings."
    )
endif()

message(STATUS "PYTHON INSTALL PREFIX ${${PROJECT_NAME}_PYTHON_BINDINGS_INSTALL_PREFIX}")

if(WIN32)
    set(PATH_SEP "\;")
else()
    set(PATH_SEP ":")
endif()
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
#remove noisy compiler warnings (as the generated code is not necessarily super-warning-free)
if(CMAKE_COMPILER_IS_GNUCXX OR CMAKE_CXX_COMPILER_ID MATCHES "Clang")
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-all -Wno-extra")
endif()

# On macOS, check if Qt is a framework build. This affects how include paths should be handled.
get_target_property(QtCore_is_framework Qt5::Core FRAMEWORK)
if(QtCore_is_framework)
    # Get the path to the framework dir.
    list(GET Qt5Core_INCLUDE_DIRS 0 QT_INCLUDE_DIR)
    get_filename_component(QT_FRAMEWORK_INCLUDE_DIR "${QT_INCLUDE_DIR}/../" ABSOLUTE)

    # QT_INCLUDE_DIR points to the QtCore.framework directory, so we need to adjust this to point
    # to the actual include directory, which has include files for non-framework parts of Qt.
    get_filename_component(QT_INCLUDE_DIR "${QT_INCLUDE_DIR}/../../include" ABSOLUTE)
endif()

# Flags that we will pass to shiboken-generator
# --generator-set=shiboken:  tells the generator that we want to use shiboken to generate code,
#                            a doc generator is also available
# --enable-parent-ctor-heuristic: Enable heuristics to detect parent relationship on constructors,
#                           this try to guess parent ownership based on the arguments of the constructors
# --enable-pyside-extensionsL: This will generate code for Qt based classes, adding extra attributes,
#                           like signal, slot;
# --enable-return-value-heuristic: Similar as --enable-parent-ctor-heuristic this use some logic to guess
#                           parent child relationship based on the returned argument
# --use-isnull-as-nb_nonzero: If a class have an isNull() const method, it will be used to compute
#                           the value of boolean casts.
#                           Example, QImage::isNull() will be used when on python side you do `if (myQImage)`
set(GENERATOR_EXTRA_FLAGS
    --generator-set=shiboken
    --enable-parent-ctor-heuristic
    --enable-pyside-extensions
    --enable-return-value-heuristic
    --use-isnull-as-nb_nonzero
    -std=c++${CMAKE_CXX_STANDARD}
)

# 2017-04-24 The protected hack can unfortunately not be disabled, because
# Clang does produce linker errors when we disable the hack.
# But the ugly workaround in Python is replaced by a shiboken change.
if(WIN32 OR DEFINED AVOID_PROTECTED_HACK)
    set(GENERATOR_EXTRA_FLAGS ${GENERATOR_EXTRA_FLAGS} --avoid-protected-hack)
    add_definitions(-DAVOID_PROTECTED_HACK)
endif()

# Replace all semicolons in a string with this platform's path separator
macro(make_path varname)
    # accepts any number of path variables
    string(REPLACE ";" "${PATH_SEP}" ${varname} "${ARGN}")
endmacro()

# Creates a PySide module target based on the arguments
# This will:
# 1 - Create a Cmake custom-target that call shiboken-generator passign the correct arguments
# 2 - Create a Cmake library target called "Py${libraryName}" the output name of this target
#     will be changed to match PySide template
# Args:
#   libraryName - The name of the output module
#   typesystemPaths - A list of paths where shiboken should look for typesystem files
#   includePaths - Include paths necessary to parse your class. *This is not the same as build*
#   outputSource - The files that will be generated by shiboken
#   targetIncludeDirs - This will be passed to target_include_directories
#   targetLinkLibraries - This will be passed to targetLinkLibraries
#   globalInclude - A header-file that contains all classes that will be generated
#   typesystemXML - The target binding typesystem (that should be the full path)
#   dependsArg - This var will be passed to add_custom_command(DEPENDS) so a new generation will be
#             trigger if one of these files changes
#   moduleOutputDir - Where the library file should be stored
macro(
    create_python_bindings
    libraryName
    typesystemPaths
    includePaths
    outputSource
    targetIncludeDirs
    targetLinkLibraries
    globalInclude
    typesystemXML
    dependsArg
    moduleOutputDir
)

    # Transform the path separators into something shiboken understands.
    make_path(shiboken_include_dirs ${includePaths})
    make_path(shiboken_typesystem_dirs ${typesystemPaths})
    get_property(
        raw_python_dir_include_dirs
        DIRECTORY
        PROPERTY INCLUDE_DIRECTORIES
    )
    make_path(python_dir_include_dirs ${raw_python_dir_include_dirs})
    set(shiboken_include_dirs "${shiboken_include_dirs}${PATH_SEP}${python_dir_include_dirs}")

    set(shiboken_framework_include_dirs_option "")
    if(CMAKE_HOST_APPLE)
        set(shiboken_framework_include_dirs "${QT_FRAMEWORK_INCLUDE_DIR}")
        make_path(shiboken_framework_include_dirs ${shiboken_framework_include_dirs})
        set(shiboken_framework_include_dirs_option "--framework-include-paths=${shiboken_framework_include_dirs}")
    endif()
    set_property(SOURCE ${outputSource} PROPERTY SKIP_AUTOGEN ON)
    add_custom_command(
        OUTPUT ${outputSource}
        COMMAND
            $<TARGET_PROPERTY:Shiboken2::shiboken,LOCATION> ${GENERATOR_EXTRA_FLAGS} ${globalInclude}
            --include-paths=${shiboken_include_dirs} --typesystem-paths=${shiboken_typesystem_dirs}
            ${shiboken_framework_include_dirs_option} --output-directory=${CMAKE_CURRENT_BINARY_DIR} ${typesystemXML}
        COMMAND ${Python3_EXECUTABLE} ${THIS_CMAKE_LIST_DIR}/KDFixupShiboken2.py ${outputSource}
        DEPENDS ${typesystemXML} ${dependsArg}
        WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
        COMMENT "Running generator for ${libraryName} binding..."
    )

    set(TARGET_NAME "Py${libraryName}")
    set(MODULE_NAME "${libraryName}")
    add_library(${TARGET_NAME} MODULE ${outputSource})

    set_target_properties(
        ${TARGET_NAME}
        PROPERTIES PREFIX ""
                   OUTPUT_NAME ${MODULE_NAME}
                   LIBRARY_OUTPUT_DIRECTORY ${moduleOutputDir}
    )
    if(APPLE)
        set_target_properties(${TARGET_NAME} PROPERTIES INSTALL_RPATH "@loader_path")
    elseif(NOT WIN32) #ie. linux
        set_target_properties(${TARGET_NAME} PROPERTIES INSTALL_RPATH "$ORIGIN")
    endif()

    if(WIN32)
        set_target_properties(${TARGET_NAME} PROPERTIES SUFFIX ".pyd")
    endif()

    target_include_directories(${TARGET_NAME} PUBLIC ${targetIncludeDirs})

    target_link_libraries(${TARGET_NAME} ${targetLinkLibraries} PySide2::pyside2 Shiboken2::libshiboken)
    target_compile_definitions(${TARGET_NAME} PRIVATE Py_LIMITED_API=0x03050000)
    if(APPLE)
        set_property(
            TARGET ${TARGET_NAME}
            APPEND
            PROPERTY LINK_FLAGS "-undefined dynamic_lookup"
        )
    endif()
    install(TARGETS ${TARGET_NAME} LIBRARY DESTINATION ${${PROJECT_NAME}_PYTHON_BINDINGS_INSTALL_PREFIX})
endmacro()
