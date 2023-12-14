view: ortho_facilities {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_facilities`
    ;;

  dimension: facility {
    type: string
    hidden: yes
    sql: ${TABLE}.Facility ;;
  }

  dimension: city {
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

  dimension: facility_location {
    type: location
    sql_latitude: ROUND(${latitude},4) ;;
    sql_longitude: ROUND(${longitude},4) ;;
  }

  dimension: distance_to_facility {
    view_label: "Ortho Patient"
    type: distance
    start_location_field: ortho_facilities.facility_location
    end_location_field: us_zip_code_latitude_and_longitude.patient_location
    units: miles
  }

  # measure: total_distance_to_facility {
  #   type: sum
  #   sql: ${distance_to_facility} ;;
  # }

  # measure: average_distance_to_facility {
  #   type: average
  #   sql: ${distance_to_facility} ;;
  #   value_format_name: decimal_2
  # }

  dimension: facility_zip {
    type: zipcode
    case: {
      when: {
        label: "37411"
        sql: ${facility} = 'Chattanooga Facility';;
      }
      when: {
        label: "38401"
        sql: ${facility} = 'Columbia Facility';;
      }
      when: {
        label: "38506"
        sql: ${facility} = 'Cookeville Facility' ;;
      }
      when: {
        label: "38127"
        sql: ${facility} = 'Germantown Facility' ;;
      }
      when: {
        label: "37076"
        sql: ${facility} = 'Hermitage Facility' ;;
      }
      when: {
        label: "38301"
        sql: ${facility} = 'Jackson Facility' ;;
      }
      when: {
        label: "37615"
        sql: ${facility} = 'Johnson City Facility' ;;
      }
      when: {
        label: "37919"
        sql: ${facility} = 'Knoxville Facility' ;;
      }
      when: {
        label: "38116"
        sql: ${facility} = 'Memphis Facility' ;;
      }
      when: {
        label: "37208"
        sql: ${facility} = 'Nashville Facility' ;;
      }
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
