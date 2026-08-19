# Supply-Chain-Forecast-Analytics
SQL supply chain analytics project analyzing actual vs forecast quantities, forecast accuracy, fiscal-year performance, and customer-level forecasting insights.


# Supply Chain Forecast Analytics using SQL

## 📌 Project Overview

This project focuses on analyzing **supply chain forecast performance** by comparing actual sales quantities with forecasted quantities.

The goal is to measure forecast accuracy at the customer level, identify forecasting errors, and create a structured SQL-based analysis that can support better demand planning and inventory decisions.

## 🎯 Business Problem

In supply chain planning, inaccurate forecasts can lead to:

* Excess inventory due to over-forecasting
* Stock shortages due to under-forecasting
* Inefficient inventory planning
* Poor demand-planning decisions

The objective of this analysis is to combine actual sales and forecast data and calculate key forecasting KPIs to evaluate forecast performance across customers and markets.

## 🛠️ Tools & Technologies

* **MySQL**
* **MySQL Workbench**
* **SQL**
* **GitHub**

## 📊 Key Forecasting Metrics

### Net Error

```text
Net Error = Forecast Quantity - Actual Sold Quantity
```

Shows whether demand was over-forecasted or under-forecasted.

### Net Error %

```text
Net Error % = (Net Error / Total Forecast Quantity) × 100
```

Expresses the net forecasting error as a percentage.

### Absolute Error

```text
Absolute Error = ABS(Forecast Quantity - Actual Sold Quantity)
```

Measures the total forecasting error regardless of direction.

### Absolute Error %

```text
Absolute Error % = (Absolute Error / Total Forecast Quantity) × 100
```

Measures the magnitude of forecasting error relative to the forecast.

### Forecast Accuracy

```text
Forecast Accuracy = 100 - Absolute Error %
```

If the absolute error percentage exceeds 100%, forecast accuracy is capped at **0%**.

## 🔄 Project Workflow

### 1. Fiscal Year Logic

Created fiscal-year logic to support the company's **September–August fiscal calendar**.

For example:

* September 2020 → FY2021
* August 2021 → FY2021

This allows sales and forecast performance to be analyzed using the organization's fiscal reporting structure.

### 2. Actual vs. Forecast Data Integration

Combined:

* `fact_sales_monthly`
* `fact_forecast_monthly`

using SQL joins and `UNION` logic.

A helper table called `fact_act_est` was created containing:

* Date
* Fiscal Year
* Product Code
* Customer Code
* Sold Quantity
* Forecast Quantity

Missing actual sales quantities were handled to support accurate downstream calculations.

### 3. Forecast Accuracy Analysis

Built a CTE-based forecast accuracy report that aggregates performance by:

* Customer
* Customer Name
* Market

The analysis calculates:

* Total Sold Quantity
* Total Forecast Quantity
* Net Error
* Net Error %
* Absolute Error
* Absolute Error %
* Forecast Accuracy

`CAST(... AS SIGNED)` is used when calculating differences between forecast and sold quantities so negative forecasting errors can be handled correctly.

`NULLIF()` is used to protect percentage calculations from division-by-zero errors.

## 💻 SQL Concepts Demonstrated

* Common Table Expressions (CTEs)
* INNER and LEFT JOINs
* UNION
* Aggregate Functions
* CASE / IF Logic
* `ABS()`
* `CAST()`
* `NULLIF()`
* GROUP BY
* Data Transformation
* NULL Handling
* Fiscal-Year Calculations
* Business KPI Development

## 📁 Project Files

### `01_fiscal_year_logic.sql`

Implements fiscal-year logic for a September–August fiscal calendar.

### `02_create_actual_forecast_table.sql`

Combines actual sales and forecast data to create the `fact_act_est` helper table used for forecast analysis.

### `03_forecast_accuracy_report.sql`

Calculates customer-level forecasting KPIs including net error, absolute error, error percentages, and forecast accuracy.

## 📚 Additional SQL Knowledge

In addition to the concepts implemented in this project, I have practiced:

* Database Triggers
* Database Events
* Indexes and Composite Indexes
* Temporary Tables
* Views
* Subqueries
* Stored Procedures
* User-Defined Functions

## 💡 Business Value

This analysis can help supply chain and demand-planning teams identify customers with lower forecast accuracy and investigate where actual demand differs significantly from forecasts.

These insights can support better:

* Demand planning
* Inventory management
* Forecast monitoring
* Customer-level performance analysis
* Supply chain decision-making

## 🚀 Skills Demonstrated

**SQL | MySQL | Supply Chain Analytics | Forecast Accuracy | Demand Planning | Data Analysis | Data Transformation | CTEs | Joins | Business Analytics**
