WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select
    DISTINCT
    MD5(medication) as medication_id,
    medication
     


from stg_ha