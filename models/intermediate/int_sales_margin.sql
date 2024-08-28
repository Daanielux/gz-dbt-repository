SELECT 
    products_id, date_date, orders_id,revenue, quantity, 
    ROUND(sale.quantity*CAST(prod.purchase_price AS FLOAT64),2) AS purchase_cost,
    round(sale.revenue - (sale.quantity*CAST(prod.purchase_price AS FLOAT64)),2) AS margin
FROM {{ ref('stg_gz_raw_data__sales') }} AS sale
LEFT JOIN {{ ref('stg_gz_raw_data__product') }} AS prod 
    USING (products_id)