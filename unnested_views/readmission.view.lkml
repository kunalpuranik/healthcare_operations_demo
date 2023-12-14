view: readmission {
 derived_table: {
   sql:
    select b.*, b1.encounter_code_name as prior_visit_encounter_code_name, b1.visit_start as prior_visit_start, b1.encounter_id as prior_encounter_id
    from ${readmission_b.SQL_TABLE_NAME} as b
    left join ${readmission_b.SQL_TABLE_NAME} as b1 on b.patient_id = b1.patient_id and b.encounter_rank+1 = b1.encounter_rank
    group by 1,2,3,4,5,6,7,8,9
    ;;

    persist_for: "24 hours"
 }


dimension: encounter_id {
  primary_key: yes
}

dimension: patient_id {}

dimension: organization_id {}

dimension: encounter_code_name {}

dimension: prior_encounter_id {}

dimension_group: visit_start {
  type: time
  timeframes: [raw, date, time]
  sql: ${TABLE}.visit_start ;;
}

dimension: encounter_rank {}

  dimension_group: prior_visit_start {
    type: time
    timeframes: [raw, date, time]
    sql: ${TABLE}.prior_visit_start ;;
  }

  dimension: prior_visit_encounter_code_name {}

  dimension: time_between_visits {
    type: duration_hour
    sql_start:${prior_visit_start_raw}  ;;
    sql_end: ${visit_start_raw} ;;
    value_format_name: decimal_2
  }

  dimension: is_readmission {
    type: yesno
    sql: ${time_between_visits} <= 720 ;;
  }

  measure: count {
    label: "Number of Encounters"
    type: count
  }

  measure: average_time_between_visits {
    type: average
    sql: ${time_between_visits} ;;
    value_format_name: decimal_2
  }

  measure: count_readmissions {
    label: "Number of Readmissions"
    type: count

    filters: {
      field: is_readmission
      value: "yes"
    }
    drill_fields: [patient.id, patient.name, patient.ssn_hashed, patient.age, patient.gender, count_readmissions]
  }

  measure: perc_30_day_readmission {
    label: "Percent 30 Day Readmission"
    type: number
    sql: (1.0*${count_readmissions}/NULLIF(${count},0))/2 ;;
    value_format_name: percent_1
    drill_fields: [prior_condition__code__coding.code, prior_condition__code__coding.display, perc_30_day_readmission, count_readmissions, average_time_between_visits]
  }

}
