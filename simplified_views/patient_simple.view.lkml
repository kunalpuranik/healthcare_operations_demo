view: patient_simple {
  sql_table_name: `looker-private-demo.healthcare_demo_live.patient_simple` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: address_city {
    group_label: "Location"
    type: string
    sql: ${TABLE}.address_city ;;
  }

  dimension: address_country {
    group_label: "Location"
    type: string
    sql: ${TABLE}.address_country ;;
  }

  dimension: address_postal_code {
    group_label: "Location"
    sql: ${TABLE}.address_postal_code ;;
    type: zipcode
  }

  dimension: address_state {
    group_label: "Location"
    type: string
    sql: ${TABLE}.address_state ;;
    map_layer_name: us_states
  }

  dimension: birth_place__city {
    group_label: "Birth Place"
    type: string
    sql: ${TABLE}.birth_place__city ;;
  }

  dimension: birth_place__country {
    group_label: "Birth Place"
    type: string
    sql: ${TABLE}.birth_place__country ;;
  }

  dimension: birth_place__state {
    group_label: "Birth Place"
    type: string
    sql: ${TABLE}.birth_place__state ;;
    map_layer_name: us_states
  }

  dimension: birthsex {
    type: string
    sql: ${TABLE}.birthsex ;;
  }

  dimension: deceased_date {
    type: string
    sql: ${TABLE}.deceased_date ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: language {
    type: string
    sql: ${TABLE}.language ;;
  }

  dimension: patient_name {
    type: string
    sql: ${TABLE}.patient_name ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}.race ;;
  }

  dimension: telecom {
    type: string
    sql: ${TABLE}.telecom ;;
  }

  measure: count {
    label: "Number of Patients"
    type: count
    drill_fields: [id, patient_name, address_state]
  }
}
