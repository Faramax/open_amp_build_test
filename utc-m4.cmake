set(STM32_CUBE_MP1_PATH      "/home/sergey/projects/developUTC/source/arm-tools/STM32CubeMP1")
set(CROSS_PREFIX             "${STM32_TOOLCHAIN_PATH}/bin/arm-none-eabi-")

set(CMAKE_C_CXX_COMMON_FLAGS  "-Wno-unused-variable -Wno-unused-parameter -Wno-psabi -Wno-deprecated-declarations")
set(CMAKE_C_FLAGS             "${CMAKE_C_CXX_COMMON_FLAGS}") #${STM32_FLAGS}
set(CMAKE_EXE_LINKER_FLAGS    "-flto") #-specs=nosys.specs

set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

set(CMAKE_C_COMPILER         "${CROSS_PREFIX}gcc")
set(CMAKE_CXX_COMPILER       "${CROSS_PREFIX}g++")


set(STM32_CUBE_PATH          "${STM32_CUBE_MP1_PATH}")
set(FREERTOS_PATH            "${STM32_CUBE_MP1_PATH}/Middlewares/Third_Party/FreeRTOS")

set(STM32_CMAKE_PATH         "${CMAKE_CURRENT_LIST_DIR}/stm32-cmake")
include(${STM32_CMAKE_PATH}/cmake/stm32_gcc.cmake)