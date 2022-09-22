clear all
set more off

use "C:\Users\otuna\Desktop\AdminTurnover\Phase3\AdminTurnover_Survey_Data_012721_020221_USE_THIS.dta"

keep if resp == 1

recode Q1 (-99 4 = .) (1 = 1 "Men") (2 = 2 "Women"), gen(gender)

recode Q2 (-99 = .), gen(age)
sum age, detail

recode Q2 (-99 = .) (18/29 = 0 "18-29") (30/39 = 1 "30-39") (40/49 = 2 "40-49") (50/59 = 3 "50-59") (60/69 = 4 "60-69"), gen(catage)

/*
graph bar, over(gender) blabel(bar, format(%9.0f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent) scheme(s2mono)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_gender.png, replace width(1200)

graph bar, over(catage) blabel(bar, format(%9.0f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent) scheme(s2mono)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_age.png, replace width(1200)
*/

recode Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7 (-99 = .)
egen racecheck = rowtotal(Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7), missing
list Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7 Q3_7_TEXT if racecheck != 1, nolab

drop temp
gen temp = 1 if racecheck == 1 & Q3_4 != 1 & Q3_1 == 1
replace temp = 2 if racecheck == 1 & Q3_4 != 1 & Q3_2 == 1
replace temp = 3 if racecheck == 1 & Q3_4 != 1 & Q3_3 == 1
replace temp = 4 if racecheck == 1 & Q3_4 == 1
replace temp = 5 if racecheck == 1 & Q3_4 != 1 & Q3_5 == 1
replace temp = 6 if racecheck == 1 & Q3_4 != 1 & Q3_6 == 1
replace temp = 7 if (racecheck == 1 & Q3_4 != 1 & Q3_7 == 1) | (racecheck >= 2 & racecheck <= 4)

recode temp (1 = 1 "American Indian or Alaska Native (NH)") (2 = 2 "Asian (NH)") (3 = 3 "Black or African American (NH)") ///
(4 = 4 "Hispanic or Latino, of any race") (5 = 5 "Native Hawaiian or Other Pacific Islander (NH)") ///
(6 = 6 "White (NH)") (7 = 7 "Other/Multiple (NH)"), gen(catrace)
drop temp

recode catrace (6 = 1) (1 2 3 4 5 7 = 0), gen(nhwhite)

/*
forval v = 1(1)7 {
replace Q3_`v' = 0 if Q3_`v' == . & racecheck < .
replace Q3_`v' = 100 if Q3_`v' == 1 & racecheck < .
}

graph hbar (mean) Q3_1 Q3_2 Q3_3 Q3_4 Q3_5 Q3_6 Q3_7, ascategory blabel(bar, format(%9.0f)) ylabel(0(20)100) ///
yvaroptions(relabel(1 "AIAN" 2 "Asian" 3 "Black/African American" 4 "Hispanic/Latino" 5 "NHOPI" 6 "White" 7 "Other")) ytitle(Percent)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_race.png, replace width(1200)
*/

recode Q4 (-99 = .) (1 = 1 "HS/GED") (2 = 2 "Some College") (3 = 3 "Associate") (4 = 4 "Bachelor") (5 = 5 "Masters") (6 = 6 "Professional") (7 = 7 "Doctorate"), gen(educ)

recode educ (1 2 = 0) (3 4 5 6 7 = 1), gen(anydegree)

tab Q5_1 if anydegree == 1 & Q5_1 != -99, miss
tab Q5_2 if anydegree == 1 & Q5_2 != -99, miss
tab Q5_3 if anydegree == 1 & Q5_3 != -99, miss
tab Q5_4 if anydegree == 1 & Q5_4 != -99, miss
tab Q5_5 if anydegree == 1 & Q5_5 != -99, miss

recode Q5_1 Q5_2 Q5_3 Q5_4 Q5_5 (-99 = .) (1 = 1) (2 = 0)
gen Q5_total = Q5_1 + Q5_2 + Q5_3 + Q5_4 + Q5_5

tab Q5_total if anydegree == 1

/*
graph hbar, over(educ) blabel(bar, format(%9.1f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_educ.png, replace width(1200)
*/

recode Q7 (-99 = .)

/*
graph bar, over(Q7) blabel(bar, format(%9.0f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_lastattend.png, replace width(1200)
*/

recode Q8_1 Q8_2 Q8_3 Q8_4 Q8_5 (-99 = .)

fre Q8_1, format(0)
fre Q8_2, format(0)
fre Q8_3, format(0)
fre Q8_4, format(0)
fre Q8_5, format(0)

sum Q8_1 Q8_2 Q8_3 Q8_4 Q8_5

recode Q9_1 Q9_2 Q9_3 Q9_4 Q9_5 (-99 = .)

fre Q9_1, format(0)
fre Q9_2, format(0)
fre Q9_3, format(0)
fre Q9_4, format(0)
fre Q9_5, format(0)

sum Q9_1 Q9_2 Q9_3 Q9_4 Q9_5

recode Q10a (-99 = .)

recode Q11 (-99 = .) (2017 = 3) (20192020 = 1)

recode Q12 (-99 = .)
fre Q12

recode Q13_1 Q13_2 Q13_3 (-99 = .)
egen rowtotal = rowtotal(Q13_1 Q13_2 Q13_3)
gen temp = 0 if Q13_3 == 1
replace temp = 1 if temp == . & Q13_1 == 1 & Q13_2 == .
replace temp = 2 if temp == . & Q13_1 == . & Q13_2 == 1
replace temp = 3 if temp == . & Q13_1 == 1 & Q13_2 == 1

recode temp (0 = 0 "First time admin") (1 = 1 "ALRC only") (2 = 2 "MC only") (3 = 3 "Both ALRC and MC"), gen(Q13)
drop temp

replace Q15_7 = 1 if Q15_7_TEXT != "-99" & Q15_7 == -99

egen anyQ15 = anycount(Q15_1 Q15_2 Q15_3 Q15_4 Q15_5 Q15_6 Q15_7), values(1 2)

foreach var in Q15_1 Q15_2 Q15_3 Q15_4 Q15_5 Q15_6 {
replace `var' = 2 if `var' == -99 & anyQ15 != 0
}

replace Q15_7 = 2 if Q15_7_TEXT == "-99" & Q15_7 == -99 & anyQ15 != 0

recode Q15_1 Q15_2 Q15_3 Q15_4 Q15_5 Q15_6 Q15_7 (-99 = .)
fre Q15_1
fre Q15_2
fre Q15_3
fre Q15_4
fre Q15_5
fre Q15_6
fre Q15_7

recode Q15_1 Q15_2 Q15_3 Q15_4 Q15_5 Q15_6 Q15_7 (-99 = .) (2 = 0) (1 = 1)
egen anywork = rowmax(Q15_1 Q15_2 Q15_3 Q15_4 Q15_5 Q15_6)


fre Q16, all i
destring Q16, gen(totten) force ignore(" " "years" "yrs" "year")
recode totten (-99 = .)
fre Q16 if totten == ., all i
replace totten = 2 if totten == . & Q16 == "2 years all with Mosaic"
replace totten = 20 if totten == . & Q16 == "2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020"
sum totten, detail

recode Q17 (-99 6 7 = .)

/*
graph hbar, over(Q17) blabel(bar, format(%9.0f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_salary.png, replace width(1200)
*/

tabm Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14

recode Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14 (-99 6 = .)

egen jobtotal = rowmean(Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14)
egen jobsec = rowmean(Q19_1 Q19_11)
egen jobcomp = rowmean(Q19_2 Q19_9)
egen jobgrowth = rowmean(Q19_3 Q19_6 Q19_10 Q19_13)
egen jobsocial = rowmean(Q19_4 Q19_7 Q19_12)
egen jobsupervision = rowmean(Q19_5 Q19_8 Q19_14)

forval v = 1(1)14 {
recode Q19_`v' (1 2 = 0) (3 = 1) (4 5 = 2), gen(newQ19_`v')
}

/*growth*/
fre Q19_3, format(0)
fre Q19_6, format(0)
fre Q19_10, format(0)
fre Q19_13, format(0)
sum Q19_3 Q19_6 Q19_10 Q19_13

/*job security*/
fre Q19_1, format(0)
fre Q19_11, format(0)
sum Q19_1 Q19_11

/*compensation*/
fre Q19_2, format(0)
fre Q19_9, format(0)
sum Q19_2 Q19_9

/*social*/
fre Q19_4, format(0)
fre Q19_7, format(0)
fre Q19_12, format(0)
sum Q19_4 Q19_7 Q19_12

/*supervision*/
fre Q19_5, format(0)
fre Q19_8, format(0)
fre Q19_14, format(0)
sum Q19_5 Q19_8 Q19_14



recode Q20_1 Q20_2 Q20_3 Q20_4 Q20_5 Q20_6 Q20_7 Q20_8 Q20_9 Q20_10 Q20_11 Q20_12 Q20_13 Q20_14 Q20_15 (-99 = .)

/*organizational commitment*/
factor Q20_1 Q20_3 Q20_6 Q20_7 Q20_9 Q20_12 Q20_13
sum Q20_1 Q20_3 Q20_6 Q20_7 Q20_9 Q20_12 Q20_13
/*affective*/
fre Q20_1, format(0)
fre Q20_3, format(0)
fre Q20_6, format(0)
/*normative*/
fre Q20_7, format(0)
fre Q20_9, format(0)
/*continuance*/
fre Q20_12, format(0)
fre Q20_13, format(0)




/*training for job skills*/
recode Q21 (-99 = .)
fre Q22_1 if Q21 == 1


/*job stress*/
recode Q26_1 Q26_2 Q26_3 Q26_4 Q26_5 Q26_6 Q26_7 Q26_8 Q26_9 Q26_10 (-99 = .)
sum Q26_1 Q26_2 Q26_3 Q26_4 Q26_5 Q26_6 Q26_7 Q26_8 Q26_9 Q26_10
/*time stress*/
fre Q26_1, format(0)
fre Q26_2, format(0)
fre Q26_3, format(0)
fre Q26_4, format(0)
fre Q26_5, format(0)

/*anxiety*/
fre Q26_6, format(0)
fre Q26_7, format(0)
fre Q26_8, format(0)
fre Q26_9, format(0)
fre Q26_10, format(0)

egen jobstress = rowmean( Q26_1 Q26_2 Q26_3 Q26_4 Q26_5 Q26_6 Q26_7 Q26_8 Q26_9 Q26_10 )

gr twoway (kdensity jobstress), xline(3.33) xlabel(1 `" "1" "Strongly Disagree" "' 2 3 4 5 `" "5" "Strongly Agree" "', grid gmin gmax) xscale(range(0.5 5.5)) ylabel(0(.2)1, gmin gmax) ytitle(Density) xtitle("Job Stress (10-Item)")
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export jobstress.png, replace width(1200)

/*
gen salary = Q17

foreach var in jobsec jobcomp jobgrowth jobsocial jobsupervision {
gen depvar = `var'
mean depvar, over(salary)
est sto `var'
drop depvar
}

coefplot jobsec, bylabel(Job Security) || jobcomp, bylabel(Pay/Compensation) || jobgrowth, bylabel(Growth Opportunities) || jobsocial, bylabel(Social) || jobsupervision, bylabel(Supervision) ///
||, xlabel(1 `" "1" "Very" "Dissatisfied" "' 2 3 4 5 `" "5" "Very" "Satisfied" "', grid gmin gmax) byopts(ixaxes) ///
ylabel(1 "$25,000 to $49,999" 2 "$50,000 to $74,999" 3 "$75,000 to $99,999" 4 "$100,000 or greater") ///
recast(connected) cirecast(rcap) xscale(range(0.5 5.5))

cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export jobsat_salary.png, replace width(1200)
*/

/*
graph dot (mean) Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14, exclude0 ascategory linetype(rectangle) marker(1, mcolor(black) msize(large)) ///
ylabel(1 `" "1" "Very Dissatisfied" "' 2 3 4 5 `" "5" "Very Satisfied" "', grid gmin gmax) ///
yscale(range(0 6)) graphregion(color(white) lcolor(white) lwidth(medthick))

cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export jobsat.png, replace width(1200)
*/

/*
graph bar, over(Q23) blabel(bar, format(%9.0f)) ylabel(0(20)100, angle(0) gmin gmax) ytitle(Percent)
cd "C:\Users\otuna\Desktop\AdminTurnover\Phase3\Report"
gr export bar_health.png, replace width(1200)
*/



exit

factor Q26_1 Q26_2 Q26_3 Q26_4 Q26_5 Q26_6 Q26_7 Q26_8 Q26_9 Q26_10
alpha Q26_1 Q26_2 Q26_3 Q26_4 Q26_5 Q26_6 Q26_7 Q26_8 Q26_9 Q26_10

reg jobstress i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi

gen intent = Q20_11+ Q20_14+ Q20_15 - 3

reg intent i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi

recode Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14 (-99 6 = .)
sum Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14
factor Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14
alpha Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14
egen jobsat = rowmean(Q19_1 Q19_2 Q19_3 Q19_4 Q19_5 Q19_6 Q19_7 Q19_8 Q19_9 Q19_10 Q19_11 Q19_12 Q19_13 Q19_14)

reg jobsat i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi

gr twoway lpolyci jobsat jobstress
gr twoway lpolyci intent jobsat
gr twoway lpolyci intent jobstress

ologit Q23 i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi
ologit Q24 i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi
ologit Q25 i.gender i.nhwhite c.age i.catcap i.anymc i.nonpro i.rural i.medi


