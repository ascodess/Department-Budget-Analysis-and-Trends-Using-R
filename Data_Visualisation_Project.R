# ==============================================================================
# Project: Department Budget Analysis and Trends Using R
# Author: Data Analytics Portfolio
# Purpose: Exploratory Budget Analysis, Department Trends & Data Storytelling
# Tools: R (tidyverse, scales, viridis)
# ==============================================================================

# ------------------------------------------------------------------------------
# 1. SETUP & PACKAGE INSTALLATION
# ------------------------------------------------------------------------------

# Install required CRAN packages if not already installed
required_packages <- c("tidyverse", "scales", "viridis")
new_packages <- required_packages[!(required_packages %in% installed.packages()[, "Package"])]
if (length(new_packages) > 0) {
  install.packages(new_packages)
}

# Load core libraries
library(tidyverse)  # Data manipulation (dplyr, tidyr) and visualization (ggplot2)
library(scales)     # Formatting labels as currency ($), percentages (%), commas
library(viridis)    # Accessible, publication-quality color palettes

# Define a shared corporate theme for consistent, dashboard-ready visuals
theme_corporate <- function(base_size = 11) {
  theme_minimal(base_size = base_size) +
    theme(
      plot.title = element_text(face = "bold", size = rel(1.2), color = "#2c3e50", margin = margin(b = 5)),
      plot.subtitle = element_text(size = rel(0.95), color = "#7f8c8d", margin = margin(b = 15)),
      plot.caption = element_text(size = rel(0.75), color = "#95a5a6", margin = margin(t = 12), hjust = 0),
      axis.title = element_text(face = "bold", size = rel(0.9), color = "#34495e"),
      axis.text = element_text(size = rel(0.85), color = "#2c3e50"),
      panel.grid.major = element_line(color = "#ecf0f1", linewidth = 0.5),
      panel.grid.minor = element_blank(),
      legend.title = element_text(face = "bold", size = rel(0.85), color = "#34495e"),
      legend.text = element_text(size = rel(0.8)),
      legend.position = "right",
      plot.margin = margin(t = 15, r = 15, b = 15, l = 15)
    )
}

# ------------------------------------------------------------------------------
# 2. DATA LOADING & INSPECTION
# ------------------------------------------------------------------------------

# Option A: Read from external CSV file
# budget_df <- read_csv("parks_and_rec_budget.csv", show_col_types = FALSE)

# Option B: Inline reproducible data frame
budget_raw <- "Year,Department,Budget_in_Thousands
2005,Parks,561
2006,Parks,520
2007,Parks,574
2008,Parks,607
2009,Parks,598
2010,Parks,552
2011,Parks,568
2012,Parks,636
2013,Parks,631
2014,Parks,617
2015,Parks,630
2016,Parks,596
2017,Parks,618
2018,Parks,748
2019,Parks,626
2020,Parks,712
2005,Health,321
2006,Health,336
2007,Health,337
2008,Health,365
2009,Health,272
2010,Health,328
2011,Health,353
2012,Health,355
2013,Health,316
2014,Health,371
2015,Health,305
2016,Health,334
2017,Health,436
2018,Health,378
2019,Health,412
2020,Health,494
2005,Sanitation,491
2006,Sanitation,529
2007,Sanitation,513
2008,Sanitation,529
2009,Sanitation,557
2010,Sanitation,568
2011,Sanitation,569
2012,Sanitation,615
2013,Sanitation,604
2014,Sanitation,525
2015,Sanitation,646
2016,Sanitation,583
2017,Sanitation,588
2018,Sanitation,707
2019,Sanitation,666
2020,Sanitation,634
2005,Public Works,592
2006,Public Works,636
2007,Public Works,588
2008,Public Works,575
2009,Public Works,669
2010,Public Works,586
2011,Public Works,579
2012,Public Works,602
2013,Public Works,686
2014,Public Works,669
2015,Public Works,734
2016,Public Works,657
2017,Public Works,703
2018,Public Works,679
2019,Public Works,692
2020,Public Works,784
2005,City Management,299
2006,City Management,319
2007,City Management,395
2008,City Management,350
2009,City Management,386
2010,City Management,404
2011,City Management,402
2012,City Management,395
2013,City Management,457
2014,City Management,332
2015,City Management,442
2016,City Management,424
2017,City Management,346
2018,City Management,515
2019,City Management,424
2020,City Management,471
2005,Education,278
2006,Education,302
2007,Education,373
2008,Education,351
2009,Education,354
2010,Education,336
2011,Education,383
2012,Education,389
2013,Education,397
2014,Education,335
2015,Education,438
2016,Education,440
2017,Education,464
2018,Education,503
2019,Education,404
2020,Education,526
2005,Transportation,357
2006,Transportation,340
2007,Transportation,352
2008,Transportation,342
2009,Transportation,375
2010,Transportation,475
2011,Transportation,418
2012,Transportation,457
2013,Transportation,521
2014,Transportation,404
2015,Transportation,499
2016,Transportation,574
2017,Transportation,519
2018,Transportation,545
2019,Transportation,506
2020,Transportation,601
2005,Housing,388
2006,Housing,372
2007,Housing,442
2008,Housing,413
2009,Housing,436
2010,Housing,434
2011,Housing,469
2012,Housing,502
2013,Housing,460
2014,Housing,502
2015,Housing,480
2016,Housing,440
2017,Housing,538
2018,Housing,570
2019,Housing,494
2020,Housing,562
2005,Recreation,613
2006,Recreation,617
2007,Recreation,572
2008,Recreation,555
2009,Recreation,591
2010,Recreation,615
2011,Recreation,652
2012,Recreation,624
2013,Recreation,598
2014,Recreation,706
2015,Recreation,674
2016,Recreation,719
2017,Recreation,689
2018,Recreation,630
2019,Recreation,716
2020,Recreation,716
2005,Animal Control,232
2006,Animal Control,311
2007,Animal Control,277
2008,Animal Control,243
2009,Animal Control,285
2010,Animal Control,327
2011,Animal Control,289
2012,Animal Control,389
2013,Animal Control,292
2014,Animal Control,252
2015,Animal Control,319
2016,Animal Control,398
2017,Animal Control,408
2018,Animal Control,405
2019,Animal Control,419
2020,Animal Control,477"

# Ingest data
budget_df <- read_csv(budget_raw, show_col_types = FALSE)

# Initial Data Quality & Sanity Audit
cat("--- DATA INSPECTION ---\n")
cat("Dimensions (Rows, Columns):", paste(dim(budget_df), collapse = " x "), "\n")
cat("Total Rows:", nrow(budget_df), "| Total Columns:", ncol(budget_df), "\n\n")

cat("Column Names:\n")
print(names(budget_df))

cat("\nFirst 6 Observations:\n")
print(head(budget_df))

cat("\nStructure of Dataset:\n")
glimpse(budget_df)

cat("\nMissing Value Count per Column:\n")
print(colSums(is.na(budget_df)))

# ------------------------------------------------------------------------------
# 3. EXPLORATORY DATA ANALYSIS (EDA) & DPLYR MANIPULATIONS
# ------------------------------------------------------------------------------

# --- A. Department Level Aggregations ---
dept_summary <- budget_df %>%
  group_by(Department) %>%
  summarise(
    Total_Budget_K = sum(Budget_in_Thousands),
    Avg_Budget_K   = mean(Budget_in_Thousands),
    Median_Budget_K= median(Budget_in_Thousands),
    Min_Budget_K   = min(Budget_in_Thousands),
    Max_Budget_K   = max(Budget_in_Thousands),
    SD_Budget_K    = sd(Budget_in_Thousands),
    Share_of_Total = (sum(Budget_in_Thousands) / sum(budget_df$Budget_in_Thousands)) * 100
  ) %>%
  arrange(desc(Total_Budget_K))

cat("\n--- DEPARTMENT SUMMARY RANKING ---\n")
print(dept_summary)

top_funded_dept <- dept_summary %>% slice(1)
lowest_funded_dept <- dept_summary %>% slice(n())

cat("\nTop Funded Department:", top_funded_dept$Department, 
    "| Total:", dollar(top_funded_dept$Total_Budget_K, prefix = "$", suffix = "K"), "\n")
cat("Lowest Funded Department:", lowest_funded_dept$Department, 
    "| Total:", dollar(lowest_funded_dept$Total_Budget_K, prefix = "$", suffix = "K"), "\n")

# --- B. Yearly Level Aggregations ---
yearly_summary <- budget_df %>%
  group_by(Year) %>%
  summarise(
    Total_Budget_K = sum(Budget_in_Thousands),
    Avg_Budget_K   = mean(Budget_in_Thousands)
  ) %>%
  arrange(Year) %>%
  mutate(
    YoY_Change_K   = Total_Budget_K - lag(Total_Budget_K),
    YoY_Growth_Pct = (Total_Budget_K - lag(Total_Budget_K)) / lag(Total_Budget_K) * 100
  )

cat("\n--- YEARLY BUDGET TRENDS & YOY GROWTH ---\n")
print(yearly_summary)

highest_year <- yearly_summary %>% arrange(desc(Total_Budget_K)) %>% slice(1)
lowest_year  <- yearly_summary %>% arrange(Total_Budget_K) %>% slice(1)

cat("\nHighest Spending Year:", highest_year$Year, 
    "| Total:", dollar(highest_year$Total_Budget_K, prefix = "$", suffix = "K"), "\n")
cat("Lowest Spending Year:", lowest_year$Year, 
    "| Total:", dollar(lowest_year$Total_Budget_K, prefix = "$", suffix = "K"), "\n")

# --- C. Department Growth (2005 vs. 2020) ---
dept_growth <- budget_df %>%
  filter(Year %in% c(2005, 2020)) %>%
  pivot_wider(names_from = Year, values_from = Budget_in_Thousands, names_prefix = "Year_") %>%
  mutate(
    Absolute_Growth_K = Year_2020 - Year_2005,
    Growth_Pct = ((Year_2020 - Year_2005) / Year_2005) * 100
  ) %>%
  arrange(desc(Growth_Pct))

cat("\n--- DEPARTMENT 15-YEAR GROWTH RATES (2005 to 2020) ---\n")
print(dept_growth)

# ------------------------------------------------------------------------------
# 4. PROFESSIONAL VISUALIZATIONS (GGPLOT2)
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# VISUALIZATION 1: Executive Summary Bar Chart (Horizontal Ranked)
# ------------------------------------------------------------------------------
p1 <- ggplot(dept_summary, aes(x = reorder(Department, Total_Budget_K), y = Total_Budget_K, fill = Total_Budget_K)) +
  geom_col(width = 0.7, show.legend = FALSE) +
  coord_flip() +
  geom_text(
    aes(label = paste0("$", comma(Total_Budget_K), "K (", round(Share_of_Total, 1), "%)")),
    hjust = -0.08,
    size = 3.5,
    fontface = "bold",
    color = "#2c3e50"
  ) +
  scale_fill_viridis_c(option = "viridis", direction = -1) +
  scale_y_continuous(
    labels = label_dollar(prefix = "$", suffix = "K"),
    expand = expansion(mult = c(0, 0.22))
  ) +
  labs(
    title = "Executive Summary: Total Municipal Budget by Department",
    subtitle = "Cumulative funding allocations (2005-2020) across all 10 municipal divisions",
    x = NULL,
    y = "Cumulative Budget (Thousands of USD)",
    caption = "Figure 1: Cumulative expenditure ranking. Public Works & Recreation lead all municipal allocations."
  ) +
  theme_corporate() +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.major.x = element_line(color = "#ecf0f1")
  )

print(p1)

# ------------------------------------------------------------------------------
# VISUALIZATION 2: Budget Trend Analysis (Total Budget by Year)
# ------------------------------------------------------------------------------
p2 <- ggplot(yearly_summary, aes(x = Year, y = Total_Budget_K)) +
  geom_area(fill = "#3498db", alpha = 0.15) +
  geom_line(color = "#2980b9", linewidth = 1.2) +
  geom_point(color = "#2980b9", size = 3.5) +
  geom_point(color = "white", size = 1.8) +
  geom_text(
    aes(label = paste0("$", comma(Total_Budget_K), "K")),
    vjust = -1.1,
    size = 3.1,
    fontface = "bold",
    color = "#2c3e50"
  ) +
  scale_x_continuous(breaks = seq(2005, 2020, by = 1)) +
  scale_y_continuous(
    labels = label_dollar(prefix = "$", suffix = "K"),
    limits = c(3800, 6500),
    expand = expansion(mult = c(0, 0.05))
  ) +
  labs(
    title = "Municipal Budget Trajectory (2005 – 2020)",
    subtitle = "Total annual expenditure increased from $4.13M to $5.98M, representing a net 44.7% expansion",
    x = "Fiscal Year",
    y = "Total Annual Budget (Thousands USD)",
    caption = "Figure 2: Overall municipal budget trendline with noticeable contractions in 2008, 2014, and 2019."
  ) +
  theme_corporate() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

print(p2)

# ------------------------------------------------------------------------------
# VISUALIZATION 3: Department Growth Trends (Multi-Line Chart)
# ------------------------------------------------------------------------------
p3 <- ggplot(budget_df, aes(x = Year, y = Budget_in_Thousands, color = Department, group = Department)) +
  geom_line(linewidth = 0.95, alpha = 0.85) +
  geom_point(size = 1.8, alpha = 0.85) +
  scale_x_continuous(breaks = seq(2005, 2020, by = 2)) +
  scale_y_continuous(labels = label_dollar(prefix = "$", suffix = "K"), breaks = seq(200, 800, by = 100)) +
  scale_color_viridis_d(option = "turbo") +
  labs(
    title = "Departmental Budget Trajectories (2005 – 2020)",
    subtitle = "Comparative longitudinal trends highlighting steady expansion across public service divisions",
    x = "Fiscal Year",
    y = "Annual Budget (Thousands USD)",
    color = "Department",
    caption = "Figure 3: Multi-line departmental comparison showing stable high funding in Public Works vs rapid growth in Animal Control."
  ) +
  theme_corporate() +
  theme(
    legend.position = "right",
    legend.key.height = unit(0.7, "cm")
  )

print(p3)

# ------------------------------------------------------------------------------
# VISUALIZATION 4: Budget Allocation Heatmap (Cross-Sectional Intensity)
# ------------------------------------------------------------------------------
dept_order <- dept_summary$Department  # Ranked order for Y-axis

p4 <- ggplot(budget_df, aes(
  x = factor(Year),
  y = factor(Department, levels = rev(dept_order)),
  fill = Budget_in_Thousands
)) +
  geom_tile(color = "white", linewidth = 0.6) +
  geom_text(
    aes(
      label = Budget_in_Thousands,
      color = Budget_in_Thousands > 550
    ),
    size = 2.9,
    fontface = "bold",
    show.legend = FALSE
  ) +
  scale_color_manual(values = c("TRUE" = "#ffffff", "FALSE" = "#2c3e50")) +
  scale_fill_viridis_c(
    option = "magma",
    direction = -1,
    labels = label_dollar(prefix = "$", suffix = "K"),
    name = "Budget ($K)"
  ) +
  labs(
    title = "Annual Budget Allocation Matrix by Department",
    subtitle = "Heatmap matrix illustrating annual funding intensity ($ in Thousands) sorted by cumulative rank",
    x = "Fiscal Year",
    y = "Department (Ranked by Total Allocation)",
    caption = "Figure 4: Darker tones indicate higher funding levels. Public Works, Recreation, and Parks consistently maintain top tiers."
  ) +
  theme_corporate() +
  theme(
    panel.grid = element_blank(),
    axis.text.x = element_text(angle = 45, hjust = 1, face = "bold"),
    axis.text.y = element_text(face = "bold")
  )

print(p4)

# ------------------------------------------------------------------------------
# VISUALIZATION 5: Department Share of Total Budget (Donut Chart)
# ------------------------------------------------------------------------------
donut_df <- dept_summary %>%
  mutate(
    Fraction = Total_Budget_K / sum(Total_Budget_K),
    Ymax = cumsum(Fraction),
    Ymin = c(0, head(Ymax, n = -1)),
    Label_Pos = (Ymax + Ymin) / 2,
    Display_Label = paste0(round(Share_of_Total, 1), "%")
  )

total_aggregate_m <- sum(dept_summary$Total_Budget_K) / 1000

p5 <- ggplot(donut_df, aes(ymax = Ymax, ymin = Ymin, xmax = 4, xmin = 2.5, fill = reorder(Department, -Total_Budget_K))) +
  geom_rect(color = "white", linewidth = 0.8) +
  coord_polar(theta = "y") +
  xlim(c(1, 4.3)) +
  scale_fill_viridis_d(option = "mako", name = "Department") +
  geom_text(
    aes(x = 3.25, y = Label_Pos, label = Display_Label),
    size = 3.1,
    fontface = "bold",
    color = "white"
  ) +
  annotate("text", x = 1, y = 0, label = paste0("Total Budget\n$", round(total_aggregate_m, 2), "M"), 
           size = 4.5, fontface = "bold", color = "#2c3e50") +
  labs(
    title = "Departmental Share of Cumulative Budget",
    subtitle = "Relative spending distribution across 10 municipal divisions ($78.29M total from 2005-2020)",
    caption = "Figure 5: Donut breakdown shows balanced municipal funding, with no single department exceeding 13.5%."
  ) +
  theme_void() +
  theme(
    plot.title = element_text(face = "bold", size = 14, color = "#2c3e50", hjust = 0.5, margin = margin(b = 5)),
    plot.subtitle = element_text(size = 10, color = "#7f8c8d", hjust = 0.5, margin = margin(b = 10)),
    plot.caption = element_text(size = 8.5, color = "#95a5a6", hjust = 0.5, margin = margin(t = 10)),
    legend.position = "right",
    legend.title = element_text(face = "bold", size = 9, color = "#34495e"),
    legend.text = element_text(size = 8)
  )

print(p5)

# ------------------------------------------------------------------------------
# VISUALIZATION 6: Budget Distribution (Histogram with Mean & Median)
# ------------------------------------------------------------------------------
overall_mean   <- mean(budget_df$Budget_in_Thousands)
overall_median <- median(budget_df$Budget_in_Thousands)

p6 <- ggplot(budget_df, aes(x = Budget_in_Thousands)) +
  geom_histogram(
    aes(y = after_stat(count)),
    binwidth = 35,
    fill = "#34495e",
    color = "white",
    alpha = 0.85
  ) +
  geom_vline(aes(xintercept = overall_mean), color = "#e74c3c", linetype = "dashed", linewidth = 1.1) +
  geom_vline(aes(xintercept = overall_median), color = "#27ae60", linetype = "dotted", linewidth = 1.1) +
  annotate(
    "label",
    x = overall_mean + 15,
    y = 23,
    label = paste0("Mean: $", round(overall_mean, 1), "K"),
    color = "#e74c3c",
    fill = "#fdf2e9",
    fontface = "bold",
    size = 3.5,
    hjust = 0
  ) +
  annotate(
    "label",
    x = overall_median - 15,
    y = 27,
    label = paste0("Median: $", round(overall_median, 1), "K"),
    color = "#27ae60",
    fill = "#eafaf1",
    fontface = "bold",
    size = 3.5,
    hjust = 1
  ) +
  scale_x_continuous(
    labels = label_dollar(prefix = "$", suffix = "K"),
    breaks = seq(200, 800, by = 100)
  ) +
  scale_y_continuous(expand = expansion(mult = c(0, 0.12))) +
  labs(
    title = "Distribution of Annual Departmental Budgets",
    subtitle = "Statistical frequency distribution across 160 individual department-year observations",
    x = "Annual Budget (Thousands USD)",
    y = "Observation Frequency (Count)",
    caption = "Figure 6: Red dashed line = Mean ($489.3K) | Green dotted line = Median ($492.5K). Near-symmetric distribution."
  ) +
  theme_corporate()

print(p6)

# ==============================================================================
# END OF SCRIPT
# ==============================================================================
































