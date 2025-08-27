SELECT
    p.patient_id,
    patient_full_name,
    d.doctor_id,
    doctor_full_name,
    h.hospital_id,
    h.hospital_name,
    i.insurance_id,
    i.insurance_provider,
    m.medication_id,
    m.medication,
    s.admission_type,
    s.date_of_admission,
    s.discharge_date,
    DATE_DIFF(s.discharge_date, s.date_of_admission, DAY) AS length_of_stay,
    s.test_results,
    s.billing_amount
FROM {{ ref('stg_health_analytics') }} s
LEFT JOIN {{ ref('dim_patient') }} p
  ON s.name = p.patient_full_name
  AND s.gender = p.gender
  AND s.blood_type = p.blood_type
LEFT JOIN {{ ref('dim_doctors') }} d
  ON s.doctor = d.doctor_full_name
  AND s.hospital = d.hospital
LEFT JOIN {{ ref('dim_hospitals') }} h
  ON s.hospital = h.hospital_name
LEFT JOIN {{ ref('dim_insurance') }} i
  ON s.insurance_provider = i.insurance_provider
LEFT JOIN {{ ref('dim_medication') }} m
  ON s.medication = m.medication
ORDER BY doctor_full_name
