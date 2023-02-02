project(hello_world.c)
cmake_minimum_required(VERSION 3.20)

set(STM32)
set(STM32_FAMILY "STM32MP1")
find_package(CMSIS COMPONENTS STM32MP157AA)
find_package(HAL COMPONENTS STM32MP1 REQUIRED)
add_compile_definitions(CORE_CM4)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
add_library(mcu_hal stm32mp1xx_hal_conf.h)
target_link_libraries(mcu_hal
   HAL::STM32::MP1
   CMSIS::STM32::MP157AA
   HAL::STM32::MP1::CORTEX
   HAL::STM32::MP1::RCC
)

add_library(mcu_libc INTERFACE IMPORTED GLOBAL)
target_sources(mcu_libc INTERFACE ${EMPTY_SYSCALLS})
target_link_libraries(mcu_libc INTERFACE
   mcu_hal
   STM32::NoSys
)

add_subdirectory(openamp)

set(SOURCES
   error_handler.c
   error_handler.h
   hello_world.c
   stm32mp1xx_it.c
)
add_executable(mt_hello_world ${SOURCES})
target_link_libraries(mt_hello_world
   cpp_amp
   mcu_hal
   mcu_libc
)
