with 

source as (

    select * from {{ source('gz_raw_data', 'sales') }}

),

renamed as (

    select
        date_date,
        orders_id,
        pdt_id AS products_id,
        revenue,
        quantity

    from source

)

select date_date, concat(orders_id,'-',products_id) AS clave, orders_id, products_id, revenue, quantity from renamed
