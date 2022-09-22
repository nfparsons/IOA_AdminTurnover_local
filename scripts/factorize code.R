transmute(
  id = order012621,
  resp = resp,
  firstname = firstname,
  lastname = lastname,
  position = q10a,
  employee_start = employee_start,
  employee_left = employee_left,
  quit = factor(
    quit,
    levels = c(0, 1),
    labels = c("Didn't quit", "Quit")
  ),
  ccmu = ccmu,
  county = county,
  fac_opendate = fac_opendate,
  fac_openyear = fac_openyear,
  fac_closeyear = fac_closeyear,
  span = span,
  turnover_ratio = factor(
    turnover_ratio,
    levels = c(1, 2, 3, 4, 5),
    labels = c("< 1/4", "1/4-1/2", "1/2-3/4", "3/4-1",
               "> 1"),
    ordered = TRUE
  ),
  catcap = factor(
    catcap,
    levels = c(1, 2, 3, 4),
    labels = c(
      "Small (6-24)",
      "Medium (25-49)",
      "Large (50-74)",
      "Very large (75+)"
    ),
    ordered = TRUE
  ),
  rural = factor(
    rural,
    levels = c(1, 2, 3),
    labels = c("Urban", "Rural", "Frontier")
  ),
  anymc = factor(anymc,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  medi = factor(medi,
                levels = c(0, 1),
                labels = c("No", "Yes")),
  q1 = factor(
    q1,
    levels = c(0, 1, 2),
    labels = c("Prefer not to answer/self-describe", "Male", "Female")
  ),
  q2 = factor(
    q2,
    levels = c(1, 2, 3, 4, 5, 6, 7),
    labels = c("< 20", "20-29", "30-39", "40-49", "50-59", "60-69",
               "70+"),
    ordered = TRUE
  ),
  q3a = factor(
    q3a,
    levels = c(1, 2, 3, 4, 5, 6, 7),
    labels = c(
      "American Indian or Alaska Native",
      "Asian",
      "Black",
      "Hawaiian or Pacific Islander",
      "Multi",
      "Other",
      "White"
    )
  ),
  q3b = factor(
    q3b,
    levels = c(0, 1),
    labels = c("Not Hispanic", "Hispanic")
  ),
  q4 = factor(
    q4,
    levels = c(1, 2, 3, 4, 5, 6, 7),
    labels = c(
      "High school diploma or equivalent (such as GED)",
      "Some college credit, but not degree",
      "Associate's degree (for example: AA, AS)",
      "Bachelor's degree (for example: BA, BS)",
      "Master's degree (for example: MA, MS, MEng, MSW, MBA)",
      "Professional degree beyond a Bachelor's Degree (for example: MD, JD)",
      "Doctorate degree (for example: PhD, EdD)"
    ),
    ordered = TRUE
  ),
  q9_1 = factor(
    q9_1,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q9_2 = factor(
    q9_2,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q9_3 = factor(
    q9_3,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q9_4 = factor(
    q9_4,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q9_5 = factor(
    q9_5,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q10a = factor(
    q10a,
    levels = c(0, 1),
    labels = c("No ownership", "Partial or full ownership")
  ),
  q11 = factor(
    q11,
    levels = c(1, 2, 3, 4),
    labels = c("< 1 year", "1-2 years", "2-5 years", "5+ years"),
    ordered = TRUE
  ),
  q12 = factor(
    q12,
    levels = c(0, 1),
    labels = c("No, worked as admin only", "Yes, had previous position")
  ),
  q13 = factor(
    q13,
    levels = c(1, 2, 3, 4),
    labels = c(
      "Assisted living",
      "Memory care",
      "Assisted living and memory care",
      "No, first community"
    )
  ),
  q14 = factor(
    q14,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "I transferred to this community in the same organization",
      "I quit",
      "I was laid off",
      "It closed",
      "Other reason"
    )
  ),
  q15_1 = factor(q15_1,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q15_2 = factor(q15_2,
                 levels = c(0, 1) ,
                 labels = c("No", "Yes")),
  q15_3 = factor(q15_3,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q15_4 = factor(q15_4,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q15_5 = factor(q15_5,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q15_6 = factor(q15_6,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q15_7 = factor(q15_7,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q16 = factor(
    q16,
    levels = c(1, 2, 3, 4),
    labels = c("Less than 9.5 years", "9.5-15 years",
               "15-22 years", "22+ years"),
    ordered = TRUE
  ),
  q17 = factor(
    q17,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "Other or prefer not to answer",
      "Less than or equal to $24,999",
      "$25,000 to $49,999",
      "$50,000 to $74,999",
      "$75,000 to $99,999",
      "$100,000 or greater"
    ),
    ordered = TRUE
  ),
  q18_1 = factor(q18_1,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_2 = factor(q18_2,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_3 = factor(q18_3,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_4 = factor(q18_4,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_5 = factor(q18_5,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_6 = factor(q18_6,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_7 = factor(q18_7,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_8 = factor(q18_8,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q18_9 = factor(q18_9,
                 levels = c(0, 1),
                 labels = c("No", "Yes")),
  q19_01 = factor(
    q19_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_02 = factor(
    q19_2,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_03 = factor(
    q19_3,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_04 = factor(
    q19_4,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_05 = factor(
    q19_5,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_06 = factor(
    q19_6,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_07 = factor(
    q19_7,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_08 = factor(
    q19_8,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_09 = factor(
    q19_9,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_10 = factor(
    q19_10,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_11 = factor(
    q19_11,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_12 = factor(
    q19_12,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_13 = factor(
    q19_13,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q19_14 = factor(
    q19_14,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Very dissatisfied",
      "Dissatisfied",
      "Neither satisfied nor dissatisfied",
      "Satisfied",
      "Very satisfied"
    ),
    ordered = TRUE
  ),
  q20_01 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_02 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_03 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_04 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_05 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_06 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_07 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_08 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_09 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_10 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_11 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_12 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_13 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_14 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q20_15 = factor(
    q20_1,
    levels = c(0, 1, 2, 3, 4, 5),
    labels = c(
      "NA",
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q21 = factor(q21,
               levels = c(0, 1),
               labels = c("No", "Yes")),
  q22_01 = factor(q22_1,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_02 = factor(q22_2,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_03 = factor(q22_3,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_04 = factor(q22_4,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_05 = factor(q22_5,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_06 = factor(q22_6,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_07 = factor(q22_7,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_08 = factor(q22_8,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_09 = factor(q22_9,
                  levels = c(0, 1),
                  labels = c("No", "Yes")),
  q22_10 = factor(
    q22_10,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_11 = factor(
    q22_11,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_12 = factor(
    q22_12,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_13 = factor(
    q22_13,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_14 = factor(
    q22_14,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_15 = factor(
    q22_15,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_16 = factor(
    q22_16,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_17 = factor(
    q22_17,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_18 = factor(
    q22_18,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_19 = factor(
    q22_19,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_20 = factor(
    q22_20,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_21 = factor(
    q22_21,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_22 = factor(
    q22_22,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q22_23 = factor(
    q22_23,
    levels = c(0, 1),
    labels = c("No", "Yes")
  ),
  q23 = factor(
    q23,
    levels = c(1, 2, 3, 4, 5),
    labels = c("Poor", "Fair", "Good", "Very good", "Excellent"),
    ordered = TRUE
  ),
  q24 = factor(
    q24,
    levels = c(1, 2, 3, 4, 5),
    labels = c("Never", "A few times a year", "Monthly", "Weekly",
               "Daily"),
    ordered = TRUE
  ),
  q25 = factor(
    q25,
    levels = c(1, 2, 3, 4, 5),
    labels = c("Never", "A few times a year", "Monthly", "Weekly",
               "Daily"),
    ordered = TRUE
  ),
  q26_01 = factor(
    q26_1,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_02 = factor(
    q26_2,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_03 = factor(
    q26_3,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_04 = factor(
    q26_4,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_05 = factor(
    q26_5,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_06 = factor(
    q26_6,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_07 = factor(
    q26_7,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_08 = factor(
    q26_8,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_09 = factor(
    q26_9,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  ),
  q26_10 = factor(
    q26_10,
    levels = c(1, 2, 3, 4, 5),
    labels = c(
      "Strongly disagree",
      "Disagree",
      "Neither agree nor disagree",
      "Agree",
      "Strongly agree"
    ),
    ordered = TRUE
  )
) |> 