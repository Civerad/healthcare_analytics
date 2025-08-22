WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select
    DISTINCT
    MD5(insurance_provider) as insurance_id,
    insurance_provider
     


from stg_ha