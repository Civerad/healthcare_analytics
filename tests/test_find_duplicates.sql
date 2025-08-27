SELECT
    name,
    age,
    date_of_admission,
    medical_condition,
    billing_amount,
    COUNT(*) AS duplicate_count
FROM {{ ref('stg_health_analytics') }}
GROUP BY 
    name,
    age,
    date_of_admission,
    medical_condition,
    billing_amount
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC