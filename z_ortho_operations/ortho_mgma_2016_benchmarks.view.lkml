view: ortho_mgma_2016_benchmarks {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_MGMA_2016_benchmarks`
    ;;

  dimension: measure_name {
    type: string
    sql: ${TABLE}.Measure_Name ;;
  }

  dimension: is_physician_workRVU {
    type: yesno
    sql: ${measure_name} = 'Physician Work RVUs'  ;;
  }

  dimension: provider_count {
    type: number
    sql: ${TABLE}.Provider_Count ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: is_east {
    type: yesno
    sql: ${region} = "Eastern" ;;
  }

  dimension: medicare_conversion_factor {
    type: number
    sql: 36.0896 ;;
  }

  dimension: mean {
    type: number
    sql: ${TABLE}.Mean ;;
  }

  dimension: median {
    type: number
    sql: ${TABLE}.Median ;;
  }

  dimension: stdev {
    type: number
    sql: ${TABLE}.Stdev ;;
  }

  dimension: _10_tile {
    type: number
    sql: ${TABLE}._10_tile ;;
  }

  dimension: _25_tile {
    type: number
    sql: ${TABLE}._25_tile ;;
  }

  dimension: _75_tile {
    type: number
    sql: ${TABLE}._75_tile ;;
  }

  dimension: _90_tile {
    type: number
    sql: ${TABLE}._90_tile ;;
  }

  dimension: groups_count {
    type: number
    sql: ${TABLE}.Groups_Count ;;
  }


  measure: count {
    type: count
    drill_fields: [measure_name]
  }
}
