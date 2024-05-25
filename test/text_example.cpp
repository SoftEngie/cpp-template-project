#include <catch2/catch_test_macros.hpp>
#include "example.hpp"

TEST_CASE( "test add function", "[add_function]" ) {
    REQUIRE( add(1,-1) == 0 );
    REQUIRE( add(2, 2) == 4 );
    REQUIRE( add(3, -1) == 2 );
    REQUIRE( add(10, 0) == 10);
}