SELECT DISTINCT
    initcap(name) as name,
    age as age,
    gender as gender,
    `Blood Type` as blood_type,
    `Medical Condition` as medical_condition,
    `Date of Admission` as date_of_admission,
    doctor as doctor,
    hospital as hospital,
    `Insurance Provider` as insurance_provider,
    round(safe_cast(`Billing Amount` as float64)) as billing_amount,
    `Room Number` as room_number,
    `Admission Type` as admission_type,
    `Discharge Date` as discharge_date,
    medication as medication,
    `Test results` as test_results
FROM {{ source("health_data", "raw_healthcare_analytics") }}
