cmake_minimum_required(VERSION 3.16.3)
project(mdx)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(lazy-write)

set(Mdp $ENV{HOME}/bin/mdp)
if(EXISTS ${Mdp})
	add_custom_command(
		COMMAND ${Mdp} mdx.md && touch mdx.cpp
		DEPENDS mdx.md
		WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
		OUTPUT ${PROJECT_SOURCE_DIR}/mdx.cpp
	)
endif()
	

add_executable(mdx ${PROJECT_SOURCE_DIR}/mdx.cpp)
target_link_libraries(mdx lazy-write)
target_link_libraries(mdx stdc++fs)

