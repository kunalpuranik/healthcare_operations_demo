#########  Original Table  #########

# unnested arrays are included as view with their own dimensions below

view: claim {
  sql_table_name: lookerdata.test_bq_dataset.Claim ;;

  #########  Standard dimensions  #########

  dimension: id {
    label: "Claim ID"
    primary_key: yes
    hidden: no
    sql: ${TABLE}.id ;;
  }

  dimension: status {
    sql: ${TABLE}.status ;;
  }

  dimension: use {
    hidden: yes
    sql: ${TABLE}.use ;;
  }

  #########  JSON  dimensions  #########


  #### period fields  ####

  dimension: billable_period {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.billablePeriod ;;
  }

  dimension_group: billable_start {
    type: time
    timeframes: [
      date,
      week,
      month_name,
      year
    ]
    sql: ${billable_period}.start ;;
  }

  dimension_group: billable_end {
    type: time
    timeframes: [
      date,
      week,
      month_name,
      year
    ]
    sql: ${billable_period}.end ;;
  }

  #### Org & Patient ID fields  ####


  dimension: organization_id {
    hidden: yes
    sql: ${TABLE}.organization.organizationId ;;
  }

  dimension: patient_id {
    hidden: yes
    sql: ${TABLE}.patient.patientId ;;
  }


  #########  array  dimensions  #########


  dimension: information {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.information ;;
  }

  dimension: item {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.item ;;
  }

  dimension: prescription {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.prescription ;;
  }

  dimension: procedure {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.procedure ;;
  }

  dimension: diagnosis {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.diagnosis ;;
  }

  dimension: total {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.total ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

### arrays with nested JSON ###
view: claim__diagnosis {
  dimension: diagnosis {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.diagnosis ;;
  }

  dimension: diagnosis___condition_id {
    label: "Diagnosed Condition ID"
    sql: ${diagnosis}.reference.reference.conditionId ;;
  }

  dimension: sequence {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.sequence ;;
  }
}

view: claim__information {
  dimension: category {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.category ;;
  }

  dimension: sequence {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.sequence ;;
  }

  dimension: value {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.value ;;
  }

  dimension: immunization_id {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${value}.reference.immunizationId ;;
  }
}
