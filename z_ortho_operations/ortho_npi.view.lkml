view: ortho_npi {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_npi_2`
    ;;

  dimension: facility_name {
    #hidden: yes
    type: string
    sql: ${TABLE}.facility_name ;;
  }

  dimension: npi {
    primary_key: yes
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: w_rvu {
    value_format_name: decimal_0
    type: number
    sql: ${TABLE}.wRVU ;;
  }

  dimension: nppes_provider_city {
    #hidden: yes
    type: string
    sql: ${TABLE}.nppes_provider_city ;;
  }

  dimension: nppes_provider_state {
    #hidden: yes
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.nppes_provider_state ;;
  }

  dimension: nppes_provider_street1 {
    #hidden: yes
    type: string
    sql: ${TABLE}.nppes_provider_street1 ;;
  }

  dimension: nppes_provider_street2 {
    #hidden: yes
    type: string
    sql: ${TABLE}.nppes_provider_street2 ;;
  }

  dimension: nppes_provider_zip {
   # hidden: yes
    type: number
    map_layer_name: us_zipcode_tabulation_areas
    sql: ${TABLE}.nppes_provider_zip ;;
  }

  dimension: nppes_provider_country {
   # hidden: yes
    type: string
    sql: ${TABLE}.nppes_provider_country ;;
  }

  dimension: provider_type {
   # hidden: yes
    type: string
    sql: ${TABLE}.provider_type ;;
  }

#   dimension: average_submitted_chrg_amt {
#   #  hidden: yes
#     type: number
#     value_format_name: usd
#     sql: ${TABLE}.average_submitted_chrg_amt ;;
#   }

  dimension: case_count {
  #  hidden: yes
    type: number
    sql: ${TABLE}.case_count ;;
  }

#   dimension:  charge_amt {
#    # hidden: yes
#     type: number
#     value_format_name: usd
#     sql: ${average_submitted_chrg_amt}*${case_count} ;;
#   }
#
#   measure: total_cases {
#    # hidden: yes
#     type: sum
#     sql: ${case_count} ;;
#     value_format_name: decimal_0
#   }
#
#   measure: total_charge_amt {
#    # hidden: yes
#     type: sum
#     value_format_name: usd
#     sql: ${charge_amt} ;;
#   }

  measure: count {
    type: count
    drill_fields: [facility_name]
  }

#   ## Benchmark Data - via MGMA
#
#   dimension: mean {
#     type: number
#     sql: 8415 ;;
#   }
#
#   dimension: 10_percentile {
#     type: number
#     sql: 4906 ;;
#   }
#
#   dimension: 25_percentile {
#     type: number
#     sql: 6005 ;;
#   }
#
#   dimension: 50_percentile {
#     type: number
#     sql: 7949 ;;
#   }
#
#   dimension: 75_percentile {
#     type: number
#     sql: 9951 ;;
#   }
#
#   dimension: 90_percentile {
#     type: number
#     sql: 12698 ;;
#   }
#
#   dimension: npi_rank {
#     type: number
#     value_format_name: decimal_0
#     sql: CASE WHEN ${w_rvu} >= ${50_percentile}
#          THEN (50 + ((${w_rvu}-${25_percentile})/(${50_percentile}-${25_percentile}))*(50-25))-25
#          ELSE (50 + ((${w_rvu}-${25_percentile})/(${50_percentile}-${25_percentile}))*(50-25))
#          END;;
#   }
#
#   dimension: npi_rank_tier {
#     type: tier
#     sql: ${npi_rank};;
#     tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
#     style: integer
#   }

    #LOGIC:
    # if wRVU is >= 50thP
    # then (50+((wRVU-25thP)/(50thP-25thP))*(50-25))-25
    # else (50+((wRVU-25thP)/(50thP-25thP))*(50-25))
    # end

}
