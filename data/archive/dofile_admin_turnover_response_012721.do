clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Phase3_Participant Tracking_012621_1818_cleaned.xlsx", sheet("ALRCMC") firstrow
drop AD AE AF AG AH AI AJ

keep if CCMU != ""

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster.dta", replace

clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Phase3_Participant Tracking_012621_1818_cleaned.xlsx", sheet("ALRCMC") firstrow
drop AD AE AF AG AH AI AJ

keep if CCMU != ""

rename * *2

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster_2.dta", replace

clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Phase3_Participant Tracking_012621_1818_cleaned.xlsx", sheet("ALRCMC") firstrow
drop AD AE AF AG AH AI AJ

keep if CCMU != ""

rename * *3

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster_3.dta", replace

clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Oregon Zip Codes Towns Cities and Service Areas and their ORH Urban Rural Frontier Designation 2.xlsx", sheet("MAIN___Zip_Codes") firstrow

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Oregon Zip Codes Towns Cities and Service Areas and their ORH Urban Rural Frontier Designation 2.dta", replace

clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Phase3_Participant Tracking_012621_1818_cleaned.xlsx", sheet("ALRCMC Survey Tracking") firstrow

rename email RecipientEmail

replace RecipientEmail = "travis.rice@prestigecare.com" if RecipientEmail == "travis.rice@prestigecarecom"

merge 1:1 firstname lastname RecipientEmail using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\AdminTurnover_Survey_Data_012721.dta"
keep if _merge == 1 | _merge == 3
drop _merge

replace fac3 = "" if fac3 == "ed@bayberrycommons.com"

duplicates tag RecipientEmail, gen(tag)

list firstname lastname RecipientEmail ResponseId fac1 ccmu1 fac2 ccmu2 fac3 ccmu3 if tag == 1

replace ccmu2 = "50M426" if ccmu1 == "50R283"
replace fac2 = "Countryside Living of Redmond" if ccmu1 == "50R283"
drop if ccmu1 == "50M426"

replace ccmu2 = "50M268" if ccmu1 == "50R395"
replace fac2 = "Sweet Bye N Bye Memory Care Facilities" if ccmu1 == "50R395"
drop if ccmu1 == "50M268"

replace ccmu2 = "70M221" if ccmu1 == "50R313"
replace fac2 = "Prairie House Assisted Living Community" if ccmu1 == "50R313"
drop if ccmu1 == "70M221"

replace ccmu2 = "5MA245" if ccmu1 == "70M227"
replace fac2 = "Avamere at Sherwood" if ccmu1 == "70M227"
drop if ccmu1 == "5MA245"

replace ccmu1 = "70A308" if fac1 == "Brookdale Newberg"

gen resp = 1 if ResponseId != ""
replace resp = 0 if ResponseId == ""

gen CCMU = ccmu1

merge m:1 CCMU using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster.dta"
keep if _merge == 3
drop _merge

gen CCMU2 = ccmu2
merge m:1 CCMU2 using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster_2.dta"
keep if _merge == 1 | _merge == 3
drop _merge

gen CCMU3 = ccmu3
merge m:1 CCMU3 using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Facility_Roster_3.dta"
keep if _merge == 1 | _merge == 3
drop _merge

egen cap = rowtotal(excap excap2 excap3), missing
egen tempcap = rowtotal(capacity)
replace cap = tempcap if cap == . & tempcap < .

egen mccap = rowtotal(exmc exmc2 exmc3)

recode mccap (0 = 0) (1/max = 1), gen(anymc)
recode cap (0/24 = 0) (25/49 = 1) (50/74 = 2) (75/max = 3), gen(catcap)

gen meditemp = 1 if medicaid == "Yes"
replace meditemp = 0 if medicaid == "Non Medicaid"

gen meditemp2 = 1 if medicaid2 == "Yes"
replace meditemp2 = 0 if medicaid2 == "Non Medicaid"

gen meditemp3 = 1 if medicaid3 == "Yes"
replace meditemp3 = 0 if medicaid3 == "Non Medicaid"

egen medi = rowmax(meditemp meditemp2 meditemp3)

rename zipcode ZipCode

merge m:1 ZipCode using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Oregon Zip Codes Towns Cities and Service Areas and their ORH Urban Rural Frontier Designation 2.dta"
keep if _merge == 3
drop _merge

gen temp = 0 if Designation == "Urban"
replace temp = 1 if Designation == "Rural"
replace temp = 2 if Designation == "Frontier"
recode temp (0 = 0 "Urban") (1 = 1 "Rural") (2 = 2 "Frontier"), gen(rural)

/*
clear all
set more off

import excel "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Owner_P_NP_032620_020221.xlsx", sheet("Owners") firstrow

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Owner_P_NP_032620_020221.dta", replace
*/

rename owner Owner

replace Owner = "Marquis Companies I, Inc." if CCMU == "50R488"
replace Owner = "Pc Roseburg, LLC" if CCMU == "70A345"
replace Owner = "Hsre-Springs V Trs, LLC" if CCMU == "50R484"
replace Owner = "Heirloom Living Centers, LLC" if CCMU == "50R486"
replace Owner = "Pc Roseburg, LLC" if CCMU == "50R489"
replace Owner = "Fields Weatherly Court, LLC" if CCMU == "70A344"
replace Owner = "Clackamas Memory Care, LLC" if CCMU == "50R483"

merge m:1 Owner using "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Owner_P_NP_032620_020221.dta"
keep if _merge == 3
drop _merge

gen nonpro = 1 if OwnType == "DNP"
replace nonpro = 0 if nonpro == .

tab catcap resp, col chi
tab anymc resp, col chi
tab rural resp, col chi
tab medi resp, col chi
tab nonpro resp, col chi

save "C:\Users\otuna\Desktop\AdminTurnover\Phase3\AdminTurnover_Survey_Data_012721_020221_USE_THIS.dta", replace
