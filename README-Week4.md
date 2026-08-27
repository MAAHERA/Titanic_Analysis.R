# YUVA Internship Track: Data Analytics & Business Intelligence
## Week 4 Final Capstone Task: Comprehensive Data Analysis Reporting & Presentation

![R](https://img.shields.io/badge/R-276DC3?style=for-the-badge&logo=r&logoColor=white)
![Caret](https://img.shields.io/badge/Caret-Machine_Learning-orange?style=for-the-badge)
![ggplot2](https://img.shields.io/badge/ggplot2-Data_Visualization-blue?style=for-the-badge)
![RandomForest](https://img.shields.io/badge/Random_Forest-Classification-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)
![Dedicated Effort](https://img.shields.io/badge/Dedicated_Effort-35_Hours-brightgreen?style=for-the-badge)

---

## 📌 Capstone Overview
This repository contains the final, integrated capstone deliverables for **Week 4** of the **YUVA Internship Program** (Data Analytics & Business Intelligence Track). 

This project synthesizes four weeks of rigorous analytical work—spanning data hygiene, exploratory data analysis (EDA), statistical hypothesis testing, machine learning modeling, and strategic reporting—into a single, business-oriented framework designed to predict customer churn in an e-commerce ecosystem ($N = 1,000$).

---

## 🎯 Deliverables & Key Objectives
- **Comprehensive DOC Report:** Primary submission file detailing introduction, data hygiene, EDA, hypothesis testing, model evaluation, and executive strategies (`Week_4_Final_Task_Comprehensive_Data_Analysis_Report.docx`).
- **Data Hygiene & Scrubbing:** Standardized schema, median imputation for missing data, and Z-score outlier filtering ($|Z| > 3$).
- **Visual EDA Suite:** Detailed behavioral plots rendered in `ggplot2` examining income distributions, spending scores, and regional purchasing behavior.
- **Statistical Significance Testing:** Conducted Welch Two-Sample $t$-tests ($t = 14.82, p < 0.001$) confirming significant spending variance between retained and churned customers.
- **Machine Learning & Diagnostic Suite:** Trained and evaluated **Logistic Regression** and **Random Forest** models using 10-Fold Repeated Cross-Validation.
- **Dedicated Effort:** **35 Dedicated Hours** across 4 program weeks.

---

## 🔬 Predictive Model & Diagnostic Benchmark

| Metric | Logistic Regression (`glm`) | Random Forest Classifier (`rf`) | Target Benchmark |
| :--- | :---: | :---: | :---: |
| **Accuracy** | 86.50% | **89.00%** | > 80.00% |
| **Sensitivity (Recall - Churn)** | 82.40% | **87.10%** | > 80.00% |
| **Specificity (Retained)** | 89.30% | **90.20%** | > 85.00% |
| **F1-Score** | 0.841 | **0.886** | > 0.800 |
| **AUC-ROC Score** | 0.912 | **0.948** | > 0.900 |

> **Key Optimization:** Decision threshold calibrated down from `0.50` to `0.38`, successfully boosting model Sensitivity (Recall) to **92.5%** for early churn detection.

---

## ⏱️ Internship Work Log & Allocation (Total: 35 Hours)

| Project Phase | Focus Area & Completed Deliverables | Dedicated Hours |
| :--- | :--- | :---: |
| **Week 1: Data Ingestion & Hygiene** | Schema design, type coercion, NA imputation, outlier detection | **6 Hours** |
| **Week 2: Exploratory Graphics** | Multi-variate ggplot2 suite, correlation matrix, visual profiling | **8 Hours** |
| **Week 3: Modeling & Diagnostics** | Hypothesis testing, cross-validation, hyperparameter tuning | **11 Hours** |
| **Week 4: Report & Presentation** | DOC synthesis, threshold calibration, executive presentation | **10 Hours** |
| **TOTAL EFFORT** | **Complete Capstone Program Requirements Met** | **35 Hours** |

---

## 📁 Repository Layout
```
├── README.md                                                       # GitHub Project Documentation
├── Week_4_Final_Task_Comprehensive_Data_Analysis_Report.docx        # Primary Comprehensive Report (DOC)
├── scripts/
│   ├── 01_data_cleaning_eda.R                                      # Cleaning & visual analysis pipeline
│   ├── 02_hypothesis_testing.R                                     # Statistical t-tests & Chi-Square scripts
│   └── 03_predictive_modeling.R                                    # Caret ML & ROC optimization pipeline
└── outputs/
    ├── visuals/                                                    # Exported ggplot2 graphs
    └── models/                                                     # Saved model objects (.rds)
```

---

*Submitted for YUVA Internship Program - Week 4 Final Evaluation.*
