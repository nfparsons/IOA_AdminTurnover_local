capture log close
clear all
putdocx clear

log using "log/adTurn_analysis.log", text replace

// PROJECT: Administrative Turnover
// PROGRAM: adTurn_analysis.do
// TASK: Analyze adTurn data
// CREATED BY: N.F. Parsons
// DATE: 08/08/22

version 1.0
set linesize 80
set more off



use "data/adturn.dta"

**********************************
*** COMMANDS/PROGRAM GOES HERE ***
**********************************

putdocx begin

putdocx paragraph, style(Title)
putdocx text ("AdTurn Analysis")

// test subscales interitem correlations

putdocx paragraph, style(Heading1)
putdocx text ("Interitem correlations")

putdocx paragraph
putdocx text ("Q19. This next question asks about how satisfied you are with each aspect of your current job listed below. To what extent are you satisfied or dissatisfied with each aspect of your job? Please select Not Applicable if a particular statement is not applicable to you or your position.")
alpha q19_*, std item
putdocx table inter1
putdocx save adTurn_Analysis, replace

putdocx begin
putdocx paragraph	
putdocx text ("Q20. To what extent are you satisfied or dissatisfied with each aspect of your job?")	
alpha q20_*, std item
putdocx save adTurn_Analysis, append

putdocx begin
putdocx paragraph
putdocx text ("Q26. Following are some statements related to your work. Do you agree or disagree with each statement?")	
alpha q26_*, std item
putdocx save adTurn_Analysis, append

// save "data/adturn.dta", replace
log close













