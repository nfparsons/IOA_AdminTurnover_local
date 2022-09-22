
// PROJECT: adTurn
// PROGRAM: adTurn_analysis.do
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

use "data/adTurn_clean.dta"
drop if (response==0)
drop if (exclude==1)

summarize

********************************************************************************
*** Set survey

svyset id [pweight=svy_weight]

********************************************************************************
*** Impute missing

mi set flong

mi register imputed sex age race education experience tenure_sr salary ///
	ownership prev_position job_sat_* org_* job_stress
	
mi register regular quit anymc catcap medi nonpro rural curriculum_* ///
	certification_* prev_admin_* prev_reason_leav prev_work_* benefits_* ///
	general_* svy_weight
	
mi impute pmm sex age race education experience tenure_sr salary ///
	ownership prev_position job_sat_* org_* job_stress, add(5) knn(1) ///
	rseed(13) force

save data/adTurn_mi, replace







********************************************************************************
*** Impute missing

mi set flong

mi register imputed sex age race education experience tenure_sr salary ///
	ownership prev_position job_sat_* org_* job_stress
	
mi impute mvn sex age race education experience tenure_sr salary ///
	ownership prev_position job_sat_* org_* job_stress, emonly
	    
mat Sigma = r(Sigma_em)
_getcovcorr Sigma, corr shape(full)
mat C = r(C)
matlist C
