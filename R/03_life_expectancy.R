## ---- life-table

# process-data
life_table$sex <- ifelse(life_table$sex == "female", "Female", "Male")

life_table_long <- melt(setDT(life_table), 
                        id.vars = c("sex"), 
                        variable.name = "year")

life_table_long$year <- substr(life_table_long$year, 2, 5)

# plot data
life_exptancy_plot <- 
  ggplot(data = life_table_long,
  aes(x = year, 
           y = value, 
           color = sex, 
           group = sex)) + 
  geom_line() +
  geom_point() +
  guides(color = guide_legend(title = "Sex")) +
  labs(title = paste0("Average life expectancy in Germany"), 
       subtitle = "Line chart of changes in life expectancy",
       caption = "Data source: Statistisches Bundesamt") +
  ylab("Life expectancy \n(age 0)") + 
  xlab("Year") + 
  ylim(50, 100) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"), 
        plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
        plot.subtitle = element_text(color = "#454543"),
        plot.caption = element_text(color = "#454543", face = "italic")) 

dev.new(width = 300, 
        height = 180, 
        unit = "mm", 
        noRStudioGD=TRUE)

ggsave("output/life_exptancy_plot.png", 
       plot = life_exptancy_plot, 
       width = 300, 
       height = 180, 
       unit = "mm", 
       dpi = 300)
