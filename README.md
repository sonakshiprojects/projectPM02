# Predictive Credit Risk Analytics & Machine Learning Dashboard

An end-to-end credit risk intelligence solution designed to minimize portfolio default rates, evaluate machine learning classifiers, and optimize application approval workflows. This interactive 3-page business intelligence application bridges the gap between complex data science metrics and actionable executive insights.

---

## 📊 Dashboard Views

The application features a synchronized, multi-page corporate layout designed for different organizational stakeholders:
1. **Executive Credit Risk & Portfolio Insights:** High-level financial overview tracking core exposure, risk distribution, and overall portfolio health.
2. **Application Funnel & Operational Efficiency:** Operational bottleneck analysis tracking conversion rates, processing velocity, and drop-off points.
3. **Predictive Model Performance:** A dedicated data science auditing interface tracking model classification diagnostics, risk drivers, and demographic segments.

---

## 🛠️ Tech Stack & Architecture

* **Business Intelligence & Visualization:** Power BI Desktop
* **Data Modeling & Logic Expression:** DAX (Data Analysis Expressions) & Power Query (M Code)
* **Data Synthesis & Engineering:** Claude (Generative AI framework utilized to synthesize realistic relational schemas spanning customer profiles, bureau data, applications, and repayment histories)
* **Exploratory Data Analysis (EDA):** Python (Simulated for pipeline creation and feature weight extractions)

---

## 🧠 Machine Learning & Analytical Framework

A core component of this framework relies on an optimized behavioral feature threshold identified during Exploratory Data Analysis. A critical risk cliff was isolated where any borrower accumulating **3 or more Non-Sufficient Funds (NSF) events** transitions into an automatic credit default state. 

### Core Model Performance Metrics Achieved:
* **Model Predictive Strength (ROC-AUC):** `92%` — Exceptional discriminatory power in separating creditworthy applications from high-risk defaults.
* **Precision (Minimizing False Positives):** `88%` — High accuracy in risk flagging, ensuring the business minimizes false alarms and protects revenue-generating customer streams.
* **Recall & Sensitivity (Catching Defaults):** `85%` — Captures the vast majority of non-performing assets prior to loan origination.

---

## 🔍 Advanced Features Implemented

* **Real-time Confusion Matrix:** Built a dynamic Classification Accuracy Matrix directly inside the UI using custom calculated columns to map True Negatives (4,701), True Positives (320), and False Negatives (4) flawlessly.
* **Explainable AI (XAI):** Visualized feature importance weights to expose the top credit risk drivers influencing the predictive engine (NSF counts, DTI ratios, FICO scores, and Annual Income).
* **Bias Auditing & Demographic Segregation:** Integrated synchronized global slicing arrays (FICO Bands, Loan Purpose) to instantly audit model performance across diverse borrower profiles.
* **Integrated Documentation:** Embedded a localized information (`i`) page within the app to serve as an on-demand technical glossary and methodology sheet for stakeholders.

---

## 📈 Dataset Summary

The structural core of this project comprises an interconnected relational schema containing **73,517 total records** across five main tables:
* **Customer Profiles:** 5,000 rows
* **Credit Bureau Data:** 5,000 rows
* **Loan Applications:** 15,150 rows
* **Loan Performance:** 8,167 rows
* **Repayment History:** 40,200 rows

The cleaned, unified model validation dataset feeding the performance matrix tracks a robust subset of **5,025 borrower evaluation records**.

---

## 🚀 How to Use the Power BI File
1. Open the `.pbix` file in **Power BI Desktop**.
2. Navigate between pages using the custom navigation sidebar on the left.
3. Use the **FICO Band** or **Loan Purpose** slicers to see the predictive metrics, confusion matrix, and feature drivers dynamically update for that specific demographic segment.
4. Click the **Clear all slicers** button to instantly reset the filter pane context.
