MACRO( ADD_FRAMEWORK fwname fwpath appname )
    TARGET_LINK_LIBRARIES( ${appname} ${fwpath}/${fwname} )
    MESSAGE( STATUS "Framework ${fwname} found at ${fwpath}" )
ENDMACRO()

MACRO( ADD_SYSTEM_FRAMEWORK fwname appname )
    FIND_LIBRARY( FRAMEWORK_${fwname} NAMES ${fwname} PATHS ${CMAKE_OSX_SYSROOT}/System/Library PATH_SUFFIXES Frameworks NO_DEFAULT_PATH )
    if( ${FRAMEWORK_${fwname}} STREQUAL FRAMEWORK_${fwname}-NOTFOUND )
        MESSAGE( ERROR ": Framework ${fwname} not found" )
    else()
        ADD_FRAMEWORK( ${fwname} ${FRAMEWORK_${fwname}} ${appname} )
    endif()
ENDMACRO( ADD_SYSTEM_FRAMEWORK )

#######################

project(my_mac_lib)

if( APPLE )    
    FILE( GLOB_RECURSE mac_sources RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} "*.mm" )
    LIST( APPEND sources ${mac_sources} )
    message("${sources}")

    foreach( curSource ${sources} )
        SET_SOURCE_FILES_PROPERTIES( ${curSource} PROPERTIES COMPILE_FLAGS "-x objective-c++" )
    endforeach( curSource )

    add_library(${PROJECT_NAME} SHARED ${sources})

    # Add system frameworks
    ADD_SYSTEM_FRAMEWORK( Foundation ${PROJECT_NAME} )
    ADD_SYSTEM_FRAMEWORK( CoreFoundation ${PROJECT_NAME} )
    ADD_SYSTEM_FRAMEWORK( AppKit ${PROJECT_NAME})

endif()
