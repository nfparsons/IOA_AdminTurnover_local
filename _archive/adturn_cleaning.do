********************************************************************************
** SET WORKING DIRECTORY

 cd "/Users/nate/My Drive (nparsons@pdx.edu)/projects/IoA/IOA_AdminTurnover_local"
 
 // PROJECT: AdTurn
 // PROGRAM: adturn_cleaning.do
 // TASK: Clean adturn data
 // CREATED BY: NF. Parsons
 // DATE: 08-08-22
 
 version 1
 clear all 
 set linesize 80
 set more off
 
 use "data/AdminTurnover_Survey_Data_012721_020221_USE_THIS.dta"

********************************************************************************
** COMMANDS / PROGRAM GOES HERE

keep order012621 firstname lastname StartDate EndDate Finished Q1 Q2 Q3_* ///
	Q4 Q5_* Q6_* Q7 Q8_* Q9_* Q10a Q11 Q12 Q13_* Q14 Q15_* Q16 Q17 Q18_* ///
	Q19_* Q20_* Q21 Q22_* Q23 Q24 Q25 Q26_* resp CCMU medicaid catcap ///
	anymc county opendate medi rural nonpro

drop Q3_7_TEXT Q6_6_TEXT Q15_7_TEXT Q18_9_TEXT Q22_23_TEXT
	
rename *, lower

