set (SRCS
	SampleGuiPlugin2.cpp
	SampleGuiPlugin2Exports.cpp
	SampleGuiPluginWindow2.cpp)
set (HEADERS
	SampleGuiPlugin2.h
	SampleGuiPluginWindow2.h)
	
set(LIBRARY_NAME SampleGuiPlugin2)

if(WIN32)
	set(SRCS ${SRCS} ${LIBRARY_NAME}.def)
	set(PREPROCESSOR_DEFINITIONS ${PREPROCESSOR_DEFINITIONS};/D_USRDLL;/D__STDC_CONSTANT_MACROS)
	set(LINK_DIRECTORIES 
		${PROJECT_ROOT_DIR}/wxGuiPluginBase/${OS_BASE_NAME}${LIB_SUFFIX}/$(ConfigurationName))
	set(DEMO_LIBS wxGuiPluginBase.lib)
endif(WIN32)
if(LINUX OR APPLE)
	set(DEMO_LIBS wxGuiPluginBase)
	SET(CMAKE_SKIP_BUILD_RPATH  FALSE)
	SET(CMAKE_BUILD_WITH_INSTALL_RPATH TRUE) 
	SET(CMAKE_INSTALL_RPATH ".:./../../")
endif(LINUX OR APPLE)

set(SRCS ${SRCS} ${HEADERS} 
	${PROJECT_ROOT_DIR}/include/stdwx.h 
	${PROJECT_ROOT_DIR}/include/stdwx.cpp)

add_definitions(${PREPROCESSOR_DEFINITIONS})

include_directories(${INCLUDE_DIRECTORIES} ${BASE_INCLUDE_DIRECTORIES} 
	${PROJECT_ROOT_DIR}/wxGuiPluginBase)
	
link_directories(${LINK_DIRECTORIES})

add_library(${LIBRARY_NAME} SHARED ${SRCS})

set(DLL_DIR ${OS_BASE_NAME}/bin)
if(WIN32)
    set(TARGET_LOCATION
                ${PROJECT_SOURCE_DIR}/${DLL_DIR}${LIB_SUFFIX}/${CMAKE_CFG_INTDIR}/plugins/gui)
elseif (LINUX)
    set(TARGET_LOCATION
                ${PROJECT_SOURCE_DIR}/${DLL_DIR}${LIB_SUFFIX}${BUNDLE_SUBFOLDER}/plugins/gui)
else()
    set(TARGET_LOCATION
                ${PROJECT_SOURCE_DIR}/${DLL_DIR}${LIB_SUFFIX}${BUNDLE_SUBFOLDER}/gui)
endif(WIN32)
# if(LINUX OR APPLE)
# 	get_target_property(RESULT_FULL_PATH ${LIBRARY_NAME} LOCATION)
# 	get_filename_component(RESULT_FILE_NAME ${RESULT_FULL_PATH} NAME)
# endif(LINUX OR APPLE)

set_target_properties(${LIBRARY_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${TARGET_LOCATION})

target_link_libraries(${LIBRARY_NAME} ${DEMO_LIBS} ${wxWidgets_LIBRARIES})

add_dependencies(${LIBRARY_NAME} wxGuiPluginBase)

target_precompile_headers(${LIBRARY_NAME} PRIVATE ${PROJECT_ROOT_DIR}/include/stdwx.h ${PROJECT_ROOT_DIR}/include/stdwx.cpp)

if(LINUX OR APPLE)
	add_custom_command(TARGET ${LIBRARY_NAME} POST_BUILD
		COMMAND ${CMAKE_COMMAND} -E make_directory ${TARGET_LOCATION}
		COMMAND ${CMAKE_COMMAND} -E copy $<TARGET_FILE:${LIBRARY_NAME}> ${TARGET_LOCATION}/$<TARGET_FILE_NAME:${LIBRARY_NAME}>
	)
endif(LINUX OR APPLE)
