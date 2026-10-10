
-- Financial Performance Analysis of 10 Technology Companies
-- Period: FY2021-FY2025
-- Dataset: financial_data

-- Query 1: Total revenue by company
SELECT company, ROUND(SUM(revenue), 2) AS total_revenue
FROM financial_data
GROUP BY company
ORDER BY total_revenue DESC;

-- Query 2: Average net profit margin by company
SELECT company, ROUND(AVG(net_profit_margin_pct), 2) AS avg_net_profit_margin_pct
FROM financial_data
GROUP BY company
ORDER BY avg_net_profit_margin_pct DESC;

-- Query 3: Highest Return on Assets (ROA) observation
SELECT company, ticker, fiscal_year, ROUND(roa_pct, 2) AS roa_pct
FROM financial_data
ORDER BY roa_pct DESC
LIMIT 1;

-- Query 4: Year-over-year revenue growth using LAG()
SELECT
    company,
    fiscal_year,
    revenue,
    LAG(revenue) OVER (
        PARTITION BY company ORDER BY fiscal_year
    ) AS previous_year_revenue,
    revenue_growth_pct
FROM financial_data
ORDER BY company, fiscal_year;

-- Query 5: Observations with net profit margin above 30%
SELECT company, fiscal_year, net_profit_margin_pct
FROM financial_data
WHERE net_profit_margin_pct > 30
ORDER BY net_profit_margin_pct DESC;

-- Query 6: Strong profitability and asset returns
SELECT
    company,
    fiscal_year,
    net_profit_margin_pct,
    roa_pct,
    liability_to_asset_pct
FROM financial_data
WHERE net_profit_margin_pct > 25
  AND roa_pct > 20
ORDER BY roa_pct DESC;
