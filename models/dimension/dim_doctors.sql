WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select
    DISTINCT MD5(CONCAT(doctor, CAST(hospital AS STRING))) AS doctor_id,
    doctor AS doctor_full_name,
    SPLIT(INITCAP(doctor), ' ')[SAFE_OFFSET(0)] AS doctor_first_name,
    SPLIT(INITCAP(doctor), ' ')[SAFE_OFFSET(1)] AS doctor_last_name,
    hospital,
     


from stg_ha