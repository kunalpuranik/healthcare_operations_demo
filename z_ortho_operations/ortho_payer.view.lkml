view: ortho_payer {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_payer`
    ;;

  dimension: payer_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.payer_id ;;
  }

  dimension: payer {
    type: string
    sql: ${TABLE}.payer ;;

    action: {
      label: "Email VP of Revenue Cycle"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Revenue Cycle Strategy Session"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello,

        Can we meet to discuss our payer trends, particularly with {{ ortho_payer.payer_type._value }}?  I'd like us to review possible interventions for performance improvement strategies and continue to monitor.

        Please let me know your availability for the next two weeks, thank you!"
      }
    }

    link: {
      label: "Website"
      url: "http://www.google.com/search?q={{ value | encode_uri }}"
      icon_url: "http://www.google.com/s2/favicons?domain=www.{{ value | encode_uri }}.com"
    }
  }

  dimension: payer_percent_coverage {
    type: number
    value_format_name: percent_0
    sql: IFNULL(${TABLE}.payer_percent_coverage,0) ;;
  }

  dimension: payer_type {
    type: string
    sql: ${TABLE}.payer_type ;;
    drill_fields: [ortho_npi_facts.facility_name]

    action: {
      label: "Email VP of Revenue Cycle"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Revenue Cycle Strategy Session"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello,

        Can we meet to discuss our payer trends, particularly with {{ ortho_payer.payer_type._value }}?  I'd like us to review possible interventions for performance improvement strategies and continue to monitor.

        Please let me know your availability for the next two weeks, thank you!"
      }
    }
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
