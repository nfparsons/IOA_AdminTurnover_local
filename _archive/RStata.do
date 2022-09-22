set more off

capture noisily {
/*RSTATA: cut me here*/
use '/Users/nate/My Drive (nparsons@pdx.edu)/projects/IoA/IOA_AdminTurnover_local/data/AdminTurnover_Survey_Data_012721_020221_USE_THIS.dta'
/*RSTATA: cut me here*/
} /* end capture noisily */
saveold RStataDataOut, version(12)
exit, clear STATA
