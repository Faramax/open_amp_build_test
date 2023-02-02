if(NOT STM32_CUBE_PATH)
   message(FATAL_ERROR "There is no STM32_CUBE_PATH specified")
endif()
set(OPEN_AMP_PATH "${STM32_CUBE_PATH}/Middlewares/Third_Party/OpenAMP")

set(METAL_LIB           ${OPEN_AMP_PATH}/libmetal/install/m4-generic-release/usr/local/lib/libmetal.a)
set(METAL_INCLUDE_DIR   ${OPEN_AMP_PATH}/libmetal/install/m4-generic-release/usr/local/include)
set(AMP_LIB             ${OPEN_AMP_PATH}/open-amp/install/m4-generic-release/usr/local/lib/libopen_amp.a)
set(AMP_INCLUDE_DIR     ${OPEN_AMP_PATH}/open-amp/install/m4-generic-release/usr/local/include)

add_library(openamp INTERFACE IMPORTED GLOBAL)
target_sources(openamp INTERFACE
   ${CMAKE_CURRENT_SOURCE_DIR}/stm32mp1xx_hal_msp.c
   ${OPEN_AMP_PATH}/virtual_driver/virt_uart.c
   ${CMAKE_CURRENT_SOURCE_DIR}/openamp.c
   ${CMAKE_CURRENT_SOURCE_DIR}/openamp.h
   ${CMAKE_CURRENT_SOURCE_DIR}/ipcc.c
   ${CMAKE_CURRENT_SOURCE_DIR}/ipcc.h
   ${CMAKE_CURRENT_SOURCE_DIR}/openamp_conf.h
   ${CMAKE_CURRENT_SOURCE_DIR}/mbox_ipcc.c
   ${CMAKE_CURRENT_SOURCE_DIR}/mbox_ipcc.h
   ${CMAKE_CURRENT_SOURCE_DIR}/rsc_table.h
   ${CMAKE_CURRENT_SOURCE_DIR}/rsc_table.c
   ${CMAKE_CURRENT_SOURCE_DIR}/rpmsg_hdr.h
   ${CMAKE_CURRENT_SOURCE_DIR}/rpmsg_hdr.c
   ${CMAKE_CURRENT_SOURCE_DIR}/rpmsg_hdr_status.h
)
target_include_directories(
   openamp INTERFACE
   ${CMAKE_CURRENT_SOURCE_DIR}
   ${METAL_INCLUDE_DIR}
   ${AMP_INCLUDE_DIR}
   ${OPEN_AMP_PATH}/virtual_driver
)
target_link_libraries(
   openamp INTERFACE
   ${AMP_LIB}
   ${METAL_LIB}
#   metal
#   open_amp
   HAL::STM32::MP1
   HAL::STM32::MP1::IPCC
#   mcu_hal
#   mcu_libc
)
target_compile_options(openamp INTERFACE -Wno-unused-parameter -Wno-empty-body -Wno-error -Wno-format)


add_library(cpp_amp INTERFACE IMPORTED GLOBAL)
target_sources(cpp_amp INTERFACE
   rpmsg.cpp
   rpmsg.hpp
   printf.cpp
   printf.hpp
)
target_link_libraries(cpp_amp INTERFACE
#   mcu_driver
   openamp
)
