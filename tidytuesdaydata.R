library(portalr)
library(dplyr)

download_observations(".")
data_tables <- load_rodent_data()

survey_data <- summarize_individual_rodents(
  time = "date",
  length = "Longterm")

species_data <- data_tables[["species_table"]]
plots_data <- data_tables[["plots_table"]]

plot_treatments <- plots_data %>%
  filter(year > 1977) |>
  mutate(iso_date = as.Date(paste0(year, "-", month, "-", "01")), 
         plot = as.factor(plot)) %>%
  select(iso_date, plot, treatment)

plots_data_longterm <- plot_treatments |>
  group_by(plot) |>
  summarize(treatment = case_when(
              all(treatment == "control") ~ "control",
              all(treatment == "exclosure") ~ "exclosure")) |>
  filter(!is.na(treatment))

species_data |>
  filter(censustarget == 1,
    unidentified == 0)

write.csv(survey_data, "surveys.csv", row.names = FALSE)
write.csv(plots_data_longterm, "plots.csv", row.names = FALSE)
write.csv(species_data, "species.csv", row.names = FALSE)
