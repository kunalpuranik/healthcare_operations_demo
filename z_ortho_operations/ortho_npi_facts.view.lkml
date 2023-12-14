view: ortho_npi_facts {

  label: "Ortho Provider Facts"

  derived_table: {

  sql:  SELECT
        ortho_npi.npi  AS npi,
        ortho_npi.facility_name  AS facility_name,
        ortho_npi.nppes_provider_city  AS nppes_provider_city,
        ortho_npi.nppes_provider_state  AS nppes_provider_state,
        ortho_npi.nppes_provider_zip  AS nppes_provider_zip,
        --ortho_npi.wRVU  AS ortho_npi_w_rvu,
        --COUNT(*) AS ortho_npi_count,
        AVG(CAST(ortho_npi.wRVU AS FLOAT64)) AS average_of_w_rvu
        FROM `looker-private-demo.healthcare_operations.ortho_npi_2` AS ortho_npi
        GROUP BY 1,2,3,4,5;;
  }

  dimension: npi {
    primary_key: yes
  }

  dimension: facility_name {
    view_label: "Ortho Facilities"
    type: string
    link: {
      label: "{{ value }} Performance Dashboard"
      #label: "Provider Performance Dashboard - {{value}}"
      url: "/dashboards/hCAzULJeXdkyDxGYZgJBLx?Hospital%20Facility={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"
    }
  }

  dimension: nppes_provider_city {}

  dimension: nppes_provider_state {
    map_layer_name: us_states
  }
  dimension: nppes_provider_zip {
    map_layer_name: us_zipcode_tabulation_areas
  }

  dimension: average_of_w_rvu {
    value_format_name: decimal_0
    type: number
  }

  ### Benchmark Data - via MGMA

  dimension: mean {
    type: number
    sql: 8415 ;;
  }

  dimension: 10_percentile {
    type: number
    sql: 4906 ;;
  }

  dimension: 25_percentile {
    type: number
    sql: 6005 ;;
  }

  dimension: 50_percentile {
    type: number
    sql: 7949 ;;
  }

  dimension: 75_percentile {
    type: number
    sql: 9951 ;;
  }

  dimension: 90_percentile {
    type: number
    sql: 12698 ;;
  }

  dimension: npi_rank {
    type: number
    value_format_name: decimal_0
    sql: CASE WHEN ${average_of_w_rvu} >= ${50_percentile}
         THEN (50 + ((${average_of_w_rvu}-${25_percentile})/(${50_percentile}-${25_percentile}))*(50-25))-25
         ELSE (50 + ((${average_of_w_rvu}-${25_percentile})/(${50_percentile}-${25_percentile}))*(50-25))
         END;;
  }

  dimension: npi_rank_tier {
    type: tier
    sql: ${npi_rank};;
    tiers: [10, 20, 30, 40, 50, 60, 70, 80, 90]
    style: integer
  }

  dimension: provider_rank_status {
    type: string
    sql:  CASE WHEN ${npi_rank} <=49 THEN 'Low Performers'
               WHEN ${npi_rank} >=50 AND ${npi_rank} <=60 THEN 'Mid Performers'
               WHEN ${npi_rank} >60 THEN 'Top Performers' ELSE NULL END;;
  }

  ### DO NOT DELETE ###
  #LOGIC FOR ABOVE PERCENTILES:
  # if wRVU is >= 50thP
  # then (50+((wRVU-25thP)/(50thP-25thP))*(50-25))-25
  # else (50+((wRVU-25thP)/(50thP-25thP))*(50-25))
  # end

  measure: count {
    type: count
  }
}
