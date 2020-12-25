
vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO brechtsanders/xlsxio
    REF cfd9ed517417000f5ffce428f2a4a7da0847c145 # 0.2.29
    SHA512 7188d6e0ec6a3ba7dd186a2b23c1a946bb2032fd6b9249312c1895cde75917f6b97a97827d43188b57de1de6c72c2fccb649ea3cd2285554ff61d81cfe996dc1
    HEAD_REF master
)

if(VCPKG_LIBRARY_LINKAGE STREQUAL dynamic)
    set(BUILD_SHARED ON)
    set(BUILD_STATIC OFF)
else()
    set(BUILD_SHARED OFF)
    set(BUILD_STATIC ON)
endif()

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
    OPTIONS
        -DBUILD_SHARED=${BUILD_SHARED}
        -DBUILD_STATIC=${BUILD_STATIC}
        -DBUILD_EXAMPLES=OFF
)
vcpkg_install_cmake()

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
vcpkg_copy_tools(TOOL_NAMES xlsxio_csv2xlsx xlsxio_xlsx2csv AUTO_CLEAN)
file(INSTALL ${SOURCE_PATH}/LICENSE.txt DESTINATION ${CURRENT_PACKAGES_DIR}/share/${PORT} RENAME copyright)

vcpkg_copy_pdbs()
