capture log close
clear all
putdocx clear

log using "log/adTurn_label", text replace

// PROJECT: Administrative Turnover
// PROGRAM: adTurn_label.do
// TASK: label adTurn data
// CREATED BY: N.F. Parsons
// DATE: 08/08/22

version 1.0
set linesize 80
set more off
set seed 13

cd "/Users/nate/My Drive (nparsons@pdx.edu)/projects/IoA/IOA_AdminTurnover_local"

use "data/adturn.dta"

**********************************
*** COMMANDS/PROGRAM GOES HERE ***
**********************************

label variable id "Unique respondent ID"

label variable firstname "Respondent's first name"

label variable lastname "Respondent's last name"

label variable employee_start "Date respondent started most recent position"

label variable employee_left "Date respondent left most recent position"

label define quit_l 0 "Did not leave" 1 "Left position"
label variable quit "Did respondent leave position?"
label values quit quit_l

label variable ccmu "Unique Facility ID"

label variable county "Facility county"

label variable fac_opendate "Date facility opened"

label variable fac_openyear "Year facility opened"

label variable fac_closeyear "Year facility closed; 2021 if NA"

label variable span "Years facility open"

label variable turnover_ratio "Number of administrators / years open"

label define catcap_l 1 "Small (6-24)" 2 "Medium (25-49)" 3 "Large (50-74)" 4 "Very large (75+)"
label variable catcap "Facility capacity"
label values catcap catcap_l

label define anymc_l 0 "No memory care" 1 "Memory care"
label variable anymc "Does facility perform memory care?"
label values anymc anymc_l

label define medi_l 0 "No Medicaid" 1 "Yes Medicaid"
label variable medi "Does facility accept Medicaid?"
label values medi medi_l

label define rural_l 1 "Urban" 2 "Rural" 3 "Frontier"
label variable rural "Is facility rural?" 
label values rural rural_l

label define nonpro_l 0 "Not nonprofit" 1 "Nonprofit"
label variable nonpro "Is facility nonprofit?"
label values nonpro nonpro_l

label define finished_l 0 "Survey incomplete" 1 "Survey complete"
label variable finished "Did respondent complete survey?"
label values finished finished_l

label variable resp "Binary response flag"

label define q1_l 1 "Male" 2 "Female" 3 "Prefer to self describe" 4 "Prefer not to answer"
label variable q1 "Q1. What gender is the respondent?"
label values q1 q1_l

label define q2_l 1 "< 20 years old" 2 "20-29 years old" 3 "30-39 years old" 4 "40-49 years old" 5 "50-59 years old" 6 "60-69 years old" 7 ">= 70 years old"
label variable q2 "Q2. Age of respondent?"
label values q2 q2_l

label define q3a_l 1 "American Indian or Alaska Native" 2 "Asian" 3 "Black or African American" 4 "Native Hawaiian or other Pacific Islander" 5 "White" 6 "Other" 7 "2+ racial categories selected"
label variable q3a "Q3. Respondent's race" 
label values q3a q3a_l
	
label define q3b_l 0 "Not Hispanic or Latino" 1 "Hispanic or Latino"
label variable q3b "Q3. Respondent's ethnicity"
label values q3b q3b_l

label define q4_l 1 "High school diploma or equivalent (e.g. GED)" 2 "Some college credit but not degree" 3 "Associate's degree (e.g. AA, AS)" 4 "Bachelor's degree (e.g. BA, BS)" 5 "Master's degree (e.g. MA, MS)" 6 "Professional degree (e.g. MD JD)" 7 "Doctorate degree (e.g. PhD EdD)"
label variable q4 "Q4. What is the highest degree or level of school you have COMPLETED?"
label values q4 q4_l
	
label define q5_l 0 "No" 1 "Yes"	
label variable q5_1 "Q5: Aging or Older Adults"
label values q5_1 q5_l
notes q5_1: Q5. Did any of your degrees include curriculum or course content related to the following subject areas?
label variable q5_2 "Q5: Disabilities"
label values q5_1 q5_l
notes q5_2: Q5. Did any of your degrees include curriculum or course content related to the following subject areas?
label variable q5_3 "Q5: Behavioral or mental health"
label values q5_3 q5_l
notes q5_3: Q5. Did any of your degrees include curriculum or course content related to the following subject areas?
label variable q5_4 "Q5: Long-term services and supports"
label values q5_4 q5_l
notes q5_4: Q5. Did any of your degrees include curriculum or course content related to the following subject areas?
label variable q5_5 "Q5: Healthcare administration"
label values q5_5 q5_l
notes q5_5: Q5. Did any of your degrees include curriculum or course content related to the following subject areas?

label define q6_l 1 "No, never" 2 "Yes, previously" 3 "Yes, currently"
label variable q6_1 "Q6: Nursing home administrator"
label values q6_1 q6_l
notes q6_1: Q6. Do you currently have or have you ever had any of the following certifications or licenses
label variable q6_2 "Q6: Registered nurse (RN)"
label values q6_2 q6_l
notes q6_2: Q6. Do you currently have or have you ever had any of the following certifications or licenses
label variable q6_3 "Q6: Licensed practical/vocational nurse (LPN/LVN)"
label values q6_3 q6_l
notes q6_3: Q6. Do you currently have or have you ever had any of the following certifications or licenses
label variable q6_4 "Q6: Certified nursing assistant (CNA)"
label values q6_4 q6_l
notes q6_4: Q6. Do you currently have or have you ever had any of the following certifications or licenses
label variable q6_5 "Q6: Certified medication aide (CMA)"
label values q6_5 q6_l
notes q6_5: Q6. Do you currently have or have you ever had any of the following certifications or licenses
label variable q6_6 "Q6: Other certification"
label values q6_6 q6_l
notes q6_6: Q6. Do you currently have or have you ever had any of the following certifications or licenses

label define q7_l 1 "2017 or before" 2 "2018" 3 "2019" 4 "2020"
label variable q7 "Q7. In what year did you last attend the state-approved 40-hour training offered by Leading Age Oregon or Oregon Health Care Association (OHCA)?"
label values q7 q7_l

label define q8_l 1 "Very dissatisfied" 2 "Dissatisfied" 3 "Neither satisfied nor dissatisfied" 4 "Satisfied" 5 "Very satisfied"
label variable q8_1 "Q8: Rules and regulations (e.g., health, fire)"
label values q8_1 q8_l
notes q8_1: Q8. How satisfied were you about the different subjects covered in the training program that you attended
label variable q8_2 "Q8: Finance, accounting"
label values q8_2 q8_l
notes q8_2: Q8. How satisfied were you about the different subjects covered in the training program that you attended
label variable q8_3 "Q8: Human resources and staffing"
label values q8_3 q8_l
notes q8_3: Q8. How satisfied were you about the different subjects covered in the training program that you attended
label variable q8_4 "Q8: Physical environment (e.g., building/plant management)"
label values q8_4 q8_l
notes q8_4: Q8. How satisfied were you about the different subjects covered in the training program that you attended
label variable q8_5 "Q8: Leadership skills"
label values q8_5 q8_l
notes q8_5: Q8. How satisfied were you about the different subjects covered in the training program that you attended

label define q9_l 1 "Strongly disagree" 2 "Disagree" 3 "Neither agree nor disagree" 4 "Agree" 5 "Strongly agree"
label variable q9_1 "Q9: My training sufficiently prepared me for this position."
label values q9_1 q9_l
notes q9_1: Q9. Do you agree or disagree with the following statements?
label variable q9_2 "Q9: I received sufficient onboarding support (e.g., mentorship) when I started this position."
label values q9_2 q9_l
notes q9_2: Q9. Do you agree or disagree with the following statements?
label variable q9_3 "Q9: There are sufficient ongoing training opportunities for me."
label values q9_3 q9_l
notes q9_3: Q9. Do you agree or disagree with the following statements?
label variable q9_4 "Q9: The existing opportunities for continuing education are relevant to my work."
label values q9_4 q9_l
notes q9_4: Q9. Do you agree or disagree with the following statements?
label variable q9_5 "Q9: My employer makes it possible for me to attend training (e.g., paid time for training)."
label values q9_5 q9_l
notes q9_5: Q9. Do you agree or disagree with the following statements?

label define q10a_l 0 "No" 1 "Yes"
label variable q10a "Q10a. Do you or a member of your immediate family have partial or full ownership of this community?"
label values q10a q10a_l

label define q11_l 1 "< 1 year" 2 "1-2 years" 3 "2-5 years" 4 "> 5 years"
label variable q11 "Q11. How long have you been an administrator at this community? Please enter in years."
label values q11 q11_l

label define q12_l 0 "No" 1 "Yes"
label variable q12 "Q12. Have you worked in any other position at this community prior to becoming an administrator?"
label values q12 q12_l

label define q13_l 1 "Assisted living/residential care (not endorsed for memory care)" 2 "Memory care community" 3 "Assisted living/residential care (not endorsed for memory care) & Memory care community" 4 "No, this is the first community of which I am the administrator."
label variable q13 "Q13. Have you ever been an administrator at another assisted living, residential care, or memory care community? Please select all that apply."
label values q13 q13_l

label define q14_l 1 "I transferred to this community in the same organization" 2 "I quit" 3 "I was laid off" 4 "It closed" 5 "Other"
label variable q14 "Q14. What was the reason for leaving your administrator position at that last community?"
label values q14 q14_l
	
label define q15_l 0 "No" 1 "Yes"
label variable q15_1 "Q15: Adult foster/care home"
label values q15_1 q15_l
notes q15_1: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_2 "Q15: Nursing home"
label values q15_2 q15_l
notes q15_2: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_3 "Q15: Home health agency (including hospice agency)"
label values q15_3 q15_l
notes q15_3: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_4 "Q15: Home care"
label values q15_4 q15_l
notes q15_4: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_5 "Q15: Hospital"
label values q15_5 q15_l
notes q15_5: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_6 "Q15: Adult day care"
label values q15_6 q15_l
notes q15_6: Q15. Have you ever worked in any of the following settings prior to your current job?
label variable q15_7 "Q15: Other"
label values q15_7 q15_l
notes q15_7: Q15. Have you ever worked in any of the following settings prior to your current job?

label define q16_l 1 "< 9.5 years" 2 "9.5-15 years" 3 "15-22 years" 4 "> 22 years"
label variable q16 "Q16. Considering your past work experience, how long have you worked in the long-term care or health settings listed above in total? Please include all prior jobs, even if you left and then came back. Please enter in years."
label values q16 q16_l

label define q17_l 1 "Less than or equal to $24,999" 2 "$25,000 to $49,999" 3 "$50,000 to $74,999" 4 "$75,000 to $99,999" 5 "$100,000 or greater" 6 "Prefer not to answer" 7 "Other"
label variable q17 "Q17. What is your current annual salary in your position as an administrator?"
label values q17 q17_l
	
label define q18_l 0 "No" 1 "Yes"
label variable q18_1 "Q18: Health insurance for you"
label values q18_1 q18_l
notes q18_1: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_2 "Q18: Health insurance that includes family coverage"
label values q18_2 q18_l
notes q18_2: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_3 "Q18: Paid personal time off or vacation time"
label values q18_3 q18_l
notes q18_3: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_4 "Q18: Paid sick leave"
label values q18_4 q18_l
notes q18_4: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_5 "Q18: Paid holidays"
label values q18_5 q18_l
notes q18_5: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_6 "Q18: Pension"
label values q18_6 q18_l
notes q18_6: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_7 "Q18: A 401(k) or 403(b) account"
label values q18_7 q18_l
notes q18_7: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_8 "Q18: Life insurance"
label values q18_8 q18_l
notes q18_8: Q18. Which of the following fringe benefits does your current employer offer to you?
label variable q18_9 "Q18: Bonus or incentive pay for (e.g., census/occupancy, incident reports)."
label values q18_9 q18_l
notes q18_9: Q18. Which of the following fringe benefits does your current employer offer to you?

label define q19_l 0 "Not applicable" 1 "Very dissatisfied" 2 "Dissatisfied" 3 "Neither satisfied nor dissatisfied" 4 "Satisfied" 5 "Very satisfied"
label variable q19_1 "Q19: The amount of job security I have."
label values q19_1 q19_l
notes q19_1: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_2 "Q19: The amount of pay and fringe benefits I receive."
label values q19_2 q19_l
notes q19_2: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_3 "Q19: The amount of personal growth and development I get in doing my job."
label values q19_3 q19_l
notes q19_3: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_4 "Q19: The people I talk to and work with on my job."
label values q19_4 q19_l
notes q19_4: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_5 "Q19: The degree of respect and fair treatment I receive from my boss."
label values q19_5 q19_l
notes q19_5: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_6 "Q19: The feeling of worthwhile accomplishment I get from doing my job."
label values q19_6 q19_l
notes q19_6: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_7 "Q19: The chance to get to know other people while on the job."
label values q19_7 q19_l
notes q19_7: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_8 "Q19: The amount of support and guidance I receive from my supervisor."
label values q19_8 q19_l
notes q19_8: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_9 "Q19: The degree to which I am fairly paid for what I contribute to this organization."
label values q19_9 q19_l
notes q19_9: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_10 "Q19: The amount of independent thought and action I can exercise in my job."
label values q19_10 q19_l
notes q19_10: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_11 "Q19: How secure things look for me in the future in this organization."
label values q19_11 q19_l
notes q19_11: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_12 "Q19: The chance to help other people while at work."
label values q19_12 q19_l
notes q19_12: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_13 "Q19: The amount of challenges in my job."
label values q19_13 q19_l
notes q19_13: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?
label variable q19_14 "Q19: The overall quality of the supervision I receive in my work."
label values q19_14 q19_l
notes q19_14: Q19. To what extent are you satisfied or dissatisfied with each aspect of your job?

label define q20_l 1 "Strongly disagree" 2 "Disagree" 3 "Neither agree nor disagre" 4 "Agree" 5 "Strongly agree"
label variable q20_1 "Q20: I feel a strong sense of 'belonging' to my organization."
label values q20_1 q20_l
notes q20_1: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_2 "Q20: My organization really cares about my wellbeing."
label values q20_2 q20_l
notes q20_2: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_3 "Q20: I feel like 'part of the family' at this organization."
label values q20_3 q20_l
notes q20_3: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_4 "Q20: Help is available from my organization when I have a problem."
label values q20_4 q20_l
notes q20_4: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_5 "Q20: My job at this organization is secure."
label values q20_5 q20_l
notes q20_5: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_6 "Q20: I feel 'emotionally attached' to this organization."
label values q20_6 q20_l
notes q20_6: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_7 "Q20: I would feel guilty if I left this organization right now."
label values q20_7 q20_l
notes q20_7: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_8 "Q20: My organization strongly considers my goals and values."
label values q20_8 q20_l
notes q20_8: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_9 "Q20: I owe a great deal to this organization."
label values q20_9 q20_l
notes q20_9: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_10 "Q20: I am confident that I will be able to work for this organization as long as I wish"
label values q20_10 q20_l
notes q20_10: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_11 "Q20: I frequently think of quitting my current job."
label values q20_11 q20_l
notes q20_11: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_12 "Q20: It would be very hard for me to leave my job right now even if I wanted to."
label values q20_12 q20_l
notes q20_12: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_13 "Q20: Right now, staying with my job at this organization is a matter of necessity as much as desire."
label values q20_13 q20_l
notes q20_13: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_14 "Q20: I will probably look for another job in the next year."
label values q20_14 q20_l
notes q20_14: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?
label variable q20_15 "Q20: There is a good chance that I will leave this job in the next year or so."
label values q20_15 q20_l
notes q20_15: Q20. Thinking about the community, management, and ownership where you work, to what extent do you agree or disagree with the following statements?

label define q21_l 0 "No" 1 "Yes"
label variable q21 "Q21. Are there any job skills you would like to get training for?"
label values q21 q21_l

label define q22_l 0 "Unchecked" 1 "Checked"
label variable q22_1 "Q22: Work-life balance"
label values q22_1 q22_l
notes q22_1: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_2 "Q22: Conducting effective meetings"
label values q22_2 q22_l
notes q22_2: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_3 "Q22: Being an effective leader"
label values q22_3 q22_l
notes q22_3: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_4 "Q22: Leading the change process"
label values q22_4 q22_l
notes q22_4: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_5 "Q22: Analyzing and interpreting data"
label values q22_5 q22_l
notes q22_5: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_6 "Q22: Informed decision making"
label values q22_6 q22_l
notes q22_6: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_7 "Q22: Creating and communicating a vision"
label values q22_7 q22_l
notes q22_7: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_8 "Q22: Developing and implementing a strategic plan"
label values q22_8 q22_l
notes q22_8: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_9 "Q22: Delegating tasks to others"
label values q22_9 q22_l
notes q22_9: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_10 "Q22: Inspiring and motivating staff"
label values q22_10 q22_l
notes q22_10: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_11 "Q22: Prioritizing"
label values q22_11 q22_l
notes q22_11: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_12 "Q22: Problem solving"
label values q22_12 q22_l
notes q22_12: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_13 "Q22: Time management"
label values q22_13 q22_l
notes q22_13: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_14 "Q22: Conflict resolution and mediation"
label values q22_14 q22_l
notes q22_14: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_15 "Q22: Oral and written communications"
label values q22_15 q22_l
notes q22_15: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_16 "Q22: Cultivating effective relationships"
label values q22_16 q22_l
notes q22_16: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_17 "Q22: Person-centered care / culture change"
label values q22_17 q22_l
notes q22_17: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_18 "Q22: Team building"
label values q22_18 q22_l
notes q22_18: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_19 "Q22: Managing teams"
label values q22_19 q22_l
notes q22_19: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_20 "Q22: Consensus building"
label values q22_20 q22_l
notes q22_20: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_21 "Q22: Active listening"
label values q22_21 q22_l
notes q22_21: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_22 "Q22: Coaching, teaching, and mentoring"
label values q22_22 q22_l
notes q22_22: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.
label variable q22_23 "Q22: Other"
label values q22_23 q22_l
notes q22_23: Q22. Which of the following job skills would you say you would like to get training for? Please select all that apply.

label define q23_l 1 "Poor" 2 "Fair" 3 "Good" 4 "Very good" 5 "Excellent"
label variable q23 "Q23. Would you say your health in general is excellent, very good, good, fair, or poor?"
label values q23 q23_l

label define q24_l 1 "Never" 2 "A few times a year" 3 "Monthly" 4 "Weekly" 5 "Daily"
label variable q24 "Q24. How often do you feel worried, nervous, or anxious?"
label values q24 q24_l

label define q25_l 1 "Never" 2 "A few times a year" 3 "Monthly" 4 "Weekly" 5 "Daily"
label variable q25 "Q25. How often do you feel depressed?"
label values q25 q25_l

label define q26_l 1 "Strongly disagree" 2 "Disagree" 3 "Neither agree nor disagree" 4 "Agree" 5 "Strongly agree"
label variable q26_1 "Q26: Working here makes it hard to spend enough time with my family." 
label values q26_1 q26_l
notes q26_1: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_2 "Q26: Working here leaves little time for other activities." 
label values q26_2 q26_l
notes q26_2: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_3 "Q26: I have too much work and too little time to do it in." 
label values q26_3 q26_l
notes q26_3: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_4 "Q26: I sometimes dread the telephone ringing at home because the call might be job-related." 
label values q26_4 q26_l
notes q26_4: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_5 "Q26: I feel like I never had a day off." 
label values q26_5 q26_l
notes q26_5: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_6 "Q26: There are lots of times when my job drives me right up the wall." 
label values q26_6 q26_l
notes q26_6: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_7 "Q26: Sometimes when I think about my job I get a tight feeling in my chest." 
label values q26_7 q26_l
notes q26_7: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_8 "Q26: I feel guilty when I take time off from my job." 
label values q26_8 q26_l
notes q26_8: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_9 "Q26: My job gets to me more than it should." 
label values q26_9 q26_l
notes q26_9: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?
label variable q26_10 "Q26: I have felt fidgety or nervous as a result of my job." 
label values q26_10 q26_l
notes q26_10: Q26. Following are some statements related to your work. Do you agree or disagree with each statement?

logistic resp anymc medi catcap rural nonpro
predict y, pr
gen svyweight = 1/y if resp == 1
label variable svyweight "Survey weights"
save "data/adturn.dta", replace

log close

