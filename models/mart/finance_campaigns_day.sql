SELECT
  campa.date_date
  ,ROUND((fino.operational_margin-campa.ads_cost),2) AS ads_margin 
  ,fino.average_basket
  ,fino.operational_margin
  ,campa.ads_cost
  ,campa.impression
  ,campa.click
FROM {{ref("int_campaigns_day")}} AS campa
LEFT JOIN {{ref("finance_days")}} fino 
  USING(date_date)
ORDER BY date_date desc