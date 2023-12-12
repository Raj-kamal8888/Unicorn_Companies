use  Unicorn_data;

--Retrieve a list of all unicorn companies:
SELECT * FROM unicorn_companies;

--Filter unicorn companies based on specific criteria:
SELECT * FROM unicorn_companies 
WHERE valuation > 10000000000 AND industry LIKE '%FinTech%';

--Calculate aggregate statistics:
SELECT COUNT(*) AS total_unicorns, AVG(valuation) AS avg_valuation
FROM unicorn_companies;

--Identify the top unicorn companies by valuation:
SELECT * FROM unicorn_companies 
ORDER BY valuation DESC LIMIT 10;

--Analyze funding rounds for unicorn companies:
SELECT uc.company_name, fr.round_name, fr.amount_raised
FROM unicorn_companies uc
INNER JOIN funding_rounds fr ON uc.company_id = fr.company_id;

--Investigate the relationship between valuation and founding year:
SELECT founding_year, AVG(valuation) AS avg_valuation
FROM unicorn_companies
GROUP BY founding_year;

--Identify potential future unicorns based on specific characteristics:
SELECT * FROM unicorn_companies
WHERE industry LIKE '%AI%' AND valuation > 500000000
AND employee_count > 100;

--Identify the most active investors in unicorn companies:
SELECT investor_name, COUNT(*) AS total_investments
FROM funding_rounds fr
INNER JOIN investors i ON fr.investor_id = i.investor_id
GROUP BY investor_name
ORDER BY total_investments DESC
LIMIT 10;

--Analyze the geographic distribution of unicorns:
SELECT country, COUNT(*) AS total_unicorns
FROM unicorn_companies
GROUP BY country
ORDER BY total_unicorns DESC;

-- Investigate the relationship between industry and valuation:
SELECT industry, AVG(valuation) AS avg_valuation
FROM unicorn_companies
GROUP BY industry
ORDER BY avg_valuation DESC;

--Calculate the average time it takes for a unicorn to reach a certain valuation:
SELECT AVG( DATEDIFF(funding_date, founding_date) ) AS avg_time
FROM unicorn_companies
WHERE valuation > 10000000000;

--Compare the characteristics of unicorns across different regions:
SELECT region, COUNT(*) AS total_unicorns, AVG(valuation) AS avg_valuation
FROM unicorn_companies
GROUP BY region
ORDER BY total_unicorns DESC;

--Predict future unicorn emergence using machine learning models:
SELECT company_name, predicted_valuation, predicted_unicorn_status
FROM prediction_model_results
WHERE predicted_unicorn_status = 1;
