SELECT 
    INITCAP(Name) AS name,
    Age AS age,
    Gender AS gender,
    `Blood Type` AS blood_type,
    `Medical Condition` AS medical_condition,
    `Date of Admission` AS date_of_admission,
    Doctor AS doctor,
    Hospital AS hospital,
    `Insurance Provider` AS insurance_provider,
    ROUND(SAFE_CAST(`Billing Amount` AS FLOAT64)) AS billing_amount,
    `Room Number` AS room_number,
    `Admission Type` AS admission_type,
    `Discharge Date` AS discharge_date,
    Medication AS medication,
    `Test results` AS test_results
FROM {{ source('health_data', 'raw_healthcare_analytics') }}
