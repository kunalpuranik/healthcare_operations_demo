view: ortho_supplier_preferences {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_supplier_preferences`
    ;;

  label: "Ortho Supplier Costs"

  dimension: npi {
    type: number
    sql: ${TABLE}.npi ;;
  }

  dimension: supplier_name {
    type: string
    sql: ${TABLE}.supplier_name ;;
    drill_fields: [ortho_npi_facts.facility_name, ortho_npi_facts.npi]

    action: {
      label: "Email VP of Supply Chain"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "{{ value }} Contract"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello,

        Can we meet to discuss our contract with {{ value }}? We may want to conduct a Physician Preference Item review - it looks like their contract is up for renewal soon.

Please let me know your availability.

Thank you!"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: [supplier_name]
  }
}
