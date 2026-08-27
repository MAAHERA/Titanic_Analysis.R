# YUVA Internship Track: Data Analytics & Business Intelligence
## Week 2 Task: Data Visualization & Insight Communication using R

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-Visualization-blue?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![Hours Dedicated](https://img.shields.io/badge/Hours_Dedicated-32_Hours-orange?style=for-the-badge)

---

## 📌 Project Overview
This repository contains the completed deliverables for **Week 2** of the **YUVA Internship Program** (Data Analytics & Business Intelligence Track). 

The primary objective of this task is to utilize statistical graphics and dynamic visualizations in **R** (`ggplot2`, `lattice`, `dplyr`, `ggcorrplot`) to analyze, interpret, and communicate complex customer purchasing behavioral trends to both technical supervisors and executive (non-technical) stakeholders.

---

## 🎯 Task Objectives & Deliverables
- **Data Selection & Overview:** Processed an E-Commerce Customer Purchasing Dataset ($N = 1,000$ customer profiles) across 9 quantitative & categorical variables.
- **Visualization Engineering:** Developed 5 distinct graphical studies to evaluate demographic distributions, income-spending elasticity, category variability, regional market penetration, and feature correlations.
- **Reproducible R Code:** Implemented clean, modular R scripts adhering to Leland Wilkinson's *Grammar of Graphics*.
- **Executive Submission Document:** Formatted **DOC file** including inline code blocks, high-resolution figures, analytical interpretations, and non-technical business recommendations.
- **Dedicated Effort:** 32 Hours (Target Range: 30 - 35 Hours).

---

## 📊 Key Visualizations & Analytical Insights

### 1. Customer Age Demographics (Histogram + Density Curve)
- **Objective:** Assess age tier distributions and verify parametric normality.
- **Key Insight:** The customer base follows a near-normal distribution centered at a **mean age of 35.2 years** (median = 35.0 years). Over **68%** of active spenders are aged 25–45, highlighting working professionals as the core target segment.

```r
# R Code Snippet: Histogram with Density Curve & Reference Lines
library(ggplot2)
library(dplyr)

ggplot(df, aes(x = Age)) +
  geom_histogram(aes(y = ..density..), bins = 20, fill = "#2b5c8f", color = "#ffffff", alpha = 0.85) +
  geom_density(color = "#d9534f", size = 1.2) +
  geom_vline(aes(xintercept = mean(Age)), color = "#e67e22", linetype = "dashed", size = 1) +
  geom_vline(aes(xintercept = median(Age)), color = "#27ae60", linetype = "dotted", size = 1) +
  labs(title = "Customer Age Distribution with Density Overlay", x = "Customer Age (Years)", y = "Density") +
  theme_minimal(base_size = 12)
```

---

### 2. Annual Income vs. Spending Score Elasticity (Scatter Plot)
- **Objective:** Evaluate purchasing power elasticity across product categories.
- **Key Insight:** Moderate positive correlation ($r = +0.42$). High-income earners (>$80k USD) exhibit noticeable divergence: splitting into high-tier buyers (Electronics/Apparel) and conservative spenders.

```r
# R Code Snippet: Bivariate Scatter Plot with Category Aesthetics
ggplot(df, aes(x = AnnualIncome_kUSD, y = SpendingScore, color = PreferredCategory)) +
  geom_point(alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", color = "#2c3e50", linetype = "dashed", se = FALSE) +
  scale_color_manual(values = c("#2b5c8f", "#d9534f", "#27ae60", "#f39c12", "#8e44ad")) +
  labs(title = "Annual Income vs. Spending Score by Product Category", x = "Annual Income ($k USD)", y = "Spending Score (1 - 100)") +
  theme_bw(base_size = 12)
```

---

### 3. Categorical Spending Variability (Boxplot Analysis)
- **Objective:** Compare median engagement and detect category outliers.
- **Key Insight:** Electronics and Apparel maintain the highest median spending scores (~58), whereas Books & Media exhibits a lower median (~38) and broader variance.

```r
# R Code Snippet: Categorical Boxplot
ggplot(df, aes(x = reorder(PreferredCategory, -SpendingScore, FUN = median), y = SpendingScore, fill = PreferredCategory)) +
  geom_boxplot(outlier.color = "#e74c3c", outlier.shape = 16, alpha = 0.75) +
  scale_fill_manual(values = c("#3498db", "#e74c3c", "#2ecc71", "#f1c40f", "#9b59b6")) +
  labs(title = "Spending Score Distribution across Product Categories", x = "Preferred Category", y = "Spending Score") +
  theme_minimal(base_size = 12)
```

---

### 4. Regional Purchasing Volume (Horizontal Bar Chart)
- **Objective:** Quantify geographical operational performance.
- **Key Insight:** **North America** commands **>40%** of total transaction volume (8,825 purchases), followed by Europe (30%) and APAC (20%). Latin America represents an underpenetrated market (10%).

```r
# R Code Snippet: Horizontal Bar Chart
region_summary <- df %>% group_by(Region) %>% summarise(TotalVolume = sum(TotalPurchases))

ggplot(region_summary, aes(x = reorder(Region, TotalVolume), y = TotalVolume)) +
  geom_bar(stat = "identity", fill = "#2b5c8f", width = 0.6) +
  geom_text(aes(label = scales::comma(TotalVolume)), hjust = -0.2, fontface = "bold") +
  coord_flip() +
  labs(title = "Total Purchase Volume by Geographic Region", x = "Region", y = "Total Purchase Count") +
  theme_classic(base_size = 12)
```

---

### 5. Multi-Metric Correlation Matrix (Heatmap)
- **Objective:** Identify underlying risk factors contributing to customer churn.
- **Key Insight:** Total Purchases strongly correlates with Spending Score ($r = +0.76$). Customer Churn exhibits inverse correlation with transaction count ($r = -0.52$), confirming continuous engagement is vital for retention.

```r
# R Code Snippet: Correlation Heatmap
library(ggcorrplot)

corr_matrix <- round(cor(df %>% select(Age, AnnualIncome_kUSD, SpendingScore, TotalPurchases, Churn)), 2)
ggcorrplot(corr_matrix, hc.order = TRUE, type = "lower", lab = TRUE, method = "square", colors = c("#6D9EC1", "#FFFFFF", "#E46726"))
```

---

## 💡 Executive Strategic Recommendations
1. **VIP Loyalty Tiering:** Design targeted premium loyalty incentives for high-income ($80k+) Electronics and Apparel buyers.
2. **Churn Early Warning System (EWS):** Implement automated flags when a customer's spending score drops below 35 over a 60-day window.
3. **Regional Supply Chain Expansion:** Optimize fulfillment logistics in high-volume hubs (North America) while piloting localized growth campaigns in Latin America.

---

## ⏱️ Work Log & Time Allocation (Total: 32 Hours)
| Project Phase | Tasks / Deliverables Completed | Hours Dedicated |
| :--- | :--- | :---: |
| **Dataset Selection & Data Hygiene** | Data curation, missing value checks, factor formatting in R | **6 Hours** |
| **Exploratory Data Analysis (EDA)** | Parametric summary metrics, distribution skewness evaluation | **7 Hours** |
| **Visualization Development (R)** | Writing & tuning ggplot2 / lattice graphics code | **10 Hours** |
| **Insight Interpretation** | Business insight extraction, correlation analysis, churn risk evaluation | **5 Hours** |
| **Documentation & DOC Generation** | Formatting DOC file, embedding high-res figures & executive narrative | **4 Hours** |
| **TOTAL HOURS** | **All Week 2 Deliverables Successfully Completed** | **32 Hours** |

---

## 📁 Repository Structure
```
├── README.md                                                 # Project GitHub documentation
├── Week_2_Task_Data_Visualization_and_Insight_Communication.docx  # Final Word submission file
├── scripts/
│   └── week2_visualization_analysis.R                        # Complete reproducible R script
└── charts/
    ├── fig1_age_distribution.png
    ├── fig2_income_vs_spending.png
    ├── fig3_boxplot_spending.png
    ├── fig4_purchases_by_region.png
    └── fig5_correlation_heatmap.png
```

---

*Submitted for YUVA Internship Program - Week 2 Evaluation.*
