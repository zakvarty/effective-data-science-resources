# Tidy Tuesday 2024-01-23 English Education

# Load required packages -------------------------------------------------------
library(readr)                  # loading data
library(dplyr)                  # data frame manipulation
library(stringr)                # character string manipulation
library(ggplot2)                # plotting
library(ggtext)                 # element_markdown for subtitle formatting
library(forcats)                # working with factors

# Load data --------------------------------------------------------------------
url <- 'https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2024/2024-01-23/english_education.csv'
education <- readr::read_csv(file = url)

# Data wrangling ---------------------------------------------------------------

## Main plot ---------------------------------

town_scores <- education %>%
  filter(str_detect(income_flag, pattern = "town")) %>%
  mutate(region = as.factor(rgn11nm), income = as.factor(income_flag)) %>%
  select(region, income, education_score) %>%
  group_by(region, income) %>%
  summarise(mean_education_score = mean(education_score)) %>%
  ungroup()  %>%
mutate(region = fct_relevel(region,
  "South West",
  "East of England",
  "South East",
  "East Midlands",
  "West Midlands",
  "Yorkshire and The Humber",
  "North East",
  "North West"))%>%
  mutate(region = fct_relevel(
    region,
    "South West",
    "East of England",
    "South East",
    "East Midlands",
    "West Midlands",
    "Yorkshire and The Humber",
    "North East",
    "North West")) %>%
  mutate(region = fct_recode(region,
    "Yorkshire and\n The Humber" = "Yorkshire and The Humber"))



## Annotations ---------------------------------

NW_scores <- town_scores %>%
  filter(region == "North West") %>%
  pull(mean_education_score)

label_df <- tibble(
  horizontal = NW_scores,
  vertical = rep(9, 3),
  string = c("Higher income deprivation", "Lower", "Mid")
)

arrow_df <- tibble(
  horizontal = NW_scores,
  upper = rep(8.75, 3),
  lower = rep(8.25, 3)
)

strings <- list(
  title = "Towns in the North West have the highest attainment scores at
  all  \n income deprivation levels",
  sub = "\n  \n  Average educational attainment score for towns, by region
  and income  \n  deprivation level, England",
  cap = "Source: Office for National Statistics analysis using Longitudinal
  Education Outcomes (LEO)  \n from the Department for Education (DfE) and Index
  of Multiple Deprivation 2019 from the  \n Department for Levelling Up, Housing
  and Communities (DLUHC)"
)

ONS_palette <- list(
  red = "#7c265a",
  blue = "#315f91",
  light_grey = "#d3d3d3",
  dark_grey = "#8A8A8A",
  black = "#222222",
  white = "#ffffff")

vertical_grid_df <- tibble(
  x = seq(-4, 6, by = 2),
  ymin = rep(0, length(x)),
  ymax = rep(8.25, length(x))
)

# Create plot ------------------------------------------------------------------

p <- ggplot() +
  geom_point(
    data = town_scores,
    mapping = aes(
      x = mean_education_score,
      y = region,
      fill = income),
    shape = 21,
    size = 4) +
  geom_linerange(
    mapping = aes(x = 0, ymin = 0.25, ymax = 8.25),
    colour = ONS_palette$dark_grey,
    linewidth = 0.8) +
  geom_linerange(
    data = vertical_grid_df,
    mapping = aes(x = x, ymin = ymin, ymax = ymax),
    colour = ONS_palette$light_grey,
    linewidth = 0.3) +
  coord_cartesian(xlim = c(-4, 6), ylim = c(1.25,8.75)) +
  labs(title = strings$title, subtitle = strings$sub, caption = strings$cap) +
  scale_fill_manual(values = unname(ONS_palette)) +
  geom_text(
    data = label_df,
    mapping = aes(
      x = horizontal,
      y = vertical,
      label = string),
    color = ONS_palette$black) +
  geom_segment(
    data = arrow_df,
    mapping = aes(
      x = horizontal,
      xend = horizontal,
      y = upper,
      yend = lower),
    arrow = arrow(length = unit(0.1, "inches"))) +
  theme_minimal() +
  theme(
    legend.position = "none",
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.text = element_text(size = 12, colour = ONS_palette$black),
    panel.grid.minor.x = element_blank(),
    panel.grid.major.x = element_blank(),
    panel.grid.major.y = element_line(linetype = 2),
    plot.title = element_markdown(size = 15,
                                  hjust = 0,
                                  face = "bold",
                                  margin = margin(0,0,15,0)),
    plot.title.position = "plot",
    plot.subtitle = element_markdown(size = 14,
                                     hjust = 0,
                                     margin = margin(0,0,15,0)),
    plot.caption = element_markdown(size = 12,
                                    hjust = 0,
                                    color = ONS_palette$dark_grey),
    plot.caption.position = "plot")


# Save plot --------------------------------------------------------------------

out_path <- "2024-01-23-english-education"

ggsave(
  plot = p,
  filename = paste0(out_path, ".png"),
  device = "png",
  width = 7.5,
  height = 6.5,
  units = "in",
  dpi = 300,
  bg = ONS_palette$white
)

# End of file
