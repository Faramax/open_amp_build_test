#include "openamp.h"
#include "ipcc.h"
#include <stm32mp1xx_hal.h>
#include <error_handler.h>

extern IPCC_HandleTypeDef hipcc;

/******************************************************************************/
/*            Cortex Processor Interruption and Exception Handlers         */
/******************************************************************************/
/**
* @brief This function handles Non maskable interrupt.
*/
void NMI_Handler(void)
{
}

/**
* @brief This function handles Hard fault interrupt.
*/
void HardFault_Handler(void)
{
  Error_Handler();
}

/**
* @brief This function handles Memory management fault.
*/
void MemManage_Handler(void)
{
  Error_Handler();
}

/**
* @brief This function handles Pre-fetch fault, memory access fault.
*/
void BusFault_Handler(void)
{
  Error_Handler();
}

/**
* @brief This function handles Undefined instruction or illegal state.
*/
void UsageFault_Handler(void)
{
  Error_Handler();
}

/**
* @brief This function handles System service call via SWI instruction.
*/
void SVC_Handler(void)
{
}

/**
* @brief This function handles Debug monitor.
*/
void DebugMon_Handler(void)
{
}

/**
* @brief This function handles Pendable request for system service.
*/
void PendSV_Handler(void)
{
}

/**
* @brief This function handles System tick timer.
*/
void SysTick_Handler(void)
{
  HAL_IncTick();
}

/******************************************************************************/
/* STM32MP1xx Peripheral Interrupt Handlers                                    */
/* Add here the Interrupt Handlers for the used peripherals.                  */
/* For the available peripheral interrupt handler names,                      */
/* please refer to the startup file (startup_stm32mp1xx.s).                    */
/******************************************************************************/

void IPCC_RX1_IRQHandler(void)
{
  HAL_IPCC_RX_IRQHandler(&hipcc);
}
