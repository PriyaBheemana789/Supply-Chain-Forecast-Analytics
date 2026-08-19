WITH forecast_err_table AS
(
    SELECT
        s.customer_code,
        c.customer AS customer_name,
        c.market,

        SUM(s.sold_quantity) AS total_sold_qty,
        SUM(s.forecast_quantity) AS total_forecast_qty,

        SUM(
            CAST(s.forecast_quantity AS SIGNED)
            - CAST(s.sold_quantity AS SIGNED)
        ) AS net_error,

        ROUND(
            SUM(
                CAST(s.forecast_quantity AS SIGNED)
                - CAST(s.sold_quantity AS SIGNED)
            ) * 100.0
            / NULLIF(SUM(s.forecast_quantity), 0),
            1
        ) AS net_error_pct,

        SUM(
            ABS(
                CAST(s.forecast_quantity AS SIGNED)
                - CAST(s.sold_quantity AS SIGNED)
            )
        ) AS abs_error,

        ROUND(
            SUM(
                ABS(
                    CAST(s.forecast_quantity AS SIGNED)
                    - CAST(s.sold_quantity AS SIGNED)
                )
            ) * 100.0
            / NULLIF(SUM(s.forecast_quantity), 0),
            2
        ) AS abs_error_pct

    FROM fact_act_est s

    JOIN dim_customer c
        ON s.customer_code = c.customer_code

    WHERE s.fiscal_year = 2021

    GROUP BY
        s.customer_code,
        c.customer,
        c.market
)

SELECT
    *,
    IF(
        abs_error_pct > 100,
        0,
        100.0 - abs_error_pct
    ) AS forecast_accuracy

FROM forecast_err_table

ORDER BY forecast_accuracy DESC;