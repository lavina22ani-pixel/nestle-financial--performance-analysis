use nestle_analytics;
show tables;
describe nestle_financials;
select count(*)from nestle_financials;
select * from nestle_financials limit 10;
select financial_year, count(*) as total_records from nestle_financials 
group by financial_year;
select statement_type , count(*) as total_records from nestle_financials
 group by statement_type ;
delete from nestle_financials;
select statement_type , count(*) as total_records from nestle_financials 
group by statement_type;
select financial_year , count(*) as total_records from nestle_financials 
group by financial_year;
select particulars, financial_year, statement_type, count(*) as duplicate_count
 from nestle_financials
 group by particulars , financial_year , statement_type
 having count(*) > 1 ;
select * from nestle_financials where (particulars, financial_year,statement_type ) in (
select particulars,financial_year,statement_type
from(
select particulars,financial_year,statement_type
from nestle_financials group by particulars, financial_year,statement_type
having count(*)>1)as duplicates
)
order by particulars , financial_year;
select case when id between 1 and 66 then "first import" when id between 67 and 132 then "second import" end as import_batch,count(*) as total_records from nestle_financials group by import_batch;
delete from nestle_financials where id between 1 and 66;
select count(*)from nestle_financials;
select particulars,financial_year,statement_type
from nestle_financials where statement_type = "income statement" and lower(particulars) like "%revenue%" order by financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%revenue%" 
 or lower(particulars) like
 "%sales%"
 )
order by particulars, financial_year;
select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%expense%" 
 or lower(particulars) like
 "%cost%"
 )
 order by particulars, financial_year;
 select particulars,
financial_year,
amount from nestle_financials 
where statement_type  = "income statement" and ( lower(particulars) like
 "%profit%" 
 or lower(particulars) like
 "%loss%"
 )
 order by particulars, financial_year;
 select
 a.particulars,
 a.amount as fy2025,
 b.amount as fy2026,
 round(
 ((b.amount - 
 a.amount)/
 nullif(abs(a.amount),0)) *
 100,
 2
 )as growth_percentage from nestle_financials a 
 join nestle_financials on a.particulars=
 b.particulars 
 and a .statement_type=
 b.statemet_type
 where a.financial_year="fy2025"
 and b. financial_year="fy2026"
 and lower(a.statement_type)="income statement";
 select count(*) as total_rows , min(id) as frist_id, max(id) as last_id from nestle_financials;
 describe nestle_financials;
 select distinct financial_year from nestle_financials;
 select financial_year ,particulars , amount from nestle_financials where particulars = "revenue from operations" order by financial_year;
 select statement_type, financial_year, count(*)as total_records from nestle_financials group by statement_type, finanal_year, statement_type;
WITH revenue AS (
    SELECT
        Financial_Year,
        SUM(Amount) AS Revenue
    FROM nestle_financials
    WHERE Particulars = 'Revenue from Operations'
    GROUP BY Financial_Year
),
comparison AS (
    SELECT
        Financial_Year,
        Revenue,
        LAG(Revenue) OVER (ORDER BY Financial_Year) AS Previous_Revenue
    FROM revenue
)
SELECT
    Financial_Year,
    Revenue,
    Previous_Revenue,
    ROUND(
        (Revenue - Previous_Revenue)
        / NULLIF(Previous_Revenue, 0) * 100, 2
    ) AS YoY_Growth_Percentage
FROM comparison;
SELECT
    Financial_Year,
    Particulars,
    Amount
FROM nestle_financials
WHERE LOWER(Particulars) LIKE '%profit%'
   OR LOWER(Particulars) LIKE '%loss%'
ORDER BY Financial_Year;
SELECT
    Financial_Year,
    Particulars,
    Amount
FROM nestle_financials
WHERE LOWER(Particulars) LIKE '%expense%'
   OR LOWER(Particulars) LIKE '%cost%'
ORDER BY Financial_Year, Amount DESC;
SELECT
    Financial_Year,
    SUM(Amount) AS Total_Expenses
FROM nestle_financials
WHERE Statement_Type = 'Profit and Loss'
  AND LOWER(Particulars) LIKE '%expense%'
GROUP BY Financial_Year;
SELECT DISTINCT Statement_Type
FROM nestle_financials;
SELECT DISTINCT Particulars
FROM nestle_financials
WHERE Statement_Type = 'Profit and Loss';
select distinct particulars from nestle_financials ;
select 
*from nestle_financials order by financial_year;
SELECT COUNT(*)
FROM nestle_financials
WHERE statement_type = 'income statement';
SELECT financial_year, particulars, amount
FROM nestle_financials
WHERE particulars LIKE '%expense%'
ORDER BY financial_year, amount DESC;
SELECT financial_year, particulars, amount
FROM nestle_financials
WHERE particulars LIKE '%Profit%'
ORDER BY financial_year;
SELECT financial_year, SUM(amount) AS total_revenue
FROM nestle_financials
WHERE particulars LIKE '%Revenue%'
GROUP BY financial_year;
SELECT financial_year, particulars, amount
FROM nestle_financials
WHERE particulars LIKE '%Profit for the year%';
SELECT financial_year, amount
FROM nestle_financials
WHERE particulars LIKE '%earnings per share%';
SELECT
    financial_year,
    AVG(amount) AS average_amount
FROM nestle_financials
GROUP BY financial_year;
SELECT
    financial_year,
    particulars,
    amount
FROM nestle_financials
ORDER BY amount DESC
LIMIT 1;
SELECT
    financial_year,
    particulars,
    amount
FROM nestle_financials
WHERE amount < 0;
SELECT
    particulars,
    amount,
    CASE
        WHEN amount > 0 THEN 'Positive'
        WHEN amount < 0 THEN 'Negative'
        ELSE 'Zero'
    END AS Amount_Status
FROM nestle_financials;
SELECT particulars, amount
FROM nestle_financials
WHERE amount > (
    SELECT AVG(amount)
    FROM nestle_financials
);
SELECT
    financial_year,
    particulars,
    amount,
    DENSE_RANK() OVER (
        PARTITION BY financial_year
        ORDER BY amount DESC
    ) AS Financial_Rank
FROM nestle_financials;
SELECT COUNT(*) AS total_records
FROM nestle_financials;
SELECT financial_year, COUNT(*) AS records
FROM nestle_financials
GROUP BY financial_year;
SELECT
    SUM(particulars IS NULL) AS missing_particulars,
    SUM(financial_year IS NULL) AS missing_years,
    SUM(amount IS NULL) AS missing_amounts
FROM nestle_financials; 
select *from nestle_financials;
use nestle_analytics ;
