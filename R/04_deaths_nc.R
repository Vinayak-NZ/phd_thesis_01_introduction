## ---- deaths-nc

# process-data
deaths_nc_long <- melt(setDT(deaths_nc), 
                        id.vars = c("year"), 
                        variable.name = "level")

# plot data
deaths_nc_plot <- 
  ggplot(deaths_nc_long, 
         aes(x = year, 
             y = value)) +
    stat_summary(geom = "ribbon", 
                 fun.min = "min", 
                 fun.max = "max", 
                 aes(fill = "#e18b22")) +
    labs(title = paste0("Deaths due to non-communicable diseases (NCDs)"), 
         subtitle = "Line chart with uncertainty estimates for NCD deaths over time",
         caption = "Data source: Institute for Health Metrics and Evaluation") +
    ylab("Deaths \nper 100,000") + 
    xlab("Year") + 
    ylim(500, 1500) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
          panel.background = element_blank(), axis.line = element_line(colour = "black"), 
          plot.title = element_text(color = "#2F2E41", size = 12, face = "bold"),
          plot.subtitle = element_text(color = "#454543"),
          plot.caption = element_text(color = "#454543", face = "italic"), 
          legend.position = "none") 

dev.new(width = 300, 
        height = 180, 
        unit = "mm", 
        noRStudioGD=TRUE)

ggsave("output/deaths_nc_plot.png", 
       plot = deaths_nc_plot, 
       width = 300, 
       height = 180, 
       unit = "mm", 
       dpi = 300)
