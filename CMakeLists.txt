cmake_minimum_required(VERSION 3.5)
project(project_name)

set(PROJECT_VERSION_MAJOR 0)
set(PROJECT_VERSION_MINOR 0)
set(PROJECT_VERSION_PATCH 0)
set(PROJECT_VERSION "${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}.${PROJECT_VERSION_PATCH}")

# Compiler options
set(CMAKE_CXX_STANDARD 20) # Change to desired C++ standard

# Source files
file(GLOB PROJECT_SOURCES
    "src/*.cpp"
)

# Header files
file(GLOB PROJECT_HEADERS
    "include/*.hpp"
)

add_library(${PROJECT_NAME}-lib ${PROJECT_SOURCES})
target_include_directories(${PROJECT_NAME}-lib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(${PROJECT_NAME} main.cpp)
target_include_directories(${PROJECT_NAME} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}-lib)

add_subdirectory(test)
IF(DOXYGEN_FOUND)
    MESSAGE(STATUS "Doxygen found: ${DOXYGEN_EXECUTABLE} -- ${DOXYGEN_VERSION}")
	# Set Doxygen input and output files.
	SET(DOXYGEN_INPUT_DIR ${PROJECT_SOURCE_DIR}/include)
	SET(DOXYGEN_OUTPUT_DIR ${CMAKE_CURRENT_BINARY_DIR}/doxygen)
	SET(DOXYGEN_INDEX_FILE ${DOXYGEN_OUTPUT_DIR}/xml/index.xml)
	SET(DOXYFILE_IN ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile.in)
	SET(DOXYFILE_OUT ${CMAKE_CURRENT_BINARY_DIR}/Doxyfile)
	# Generate DoxyFile from the input file.
	CONFIGURE_FILE(${DOXYFILE_IN} ${DOXYFILE_OUT} @ONLY)
	# Create Output directory.
	FILE(MAKE_DIRECTORY ${DOXYGEN_OUTPUT_DIR})
	# Command for generating doc from Doxygen config file.
	ADD_CUSTOM_COMMAND(OUTPUT ${DOXYGEN_INDEX_FILE}
					COMMAND ${DOXYGEN_EXECUTABLE} ${DOXYFILE_OUT}
					MAIN_DEPENDENCY ${DOXYFILE_OUT} ${DOXYFILE_IN}
					COMMENT "Generating Doxygen documentation"
					VERBATIM)
	# Create CMake Target for generating doc.
	ADD_CUSTOM_TARGET(docs ALL DEPENDS ${DOXYGEN_INDEX_FILE})
ENDIF()
