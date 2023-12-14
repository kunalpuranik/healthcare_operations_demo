#########  Original Table  #########
# unnested arrays are included as view with their own dimensions below

view: diagnostic_report {
  sql_table_name: `looker-private-demo.healthcare_demo_live.diagnosticreport` ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    label: " Diagnostic Report ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: issued {
    hidden: yes
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
    sql: ${TABLE}.issued ;;
  }

  dimension: status {
    description: "registered | partial | preliminary | final +"
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: conclusion {
    description: "Clinical conclusion (interpretation) of test results *NULL*"
    type: string
    sql: ${TABLE}.conclusion ;;
  }

  #########  JSON  dimensions  #########

  #### code fields  ####

  dimension: code {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.code ;;
  }

  dimension: code__coding {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${code}.coding ;;
  }


  #### context fields  ####

  dimension: context {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.context ;;
  }

  dimension: context__encounter_id {
    label: " Encounter ID"
    sql: ${context}.encounterId ;;
  }

  #### effective fields  ####

  dimension: effective {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.effective ;;
  }

  dimension_group: dateTime {
    type: time
    label: "Effective"
    timeframes: [
      date,
      week,
      month,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day
    ]
    sql: ${effective}.dateTime ;;
  }


  #### subject fields  ####

  dimension: subject {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.subject ;;
  }

  dimension: subject__patient_id {
    label: " Subject ID"
    sql: ${subject}.patientId ;;
  }


  #########  Array  dimensions, unnested below  #########

  dimension: result {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.result ;;
  }


  #########  Measures  #########

  measure: count {
    type: count
    drill_fields: [id]
  }
}

#########  Unnested Arrays  #########

view: diagnostic_report__code__coding {
  view_label: "Diagnostic Report"
  dimension: code {
    label: "Diagnostic Code"
    description: "Name/Code for this diagnostic report"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: is_covid {
    type: yesno
    sql: ${code} = '24321-2' ;;
  }

  dimension: display {
    label: "Diagnostic Report Name"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    type: string
    sql: ${TABLE}.system ;;
  }

}

view: diagnostic_report__result {
  view_label: "Diagnostic Report"

  dimension: display {
    group_label: "Result"
    description: "Observations"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: reference {
    group_label: "Result"
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension: identifier {
    group_label: "Result"
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  dimension: observation_id {
    group_label: "Result"
    label: "Result Observation ID"
    type: string
    sql: ${TABLE}.observationId ;;
  }
}
