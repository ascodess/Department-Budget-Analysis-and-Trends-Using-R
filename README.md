# 🏛️ Department Budget Analysis & Trends Using R

<p align="center">
  <img src="https://img.shields.io/badge/R-4.0+-276DC3?style=for-the-badge&logo=r&logoColor=white" />
  <img src="https://img.shields.io/badge/Tidyverse-Data%20Analysis-1A1A1A?style=for-the-badge&logo=r&logoColor=white" />
  <img src="https://img.shields.io/badge/ggplot2-Data%20Visualization-blue?style=for-the-badge&logo=r&logoColor=white" />
  <img src="https://img.shields.io/badge/Project-Completed-success?style=for-the-badge" />
</p>

## 📌 Project Overview

This project analyzes **16 years of municipal budget allocations (2005–2020)** across **10 public service departments** using **R, Tidyverse, and ggplot2**.

The objective was to uncover funding patterns, departmental growth trends, budget distribution, and long-term spending priorities through exploratory data analysis and professional data visualization.

---

## 🎯 Key Highlights

| Metric | Value |
|----------|----------|
| Total Budget Allocation | **$78.29M** |
| Years Analyzed | **16 Years** |
| Departments | **10** |
| Records | **160** |
| Highest Funded Department | **Public Works ($10.43M)** |
| Fastest Growing Department | **Animal Control (+105.6%)** |
| Overall Budget Growth | **+44.7%** |

---

## 💡 Business Insights

- Public Works received the highest cumulative funding, accounting for **13.3%** of total municipal spending.
- Recreation and Public Works together represented more than **26%** of total allocations.
- Animal Control showed the strongest long-term growth, expanding by **105.6%** between 2005 and 2020.
- Education and Transportation also experienced substantial growth, increasing by **89.2%** and **68.3%** respectively.
- Municipal spending increased from **$4.13M in 2005** to **$5.98M in 2020**, demonstrating strong long-term growth despite temporary budget contractions.

---

# 📸 Project Visualizations

## Department Funding Ranking

![Department Ranking](./screenshots%20of%20visualisation/Executive%20Summary%20Bar%20Chart%20(Horizontal%20Ranked).png)

## Municipal Budget Trend (2005–2020)

![Budget Trend](screenshots%20of%20visualisation/Budget%20Trend%20Analysis%20(Total%20Budget%20by%20Year).png)

## Department Growth Trends

![Growth Trends](screenshots%20of%20visualisation/Department%20Growth%20Trends%20(Multi-Line%20Chart).png)

## Budget Allocation Heatmap

![Heatmap](screenshots%20of%20visualisation/Budget%20Allocation%20Heatmap%20(Cross-Sectional%20Intensity).png)

## Department Share of Budget

![Donut Chart](screenshots%20of%20visualisation/Department%20Share%20of%20Total%20Budget%20(Donut%20Chart).png)

## Budget Distribution Analysis

![Histogram](screenshots%20of%20visualisation/Budget%20Distribution%20(Histogram%20with%20Mean%20%26%20Median).png)

---

## 📊 Dataset Information

| Column | Description |
|----------|----------|
| Year | Fiscal year of budget allocation |
| Department | Municipal department name |
| Budget_in_Thousands | Annual budget allocation ($K) |

### Dataset Summary

- **Time Period:** 2005 – 2020
- **Departments:** 10
- **Observations:** 160
- **Missing Values:** 0
- **Data Type:** Structured tabular dataset

---

## ⚙️ Analysis Workflow

```text
Data Collection
      │
      ▼
Data Cleaning & Validation
      │
      ▼
Exploratory Data Analysis
      │
      ▼
Department & Time-Series Analysis
      │
      ▼
Data Visualization
      │
      ▼
Business Insights & Reporting
```

---

## 🛠️ Skills Demonstrated

### Data Analysis
- Data Cleaning
- Exploratory Data Analysis (EDA)
- Statistical Analysis
- Time-Series Analysis
- Trend Identification

### R Programming
- Data Import & Validation
- Data Transformation
- Aggregations & Summaries
- Data Visualization

### Business Intelligence
- KPI Identification
- Budget Trend Analysis
- Department Performance Evaluation
- Insight Generation

---

## 📈 Department Performance Summary

| Department | Total Budget ($K) | Share (%) | Growth (%) |
|------------|------------------:|-----------:|-----------:|
| Public Works | 10,431 | 13.32 | 32.43 |
| Recreation | 10,287 | 13.14 | 16.80 |
| Parks | 9,794 | 12.51 | 26.92 |
| Sanitation | 9,324 | 11.91 | 29.12 |
| Housing | 7,502 | 9.58 | 44.85 |
| Transportation | 7,285 | 9.30 | 68.35 |
| City Management | 6,361 | 8.12 | 57.53 |
| Education | 6,273 | 8.01 | 89.21 |
| Health | 5,713 | 7.30 | 53.89 |
| Animal Control | 5,323 | 6.80 | 105.60 |

---

## 📂 Repository Structure

```text
Department-Budget-Analysis-R
│
├── Data_Visualisation_Project.R
├── parks_and_rec_budget.csv
├── Data for visualisation.RData
├── screenshots of visualisation/
│   ├── Executive Summary Bar Chart.png
│   ├── Budget Trend Analysis.png
│   ├── Department Growth Trends.png
│   ├── Budget Allocation Heatmap.png
│   ├── Department Share Donut Chart.png
│   └── Budget Distribution Histogram.png
│
└── README.md
```

---

## 💻 Tech Stack

| Category | Tools |
|-----------|--------|
| Language | R |
| Data Manipulation | dplyr, tidyr |
| Data Visualization | ggplot2 |
| Data Import | readr |
| Formatting | scales |
| Color Palettes | viridis |

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/ascodess/department-budget-analysis-r.git

cd department-budget-analysis-r
```

### Install Required Packages

```r
install.packages(c(
  "tidyverse",
  "scales",
  "viridis"
))
```

### Run Analysis

```r
source("Data_Visualisation_Project.R")
```

All charts will be generated automatically in RStudio.

---

## 🎓 What This Project Demonstrates

✅ Data Cleaning & Validation  
✅ Exploratory Data Analysis (EDA)  
✅ Time-Series Analysis  
✅ Statistical Analysis  
✅ Business Insight Generation  
✅ Professional Data Visualization  
✅ R Programming Fundamentals  
✅ End-to-End Analytics Workflow  

---

## 👤 Author

### Aadhya Sharma

Aspiring Data Analyst passionate about transforming raw data into actionable insights through analytics and visualization.

📧 **Email:** aadhya2208@gmail.com

🔗 **LinkedIn:** https://www.linkedin.com/in/aadhya-sharma-contactaadhya

🔗 **GitHub:** https://github.com/ascodess

---
