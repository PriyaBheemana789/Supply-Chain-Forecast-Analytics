DROP TABLE IF EXISTS fact_act_est;

CREATE TABLE fact_act_est
(
    SELECT
        s.date AS date,
        s.fiscal_year AS fiscal_year,
        s.product_code AS product_code,
        s.customer_code AS customer_code,
        s.sold_quantity AS sold_quantity,
        f.forecast_quantity AS forecast_quantity
    FROM fact_sales_monthly s
    LEFT JOIN fact_forecast_monthly f
    USING (date, customer_code, product_code)
)
UNION
(
    SELECT
        f.date AS date,
          f.fiscal_year AS fiscal_year,
        f.product_code AS product_code,
        f.customer_code AS customer_code,
        s.sold_quantity AS sold_quantity,
        f.forecast_quantity AS forecast_quantity
    FROM fact_forecast_monthly f
    LEFT JOIN fact_sales_monthly s
    USING (date, customer_code, product_code)
);

UPDATE fact_act_est
SET sold_quantity = 0
WHERE sold_quantity IS NULL;