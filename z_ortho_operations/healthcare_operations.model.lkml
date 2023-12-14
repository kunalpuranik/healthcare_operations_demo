connection: "looker-private-demo"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project
include: "*.view.lkml"
#include: "/radiology/*.view.lkml"
# include: "/**/view.lkml"                   # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard
include: "/ortho_facilities.dashboard"
include: "/ortho_operations.dashboard"

explore: ortho_procedures {

  label: "Orthopedic Surgery Cases"

  sql_always_where: ${ortho_patient.patient_name} IS NOT NULL ;;

  join: ortho_patient {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_procedures.patient_id} = ${ortho_patient.patient_id} ;;
  }

  join: ortho_payer {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_procedures.payer} = ${ortho_payer.payer_id} ;;
  }

  join: ortho_npi_facts {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_procedures.npi} = ${ortho_npi_facts.npi} ;;
  }

  join: ortho_supplier_preferences {
    relationship: one_to_one
    type: inner
    sql_on: ${ortho_npi_facts.npi} = ${ortho_supplier_preferences.npi} ;;
  }

  join: ortho_supplier_costs {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_supplier_preferences.supplier_name} = ${ortho_supplier_costs.supplier_name} ;;
  }

  join: ortho_facilities {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_npi_facts.facility_name} = ${ortho_facilities.facility} ;;
  }

  join: ortho_cpt_codes {
    relationship: many_to_one
    sql_on: CAST(${ortho_procedures.cpt_code} AS STRING) = CAST(${ortho_cpt_codes.cpt_code} AS STRING) ;;
    type: inner
  }

  join: ortho_reasons_wait_time {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_procedures.reason_wait_time_id} = ${ortho_reasons_wait_time.reason_wait_time_id} ;;
  }

  join: us_zip_code_latitude_and_longitude {
    relationship: many_to_one
    type: inner
    sql_on: ${ortho_patient.patient_zip} = ${us_zip_code_latitude_and_longitude.zip} ;;
  }
}








######################################################Radiology Use Case############################################################
# explore: radiology_appointments {
#   label: "Radiology Appointments"
#
#   join: radiology_cpt_codes {
#     relationship: many_to_one
#     sql_on: ${radiology_appointments.cpt_code} = ${radiology_cpt_codes.cpt_code};;
#   }
#
#   join: radiology_facility {
#     relationship: many_to_one
#     sql_on:  ${radiology_appointments.clinic} = ${radiology_facility.facility_name} AND
#              ${radiology_appointments.system} = ${radiology_facility.provider_name};;
#   }
#
#   join: hours {
#     type: full_outer
#     relationship: many_to_one
#     sql_on: CAST(${radiology_appointments.hour_start} AS STRING) = CAST(${hours.hours} AS STRING);;
#   }
# }
#
# explore: radiology_appointment_dim {}
