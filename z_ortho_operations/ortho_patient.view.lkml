view: ortho_patient {
  sql_table_name: `looker-private-demo.healthcare_operations.ortho_patient`
    ;;

  dimension: patient_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.patient_id ;;
  }

  dimension: first_name {
    hidden: yes
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    hidden: yes
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: patient_name {
    type: string
    sql: ${first_name} || " " || ${last_name} ;;
    action: {
      label: "Send to Microsoft Teams to Check Eligibility"
      icon_url: "https://apprecs.org/ios/images/app-icons/256/aa/1113153706.jpg"
      url: "https://us-central1-looker-private-demo.cloudfunctions.net/sendtomsteams"

      param: {
        name: "msteamswebhook"
        value: "https://outlook.office.com/webhook/ea063618-4f80-4b0e-9e56-ba2fa46cce15@d218a038-fce6-4d24-b555-da29bdb61480/IncomingWebhook/a5d535f262ca40978bc1f14dadc19b46/d9cd9560-7bf0-4648-879a-ea56deebb579"
      }

      param: {
        name: "link"
        value: "https://demo.looker.com/dashboards/pwSkck3zvGd1fnhCO7Fc12?Campaign%20Name={{value | encode_uri}}"
      }

      param: {
        name: "linktext"
        value: "{{value}} - Check Medicare/Medicaid Eligibility"
      }

      form_param: {
        name: "Subject"
        type: string
        default: "Check Medicare/Medicaid Eligibility"
      }

      form_param: {
        name: "Recipient"
        type: string
        default: "Scheduling/Patient Check-in Team"
      }

      form_param: {
        name: "Message"
        type: textarea
        default: "Hello,

        Please provide eligibility paperwork for Medicare/Medicaid enrollee program to {{value}} prior to their upcoming appointment.

Thank you."
      }
    }
  }

  dimension: patient_age {
    type: number
    sql: ${TABLE}.patient_age ;;
  }

  dimension: patient_age_tier {
    type: tier
    tiers: [10,20,30,40,50,60,70]
    style: integer
    sql: ${patient_age} ;;
  }

  dimension: patient_gender {
    type: string
    sql: ${TABLE}.patient_gender ;;
  }

  dimension: patient_race {
    type: string
    sql: ${TABLE}.patient_race ;;
  }

  dimension: patient_email {
    type: string
    sql: CASE WHEN LENGTH(first_name) <= 7 THEN LOWER(REPLACE(${first_name}," ", "") || "." || ${last_name} || "@gmail.com")
              WHEN LENGTH(first_name) >= 8 AND LENGTH(first_name) <= 10 THEN LOWER(REPLACE(${first_name}," ", "") || "." || ${last_name} || "@hotmail.com")
              ELSE LOWER(REPLACE(${first_name}," ", "") || "." || ${last_name} || "@yahoo.com") END ;;

    tags: ["email"]

    action: {
      label: "Email Patient Reminder"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"

      param: {
        name: "some_auth_code"
        value: "abc123456"
      }

      form_param: {
        name: "Subject"
        required: yes
        default: "Follow-up Appointment Reminder"
      }

      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
  "Hello {{ first_name }},

        This is a friendly reminder - your next appointment is coming up! Please remember to update your insurance information in our patient portal prior to your visit.

Best,
The Ortho Staff at {{ ortho_facilities.facility }}"
      }
    }

    action: {
      label: "Email Patient - We Missed You!"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"

      param: {
        name: "some_auth_code"
        value: "abc123456"
      }

      form_param: {
        name: "Subject"
        required: yes
        default: "We Missed You!"
      }

      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hello {{ first_name }},

        Please reschedule at your earliest convenience on the patient portal and take 2 minutes to complete our survey.

        Best,
        The Ortho Staff at {{ ortho_facilities.facility }}"
      }
    }
  }

  dimension: patient_zip {
    type: zipcode
    sql: IFNULL(${TABLE}.patient_zip, ${ortho_facilities.facility_zip}) ;;
  }

  measure: count {
    type: count
    drill_fields: [last_name, first_name]
  }
}
