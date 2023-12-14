view: ortho_reasons_wait_time {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_reasons_wait_time`
    ;;

  label: "Ortho Procedures"

  dimension: reason_wait_time_id {
    hidden: yes
    type: number
    sql: ${TABLE}.reason_wait_time_id ;;
  }

  dimension: reason_wait_time_description {
    type: string
    sql: ${TABLE}.reason_wait_time_description ;;
    drill_fields: [ortho_procedures.patient_id,
                   ortho_npi_facts.facility_name]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [ ortho_patient.patient_name,
                    ortho_encounters.facility,
                    ortho_encounters.schedule_time_of_day,
                    ortho_encounters.paperwork_complete,
                    ortho_patient.patient_email]
  }
}
