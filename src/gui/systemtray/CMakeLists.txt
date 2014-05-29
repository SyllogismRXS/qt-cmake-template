set( APP_NAME systemtray)

file ( GLOB_RECURSE app_SOURCES *.cpp )
file ( GLOB_RECURSE app_HEADERS *.h )

file ( GLOB_RECURSE app_FORMS *.ui)
file ( GLOB_RECURSE app_RESOURCES *.qrc)

SET(QT_USE_QTGUI TRUE)

QT4_WRAP_CPP(app_HEADERS_MOC ${app_HEADERS})
QT4_WRAP_UI(app_FORMS_HEADERS ${app_FORMS})
QT4_ADD_RESOURCES(app_RESOURCES_RCC ${app_RESOURCES})

include_directories(${CMAKE_CURRENT_BINARY_DIR})

include(${QT_USE_FILE})

add_definitions(${QT_DEFINITIONS})
add_definitions(-DQDESIGNER_EXPORT_WIDGETS)

#message(${CMAKE_CURRENT_BINARY_DIR})

add_executable(${APP_NAME} 
  ${app_SOURCES}
  ${app_HEADERS_MOC}
  ${app_FORMS_HEADERS}
  ${app_RESOURCES_RCC}
  )

target_link_libraries(${APP_NAME} 
  ${QT_LIBRARIES}
  )
