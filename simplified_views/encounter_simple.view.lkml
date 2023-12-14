view: encounter_simple {
  sql_table_name: `looker-private-demo.healthcare_demo_live.encounter_simple` ;;
  drill_fields: [id]

  dimension: id {
    hidden: no
    label: " Encounter ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: code {
    description: "inpatient | outpatient | ambulatory | emergency +"
    label: "Class Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: is_inpatient {
    type: yesno
    sql: ${code} = 'IMP';;
  }

  dimension: is_discharged {
    type: yesno
    sql: ${discharge_disposition_code} is not null ;;
  }

  dimension: discharge_disposition_display {
    group_label: "Discharge"
    label: "Discharge Disposition"
    description: "Name - Category or kind of location after discharge"
    type: string
    sql: ${TABLE}.dischare_disposition_display ;;
    link: {
      label: "Look up on NUBC"
      icon_url: "http://www.healthforum.com/images/billing-coding/nubc-logo.png"
      url: "{{ encounter.system._value }}"
    }
  }

  dimension: discharge_disposition_code {
    group_label: "Discharge"
    description: "Code - Category or kind of location after discharge"
    label: "Discharge Code"
    type: string
    sql: ${TABLE}.discharge_disposition_code ;;
  }

  dimension: organization_id {
    type: string
    sql: ${TABLE}.organization_id ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: practitioner_id {
    type: string
    sql: ${TABLE}.practitioner_id ;;
  }


  dimension: reason_code {
    group_label: "Reason"
    label: "Reason Code"
    description: "Coded reason the encounter takes place"
    type: string
    sql: ${TABLE}.reason_code ;;
  }

  dimension: reason_display {
    group_label: "Reason"
    label: "Reason"
    description: "Coded reason the encounter takes place"
    type: string
    sql: ${TABLE}.reason_display ;;
    link: {
      label: "Look up on Snomed"
      icon_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSP9Q4u6D3vfBt1K_VVcso-bjl6hRAhOEBAF0kLE_haQDD-f0-7&s"
      url: "{{ encounter.system._value }}"
    }
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.start_time ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.end_time ;;
  }

  dimension: length_of_stay {
    type: duration_minute
    sql_start: ${start_raw} ;;
    sql_end: ${end_raw} ;;
  }

  dimension: status {
    description: "planned | arrived | triaged | in-progress | onleave | finished | cancelled +"
    label: " Status"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: system {
    type: string
    sql: ${TABLE}.system ;;
  }


  dimension: type_code {
    group_label: "Type"
    label: "Type Code"
    description: "Code - Specific type of encounter"
    type: string
    sql: ${TABLE}.type_code ;;
  }

  dimension: type_display {
    group_label: "Type"
    label: "Type"
    description: "Name - Specific type of encounter"
    type: string
    sql: ${TABLE}.type_display ;;
  }


  measure: count {
    label: "Number of Encounters"
    type: count
  }


  measure: count_patients {
    label: "Number of Patients"
    type: count_distinct
    sql: ${patient_id} ;;
  }

  measure: repeat_patients {
    label: "Percent of Repeat Patients"
    type: number
    value_format_name: percent_2
    sql: 1.0*(${count}-${count_patients})/nullif(${count},0) ;;
  }

  measure: average_los {
    label: "Average Length of Stay"
    type: average
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
    drill_fields: [organization_id, average_los]
  }

  measure: min_los {
    group_label: "LOS Statistics"
    label: "Min Length of Stay"
    type: min
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: max_los {
    group_label: "LOS Statistics"
    label: "Max Length of Stay"
    type: max
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: 25_los {
    group_label: "LOS Statistics"
    label: "25th Percentile Length of Stay"
    type: percentile
    percentile: 25
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: 75_los {
    group_label: "LOS Statistics"
    label: "75th Percentile Length of Stay"
    type: percentile
    percentile: 75
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

  measure: med_los {
    group_label: "LOS Statistics"
    label: "Median Length of Stay"
    type: median
    sql: ${length_of_stay} ;;
    value_format_name: decimal_2
  }

}
