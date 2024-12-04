cmake_minimum_required(VERSION 3.5.0)
project(createDB VERSION 0.1.0 LANGUAGES C CXX)

add_executable(usingSqliteCallback main.cpp)
find_package (SQLite3)
if (SQLITE3_FOUND)
  include_directories(${SQLite3_INCLUDE_DIRS})
  target_link_libraries (usingSqliteCallback ${SQLite3_LIBRARIES})
endif (SQLITE3_FOUND)