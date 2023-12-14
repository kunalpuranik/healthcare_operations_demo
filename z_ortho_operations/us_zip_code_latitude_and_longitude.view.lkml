view: us_zip_code_latitude_and_longitude {
  sql_table_name: `looker-private-demo.healthcare_operations.us_zip_code_latitude_and_longitude`
    ;;


  dimension: city {
    hidden: yes
    type: string
    sql: ${TABLE}.City ;;
  }

  dimension: latitude {
    hidden: yes
    type: number
    sql: CAST(${TABLE}.Latitude as NUMERIC) ;;
  }

  dimension: longitude {
    hidden: yes
    type: number
    sql: CAST(${TABLE}.Longitude as NUMERIC) ;;
  }

  dimension: patient_location {
    view_label: "Ortho Patient"
    type: location
    sql_latitude: ROUND(${latitude},4) ;;
    sql_longitude: ROUND(${longitude},4) ;;
  }

  dimension: state {
    hidden: yes
    type: string
    sql: ${TABLE}.State ;;
  }

  dimension: zip {
    hidden: yes
    type: zipcode
    sql: ${TABLE}.Zip ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
