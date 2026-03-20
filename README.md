# The Hidden Cost of Waiting: Time-to-Value Analysis

## Overview

Most business analysis focuses on revenue and profit.

This project explores a different question:

**Does time reduce the value of revenue?**

Using SQL, this analysis evaluates how operational delays (fulfillment time) impact the real value of business transactions.

---

## Business Problem

While companies often track how much revenue they generate, they rarely consider how long it takes to deliver value.

Delays in fulfillment can:

- Reduce customer satisfaction  
- Increase return rates  
- Decrease the effective value of revenue  

This project aims to quantify the hidden financial impact of time delays.

---

## Methodology

A transactional dataset was analyzed using SQL.

Revenue was adjusted using a **time-decay model**:

Adjusted Revenue = Revenue × (1 - 0.001 × fulfillment_days)

This assumes that each day of delay reduces value by 0.1%.

Due to SQLite limitations (no POWER/EXP functions), a linear decay model was implemented for simplicity and interpretability.

---

## Key Analysis

### 1. Value Loss Calculation
Measured the difference between actual revenue and time-adjusted revenue.

### 2. Regional Impact
Identified which regions contribute most to value loss.

### 3. Delay vs Return Relationship
Analyzed how fulfillment delays affect return rates.

### 4. Product Delay Analysis
Ranked products based on average fulfillment delays.

---

## Key Insights

- Revenue loses measurable value when fulfillment is delayed  
- Some regions contribute disproportionately to value loss  
- Higher fulfillment delays are associated with higher return rates  
- A small number of products drive most operational inefficiencies  

---

## SQL Techniques Used

- Common Table Expressions (CTEs)  
- Window Functions (RANK)  
- CASE Statements  
- Aggregations  
- Business modeling in SQL  

---

## Files in This Repository

- `/data` → Raw dataset used  
- `/sql` → SQL scripts for analysis  
- `/images` → Query outputs and insights  

---

## Conclusion

This project demonstrates that operational efficiency is not just a logistics concern, but a financial one.

Time directly impacts value.

---

## Author

**Moses Abah**  
Data Analyst | Business Intelligence Enthusiast
