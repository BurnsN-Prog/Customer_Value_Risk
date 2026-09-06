# Meridian Financial Group — Customer Value & Credit Risk Analysis

## Business Problem
Consumer Banking leadership requested an evaluation of customer portfolio value, retention trends, and personal-loan credit risk across customer segments and regions. This analysis identifies high-value customer groups, evaluates patterns associated with account closures, and highlights areas of concentrated credit-risk exposure. The objective is to deliver data-backed portfolio insights and establish key recommendations for subsequent business investigation.

## Dataset
The analysis uses `meridian_customer_value_risk.csv`, a customer-level dataset where each row represents an individual customer (300 observations). Key fields include:
* customer demographics (`customer_segment`, `region`)
* portfolio engagement (`product_count`, `deposit_balance`)
* financial metrics (`annual_fee_revenue`, `annual_interest_revenue`)
* retention indicators (`closed_account`) 
* support interaction (`support_tickets_ytd`) 
* loan performance (`personal_loan_balance`, `loan_status`)

## Tools
- PostgreSQL
- Python (pandas, seaborn, matplotlib)

## Key Questions
1. Which customer segments create the most value?
2. Are customers who close their accounts meaningfully different from those who stay?
3. Where is personal-loan credit risk concentrated?
4. What should the business investigate next?

## Analysis
- **SQL Workflow:** Executed portfolio aggregations using conditional `FILTER` clauses to calculate segment revenue, account closure rates, product adoption, and loan risk ratios across customer segments and geographic regions.
- **Python Workflow:** Built a Pandas data pipeline to compute combined total revenue (`annual_fee_revenue + annual_interest_revenue`) and segment-level loan risk metrics. Generated dual-axis visualizations comparing total dollars at risk against percentage risk rates.

## Key Findings
- **Volume vs. Per-Customer Value:** Mass Market customers generate the highest total revenue ($36,733) due to volume (60% of the customer base), despite having the lowest average deposit balance and product count (~1.4). Conversely, Affluent customers yield the highest per-customer revenue ($491) and product engagement (~3.0 products), but represent only 12% of the total customer base ($17,184 total revenue).
- **Retention & Friction Indicators:** Closed accounts do not differ meaningfully in revenue per customer ($256 for closed vs. $270 for active), indicating churn is not concentrated solely in low-value accounts. However, closed accounts average nearly double the YTD support tickets of active accounts (1.0 vs. 0.5 per customer), highlighting service friction as a potential churn factor.
- **Credit Exposure vs. Risk Rate:** Total credit exposure and underlying risk rate are distinct. Mass Market holds the largest dollar amount at risk ($198,031) due to segment size, but Emerging Affluent exhibits a higher risk rate (20.00% vs. 18.18%). Geographically, the South region presents the highest overall exposure ($115,545 at risk) and highest risk rate (32.00%).

## Business Recommendations
- **Target Cross-Selling in Emerging Affluent:** Capitalize on Emerging Affluent engagement to deepen product relationship depth while actively monitoring credit performance.
- **Investigate Support Tickets:** Investigate whether recurring support issues are associated with elevated closure risk.
- **Investigate Southern Credit Performance:** Review borrower characteristics, underwriting outcomes, loan mix, and collections performance to determine why the South exhibits elevated credit risk.

## Limitations
- **Observational Data:** The dataset contains historical correlations; it cannot prove causal drivers for account closures or borrower defaults.
- **Static Snapshot:** The data reflects a single observation period and lacks longitudinal tracking to measure individual customer lifetime value (LTV) growth over time.



> Note: This is a fictional financial-services case study created for portfolio practice.
