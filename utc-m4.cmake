set(ARM_TOOLS_PATH           "/home/sergey/projects/developUTC/source/arm-tools")
set(STM32_TOOLCHAIN_PATH     "${ARM_TOOLS_PATH}/gcc")
set(CROSS_PREFIX             "${ARM_TOOLS_PATH}/gcc/bin/arm-none-eabi-")
set(CMAKE_SYSROOT            "${ARM_TOOLS_PATH}/gcc/arm-none-eabi/")

set(CMAKE_C_CXX_COMMON_FLAGS  "-Wno-unused-variable -Wno-unused-parameter -Wno-psabi -Wno-deprecated-declarations")
set(CMAKE_C_FLAGS             "${CMAKE_C_CXX_COMMON_FLAGS}") #${STM32_FLAGS}
set(CMAKE_EXE_LINKER_FLAGS    "-flto") #-specs=nosys.specs

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_C_COMPILER         "${CROSS_PREFIX}gcc")
set(CMAKE_CXX_COMPILER       "${CROSS_PREFIX}g++")

set(STM32_CUBE_MP1_PATH      "${ARM_TOOLS_PATH}/STM32CubeMP1")
set(STM32_CUBE_PATH          "${STM32_CUBE_MP1_PATH}")
set(FREERTOS_PATH            "${STM32_CUBE_MP1_PATH}/Middlewares/Third_Party/FreeRTOS")

include(${ARM_TOOLS_PATH}/stm32-cmake/cmake/stm32_gcc.cmake)
