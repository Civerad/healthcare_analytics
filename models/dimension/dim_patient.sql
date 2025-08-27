WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select DISTINCT
    MD5(CONCAT(name, CAST(gender AS STRING), CAST(blood_type AS STRING))) AS patient_id,
    name AS patient_full_name,
    SPLIT(INITCAP(name), ' ')[SAFE_OFFSET(0)] AS patient_first_name,
    SPLIT(INITCAP(name), ' ')[SAFE_OFFSET(1)] AS patient_last_name,
    gender,
    blood_type


from stg_ha
ORDER BY patient_full_name