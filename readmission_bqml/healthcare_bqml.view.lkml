view: healthcare_bqml_input {
  derived_table: {
    sql: SELECT *,
            (CASE WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) <= 7 THEN TRUE
            WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) > 7 THEN FALSE
            ELSE NULL
            END) as readmission_within_7
          FROM `looker-private-demo.healthcare_demo_live.bqml_input`
          WHERE EXTRACT(YEAR FROM discharge_date) > 2018 and EXTRACT(YEAR FROM discharge_date) <= 2020) ;;
  }
}

view: healthcare_bqml_fit {
  derived_table: {
    sql:CREATE OR REPLACE MODEL
  `       healthcare_demo_live.automl_classifier` OPTIONS(model_type='AUTOML_CLASSIFIER',
                                            INPUT_LABEL_COLS =  ["readmission_within_7"],
                                            DATA_SPLIT_COL = "discharge_date"
              ) AS
              SELECT * FROM ${healthcare_bqml_input.SQL_TABLE_NAME};;
  }
}

view: healthcare_bqml_predict {
  derived_table: {
    persist_for: "48 hours"
    sql:SELECT * FROM ML.PREDICT(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`,
                (
                  with CTE as (
                  SELECT *,
                  (CASE WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) <= 7 THEN TRUE
                      WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) > 7 THEN FALSE
                      ELSE NULL
                      END) as readmission_within_7
                  FROM `looker-private-demo.healthcare_demo_live.bqml_input`
                  WHERE EXTRACT(YEAR FROM discharge_date) > 2020)
                  SELECT * FROM CTE
                  WHERE readmission_within_7 IS NOT NULL
                    ));;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: predicted_readmission_within_7 {
    type: yesno
    sql: ${TABLE}.predicted_readmission_within_7 ;;
  }

  dimension: predicted_readmission_within_7_probs {
    type: string
    sql: ${TABLE}.predicted_readmission_within_7_probs ;;
  }

  dimension: patient_admission {
    primary_key: yes
    type: string
    sql: CONCAT(${patient_gender}, ${admission_date}) ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
    action: {
      label: "New Patient"
      url: "https://us-central1-sandbox-trials.cloudfunctions.net/healthcare_bqml_action"
      param: {
        name: "patient_id"
        value: "{{ value }}"
      }
      form_param: {
        name: "First Name"
        label: "First Name"
        type: string
      }
      form_param: {
        name: "Last Name"
        label: "Last Name"
        type: string
      }
      form_param: {
        name: "Gender"
        label: "Gender"
        type: select
        option: {
          name: "male"
          label: "Male"
        }
        option: {
          name: "female"
          label: "Female"
        }
      }
      form_param: {
        name: "Age Tier"
        label: "Age Tier"
        type: select
        option: {
          name: "0 to 17"
          label: "0 to 17"
        }
        option: {
          name: "18 to 24"
          label: "18 to 24"
        }
        option: {
          name: "25 to 39"
          label: "25 to 39"
        }
        option: {
          name: "40 to 54"
          label: "40 to 54"
        }
        option: {
          name: "55 to 64"
          label: "55 to 64"
        }
        option: {
          name: "65 or Above"
          label: "65 or Above"
        }
      }
      form_param: {
        name: "Race"
        label: "Race"
        type: select
        option: {
          name: "American Indian or Alaska Native"
          label: "American Indian or Alaska Native"
        }
        option: {
          name: "Asian"
          label: "Asian"
        }
        option: {
          name: "Black or African American"
          label: "Black or African American"
        }
        option: {
          name: "Other"
          label: "Other"
        }
        option: {
          name: "White"
          label: "White"
        }
      }
      form_param: {
        name: "City"
        label: "City"
        type: string
      }
      form_param: {
        name: "Country"
        label: "Country"
        type: string
      }


      form_param: {
        name: "Wellness Screened in the Past Year"
        label: "Wellness Screened in the Past Year"
        type: select
        option: {
          name: "yes"
          label: "Yes"
        }
        option: {
          name: "no"
          label: "No"
        }
      }

      form_param: {
        name: "Encounter Type"
        label: "Encounter Type"
        type: select
        option: {
          name: "Encounter for symptom"
          label: "Encounter for symptom"
        }
        option: {
          name: "Emergency Encounter"
          label: "Emergency Encounter"
        }
        option: {
          name: "Encounter for problem"
          label: "Encounter for problem"
        }
        option: {
          name: "Death Certification"
          label: "Death Certification"
        }
        option: {
          name: "Follow-up encounter"
          label: "Follow-up encounter"
        }
        option: {
          name: "Emergency Room Admission"
          label: "Emergency Room Admission"
        }
        option: {
          name: "Outpatient procedure"
          label: "Outpatient procedure"
        }
        option: {
          name: "Asthma follow-up"
          label: "Asthma follow-up"
        }
      }
      form_param: {
        name: "Procedure Type"
        label: "Procedure Type"
        type: select
        option: {
          name: "exam"
          label: "Exam"
        }
        option: {
          name: "laboratory"
          label: "Laboratory"
        }
        option: {
          name: "vital-signs"
          label: "Vital-Signs"
        }
        option: {
          name: "survey"
          label: "Survey"
        }
        option: {
          name: "imaging"
          label: "Imaging"
        }
        option: {
          name: "therapy"
          label: "Therapy"
        }
      }
      form_param: {
        name: "Practictioner Examiner"
        label: "Practictioner Examiner (First and Last Name)"
        type: string
      }

      form_param: {
        name: "Length of Stay"
        label: "Length of Stay (Minutes)"
        type: string
      }
      form_param: {
        name: "Admission Date"
        label: "Admission Date (YYYY-MM-DD)"
        type: string
      }
      form_param: {
        name: "Discharge Date"
        label: "Discharge Date (YYYY-MM-DD)"
        type: string
      }
      form_param: {
        name: "Last Discharge Date"
        label: "Last Discharge Date (YYYY-MM-DD)"
        type: string
      }
    }
  }


  dimension: patient_name {
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: patient_age_tier__sort_ {
    type: string
    sql: ${TABLE}.patient_age_tier__sort_ ;;
  }

  dimension: patient_age_tier {
    type: string
    sql: ${TABLE}.patient_age_tier ;;
  }

  dimension: patient_us_core_ethnicity {
    type: string
    sql: ${TABLE}.patient_us_core_ethnicity ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: patient_us_core_race {
    type: string
    sql: ${TABLE}.patient_us_core_race ;;
  }

  dimension: patient_is_wellness_screened_in_the_past_year {
    type: string
    sql: ${TABLE}.patient_is_wellness_screened_in_the_past_year ;;
  }

  dimension: patient_birth_place__city {
    type: string
    sql: ${TABLE}.patient_birth_place__city ;;
  }

  dimension: patient_birth_place__state {
    type: string
    sql: ${TABLE}.patient_birth_place__state ;;
  }

  dimension: encounter_type_coding_display {
    type: string
    sql: ${TABLE}.encounter_type_coding_display ;;
  }

  dimension: observation__category__coding_display {
    type: string
    sql: ${TABLE}.observation__category__coding_display ;;
  }

  dimension: practitioner_investigator {
    type: string
    sql: ${TABLE}.practitioner_investigator ;;
  }

  dimension: encounter_length_of_stay {
    type: number
    sql: ${TABLE}.encounter_length_of_stay ;;
  }

  dimension: length_of_stay_tier {
    type: tier
    tiers: [0,60,120, 180, 240, 300, 720, 1440]
    style: integer
    sql: ${TABLE}.encounter_length_of_stay ;;
  }


  dimension: admission_date {
    type: date
    datatype: date
    sql: ${TABLE}.admission_date ;;
  }

  dimension: discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.discharge_date ;;
  }

  dimension: last_discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_discharge_date ;;
  }

  dimension: readmission_within_7 {
    type: yesno
    sql: ${TABLE}.readmission_within_7 ;;
  }

  dimension: prediction_accurate {
    type: yesno
    sql: ${predicted_readmission_within_7} = ${readmission_within_7} ;;
  }

  set: detail {
    fields: [
      predicted_readmission_within_7,
      predicted_readmission_within_7_probs,
      patient_id,
      patient_name,
      patient_age_tier__sort_,
      patient_age_tier,
      patient_us_core_ethnicity,
      patient_gender,
      patient_us_core_race,
      patient_is_wellness_screened_in_the_past_year,
      patient_birth_place__city,
      patient_birth_place__state,
      encounter_type_coding_display,
      observation__category__coding_display,
      practitioner_investigator,
      encounter_length_of_stay,
      admission_date,
      discharge_date,
      last_discharge_date,
      readmission_within_7
    ]
  }

}




view: healthcare_bqml_new_patients {
  sql_table_name: looker-private-demo.healthcare_demo_live.new_patient_visits ;;

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }
  dimension: patient_name {
    action: {
      label: "New Patient"
      url: "https://us-central1-sandbox-trials.cloudfunctions.net/healthcare_bqml_action"
      param: {
        name: "patient_id"
        value: "0fd0ae11-7a98-4b18-8246-b41fd3cbd38a"
      }
      form_param: {
        name: "First Name"
        label: "First Name"
        default: "Chong"
        type: string
      }
      form_param: {
        name: "Last Name"
        label: "Last Name"
        default: "Torp"
        type: string
      }
      form_param: {
        name: "Gender"
        label: "Gender"
        type: select
        option: {
          name: "male"
          label: "Male"
        }
        option: {
          name: "female"
          label: "Female"
        }
        default: "male"
      }
      form_param: {
        name: "Age Tier"
        label: "Age Tier"
        type: select
        option: {
          name: "0 to 17"
          label: "0 to 17"
        }
        option: {
          name: "18 to 24"
          label: "18 to 24"
        }
        option: {
          name: "25 to 39"
          label: "25 to 39"
        }
        option: {
          name: "40 to 54"
          label: "40 to 54"
        }
        option: {
          name: "55 to 64"
          label: "55 to 64"
        }
        option: {
          name: "65 or Above"
          label: "65 or Above"
        }
        default: "65 or Above"
      }
      form_param: {
        name: "Race"
        label: "Race"
        type: select
        option: {
          name: "American Indian or Alaska Native"
          label: "American Indian or Alaska Native"
        }
        option: {
          name: "Asian"
          label: "Asian"
        }
        option: {
          name: "Black or African American"
          label: "Black or African American"
        }
        option: {
          name: "Other"
          label: "Other"
        }
        option: {
          name: "White"
          label: "White"
        }
        default: "White"
      }
      form_param: {
        name: "City"
        label: "City"
        default: "Beverly"
        type: string
      }
      form_param: {
        name: "State"
        label: "State"
        default: "Massachusetts"
        type: string
      }
      form_param: {
        name: "Wellness Screened in the Past Year"
        label: "Wellness Screened in the Past Year"
        type: select
        option: {
          name: "yes"
          label: "yes"
        }
        option: {
          name: "no"
          label: "no"
        }
        default: "yes"
      }
      form_param: {
        name: "Encounter Type"
        label: "Encounter Type"
        type: select
        option: {
          name: "Encounter for symptom"
          label: "Encounter for symptom"
        }
        option: {
          name: "Emergency Encounter"
          label: "Emergency Encounter"
        }
        option: {
          name: "Encounter for problem"
          label: "Encounter for problem"
        }
        option: {
          name: "Death Certification"
          label: "Death Certification"
        }
        option: {
          name: "Follow-up encounter"
          label: "Follow-up encounter"
        }
        option: {
          name: "Emergency Room Admission"
          label: "Emergency Room Admission"
        }
        option: {
          name: "Outpatient procedure"
          label: "Outpatient procedure"
        }
        option: {
          name: "Asthma follow-up"
          label: "Asthma follow-up"
        }
      }
      form_param: {
        name: "Procedure Type"
        label: "Procedure Type"
        type: select
        option: {
          name: "exam"
          label: "Exam"
        }
        option: {
          name: "laboratory"
          label: "Laboratory"
        }
        option: {
          name: "vital-signs"
          label: "Vital-Signs"
        }
        option: {
          name: "survey"
          label: "Survey"
        }
        option: {
          name: "imaging"
          label: "Imaging"
        }
        option: {
          name: "therapy"
          label: "Therapy"
        }
      }
      form_param: {
        name: "Practictioner Examiner"
        label: "Practictioner Examiner (First and Last Name)"
        type: string
      }
      form_param: {
        name: "Length of Stay"
        label: "Length of Stay (Minutes)"
        type: string
      }
      form_param: {
        name: "Admission Date"
        label: "Admission Date (YYYY-MM-DD)"
        type: string
      }
      form_param: {
        name: "Discharge Date"
        label: "Discharge Date (YYYY-MM-DD)"
        type: string
      }
      form_param: {
        name: "Last Discharge Date"
        label: "Last Discharge Date (YYYY-MM-DD)"
        type: string
      }
    }
  }
  dimension: patient_age_tier {
    type: string
    sql: ${TABLE}.patient_age_tier ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: patient_us_core_race {
    type: string
    sql: ${TABLE}.patient_us_core_race ;;
  }

  measure: count { type: count }


  dimension: patient_age_tier__sort_ {
    type: string
    sql: ${TABLE}.patient_age_tier__sort_ ;;
  }

  dimension: patient_us_core_ethnicity {
    type: string
    sql: ${TABLE}.patient_us_core_ethnicity ;;
  }

  dimension: patient_is_wellness_screened_in_the_past_year {
    type: string
    sql: ${TABLE}.patient_is_wellness_screened_in_the_past_year ;;
  }

  dimension: patient_birth_place__city {
    type: string
    sql: ${TABLE}.patient_birth_place__city ;;
  }

  dimension: patient_birth_place__state {
    type: string
    sql: ${TABLE}.patient_birth_place__state ;;
  }

  dimension: encounter_type_coding_display {
    type: string
    sql: ${TABLE}.encounter_type_coding_display ;;
  }

  dimension: observation__category__coding_display {
    type: string
    sql: ${TABLE}.observation__category__coding_display ;;
  }

  dimension: practitioner_investigator {
    type: string
    sql: ${TABLE}.practitioner_investigator ;;
  }

  dimension: encounter_length_of_stay {
    type: number
    sql: ${TABLE}.encounter_length_of_stay ;;
  }

  dimension: admission_date {
    type: date
    datatype: date
    sql: ${TABLE}.admission_date ;;
  }

  dimension: discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.discharge_date ;;
  }

  dimension: last_discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_discharge_date ;;
  }
}

view: new_patient_predictions_info_schema {
  derived_table: {
    sql:
      SELECT *
      FROM healthcare_demo_live.INFORMATION_SCHEMA.TABLES  AS healthcare_bqml_new_patients
      WHERE table_name = "new_patient_visits"
    ;;
  }
  dimension: table_catalog {
    type: string
    sql: ${TABLE}.table_catalog ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.table_schema ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: table_type {
    type: string
    sql: ${TABLE}.table_type ;;
  }

  dimension: is_insertable_into {
    type: string
    sql: ${TABLE}.is_insertable_into ;;
  }

  dimension: is_typed {
    type: string
    sql: ${TABLE}.is_typed ;;
  }

  dimension_group: creation_time {
    type: time
    sql: ${TABLE}.creation_time ;;
  }
}


view: healthcare_bqml_new_patient_predictions {
derived_table: {
      sql:
          SELECT
              *
            FROM
              ML.PREDICT(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`,
                (
                WITH
                  CTE AS (
                  SELECT
                    *
                  FROM
                    `looker-private-demo.healthcare_demo_live.new_patient_visits`
                  WHERE
                    patient_name = "Alick Zhang")
                SELECT
                  *
                FROM
                  CTE));;
    }
  dimension: patient_name {}
  dimension: predicted_readmission_within_7 {}
  dimension: predicted_readmission_within_7_probs {hidden:yes}

}

view: prediction_probs {
  dimension: label {}
  measure: prob {
    type: average
  }
}

view: new_patient_info_schema {
  derived_table: {
    sql: SELECT *
      FROM looker-private-demo.healthcare_demo_live.INFORMATION_SCHEMA.COLUMNS
      WHERE table_name = 'new_patient_visits'
      ;;
  }

  measure: count {
    type: count
  }

  dimension: table_catalog {
    type: string
    sql: ${TABLE}.table_catalog ;;
  }

  dimension: table_schema {
    type: string
    sql: ${TABLE}.table_schema ;;
  }

  dimension: table_name {
    type: string
    sql: ${TABLE}.table_name ;;
  }

  dimension: column_name {
    type: string
    sql: ${TABLE}.column_name ;;
  }

  dimension: data_type {
    type: string
    sql: ${TABLE}.data_type ;;
  }
}







###############healthecare probabilities

view: healthcare_predictions {
  derived_table: {
    sql: SELECT *
          FROM ${healthcare_bqml_predict.SQL_TABLE_NAME}
          LEFT JOIN UNNEST (predicted_readmission_within_7_probs) as probs;;
  }
  dimension: patient_id {}

  dimension: patient_admission {
    primary_key:yes
    sql: CONCAT(${TABLE}.patient_id, ${TABLE}.admission_date) ;;
  }
  dimension: encounter_type_coding_display {
    type: string
    sql: ${TABLE}.encounter_type_coding_display ;;
  }

  dimension: observation__category__coding_display {
    type: string
    sql: ${TABLE}.observation__category__coding_display ;;
  }

  dimension: admission_date {
    type: date
    datatype: date
    sql: ${TABLE}.admission_date ;;
  }

  dimension: label  {type: yesno }
  measure: avg_prob {
    type: average
    sql: ${TABLE}.prob ;;
    value_format_name: percent_2
    sql_distinct_key: ${patient_admission} ;;
  }
  measure: count {
    type: count
    drill_fields: [admission_date, patient_name, encounter_type_coding_display, encounter_length_of_stay, predicted_readmission_within_7]
  }

  dimension: predicted_readmission_within_7 {
    type: yesno
    sql: ${TABLE}.predicted_readmission_within_7 ;;
  }

  dimension: predicted_readmission_within_7_probs {
    type: string
    sql: ${TABLE}.predicted_readmission_within_7_probs ;;
  }


  dimension: patient_name {
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: patient_age_tier__sort_ {
    type: string
    sql: ${TABLE}.patient_age_tier__sort_ ;;
  }

  dimension: patient_age_tier {
    type: string
    sql: ${TABLE}.patient_age_tier ;;
  }

  dimension: patient_us_core_ethnicity {
    type: string
    sql: ${TABLE}.patient_us_core_ethnicity ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: patient_us_core_race {
    type: string
    sql: ${TABLE}.patient_us_core_race ;;
  }

  dimension: patient_is_wellness_screened_in_the_past_year {
    type: string
    sql: ${TABLE}.patient_is_wellness_screened_in_the_past_year ;;
  }

  dimension: patient_birth_place__city {
    type: string
    sql: ${TABLE}.patient_birth_place__city ;;
  }

  dimension: patient_birth_place__state {
    type: string
    sql: ${TABLE}.patient_birth_place__state ;;
  }


  dimension: practitioner_investigator {
    type: string
    sql: ${TABLE}.practitioner_investigator ;;
  }

  dimension: encounter_length_of_stay {
    type: number
    sql: ${TABLE}.encounter_length_of_stay ;;
  }

  dimension: length_of_stay_tier {
    type: tier
    tiers: [0,60,120, 180, 240, 300, 720, 1440]
    style: integer
    sql: ${TABLE}.encounter_length_of_stay ;;
  }

  dimension: is_planned {
    type: yesno
    sql: ${encounter_type_coding_display} IN ("Encounter for check up (procedure)", "Prenatal visit", "Follow-up encounter", "Encounter for 'check-up’", "Prenatal initial visit", "Postnatal visit","Asthma follow-up","Patient-initiated encounter","Non-urgent orthopedic admission", "Allergic disorder follow-up assessment","Encounter for check up","Follow-up visit (procedure)") ;;
  }


  dimension: discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.discharge_date ;;
  }

  dimension: last_discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_discharge_date ;;
  }

  dimension: readmission_within_7 {
    type: yesno
    sql: ${TABLE}.readmission_within_7 ;;
  }

  dimension: prediction_accurate {
    type: yesno
    sql: ${predicted_readmission_within_7} = ${readmission_within_7} ;;
  }

}

view: patient_survey {
  sql_table_name: healthcare_demo_live.patient_survey;;

  dimension: ease_of_scheduling_appointment {
    label: "How easy was it to schedule an appointment with our facility?"
    type: string
    sql: ${TABLE}.ease_of_scheduling_appointment ;;
    action: {
      label: "New Survey"
      url: "https://us-central1-sandbox-trials.cloudfunctions.net/healthcare_survey_action"

      form_param: {
        name: "Ease Of Scheduling Appointment"
        label: "How easy was it to schedule an appointment with our facility?"
        type: select
        option: {
          name: "1 - Very Unsatisfied"
          label: "1 - Very Unsatisfied"
        }
        option: {
          name: "2 - Unsatisfied"
          label: "2 - Unsatisfied"
        }
        option: {
          name: "3 - Neutral"
          label: "3 - Neutral"
        }
        option: {
          name: "4 - Satisified"
          label: "4 - Satisified"
        }
        option: {
          name: "5 - Very Satisfied"
          label: "5 - Very Satisfied"
        }
      }
      form_param: {
        name: "Wait Time For Appointment"
        label: "How long did you wait (beyond your appointment time) to be seen by the provider?"
        type: select
        option: {
          name: "1 - Very Unsatisfied"
          label: "1 - Very Unsatisfied"
        }
        option: {
          name: "2 - Unsatisfied"
          label: "2 - Unsatisfied"
        }
        option: {
          name: "3 - Neutral"
          label: "3 - Neutral"
        }
        option: {
          name: "4 - Satisified"
          label: "4 - Satisified"
        }
        option: {
          name: "5 - Very Satisfied"
          label: "5 - Very Satisfied"
        }
      }
      form_param: {
        name: "Cleanliness And Appearance Of Facility"
        label: "How satisfied are you with the cleanliness and appearance of our facility?"
        type: select
        option: {
          name: "1 - Very Unsatisfied"
          label: "1 - Very Unsatisfied"
        }
        option: {
          name: "2 - Unsatisfied"
          label: "2 - Unsatisfied"
        }
        option: {
          name: "3 - Neutral"
          label: "3 - Neutral"
        }
        option: {
          name: "4 - Satisified"
          label: "4 - Satisified"
        }
        option: {
          name: "5 - Very Satisfied"
          label: "5 - Very Satisfied"
        }
      }
      form_param: {
        name: "Overall Care Rating"
        label: "How would you rate the overall care you received from your provider?"
        type: select
        option: {
          name: "1 - Very Unsatisfied"
          label: "1 - Very Unsatisfied"
        }
        option: {
          name: "2 - Unsatisfied"
          label: "2 - Unsatisfied"
        }
        option: {
          name: "3 - Neutral"
          label: "3 - Neutral"
        }
        option: {
          name: "4 - Satisified"
          label: "4 - Satisified"
        }
        option: {
          name: "5 - Very Satisfied"
          label: "5 - Very Satisfied"
        }
      }
      form_param: {
        name: "Likelihood Of Recommendation"
        label: "How likely are you to recommend our facility to a friend or family member?"
        type: select
        option: {
          name: "1 - Very Unsatisfied"
          label: "1 - Very Unsatisfied"
        }
        option: {
          name: "2 - Unsatisfied"
          label: "2 - Unsatisfied"
        }
        option: {
          name: "3 - Neutral"
          label: "3 - Neutral"
        }
        option: {
          name: "4 - Satisified"
          label: "4 - Satisified"
        }
        option: {
          name: "5 - Very Satisfied"
          label: "5 - Very Satisfied"
        }
      }
    }
  }

  dimension: wait_time_for_appointment {
    label: "How long did you wait (beyond your appointment time) to be seen by the provider?"
    type: string
    sql: ${TABLE}.wait_time_for_appointment ;;
  }

  dimension: cleanliness_and_appearance_of_facility {
    label: "How satisfied are you with the cleanliness and appearance of our facility?"
    type: string
    sql: ${TABLE}.cleanliness_and_appearance_of_facility ;;
  }

  dimension: overall_care_rating {
    label: "How would you rate the overall care you received from your provider?"
    type: string
    sql: ${TABLE}.overall_care_rating ;;
  }

  dimension: likelihood_of_recommendation {
    label: "How likely are you to recommend our facility to a friend or family member?"
    type: string
    sql: ${TABLE}.likelihood_of_recommendation ;;
  }

}
