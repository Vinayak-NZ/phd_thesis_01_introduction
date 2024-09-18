## ---- cost-care

# per-person-process

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

# total-process
cost_care_t <- cost_care[, c("icd_code", 
                              "icd_label", 
                              "laymen_label", 
                              "total_2015", 
                              "total_2020")]

cost_care_t$r2015 <- (ave(cost_care_t$total_2015, 
                         cost_care_t$laymen_label, 
                          FUN = cumsum))/1000000

cost_care_t$r2020 <- (ave(cost_care_t$total_2020, 
                         cost_care_t$laymen_label, 
                          FUN = cumsum))/1000000

cost_care_t <- cost_care_t[!cost_care_t$icd_code == "ICD10-J40-J47", 
                             c("laymen_label", 
                               "r2015", 
                               "r2020")]

cost_care_t_long <- melt(setDT(cost_care_t), 
                          id.vars = c("laymen_label"), 
                          variable.name = "year")

cost_care_t_long$year <- substr(cost_care_t_long$year, 2, 5)

cost_care_t_long$icd <- ifelse(cost_care_t_long$laymen_label == "cancers", 
                                "C00 - D48", 
                                ifelse(cost_care_t_long$laymen_label == "diabetes", 
                                       "E10 - E14", 
                                       ifelse(cost_care_t_long$laymen_label == "mental_behavioural_disorders", 
                                              "F00 - F99", 
                                              ifelse(cost_care_t_long$laymen_label == "cardiovascular_diseases", 
                                                     "I00 - I99", 
                                                     ifelse(cost_care_t_long$laymen_label == "respiratory_conditions", 
                                                            "J46 - J47", 
                                                            "M00 - M99")))))


# create plots

cost_care_pp_plot <- 
  ggplot(cost_care_pp_long, 
         aes(fill = year, 
             y = value, 
             x = icd)) + 
    geom_bar(position = "dodge", 
             stat = "identity") + 
    labs(title = paste0("Cost of care for non-communicable diseases (NCDs) in Germany"), 
         subtitle = "Bar graph of NCD costs calculated per inhabitant",
         caption = "Data source: Statistisches Bundesamt", 
         fill = "Year") +
    ylab("Cost \nper inhabitant (\U20AC)") + 
    xlab("Year") + 
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"), 
          plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
          plot.subtitle = element_text(color = "#454543"),
          plot.caption = element_text(color = "#454543", face = "italic")) 

cost_care_t_plot <- 
  ggplot(cost_care_t_long, 
         aes(fill = year, 
             y = value, 
             x = icd)) + 
  geom_bar(position = "dodge", 
           stat = "identity") + 
  labs(title = paste0("Cost of care for non-communicable diseases (NCDs) in Germany"), 
       subtitle = "Bar graph of total costs attributed to NCDs",
       caption = "Data source: Statistisches Bundesamt", 
       fill = "Year") +
  ylab("Cost \nin Millions (\U20AC)") + 
  xlab("Year") + 
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

plot_cost <-
  plot_grid(cost_care_pp_plot, 
          cost_care_t_plot, 
          labels = "AUTO")

dev.new(width = 310, 
        height = 180, 
        unit = "mm", 
        noRStudioGD=TRUE)

ggsave("output/plot_cost.png", 
       plot = plot_cost, 
       width = 310, 
       height = 180, 
       unit = "mm", 
       dpi = 300)
