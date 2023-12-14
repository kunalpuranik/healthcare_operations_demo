view: readmission_b {
  derived_table: {
    sql: SELECT
          encounter.id  AS encounter_id,
          encounter.serviceProvider.organizationId as organization_id,
          encounter.subject.patientId  AS patient_id,
          case when encounter.class.code = 'IMP' then 'Inpatient'
            when encounter.class.code = 'AMB' then 'Ambulatory'
            when encounter.class.code = 'EMER' then 'Emergency Department' end AS encounter_code_name,
          encounter.period.start as visit_start,
          rank () over (partition by encounter.subject.patientId order by encounter.period.start desc) as encounter_rank
          FROM ${encounter.SQL_TABLE_NAME}  AS encounter
        GROUP BY 1,2,3,4,5
    ;;
      persist_for: "24 hours"
    }


    dimension: encounter_id {
      primary_key: yes
    }

    dimension: patient_id {}

    dimension: organization_id {}

    dimension: encounter_code_name {}

    dimension_group: visit_start {
      type: time
      timeframes: [raw, date, time]
      sql: ${TABLE}.visit_start ;;
    }

    dimension: encounter_rank {}
  }
