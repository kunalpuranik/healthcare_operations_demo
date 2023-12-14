view: ortho_procedures {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_procedures_2`
    ;;

  dimension: unique_id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.unique_id ;;
  }

  dimension: encounter_id {
    type: number
    sql: ${TABLE}.encounter_id ;;
  }

  dimension: patient_id {
    hidden: yes
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: npi {
    hidden: yes
    type: string
    sql: ${TABLE}.npi ;;
  }

  dimension: complete {
    type: yesno
    sql: ${TABLE}.complete_yn ;;
  }

  dimension: cpt_code {
    hidden: yes
    type: string
    sql: ${TABLE}.cpt_code ;;
  }

  dimension: patient_billed {
    type: yesno
    sql: ${TABLE}.patient_billed_yn ;;
  }

  dimension: payer {
    type: number
    sql: ${TABLE}.payer ;;
  }

  dimension: procedure_charges {
    view_label: "Ortho Billing"
    label: "Actual Procedure Charges"
    type: number
    value_format_name: usd
    sql: IFNULL(${TABLE}.procedure_charges,0) ;;
  }

  measure: total_procedural_charges {
    view_label: "Ortho Billing"
    type: sum
    value_format_name: usd
    sql: ${procedure_charges} ;;
    drill_fields:  [ortho_procedures.patient_id,
                    ortho_patient.patient_name,
                    ortho_npi_facts.facility_name,
                    ortho_procedures.paperwork_complete,
                    ortho_payer.payer,
                    ortho_patient.patient_email]
  }

  measure: average_procedural_charges {
    view_label:"Ortho Billing"
    type: average
    value_format_name: usd
    sql: ${procedure_charges} ;;
    drill_fields: [ortho_supplier_costs.supplier_name, total_supply_costs]
  }

  ####### Added for Average Cost Per Case ######

  ##Note this is an estimate to just get it in the ballpark, Avg Cost Per Case for Ortho in the Outpatient setting is 15k-25k
  dimension: cost_per_case {
    view_label:"Ortho Billing"
    type: number
    sql: ${procedure_charges}*6.25;;
    value_format_name: usd
  }

  measure: average_cost_per_case {
    view_label:"Ortho Billing"
    type: average
    sql: ${cost_per_case} ;;
    value_format_name: usd
  }

  measure: total_cost_per_case {
    view_label:"Ortho Billing"
    type: sum
    sql: ${cost_per_case} ;;
    value_format_name: usd
  }

  ##############################################

  dimension: payer_covered_amt {
    view_label: "Ortho Billing"
    type: number
    value_format_name: usd
    sql: (IFNULL(${procedure_charges},0)*${ortho_payer.payer_percent_coverage})*1.0 ;;
  }

  measure: total_payer_covered_amt {
    view_label: "Ortho Billing"
    type: sum
    value_format_name: usd
    sql: ${payer_covered_amt} ;;
  }

  dimension: net_amt {
    hidden: yes
    view_label: "Ortho Billing"
    type: number
    value_format_name: usd
    sql: ${procedure_charges}-${payer_covered_amt} ;;
  }

  measure: total_net_amt {
    view_label: "Ortho Billing"
    type: sum
    value_format_name: usd
    sql: ${net_amt} ;;
  }

  measure: average_payer_covered_amt {
    view_label: "Ortho Billing"
    label: "Average All Payer Covered Amt"
    type: average
    value_format_name: usd
    sql: ${payer_covered_amt} ;;
  }

  dimension: is_commercial_payer {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}<=400 ;;
  }

  dimension: is_government_payer {
    hidden: yes
    view_label:"Ortho Billing"
    type: yesno
    sql: ${payer}=500 OR ${payer}=600 ;;
  }

  dimension: is_self_pay {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=700 ;;
  }

  ## Add for each payer, individually
  dimension: is_humana {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=100 ;;
  }

  dimension: is_aetna {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=200 ;;
  }

  dimension: is_bcbs {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=300 ;;
  }

  dimension: is_cigna {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=400 ;;
  }

  dimension: is_medicare {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=500 ;;
  }

  dimension: is_medicaid {
    hidden: yes
    view_label: "Ortho Billing"
    type: yesno
    sql: ${payer}=600 ;;
  }

  measure: average_commercial_payer_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: ${payer_covered_amt} ;;
    value_format_name: usd
    filters: [is_commercial_payer: "Yes"]
  }

  measure: average_government_payer_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: ${payer_covered_amt} ;;
    value_format_name: usd
    filters: [is_government_payer: "Yes"]
  }

  measure: average_humana_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: IFNULL(${payer_covered_amt},0) ;;
    value_format_name: usd
    filters: [is_humana: "Yes"]
  }

  measure: average_aetna_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: IFNULL(${payer_covered_amt},0) ;;
    value_format_name: usd
    filters: [is_aetna: "Yes"]
  }

  measure: average_bcbs_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: IFNULL(${payer_covered_amt},0) ;;
    value_format_name: usd
    filters: [is_bcbs: "Yes"]
  }

  measure: average_cigna_covered_amt {
    view_label: "Ortho Billing"
    type: average
    sql: IFNULL(${payer_covered_amt},0) ;;
    value_format_name: usd
    filters: [is_cigna: "Yes"]
  }

  ## Medicare Benchmarks (Dimensions)

  dimension: average_submitted_chrg_amt {
    view_label: "Ortho Billing"
    label: "BM Avg Submitted Charges"
    type: number
    value_format_name: usd
    sql: ${TABLE}.average_submitted_chrg_amt ;;
  }

  dimension: average_medicare_allowed_amt {
    view_label: "Ortho Billing"
    label: "BM Avg Medicare Allowed Amt"
    type: number
    value_format_name: usd
    sql: ${TABLE}.average_medicare_allowed_amt ;;
  }

  dimension: average_medicare_payment_amt {
    view_label: "Ortho Billing"
    label: "BM Avg Medicare Payment Amt"
    type: number
    value_format_name: usd
    sql: ${TABLE}.average_medicare_payment_amt ;;
  }

  dimension: average_medicare_standard_amt {
    view_label: "Ortho Billing"
    label: "BM Avg Medicare Standard Payment Amt"
    type: number
    value_format_name: usd
    sql: ${TABLE}.average_medicare_standard_amt ;;
  }

  ######################## Appointment Data

    dimension_group: schedule {
      group_label: "Schedule Start"
      type: time
      timeframes: [
        raw,
        time,
        time_of_day,
        hour,
        date,
        week,
        day_of_week,
        month
      ]
      sql: ${TABLE}.appointment_schedule_start ;;
    }

    dimension_group: actual_start {
      group_label: "Actual Start"
      type: time
      timeframes: [
        raw,
        time,
        time_of_day,
        hour,
        date,
        week,
        day_of_week,
        month
      ]
      sql: ${TABLE}.appointment_start ;;
      drill_fields: [ortho_npi_facts.facility_name]

    }

    dimension_group: actual_end {
      group_label: "Actual End"
      type: time
      timeframes: [
        raw,
        time,
        time_of_day,
        hour,
        date,
        week,
        day_of_week,
        month,
      ]
      sql: ${TABLE}.appointment_end ;;
    }

    dimension: target_duration_minutes {
      hidden: yes
      type: number
      sql: ${TABLE}.target_duration_minutes ;;
    }

    dimension: is_no_show {
      type: yesno
      sql: ${TABLE}.is_no_show_yn AND ${payer}<>400 AND ${payer}<>300 AND ${payer}<>200 AND ${payer}<>100 ;;
    }

    dimension: paperwork_complete {
      type: yesno
      sql: ${TABLE}.paperwork_complete_yn ;;
    }

    measure: count_of_incomplete_paperwork {
      type: count_distinct
      sql: ${encounter_id} ;;
      filters: [paperwork_complete: "No"]
      drill_fields:[ortho_patient.patient_name,
                    ortho_npi_facts.facility_name,
                    ortho_payer.payer,
                    ortho_procedures.paperwork_complete,
                    ortho_patient.patient_email]
    }

    dimension_group: patient_check_in {
      type: time
      timeframes: [
        raw,
        time,
        hour,
        date,
        week,
        day_of_week,
        month
      ]
      sql: ${TABLE}.patient_check_in_time ;;
    }

    dimension: patient_check_in {
      type: yesno
      sql:  ${patient_check_in_raw} IS NOT NULL ;;
    }

    measure: count_of_patients_checked_in {
      type: count_distinct
      sql: ${encounter_id} ;;
      filters: [patient_check_in: "Yes", is_no_show: "No"]
      drill_fields:[ortho_patient.patient_name,
                    ortho_npi_facts.facility_name,
                    ortho_procedures.paperwork_complete,
                    ortho_patient.patient_email]
    }

    dimension: wait_time_minutes {
      type: number
      sql: ${TABLE}.wait_time_minutes ;;
    }

    dimension: reason_wait_time_id {
      type: number
      sql: ${TABLE}.reason_wait_time_id ;;
    }

    measure: average_wait_time_minutes {
      type: average
      value_format_name: decimal_0
      sql: ${wait_time_minutes} ;;
      drill_fields: [ortho_reasons_wait_time.reason_wait_time_description,
                     average_wait_time_minutes ]
    }

    measure: count_of_no_shows {
      type: count_distinct
      sql: ${encounter_id} ;;
      filters: [is_no_show: "Yes"]
      drill_fields: [ortho_patient.patient_name, ortho_npi_facts.facility_name,
                    booking_source, ortho_procedures.actual_start_date,
                    ortho_procedures.supply_category,
                    ortho_patient.patient_email]
      link: {
        label: "See Total 'No Show' Average Cost Per Case"
        url: "https://googledemo.looker.com/looks/367"
        icon_url: "http://www.looker.com/favicon.ico"
      }
    }


  ### faked booking source metrics (should update with real data) ###

   dimension: booking_source {
    type: string
    case: {
      when: {
        label: "ZocDoc"
        sql: ${ortho_payer.payer_id} = 200;;
      }
      when: {
        label: "Online Portal"
        sql: ${ortho_payer.payer_id} IN (600,400,100);;
      }
      when: {
        label: "Phone"
        sql: ${ortho_payer.payer_id} IN (700,500,300);;
      }
      else: "Not specified"
    }
   }

    dimension: supply_category {
      view_label: "Ortho Supplier Costs"
      type: string
      case: {
        when: {
          label: "Knee Implant"
          sql: ${ortho_cpt_codes.cpt_code} IN ('27447', '29880', '29881');;
        }
        when: {
          label: "Hip Implant"
          sql: ${ortho_cpt_codes.cpt_code} = '27130';;
        }

        else: "Other"
      }
    }

    dimension: supply_costs {
      view_label: "Ortho Supplier Costs"
      type: number
      description: "Supply costs for hip or knee implants"
      sql: CASE WHEN ${supply_category}="Knee Implant" THEN ${ortho_supplier_costs.knee_implants}
                WHEN ${supply_category}="Hip Implant" THEN  ${ortho_supplier_costs.hip_implants}
                ELSE 0 END;;
      value_format_name: usd
    }

    measure: total_supply_costs{
      view_label: "Ortho Supplier Costs"
      type: sum
      sql: ${supply_costs} ;;
      value_format_name: usd
    }

    measure: no_show_rate {
      type: number
      value_format_name: percent_0
      sql: 1.0*${count_of_no_shows}/NULLIF(${count_cases},0) ;;
      # drill_fields: [ortho_patient.patient_name, ortho_npi_facts.facility_name,
      #               booking_source, ortho_procedures.actual_start_time,
      #               ortho_procedures.actual_end_time, ortho_procedures.supply_category,
      #               ortho_payer.payer, ortho_patient.patient_email, no_show_rate]
      drill_fields: [ortho_npi_facts.facility_name, count_of_no_shows]
    }

    measure: count_patients {
    label: "Count of Patients"
    type: count_distinct
    sql: ${patient_id}  ;;
      drill_fields:[ortho_patient.patient_name,
                    ortho_npi_facts.facility_name,
                    ortho_procedures.paperwork_complete,
                    ortho_patient.patient_email]
  }

    measure: count_cases {
      label: "Count of Cases"
      type: count_distinct
      sql: ${unique_id} ;;
      drill_fields:[ortho_patient.patient_name,
                    ortho_npi_facts.facility_name,
                    ortho_cpt_codes.cpt_code,
                    ortho_cpt_codes.cpt_description,
                    ortho_payer.payer,
                    ortho_procedures.paperwork_complete,
                    ortho_patient.patient_email]
  }

}
