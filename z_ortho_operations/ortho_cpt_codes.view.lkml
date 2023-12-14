view: ortho_cpt_codes {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_cpt_codes`
    ;;

  label: "Ortho Procedures"

  ## CPT Codes

  dimension: cpt_code {
    primary_key: yes
    type: string
    sql: ${TABLE}.cpt_code ;;
    drill_fields: [ortho_procedures.patient_id, ortho_npi_facts.facility_name]

#     link: {
#       label: "Map SNOWMED to ICD-10"
#       url: "https://imagic.nlm.nih.gov/imagic/code/map?v=5&js=true&pabout=&pinstructions=&init-params=&pat=My+Patient&pat.init=My+Patient&q.f=&q.dob=&p=cad2f1b3z0&p.cad2f1b3z0.e={{ display._value }}&pdone=Get+ICD+Codes&qadd="
#       icon_url: "https://www.nih.gov/sites/default/files/about-nih/2012-logo.png"
#     }

    action: {
      label: "Email Department Director"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Departmental Strategy Session"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello,

        Can we meet to discuss case volume for CPT Code: {{ value }} ({{ cpt_description._value }})? I'd like us to review possible performance improvement strategies and continue to monitor.

        Please let me know your availability for the next two weeks, thank you!"
    }
   }
  }

  dimension: cpt_description {
    label: "Procedure"
    type: string
    sql: ${TABLE}.cpt_description ;;
  }

  ## Medicare Benchmarks

  dimension: average_medicare_allowed_amt {
    hidden: yes
    type: number
    sql: ${TABLE}.average_medicare_allowed_amt ;;
  }

  dimension: average_medicare_payment_amt {
    hidden: yes
    type: number
    sql: ${TABLE}.average_medicare_payment_amt ;;
  }

  dimension: average_medicare_standard_amt {
    hidden: yes
    type: number
    sql: ${TABLE}.average_medicare_standard_amt ;;
  }

  dimension: average_submitted_chrg_amt {
    hidden: yes
    type: number
    sql: ${TABLE}.average_submitted_chrg_amt ;;
  }

  measure: count {
    hidden: yes
    type: count
    drill_fields: []
  }
}
