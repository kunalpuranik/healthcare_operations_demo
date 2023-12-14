view: condition_simple {
  sql_table_name: `looker-private-demo.healthcare_demo_live.simple_condition` ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.condition_id ;;
  }


  dimension: category_code {
    type: string
    sql: ${TABLE}.condition__category__coding_code ;;
  }

  dimension: category_display {
    type: string
    sql: ${TABLE}.condition__category__coding_display ;;
  }

  dimension: condition_code {
    label: "Condition Code"
    #group_label: "Code"
    type: string
    sql: ${TABLE}.code ;;
    link: {
      label: "Map SNOWMED to ICD-10"
      url: "https://imagic.nlm.nih.gov/imagic/code/map?v=5&js=true&pabout=&pinstructions=&init-params=&pat=My+Patient&pat.init=My+Patient&q.f=&q.dob=&p=cad2f1b3z0&p.cad2f1b3z0.e={{ display._value }}&pdone=Get+ICD+Codes&qadd="
      icon_url: "https://www.nih.gov/sites/default/files/about-nih/2012-logo.png"
    }
    link: {
      label: "Condition Lookup Dashboard"
      icon_url: "https://avatars0.githubusercontent.com/u/1437874?s=400&v=4"
      url: "/dashboards/TU4SBUVLvW1gDzfwCms2ji?Condition%20Code={{ value }}"
    }
    action: {
      label: "Email Department Head"
      url: "https://postman-echo.com/post"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Departmental OKR Session"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello,

        We've identified your department as an area of opportunity to improve our readmissions rates. I'd like to schedule an OKR planning session to present our deep dive analysis, and create key goals for your department and alerts to monitor success.

        Please let me know your availability for the next two weeks, thank you!"
      }
    }
  }

  dimension: condition_display {
    label: "Condition Name"
    type: string
    sql: ${TABLE}.condition__code__coding_display ;;
  }

  dimension: clinical_status {
    type: string
    sql: ${TABLE}.condition_clinical_status ;;
  }

  dimension: encounter_id {
    type: string
    sql: ${TABLE}.condition_context__encounterid_1 ;;
  }

  dimension_group: onset {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.condition_onset_time ;;
  }

  dimension: patient_id {
    type: string
    sql: ${TABLE}.condition_subject__patient_id ;;
  }

  dimension: verification_status {
    type: string
    sql: ${TABLE}.condition_verification_status ;;
  }

  measure: count {
    label: "Number of Conditions"
    type: count
    drill_fields: [condition_code, condition_display, category_code, category_display]
  }
}
