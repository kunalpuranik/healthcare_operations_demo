view: healthcare_days_since_readmission {
  derived_table: {
    sql:
    SELECT
    patient.id  AS patient_id,
        (DATE((encounter.period).start , 'America/Los_Angeles')) AS admission_date,
        (DATE((encounter.period).end , 'America/Los_Angeles')) AS discharge_date,
    encounter.id  AS encounter_id,
    LAG(DATE((encounter.period).end),1) OVER (PARTITION BY patient.id ORDER BY DATE((encounter.period).start , 'America/Los_Angeles') ASC) as last_discharge_date,
    (CASE WHEN DATE_DIFF(DATE((encounter.period).end , 'America/Los_Angeles'), LAG(DATE((encounter.period).end),1) OVER (PARTITION BY patient.id ORDER BY DATE((encounter.period).start , 'America/Los_Angeles') ASC), DAY) <= 7 THEN TRUE
        WHEN DATE_DIFF(DATE((encounter.period).end , 'America/Los_Angeles'), LAG(DATE((encounter.period).end),1) OVER (PARTITION BY patient.id ORDER BY DATE((encounter.period).start , 'America/Los_Angeles') ASC), DAY) > 7 THEN FALSE
        ELSE NULL
        END) as readmission_within_7
    FROM `looker-private-demo.healthcare_demo_live.encounter`  AS encounter
    LEFT JOIN `looker-private-demo.healthcare_demo_live.patient`  AS patient ON ((encounter.subject).patientId) = patient.id;;
  }

  measure: count {
    type: count
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
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

  dimension: encounter_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.encounter_id ;;
  }

  dimension: last_discharge_date {
    type: date
    datatype: date
    sql: ${TABLE}.last_discharge_date ;;
  }

  dimension: days_since_last_visit {
    type: number
    sql: DATE_DIFF(${discharge_date}, ${last_discharge_date}, DAY) ;;
  }

  dimension: readmission_within_7 {
    type: yesno
    sql: ${TABLE}.readmission_within_7 ;;
  }
}
