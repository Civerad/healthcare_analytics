WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select
    DISTINCT
    MD5(hospital) as hospital_id,
    hospital AS hospital_name
     


from stg_ha