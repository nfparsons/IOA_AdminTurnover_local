
// PROJECT: adTurn
// PROGRAM: adTurn_prep.do
// TASK: Prep data for analysis
// CREATED BY: N.F. Parsons
// DATE: 09.09.22

clear all
set linesize 80 
set more off, permanently

********************************************************************************
*** COMMANDS/PROGRAM GOES HERE ***
********************************************************************************

// load data

use "data/AdminTurnover_Survey_Data_012721_020221_USE_THIS.dta"

// remove duplicate variables for sanity

drop Check1* Q R S T

// merge with Administrator data

merge 1:1 ccmu1 firstname lastname using "data/AdTurn List 021622.dta"

********************************************************************************
// recode variables

mvdecode _all, mv(-99 = .)

generate id = order012621
label variable id "Unique ID"
order id, first

// generate quit outcome variable
generate quit = . 
replace quit = 1 if (ENDED_100121 == .)
replace quit = 0 if (ENDED_100121 != .)
label variable quit "Did respondent quit latest position?"
order quit, after(id)

// Demographic Characteristics
recode Q1 (1=1 "Male") ///
		  (2=2 "Female") ///
		  (3/4=.), generate(sex)
label variable sex "Respondent sex (Simplified)"
order sex, after(quit)

recode Q2 (0/20=1 "<= 20 years old") ///
		  (20/30=2 ">20 to 30 years old") ///
		  (30/40=3 ">30 to 40 years old") ///
		  (40/50=4 ">40 to 50 years old") ///
		  (50/60=5 ">50 to 60 years old") ///
		  (60/70=6 ">60 to 70 years old") ///
		  (70/max=7 "70+ years old"), generate(age)
label variable age "Respondent age (Categorical)"
order age, after(sex)
		  
generate race = .
replace race = 1 if (Q3_6==1)
replace race = 2 if (Q3_6!=1)
label define racelabel 1 "White" 2 "Non-white"
label values race racelabel
label variable race "Respondent race (Binary)"
order race, after(age)

recode Q4 (1 = 1 "High school/GED") ///
		  (2 = 2 "Some college") ///
		  (3 = 3 "Associate's degree") ///
		  (4 = 4 "Bachelor's degree") ///
		  (5 = 5 "Master's degree") ///
		  (6 = 6 "Professional degree") ///
		  (7 = 7 "Doctoral degree"), generate(education)
label variable education "Respondent education level (Categorical)"
order education, after(race)

replace Q16 = "20" if (Q16=="2001,2002,2003,2004,2005,2006,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019,2020")
replace Q16 = "." if (Q16=="n/a")
destring Q16, replace ignore(years all with Mosaic yrs year)
recode Q16 (0/2=1 "<= 2 years") ///
		   (2/5=2 ">2 - 5 years") ///
		   (5/10=3 ">5 - 10 years") ///
		   (10/15=4 ">10 - 15 years") ///
		   (15/20=5 ">15 - 20 years") ///
		   (20/max=6 "20+ years"), generate(experience)
label variable experience "Respondent year experience in field (Categorical)"
order experience, after(education)
 
format %td STARTED ENDED_100121
generate start_date = STARTED
format %td start_date
label variable start_date "ODHS date respondent began latest position"
order start_date, after(experience)

egen max_ENDED_100121 = max(ENDED_100121)
generate end_date = ENDED_100121
format %td end_date
replace end_date = max_ENDED_100121 if end_date==.
label variable end_date "ODHS date respondent left last position; NA if respondent did not leave"
order end_date, after(start_date)

generate tenure = (end_date - start_date) / 365.25
label variable tenure "ODHS length of stay in respondent's last position (Years)"
order tenure, after(end_date)

generate tenure_sr = Q11
label variable tenure_sr "Self-reported length of stay in respondent's last position (Years)"
order tenure_sr, after(tenure)

recode Q17 (1 = 1 "Less than or equal to $24,999") ///
		   (2 = 2 "$25,000-$49,999") ///
		   (3 = 3 "50,000-$74,999") ///
		   (4 = 4 "75,000-$99,999") ///
		   (5 = 5 "$100,000+") ///
		   (6/7 = .), generate(salary)
label variable salary "Respondent's salary (Categorical)"
order salary, after(tenure_sr)


// Facility Characteristics

generate ccmu = CCMU
label variable ccmu "Facility CCMU"
order ccmu, after(salary)

generate fac = fac1
label variable fac "Facility name"
order fac, after(ccmu)

label variable anymc "Does facility perform memory care? (Binary)"
label define anymclabel 0 "No" 1 "Yes"
label values anymc anymclabel
order anymc, after(fac)

recode catcap (0=1) ///
			  (1=2) ///
			  (2=3) ///
			  (3=4)
label define catcaplabel 1 "Small (6-24)" 2 "Medium (25-49)" 3 "Large (50-74)" 4 "Very Large (75+)"
label values catcap catcaplabel
label variable catcap "Facility capacity (Categorical)"
order catcap, after(anymc)

label variable medi "Does facility accept Medicaid? (Binary)"
label define medilabel 0 "No" 1 "Yes"
label values medi medilabel
order medi, after(catcap)

label variable nonpro "Is facility nonprofit? (Binary)"
label define nonprolabel 0 "No" 1 "Yes"
label values nonpro nonprolabel
order nonpro, after(medi)

recode rural (0=1) ///
			 (1=2) ///
			 (2=3)
label define rurallabel 1 "Urban" 2 "Rural" 3 "Frontier"
label values rural rurallabel
label variable rural "Facility's geographic context (Categorical)"
order rural, after(nonpro)


// Survey responses

recode Q5_1 (1=1 "Yes") ///
			(2=0 "No"), generate(curriculum_aging)
label variable curriculum_aging "Q5_1 Aging or older adults"
order curriculum_aging, after(rural)

recode Q5_2 (1=1 "Yes") ///
			(2=0 "No"), generate(curriculum_disabil)
label variable curriculum_disabil "Q5_2 Disabilities"
order curriculum_disabil, after(curriculum_aging)

recode Q5_3 (1=1 "Yes") ///
			(2=0 "No"), generate(curriculum_bhi)
label variable curriculum_bhi "Q5_3 Behavioral or mental health"
order curriculum_bhi, after(curriculum_disabil)

recode Q5_4 (1=1 "Yes") ///
			(2=0 "No"), generate(curriculum_lts)
label variable curriculum_lts "Q5_4 Long-term services and supports"
order curriculum_lts, after(curriculum_bhi)

recode Q5_5 (1=1 "Yes") ///
			(2=0 "No"), generate(curriculum_admin)
label variable curriculum_admin "Q5_5 Healthcare administration"
order curriculum_admin, after(curriculum_lts)


recode Q6_1 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_nha)
label variable certification_nha "Q6_1 Nursing home administrator"
order certification_nha, after(curriculum_admin)

recode Q6_2 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_rn)
label variable certification_rn "Q6_2 Registered nurse"
order certification_rn, after(certification_nha)

recode Q6_3 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_lpn)
label variable certification_lpn "Q6_3 LPN/LVN"
order certification_lpn, after(certification_rn)

recode Q6_4 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_cna)
label variable certification_cna "Q6_4 CNA"
order certification_cna, after(certification_lpn)

recode Q6_5 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_cma)
label variable certification_cma "Q6_5 CMA"
order certification_cma, after(certification_cna)

recode Q6_6 (1=0 "No, never") ///
			(2=1 "Yes, previously") ///
			(3=2 "Yes, currently"), generate(certification_oth)
label variable certification_oth "Q6_6 Other"
order certification_oth, after(certification_cma)


recode Q10a (2=0 "No") ///
			(1=1 "Yes"), generate(ownership)
label variable ownership "Q10a Partial or full ownership? (Binary)"
order ownership, after(certification_oth)


recode Q12 (2=0 "No") ///
		   (1=1 "Yes"), generate(prev_position)
label variable prev_position "Q12 Worked in any other position at this community?"
order prev_position, after(ownership)


generate prev_admin_alrc = 1 if (Q13_1==1)
replace prev_admin_alrc = 0 if (Q13_1!=1)
label define prev_admin_alrclabel 0 "No" 1 "Yes"
label values prev_admin_alrc prev_admin_alrclabel
label variable prev_admin_alrc "Q13_1 Has respondent been an administrator at an AL/RC community?"
order prev_admin_alrc, after(prev_position)

recode Q13_2 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_admin_mc)
replace prev_admin_mc = 0 if (Q13_2!=1)
label variable prev_admin_mc "Q13_2 Has respondent been an administrator at an MC community?"
order prev_admin_mc, after(prev_admin_alrc)

recode Q13_3 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_admin_first)
replace prev_admin_first = 0 if (Q13_3!=1)
label variable prev_admin_first "Q13_3 Respondent's first administrator position."
order prev_admin_first, after(prev_admin_mc)


recode Q14 (1=1 "I transferred to this community in the same organization") ///
		   (2=2 "I quit") ///
		   (3=3 "I was laid off?") ///
		   (4=4 "It closed") ///
		   (5=5 "Other"), generate(prev_reason_leav)
label variable prev_reason_leav "Q14 Reason for leaving previous position"
order prev_reason_leav, after(prev_admin_first)


recode Q15_1 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_afh)
label variable prev_work_afh "Q15_1 Previously worked in AFH/CH"
order prev_work_afh, after(prev_reason_leav)

recode Q15_2 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_nh)
label variable prev_work_nh "Q15_2 Previously worked in Nursing Home"
order prev_work_nh, after(prev_work_afh)

recode Q15_3 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_hha)
label variable prev_work_hha "Q15_3 Previously worked in Home Health Agency"
order prev_work_hha, after(prev_work_nh)

recode Q15_4 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_hc)
label variable prev_work_hc "Q15_4 Previously worked in Home Care"
order prev_work_hc, after(prev_work_hha)

recode Q15_5 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_hosp)
label variable prev_work_hosp "Q15_5 Previously worked in Hospital"
order prev_work_hosp, after(prev_work_hc)

recode Q15_6 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_adc)
label variable prev_work_adc "Q15_6 Previously worked in Adult Day Care"
order prev_work_adc, after(prev_work_hosp)

recode Q15_7 (2=0 "No") ///
			 (1=1 "Yes"), generate(prev_work_other)
label variable prev_work_other "Q15_7 Previously worked in Other"
order prev_work_other, after(prev_work_adc)


recode Q18_1 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_persins)
label variable benefits_persins "Q18_1 Benefits: Personal insurance"
order benefits_persins, after(prev_work_other)

recode Q18_2 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_famins)
label variable benefits_famins "Q18_2 Benefits: Family insurance"
order benefits_famins, after(benefits_persins)

recode Q18_3 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_pto)
label variable benefits_pto "Q18_3 Benefits: Paid personal time"
order benefits_pto, after(benefits_famins)

recode Q18_4 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_psl)
label variable benefits_psl "Q18_4 Benefits: Paid sick leave"
order benefits_psl, after(benefits_pto)

recode Q18_5 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_phol)
label variable benefits_phol "Q18_5 Benefits: Paid holidays"
order benefits_phol, after(benefits_psl)

recode Q18_6 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_pens)
label variable benefits_pens "Q18_6 Benefits: Pension"
order benefits_pens, after(benefits_phol)

recode Q18_7 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_401k)
label variable benefits_401k "Q18_7 Benefits: 401k"
order benefits_401k, after(benefits_pens)

recode Q18_8 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_lifins)
label variable benefits_lifins "Q18_8 Benefits: Life insurance"
order benefits_lifins, after(benefits_401k)

recode Q18_9 (2/3=0 "No") ///
			 (1=1 "Yes"), generate(benefits_bonus)
label variable benefits_bonus "Q18_9 Benefits: Bonus or incentive pay"
order benefits_bonus, after(benefits_lifins)


recode Q23 (1=5 "Excellent") ///
		   (2=4 "Very good") ///
		   (3=3 "Good") ///
		   (4=2 "Fair") ///
		   (5=1 "Poor"), generate(general_health)
label variable general_health "Q23 Respondent's health in general"
order general_health, after(benefits_bonus)

recode Q24 (1=5 "Daily") ///
		   (2=4 "Weekly") ///
		   (3=3 "Monthly") ///
		   (4=2 "A few times a year") ///
		   (5=1 "Never"), generate(general_anxiety)
label variable general_anxiety "Q24 Respondent's anxiety in general"
order general_anxiety, after(general_health)

recode Q25 (1=5 "Daily") ///
		   (2=4 "Weekly") ///
		   (3=3 "Monthly") ///
		   (4=2 "A few times a year") ///
		   (5=1 "Never"), generate(general_depressed)
label variable general_depressed "Q25 Respondent's depression in general"
order general_depressed, after(general_anxiety)


// Scales - simple additive
// Job Satisfaction, 5 subscales
recode Q19* (6=.)

generate job_sat_sec = Q19_1 + Q19_11
label variable job_sat_sec "Q19 Job satisfaction: Job security"
order job_sat_sec, after(general_depressed)

generate job_sat_comp = Q19_2 + Q19_9 
label variable job_sat_comp "Q19 Job satisfaction: Compensation"
order job_sat_comp, after(job_sat_sec)

generate job_sat_grow = Q19_3 + Q19_6 + Q19_10 + Q19_13
label variable job_sat_grow "Q19 Job satisfaction: Growth"
order job_sat_grow, after(job_sat_comp)

generate job_sat_social = Q19_4 + Q19_7 + Q19_12
label variable job_sat_social "Q19 Job satisfaction: Social/co-workers"
order job_sat_social, after(job_sat_grow)

generate job_sat_super = Q19_5 + Q19_8 + Q19_14
label variable job_sat_super "Q19 Job satisfaction: Supervision"
order job_sat_super, after(job_sat_social)


// Organizational Characteristics, 4 subscales
recode Q20* (6=.)

generate org_commit = Q20_1 + Q20_3 + Q20_6 + Q20_7 + Q20_9 + Q20_12 + Q20_13
label variable org_commit "Q20 Organizational Commitment"
order org_commit, after(job_sat_super)

generate org_support = Q20_2 + Q20_4 + Q20_8 
label variable org_support "Q20 Perceived organizational support"
order org_support, after(org_commit)

generate org_security = Q20_5 + Q20_10
label variable org_security "Q20 Perceived job security"
order org_security, after(org_support)

generate org_itq = Q20_11 + Q20_14 + Q20_15
label variable org_itq "Q20 Intent to quit"
order org_itq, after(org_security)


// Job Stress, 1 scale
recode Q26* (6=.)

generate job_stress = Q26_1 + Q26_2 + Q26_3 + Q26_4 + Q26_5 + Q26_6 + Q26_7 + Q26_8 + Q26_9 + Q26_10
label variable job_stress "Q26 Job stress"
order job_stress, after(org_itq)


// generate survey weights
logit resp anymc catcap nonpro rural medi
predict pred, pr
generate svy_weight = 1/pred
label variable svy_weight "Survey weights"
order svy_weight, after(job_stress)

generate response = resp
order response, after(svy_weight)

generate exclude = 1 if (NoAdminRecord=="Exclude")
order exclude, after(response)


********************************************************************************
// do some cleanup

keep id-exclude

mvdecode _all, mv(-99 = .)

// code the missing binaries with 0
mvencode curriculum_* certification_* prev_reason_leav prev_work_* ///
	benefits_*, mv(0) override

summarize

save data/adTurn_clean, replace


