view: ortho_supplier_costs {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_supplier_costs`
    ;;

  label: "Ortho Supplier Costs"

  dimension: hip_implants {
    hidden: yes
    type: number
    sql: ${TABLE}.hip_implants ;;
    value_format_name: usd
  }

  dimension: knee_implants {
    hidden: yes
    type: number
    sql: ${TABLE}.knee_implants ;;
    value_format_name: usd
  }

  dimension: supplier_name {
    hidden: yes
    type: string
    sql: ${TABLE}.supplier_name ;;
    drill_fields: [ortho_npi_facts.facility_name, ortho_npi_facts.npi]
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: [supplier_name]
  }

  dimension: contract_renewal_year {
    view_label: "Ortho Supplier Costs"
    type: string
    case: {
      when: {
        label: "2023"
        sql: ${supplier_name} = 'Zimmer Biomet';;
      }
      when: {
        label: "2025"
        sql: ${supplier_name} = 'Stryker';;
      }
      when: {
        label: "2022"
        sql: ${supplier_name} = 'Depuy Synthes';;
      }
      when: {
        label: "2021"
        sql: ${supplier_name} = 'Medtronic';;
      }
      when: {
        label: "2024"
        sql: ${supplier_name} = 'Smith & Nephew';;
      }
      when: {
        label: "2021"
        sql: ${supplier_name} = 'NuVasive';;
      }
      else: "2020"
    }
  }
}
