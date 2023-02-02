#include "stm32mp1xx_hal.h"
#include "virt_uart.h"
#include "ipcc.h"

int main()
{
   HAL_Init();

   assert(!IS_ENGINEERING_BOOT_MODE());

   __HAL_RCC_HSEM_CLK_ENABLE();
   MX_IPCC_Init();
   MX_OPENAMP_Init(RPMSG_REMOTE, NULL);

   while(1)
   {
   }
}
