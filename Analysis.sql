-- Meridian Financial Group
-- Week 5: Consumer Banking + Credit Risk Portfolio Project
-- Analyst: Nicole
-- Date: September 2, 2026

-- Task 1: Customer value by segment
-- Return customer_segment, unique customers, total deposit balance,
-- total annual revenue (fee + interest), and average annual revenue per customer.
SELECT customer_segment, 
	COUNT(DISTINCT customer_id) AS unique_customers,
	SUM(deposit_balance) AS total_deposit,
	(SUM(annual_fee_revenue) + SUM(annual_interest_revenue)) AS total_annual_revenue,
	ROUND(((SUM(annual_fee_revenue) + SUM(annual_interest_revenue))/ COUNT(DISTINCT customer_id)),2) AS avg_annual_revenue
FROM customer_value_risk
GROUP BY customer_segment;

-- Task 2: Relationship depth
-- Compare average product_count and average deposit_balance
-- for customers who stayed versus customers who closed.
SELECT closed_account, COUNT(customer_id) AS customer_count,
	ROUND(AVG(product_count),2) AS avg_product_count,
	ROUND(AVG(deposit_balance),2) AS avg_deposit_balance,
	ROUND(AVG((annual_fee_revenue + annual_interest_revenue)),2) AS annual_revenue,
	ROUND(AVG(monthly_transactions),2) AS avg_monthly_transactions
FROM customer_value_risk
GROUP BY closed_account;

-- Task 3: Credit-risk exposure
-- By customer_segment, return:
-- number of customers with a personal loan,
-- number of 30+ delinquent or charged off,
-- risk rate among loan customers,
-- total personal loan balance at risk.
SELECT customer_segment, 
	COUNT(DISTINCT customer_id) FILTER(WHERE personal_loan_balance > 0) AS personal_loan_count,
	COUNT(DISTINCT customer_id) FILTER(WHERE loan_status IN ('30+ Delinquent', 'Charged Off')) AS at_risk_loan_count,
	ROUND(100.0 * COUNT(DISTINCT customer_id) FILTER (WHERE loan_status IN ('30+ Delinquent', 'Charged Off'))
        / NULLIF(COUNT(DISTINCT customer_id) FILTER (WHERE personal_loan_balance > 0), 0),2) AS risk_rate_pct,
	SUM(personal_loan_balance) AS total_personal_loan_balance,
	SUM(personal_loan_balance) FILTER(WHERE loan_status IN ('30+ Delinquent', 'Charged Off')) AS total_personal_at_risk_balance
	
FROM customer_value_risk
GROUP BY customer_segment;

-- Task 4: Management view
-- By region, return:
-- total customers, closed customers, closure rate,
-- total annual revenue, and total deposit balance.
SELECT region,
	COUNT(DISTINCT customer_id) AS total_customers,
	COUNT(customer_id) FILTER(WHERE closed_account = '1') AS closed_customers,
	ROUND(COUNT(customer_id) FILTER(WHERE closed_account = '1')*100.0/COUNT(DISTINCT customer_id),2) AS closure_rate,
	(SUM(annual_fee_revenue) + SUM(annual_interest_revenue)) AS total_annual_revenue,
	SUM(deposit_balance) AS total_deposit_balance
	
FROM customer_value_risk
GROUP BY region;