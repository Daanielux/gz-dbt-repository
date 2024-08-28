SELECT
  orm.orders_id
  ,orm.date_date
  ,ROUND(orm.margin + shi.shipping_fee - (shi.logcost + cast (shi.ship_cost AS FLOAT64)),2) AS operational_margin 
  ,orm.quantity
  ,orm.revenue
  ,orm.purchase_cost
  ,orm.margin
  ,shi.shipping_fee
  ,shi.logcost
  ,shi.ship_cost
FROM {{ref("int_orders_margin")}} orm
LEFT JOIN {{ref("stg_gz_raw_data__ship")}} shi 
  USING(orders_id)
ORDER BY orders_id desc