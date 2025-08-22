WITH stg_ha as (

select * 
from {{ref("stg_health_analytics") }}
)

select
    MD5(CONCAT(Name, CAST(age AS STRING))) AS patient_id,
    name AS patient_full_name,
    SPLIT(INITCAP(Name), ' ')[SAFE_OFFSET(0)] AS patient_first_name,
    SPLIT(INITCAP(Name), ' ')[SAFE_OFFSET(1)] AS patient_last_name,
    age,
    gender,
    blood_type,
    medical_condition,
    


from stg_ha