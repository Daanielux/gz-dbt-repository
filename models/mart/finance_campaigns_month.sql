SELECT 
    DATE_TRUNC(date_date, MONTH) AS mes, 
    SUM(ads_margin) AS ads_margin,
    round(SUM(average_basket),1) AS average_basket,
    SUM(operational_margin) AS operational_margin,
    SUM(ads_cost) AS ads_cost,
    SUM(impression) AS impression,
    SUM(click) AS click
FROM {{ref("finance_campaigns_day")}}
GROUP BY 
    mes
ORDER BY 
    mes DESC