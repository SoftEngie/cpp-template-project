Include(FetchContent)

FetchContent_Declare(
  Catch2
  GIT_REPOSITORY https://github.com/catchorg/Catch2.git
  GIT_TAG        v3.4.0 # or a later release
)

FetchContent_MakeAvailable(Catch2)
file(GLOB TEST_SOURCES
${CMAKE_CURRENT_SOURCE_DIR}/*.cpp
)
add_executable(test ${TEST_SOURCES})
target_include_directories(test PRIVATE ${CMAKE_SOURCE_DIR}/include)
target_link_libraries(test PRIVATE ${PROJECT_NAME}-lib)
target_link_libraries(test PRIVATE Catch2::Catch2WithMain)

list(APPEND CMAKE_MODULE_PATH ${catch2_SOURCE_DIR}/extras)
include(CTest)
include(Catch)
catch_discover_tests(test)

add_custom_target(runtests
    COMMAND ${CMAKE_BINARY_DIR}/test/test
    DEPENDS test
    COMMENT "Running tests"
)

add_custom_target(verboseruntests
    COMMAND ${CMAKE_BINARY_DIR}/test/test --verbosity high
    DEPENDS test
    COMMENT "Running tests with --verbose option"
)