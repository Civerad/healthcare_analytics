# Healthcare Data Case Study

## Project Overview
This project demonstrates how healthcare organizations can leverage patient admissions data to drive operational, financial, and clinical insights. Using a combination of data modeling (dbt), SQL (BigQuery), and dashboard visualizations (Looker), I analyzed patient flows, hospital performance, billing, physician activity, and medication usage.

## Objective
The goal of this case study is to showcase how I approach real-world business analysis problems: identifying key metrics, cleaning and modeling data, and creating dashboards that answer actionable business questions for stakeholders such as hospital administrators, finance teams, physicians, and pharmacy managers.

## Scope & Impact
Through this project, I explore questions such as:
- Which hospitals have the longest average patient stays, and which conditions drive admissions?
- How do billing amounts vary by insurance provider and admission type?
- Which doctors see the most patients, and how does their performance compare in terms of length of stay and prescribing patterns?
- What are the most frequently used medications, and how do they impact costs and outcomes?

## Skills & Tools Highlighted
- **Data Modeling & Transformation:** dbt for staging and transforming healthcare data.
- **Data Analysis:** SQL to calculate key metrics, identify trends, and handle data quality issues.
- **Data Visualization:** Looker dashboards to present insights in a business-readable format.
- **Business Insights:** Translating complex datasets into actionable recommendations for hospital operations, finance, and clinical decision-making.

This case study demonstrates the ability to combine **technical skills with business thinking**, making data meaningful and actionable in a healthcare context.

## Data Sources & Structure

The project uses healthcare admissions data enriched with dimension tables to provide a complete view of patients, doctors, hospitals, insurance providers, and medications.  

**Fact Table – Admissions (`fct_admissions`)**
| Column | Description |
|--------|-------------|
| patient_id | Unique identifier for each patient |
| doctor_id | Unique identifier for each doctor |
| hospital_id | Unique identifier for each hospital |
| insurance_id | Unique identifier for each insurance provider |
| medication_id | Unique identifier for each medication |
| admission_type | Type of admission (Emergency, Elective, Urgent) |
| medical_condition | Medical condition (Obesity, Cancer, Arthritis, Asthma, Diabetes, Hypertension) |
| date_of_admission | Admission date |
| discharge_date | Discharge date |
| length_of_stay | Derived: discharge_date - date_of_admission |
| test_results | Outcome of medical tests (Normal, Abnormal, Inconclusive) |
| billing_amount | Amount billed for the admission |

**Dimension Tables**
- `dim_patient` – Patient demographics: full name, gender, blood type, age group.
- `dim_doctors` – Doctor details: full name, specialty, affiliated hospital.
- `dim_hospitals` – Hospital details: name, location, capacity (if available).
- `dim_insurance` – Insurance provider names and coverage info.
- `dim_medication` – Medication names and categories.

**Data Cleaning & Transformations**
- Cleaned missing and abnormal values.
- Created **unique patient IDs** using a hash of name, gender, and blood type.
- Standardized categorical fields (gender, admission type, medication names).
- Derived **length of stay** from admission and discharge dates.
- Flagged negative billing amounts as potential errors.
- Ensured consistent joins between fact and dimension tables for analysis.

---

## dbt Models

The project uses **dbt** to model, transform, and test the data.  
Key models include:

- **Staging Models (`stg_health_analytics`)**  
  Cleaned and standardized raw source data with proper column types and naming conventions.

- **Dimension Models**  
  - `dim_patient` – Unique patients with demographics.  
  - `dim_doctors` – Unique doctors and their affiliations.  
  - `dim_hospitals` – Unique hospitals.  
  - `dim_insurance` – Unique insurance providers.  
  - `dim_medication` – Unique medications.

- **Fact Model (`fct_admissions`)**  
  Combines all dimensions with admissions data, calculating metrics like length of stay and linking IDs for analytics.

**Testing with dbt**
- Ensured **uniqueness** and **non-null constraints** for primary keys (`patient_id`, `doctor_id`, etc.).
- Validated categorical values (gender, blood type, admission type, test results).
- Flagged negative or out-of-range billing amounts.

---

## Looker Dashboards & Insights

The dashboards were created directly in Looker using the `fct_admissions` fact table and all dimensions. Key dashboards include:

### Hospital Operations
- Avg. length of stay by hospital.
- Top 5 medical conditions driving admissions.
- Bed utilization by long-stay patients.

### Financial / Revenue Cycle
- Billing amounts by insurance provider.
- Revenue per admission type.
- Analysis of negative billing amounts and potential errors.

### Physician / Clinical Performance
- Patients treated per doctor per month.
- Average length of stay per doctor.
- Medications prescribed by doctor and associated costs.

### Patient Insights
- Distribution of patients by gender and age.
- Readmission frequency and patterns.
- Demographics correlated with length of stay.

### Pharmacy / Medication Management
- Most commonly prescribed medications.
- Medications with highest billing impact.
- Correlation of medication usage with patient outcomes.

**Example Insights**
- Hospital A has the longest average length of stay (9.3 days vs 6.1 average).  
- Doctor B discharges patients 40% faster than peers.  
- Certain medications are associated with higher billing but no reduced stay, highlighting potential areas for cost optimization.  

---

## How to Use
- Explore dashboards in Looker to filter by hospital, doctor, insurance provider, or medication.  
- Use dbt models to replicate the transformations and metrics in your own warehouse.  
- Reference SQL queries in `/sql_queries` folder for detailed metric calculations.

---

## Tools & Skills Demonstrated
- SQL (data transformation and analysis)
- dbt (data modeling, testing, staging)
- Looker (dashboarding and visualization)
- Business analysis (deriving actionable insights from healthcare data)
- Data cleaning and quality validation
