with 

source as (

    select * from {{ source('gz_raw_data', 'facebook') }}

),

renamed as (

    select
        date_date,
        paid_source,
        campaign_key,
        campgn_name AS campaign_name,
        cast (ads_cost AS float64) AS ads_cost,
        impression,
        click

    from source

)

select date_date, paid_source, campaign_key, campaign_name, ads_cost, impression, click from renamed
