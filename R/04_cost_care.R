## ---- cost-care

# per-person

cost_care_pp <- cost_care[, c("icd_code", 
                              "icd_label", 
                              "laymen_label", 
                              "person_2015", 
                              "person_2020")]

cost_care_pp$r2015 <- ave(cost_care_pp$person_2015, 
                              cost_care_pp$laymen_label, 
                              FUN = cumsum)

cost_care_pp$r2020 <- ave(cost_care_pp$person_2020, 
                              cost_care_pp$laymen_label, 
                              FUN = cumsum)

cost_care_pp <- cost_care_pp[!cost_care_pp$icd_code == "ICD10-J40-J47", 
                             c("laymen_label", 
                               "r2015", 
                               "r2020")]

cost_care_pp_long <- melt(setDT(cost_care_pp), 
                       id.vars = c("laymen_label"), 
                       variable.name = "year")

cost_care_pp_long$year <- substr(cost_care_pp_long$year, 2, 5)

cost_care_pp_long$icd <- ifelse(cost_care_pp_long$laymen_label == "cancers", 
                                   "C00 - D48", 
                                   ifelse(cost_care_pp_long$laymen_label == "diabetes", 
                                          "E10 - E14", 
                                          ifelse(cost_care_pp_long$laymen_label == "mental_behavioural_disorders", 
                                                 "F00 - F99", 
                                                 ifelse(cost_care_pp_long$laymen_label == "cardiovascular_diseases", 
                                                        "I00 - I99", 
                                                        ifelse(cost_care_pp_long$laymen_label == "respiratory_conditions", 
                                                               "J46 - J47", 
                                                               "M00 - M99")))))
ggplot(cost_care_pp_long, 
       aes(fill = year, 
           y = value, 
           x = icd)) + 
  geom_bar(position = "dodge", 
           stat = "identity")
