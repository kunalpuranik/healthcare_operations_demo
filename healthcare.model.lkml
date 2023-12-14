connection: "looker-private-demo"
# include: "/demo_vitals/*.view.lkml"
include: "/simplified_views/*.view.lkml"
include: "/unnested_views/*.view.lkml"
include: "/realtime_views/*.view.lkml"
include: "/data_science/*.view.lkml"
include: "dashboards/*.dashboard.lookml"
include: "*.view"
label: "Healthcare Systems and Providers"
include: "/readmission_bqml/*.dashboard.lookml"
include: "/readmission_bqml/*.view.lkml"

############ Unnested Explores #############

####### Step 1: Base explores

explore: encounter {
  fields: [ALL_FIELDS*,-encounter.hospital_concat_date]
  hidden: yes
  label: "Unnested Encounter"
  join: encounter__meta__profile {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${encounter.meta__profile}) as encounter__meta__profile;;
  }
  join: encounter__hospitalization__discharge_disposition__coding {
    sql: LEFT JOIN UNNEST(${encounter.hospitalization__discharge_disposition__coding}) as encounter__hospitalization__discharge_disposition__coding ;;
    relationship: one_to_many
  }
  join: encounter__hospitalization__admit_source__coding {
    sql: LEFT JOIN UNNEST(${encounter.hospitalization__admit_source__coding}) as encounter__hospitalization__admit_source__coding ;;
    relationship: one_to_many
  }
  join: encounter__hospitalization__readmission__coding {
    sql: LEFT JOIN UNNEST(${encounter.hospitalization__readmission__coding}) as encounter__hospitalization__readmission__coding ;;
    relationship: one_to_many
  }
  join: encounter__location {
    sql: LEFT JOIN UNNEST(${encounter.location}) as encounter__location ;;
    relationship: one_to_many
  }
  join: encounter__participant {
    sql: LEFT JOIN UNNEST(${encounter.participant}) as encounter__participant ;;
    relationship: one_to_many
  }
  join: encounter__reason {
    sql: LEFT JOIN UNNEST(${encounter.reason}) as encounter__reason ;;
    relationship: one_to_many
  }
  join: encounter__reason__coding {
    sql: LEFT JOIN UNNEST(${encounter__reason.coding}) as encounter__reason__coding ;;
    relationship: one_to_many
  }
  join: encounter__type {
    sql: LEFT JOIN UNNEST(${encounter.type}) as encounter__type ;;
    relationship: one_to_many
  }
  join: encounter__type__coding {
    sql: LEFT JOIN UNNEST(${encounter__type.coding}) as encounter__type__coding ;;
    relationship: one_to_many
  }
}

explore: diagnostic_report {
  hidden: yes
  label: "Unnested Diagnostic Report"
  join: diagnostic_report__code__coding {
    sql: LEFT JOIN UNNEST(${diagnostic_report.code__coding}) as diagnostic_report__code__coding ;;
    relationship: one_to_many
  }
  join: diagnostic_report__result {
    sql: LEFT JOIN UNNEST(${diagnostic_report.result}) as diagnostic_report__result ;;
    relationship: one_to_many
  }
}

explore: condition {
  hidden: yes
  label: "Unnested Condition"
  join: condition__meta__profile {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${condition.meta__profile}) as condition__meta__profile;;
  }
  join: condition__code__coding {
    sql: LEFT JOIN UNNEST(${condition.code__coding}) as condition__code__coding ;;
    relationship: one_to_many
  }
  join: condition__category {
    sql: LEFT JOIN UNNEST(${condition.category}) as condition__category ;;
    relationship: one_to_many
  }
  join: condition__category__coding {
    sql: LEFT JOIN UNNEST(${condition__category.coding}) as condition__category__coding ;;
    relationship: one_to_many
  }
}

explore: medication_request {
  hidden: yes
  label: "Unnested Medication Request"
  join: medication_request__meta__profile {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${medication_request.meta__profile}) as medication_request__meta__profile;;
  }
  join: medication_request__medication__codeable_concept__coding {
    sql: LEFT JOIN UNNEST(${medication_request.medication__codeable_concept__coding}) as medication_request__medication__codeable_concept__coding ;;
    relationship: one_to_many
  }
  join: medication_request__extension__codeable_concept__coding {
    sql: LEFT JOIN UNNEST(${medication_request.code_extension__value__codeable_concept__coding}) as medication_request__extension__codeable_concept__coding ;;
    relationship: one_to_many
  }
}

explore: observation {
  hidden: yes
  label: "Unnested Observation"
  join: observation__meta__profile {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${observation.meta__profile}) as observation__meta__profile;;
  }
  join: observation__category {
    sql: LEFT JOIN UNNEST(${observation.category}) as observation__category ;;
    relationship: one_to_many
  }
  join: observation__category__coding {
    sql: LEFT JOIN UNNEST(${observation__category.coding}) as observation__category__coding ;;
    relationship: one_to_many
  }
  join: observation__component {
    sql: LEFT JOIN UNNEST(${observation.component}) as observation__component ;;
    relationship: one_to_many
  }
  join: observation__component__code__coding {
    sql: LEFT JOIN UNNEST(${observation__component.code__coding}) as observation__component__code__coding ;;
    relationship: one_to_many
  }
}

explore: organization {
  hidden: yes
  label: "Unnested Organization"
  join: organization__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${organization.address}) as organization__address;;
  }
  join: organization__identifier {
    sql: LEFT JOIN UNNEST(${organization.identifier}) as organization__identifier ;;
    relationship: one_to_many
  }
  join: organization__type {
    sql: LEFT JOIN UNNEST(${organization.type}) as organization__type ;;
    relationship: one_to_many
  }
  join: organization__meta__profile {
    sql: LEFT JOIN UNNEST(${organization.meta__profile}) as organization__meta__profile ;;
    relationship: one_to_many
  }
}

explore: patient {
  hidden: yes
  label: "Patient Details"
  join: patient__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${patient.address}) as patient__address;;
  }
  join: patient__identifier {
    sql: LEFT JOIN UNNEST(${patient.identifier}) as patient__identifier ;;
    relationship: one_to_many
  }
  join: patient__communication {
    sql: LEFT JOIN UNNEST(${patient.communication}) as patient__communication ;;
    relationship: one_to_many
  }
  join: patient__meta__profile {
    sql: LEFT JOIN UNNEST(${patient.meta__profile}) as patient__meta__profile ;;
    relationship: one_to_many
  }
#   join: patient__contact__period {
#     sql: LEFT JOIN UNNEST(${patient__contact.period} as patient__contact__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__address {
#     sql: LEFT JOIN UNNEST(${patient__contact.address} as patient__contact__address ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__address__period {
#     sql: LEFT JOIN UNNEST(${patient__contact__address.period} as patient__contact__address__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact {
#     sql: LEFT JOIN UNNEST(${patient.contact} as patient__contact ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization {
#     sql: LEFT JOIN UNNEST(${patient__contact.organization} as patient__contact__organization ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__period {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier.period} as patient__contact__organization__identifier__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization.identifier} as patient__contact__organization__identifier ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier.assigner} as patient__contact__organization__identifier__assigner ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner__identifier__period {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__assigner__identifier.period} as patient__contact__organization__identifier__assigner__identifier__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner__identifier {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__assigner.identifier} as patient__contact__organization__identifier__assigner__identifier ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner__identifier__assigner {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__assigner__identifier.assigner} as patient__contact__organization__identifier__assigner__identifier__assigner ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner__identifier__type__coding {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__assigner__identifier__type.coding} as patient__contact__organization__identifier__assigner__identifier__type__coding ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__assigner__identifier__type {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__assigner__identifier.type} as patient__contact__organization__identifier__assigner__identifier__type ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__type__coding {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier__type.coding} as patient__contact__organization__identifier__type__coding ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__organization__identifier__type {
#     sql: LEFT JOIN UNNEST(${patient__contact__organization__identifier.type} as patient__contact__organization__identifier__type ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__name {
#     sql: LEFT JOIN UNNEST(${patient__contact.name} as patient__contact__name ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__name__period {
#     sql: LEFT JOIN UNNEST(${patient__contact__name.period} as patient__contact__name__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__telecom__period {
#     sql: LEFT JOIN UNNEST(${patient__contact__telecom.period} as patient__contact__telecom__period ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__telecom {
#     sql: LEFT JOIN UNNEST(${patient__contact.telecom} as patient__contact__telecom ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__relationship__coding {
#     sql: LEFT JOIN UNNEST(${patient__contact__relationship.coding} as patient__contact__relationship__coding ;;
#     relationship: one_to_many
#   }
#   join: patient__contact__relationship {
#     sql: LEFT JOIN UNNEST(${patient__contact.relationship} as patient__contact__relationship ;;
#     relationship: one_to_many
#   }
}

explore: procedure {
  hidden: yes
  label: "Unnested Procedure"
  join: procedure__code__coding {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${procedure.code__coding}) as procedure__code__coding;;
  }
  join: procedure__meta__profile {
    sql: LEFT JOIN UNNEST(${procedure.meta__profile}) as procedure__meta__profile ;;
    relationship: one_to_many
  }
}

explore: practitioner {
  hidden: yes
  label: "Unnested Practitioners"
  join: practitioner__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${practitioner.address}) as practitioner__address;;
  }
  join: practitioner__identifier {
    sql: LEFT JOIN UNNEST(${practitioner.identifier}) as practitioner__identifier ;;
    relationship: one_to_many
  }
}

explore: claim {
  join: claim__diagnosis {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${claim.diagnosis}) as claim__diagnosis;;
  }
  join: claim__information {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${claim.diagnosis}) as claim__diagnosis;;
  }
}

####### Step 2: Extend explores together

explore: patient_encounter {
  hidden: no
  extends: [encounter,patient, diagnostic_report]
  from: encounter
  view_name: encounter
  label: "Patient Encounter"
  join: patient {
    relationship: many_to_one
    sql_on: ${encounter.patient_id} = ${patient.id} ;;
  }
  join: organization {
    relationship: many_to_one
    sql_on: ${organization.id} = ${encounter.organization_id} ;;
  }
  join: organization__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${organization.address}) as organization__address;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${encounter__participant.practitionerId} ;;
  }
  join: diagnostic_report {
    relationship: many_to_one
    sql_on: ${diagnostic_report.context__encounter_id} = ${encounter.id} ;;
  }
}

explore: observation_extended {
  hidden: yes
  extends: [encounter,observation,organization]
  from: observation
  view_name: observation
  label: "Observations"
  join: encounter {
    relationship: many_to_one
    sql_on: ${observation.context__encounter_id} = ${encounter.id} ;;
  }
  join: organization {
    relationship: many_to_one
    sql_on: ${organization.id} = ${encounter.organization_id} ;;
  }
  join: organization__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${organization.address}) as organization__address;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${encounter__participant.practitionerId} ;;
  }
}

explore: condition_extended {
  hidden: no
  label: "Diagnoses & Medication Requests"
  extends: [condition,encounter,medication_request,patient,organization]
  from: condition
  view_name: condition
  join: encounter {
    relationship: many_to_one
    sql_on: ${condition.context__encounterId} = ${encounter.id} ;;
  }
  join: medication_request {
    relationship: many_to_many
    sql_on: ${medication_request.context__encounter_id} = ${encounter.id} ;;
  }
  join: patient {
    relationship: many_to_one
    sql_on: ${encounter.patient_id} = ${patient.id} ;;
  }
  join: patient_facts {
    type: left_outer
    relationship: one_to_one
    sql_on: ${patient_facts.patient_id} = ${patient.id} ;;
  }
  join: organization {
    relationship: many_to_one
    sql_on: ${organization.id} = ${encounter.organization_id} ;;
  }
  join: organization__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${organization.address}) as organization__address;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${encounter__participant.practitionerId} ;;
  }
}

explore: observation_vitals {
  fields: [ALL_FIELDS*, -patient.is_wellness_screened_in_the_past_year]
  label: "Vitals Monitoring"
  join: patient {
    relationship: many_to_one
    sql_on: ${observation_vitals.patient_id} = ${patient.id} ;;
  }
  join: organization {
    relationship: many_to_one
    sql_on: ${organization.id} = ${observation_vitals.organization_id} ;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${observation_vitals.practitioner_id} ;;
  }
  join: vital_fact {
    view_label: "Vital"
    relationship: many_to_one
    sql_on: ${vital_fact.vital_type}=${observation_vitals.type} ;;
  }
  join: observation_count_by_vital {
    relationship: many_to_one
    sql_on: ${observation_count_by_vital.type}=${observation_vitals.type} ;;
  }
}

explore: observation_vitals_simple {
  label: "Interactions"
  hidden: yes
  from: observation_vitals
  view_name: observation_vitals
  view_label: "Interactions"
  sql_always_where: ${observation_vitals.issued_date} <= '2020-06-23' ;;
  always_filter: {
    filters: [observation_vitals.issued_date: "2020/05/15 to 2020/06/23"]
  }
  fields: [
      observation_vitals.observation_id
    , observation_vitals.patient_id
    , observation_vitals.issued_date
    , observation_vitals.issued_day_of_week
    , observation_vitals.issued_hour_of_day
    , observation_vitals.issued_month
    , observation_vitals.issued_week
    , observation_vitals.issued_year
    , observation_vitals.count
    , patient.age
    , patient.age_tier
    , patient.us_core_birthsex
    , patient.us_core_ethnicity
    , patient.gender
    , patient.name
    , patient.ssn_hashed
    , patient.us_core_race
    , patient.average_age
    , patient.count
    , practitioner.active
    , practitioner.gender
    , practitioner.id
    , patient.id
    , practitioner.investigator
    , practitioner.count
  ]
  join: patient {
    relationship: many_to_one
    sql_on: ${observation_vitals.patient_id} = ${patient.id} ;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${observation_vitals.practitioner_id} ;;
  }
}

explore: readmission {
  label: "Readmissions"
  hidden: no
  join: condition {
    type: left_outer
    relationship: many_to_one
    sql_on: ${condition.context__encounterId} = ${readmission.encounter_id} ;;
  }
  join: condition__code__coding {
    sql: LEFT JOIN UNNEST(${condition.code__coding}) as condition__code__coding ;;
    relationship: one_to_many
  }
  join: prior_condition {
    from: condition
    type: left_outer
    relationship: many_to_one
    sql_on: ${prior_condition.context__encounterId} = ${readmission.prior_encounter_id};;
  }
  join: prior_condition__code__coding {
    view_label: "Prior Condition"
    from: condition__code__coding
    sql: LEFT JOIN UNNEST(${prior_condition.code__coding}) as prior_condition__code__coding ;;
    relationship: one_to_many
  }
  extends: [patient]
  join: patient {
    type: left_outer
    relationship: many_to_one
    sql_on: ${patient.id}=${readmission.patient_id} ;;
  }
}

####### Step 3: FHIR Explore

explore: encounter_extended {
  hidden: no
  extends: [encounter,patient,observation, condition]
  from: encounter
  view_name: encounter
  label: "FHIR (older, simpler version)"
  join: patient {
    relationship: many_to_one
    sql_on: ${encounter.patient_id} = ${patient.id} ;;
  }
  join: organization {
    relationship: many_to_one
    sql_on: ${organization.id} = ${encounter.organization_id} ;;
  }
  join: organization__address {
    relationship: many_to_one
    sql: LEFT JOIN UNNEST(${organization.address}) as organization__address;;
  }
  join: practitioner {
    relationship: many_to_one
    sql_on: ${practitioner.id} = ${encounter__participant.practitionerId} ;;
  }
  join: encounter_readmission_predictions {
    view_label: "Encounter"
    fields: [encounter_readmission_predictions.readmission_risk_score]
    relationship: one_to_one
    sql_on: ${encounter.id} = ${encounter_readmission_predictions.encounter_id};;
  }
  join: condition {
    relationship: one_to_many
    sql_on: ${condition.context__encounterId} = ${encounter.id} ;;
  }
  join: observation {
    relationship: many_to_one
    sql_on: ${observation.context__encounter_id} = ${encounter.id} ;;
  }
  join: bqml_predict {
    relationship: one_to_one
    sql_on: ${bqml_predict.encounter_id} = ${observation.context__encounter_id} and ${bqml_predict.encounter_id} = ${condition.context__encounterId} ;;
  }
  join: healthcare_days_since_readmission {
    relationship: one_to_one
    sql_on: ${healthcare_days_since_readmission.encounter_id} = ${encounter.id};;
  }
  aggregate_table: simple_rollup {
    query: {
      dimensions: [
        encounter.length_of_stay_tier,
        encounter.period__end_date,
        encounter.period__start_date,
        encounter_readmission_predictions.readmission_risk_score,
        observation__category__coding.display,
        patient.age_tier,
        patient.gender
      ]
      measures: [encounter.average_los, encounter.count_patients, encounter.latest_encounter, observation.count, patient.average_age]
      filters: [encounter.period__start_date: "12 months"]
      timezone: "America/Los_Angeles"
    }

    materialization: {
      datagroup_trigger: once_weekly
    }
  }
}


## CCF

explore: patient_encounter_ccf {
  extends: [encounter_extended]
  from: encounter
  view_name: encounter
  label: "CCF - FHIR"

  join: condition {
    relationship: one_to_many
    sql_on: ${condition.context__encounterId} = ${encounter.id} ;;
  }
  join: observation {
    relationship: many_to_one
    sql_on: ${observation.context__encounter_id} = ${encounter.id} ;;
  }
}














############ Simplified View Explores #############

explore: condition_simple {
  view_label: "Condition"
  label: " Simplified Patient, Encounter & Condition"
  join: patient_simple {
    view_label: "Patient"
    type: left_outer
    relationship: many_to_one
    sql_on: ${condition_simple.patient_id} = ${patient_simple.id} ;;
  }
  join: encounter_simple {
    view_label: "Encounter"
    type: left_outer
    relationship: many_to_one
    sql_on: ${encounter_simple.id} = ${condition_simple.encounter_id} ;;
  }
}

explore: realtime_observations {
  hidden: yes
  join: vital_fact {
    view_label: "Vital"
    relationship: many_to_one
    sql_on: ${vital_fact.vital_type}=${realtime_observations.type} ;;
  }
}

############# Readmission BQML ###########################
explore: healthcare_bqml_confusion_matrix {}
explore: healthcare_bqml_predict1 {}
explore: bqml_predict {}
explore: new_patient_predictions_info_schema {}
explore: healthcare_bqml_eval1 {}
explore: healthcare_training_info1 {}
explore: healthcare_bqml_predict {
  join: prediction_probs {
    sql: LEFT JOIN UNNEST(${healthcare_bqml_predict.predicted_readmission_within_7_probs}) as prediction_probs ;;
  }
}
explore: healthcare_bqml_eval {}
explore: healthcare_bqml_matrix_unseen {}
explore: healthcare_bqml_matrix_seen {}
explore: healthcare_bqml_roc {}
explore: healthcare_bqml_new_patients {}
explore: healthcare_bqml_new_patient_predictions {
  join: prediction_probs {
    sql: LEFT JOIN UNNEST(${healthcare_bqml_new_patient_predictions.predicted_readmission_within_7_probs}) as prediction_probs ;;
  }
}
explore: new_patient_info_schema {}
explore: patient_survey {}

explore: healthcare_predictions {}
############ Caching Logic ############

persist_with: once_weekly

### PDT Timeframes

datagroup: once_daily {
  max_cache_age: "24 hours"
  sql_trigger: SELECT current_date() ;;
}

datagroup: once_weekly {
  max_cache_age: "168 hours"
  sql_trigger: SELECT extract(week from current_date()) ;;
}

datagroup: once_monthly {
  max_cache_age: "720 hours"
  sql_trigger: SELECT extract(month from current_date()) ;;
}

datagroup: once_yearly {
  max_cache_age: "9000 hours"
  sql_trigger: SELECT extract(year from current_date()) ;;
}
