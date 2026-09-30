# Water Quality Analysis: From River Intake to Consumer Tap (2023–2024)

An end-to-end analysis of 300 water samples collected from five stations along a supply chain, using **MySQL**, **Power BI** and **Python** to assess treatment performance, WHO compliance and potability.

![SQL](https://img.shields.io/badge/SQL-MySQL-blue) ![Power BI](https://img.shields.io/badge/Dashboard-Power%20BI-yellow) ![Python](https://img.shields.io/badge/Python-pandas%20%7C%20SciPy-green)

---

## Table of Contents
- [Project Overview](#project-overview)
- [Business Questions](#business-questions)
- [Dataset](#dataset)
- [Tools and Methods](#tools-and-methods)
- [Key Findings](#key-findings)
- [Dashboard](#dashboard)
- [Extended Analysis](#extended-analysis)
- [Recommendations](#recommendations)
- [Limitations](#limitations)
- [Repository Structure](#repository-structure)
- [Author](#author)

---

## Project Overview

Water utilities need to know whether treatment is working and whether the water that reaches customers is safe. This project follows water through five points in the system and asks where quality improves, where it deteriorates, and which WHO checks cause samples to fail.

| Station | Region | Role |
|---|---|---|
| A – River Intake | North | Raw source |
| B – Reservoir | East | Raw source |
| C – Treatment Plant Outlet | South | Treated |
| D – Distribution Main | West | Treated |
| E – Consumer Tap | Central | Treated |

## Business Questions

1. How many samples were tested, and what are the average levels of each parameter?
2. Which stations record the highest and lowest levels of each parameter?
3. How do results change between 2023 and 2024, and from month to month?
4. How many samples pass the WHO checks for pH, turbidity, nitrate and coliform?
5. How many treated samples are potable, and what drives the failures?

## Dataset

- **Size:** 300 samples, 21 columns, no missing values, unique Sample IDs
- **Period:** 1 January 2023 – 31 December 2024
- **Parameters (11):** pH, turbidity (NTU), dissolved oxygen, TDS, conductivity, hardness, nitrate, BOD, total coliform, chlorine, temperature
- **Flags:** WHO pH, turbidity, nitrate and coliform PASS/FAIL, plus `Overall Potable` (YES / NO / N/A for raw sources)

> The dataset appears to be synthetic or illustrative (for example, clean pass/fail cut-offs), so findings demonstrate the analytical method rather than real-world conditions.

## Tools and Methods

| Stage | Tool | What was done |
|---|---|---|
| Analysis | MySQL | KPIs, station / year / month comparisons, WHO pass-fail and potability counts |
| Visualisation | Power BI | Interactive dashboard with station, region and date slicers |
| Validation and extended analysis | Python (pandas, SciPy, matplotlib) | Reconciled SQL and dashboard figures to the raw CSV; significance tests; correlation analysis |

Example query (average coliform by station):

```sql
SELECT
   Station_Name,
   Region,
   ROUND(AVG(Total_Coliform_CFU_100mL),2) AS Average_Total_Coliform
FROM water_quality_dataset
GROUP BY 1,2
ORDER BY 3 DESC;
```

## Key Findings

**Overall averages:** pH 7.44 · hardness 207.06 mg/L · dissolved oxygen 8.14 mg/L · turbidity 12.35 NTU · conductivity 359.60 µS/cm · nitrate 3.43 mg/L · BOD 2.07 mg/L · coliform 65.80 CFU/100 mL · chlorine 0.49 mg/L · temperature 19.21 °C

### 1. Treatment removes most contamination

| Parameter | River Intake (A) | Treatment Outlet (C) | Reduction |
|---|---|---|---|
| Total coliform (CFU/100 mL) | 230.48 | 2.03 | 99.1% |
| Turbidity (NTU) | 45.93 | 0.86 | 98.1% |
| Nitrate (mg/L) | 7.57 | 1.36 | 82.0% |
| Conductivity (µS/cm) | 513.42 | 281.90 | 45.1% |
| BOD (mg/L) | 2.96 | 1.68 | 43.2% |

Chlorine moves the other way (0.10 → 1.03 mg/L) because it is added during treatment. pH, hardness and temperature are broadly similar across stations.

### 2. Quality declines after the plant

Coliform rises from **2.03** (outlet) to **4.00** (distribution main) to **7.29** (consumer tap), while chlorine falls from **1.03** to **0.69** to **0.53** mg/L. The differences between the three treated stations are statistically significant (Kruskal–Wallis, p < 0.001).

### 3. Only 20 of 187 treated samples are potable

| Station | Potable | Not potable |
|---|---|---|
| C – Treatment Outlet | 8 | 53 |
| D – Distribution Main | 7 | 54 |
| E – Consumer Tap | 5 | 60 |

The potable flag is identical to the coliform-pass flag. Every treated sample passes pH, turbidity and nitrate, so **coliform is the only reason treated water fails** (WHO rule: 0 CFU/100 mL).

### 4. Raw sources are the risk hotspot

- Station A fails WHO coliform and turbidity in all 56 samples, and nitrate in 17 of 56 (30%)
- Station B fails coliform in all 57 samples and turbidity in 56 of 57

### 5. Yearly and monthly patterns are weak

2024 looks cleaner (coliform 81.4 → 49.1 CFU/100 mL), but the difference is not significant at the 5% level (p = 0.06). Monthly swings in the dashboard are largely explained by which stations happened to be sampled that month, and no month effect is significant once station is accounted for.

## Dashboard

The Power BI report (`WATER_QUALITY_POWERBI_ANALYSIS.pdf`) includes KPI cards, station-level bar charts for every parameter, WHO pass/fail matrices, a potability matrix, and monthly and 2023 vs 2024 comparisons, filterable by station, region and date.

<!-- Add a screenshot: ![Dashboard](images/dashboard.png) -->

## Extended Analysis

- **Disinfectant residual:** 12.3% of consumer-tap samples have chlorine below 0.2 mg/L; none do at the outlet or distribution main
- **Correlations:** coliform is strongly linked to turbidity (ρ = 0.76) and negatively to chlorine (ρ = −0.74), but within each treated station chlorine and coliform are not significantly correlated, so the overall link should not be read as causal
- **Redundancy:** conductivity and TDS are almost perfectly correlated (ρ = 1.00)
- **Data validity:** station and region are one-to-one, so regional findings are really station findings; all 300 pH samples pass, so the pH pass/fail query carries no information

## Recommendations

1. **Protect water in the network,** not just at the plant: check main and service-line integrity, flush dead ends, and review cross-connection risk
2. **Hold a chlorine residual** above 0.2 mg/L at the tap, with booster dosing where needed
3. **Confirm coliform detections** with repeat sampling and lab checks before concluding that most treated water is unsafe
4. **Manage raw-water risk:** nitrate above 10 mg/L at the intake points to catchment inputs
5. **Use turbidity as an early-warning indicator** for microbial risk in raw water
6. **Balance the sampling design** (equal samples per station per month) so seasonal analysis is valid
7. **Dashboard:** separate raw and treated KPIs, add potability rate per station, and annotate monthly charts with sample counts

## Limitations

- 300 samples, one sampling point per station; samples are independent, not the same water tracked along the network
- Correlations are associational, and tests are not adjusted for multiple comparisons
- Pass/fail thresholds are taken as supplied in the dataset (for example, the turbidity cut-off is about 3 NTU, stricter than the WHO guideline of 5 NTU)

## Repository Structure

```
├── data/
│   └── Water_quality_dataset.csv
├── sql/
│   └── WATER_QUALITY_SQL_ANALYSIS.sql
├── dashboard/
│   └── WATER_QUALITY_POWERBI_ANALYSIS.pdf
├── report/
│   └── Water_Quality_Analysis_Report.docx
└── README.md
```

## Author

**Brian Mbae Mwarania**
Data analyst | SQL · Power BI · Python

linkedin.com/in/brian-mbae-598070223
github.com/brianmbae-analytics
mbaemwarania@gmail.com
