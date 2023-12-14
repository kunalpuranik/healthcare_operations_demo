#########  Original Table  #########

# unnested arrays are included as view with their own dimensions below
view: condition {
  sql_table_name: `looker-private-demo.healthcare_demo_live.condition` ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    label: "Condition ID"
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: asserted_date {
    hidden: yes
    type: string
    sql: ${TABLE}.assertedDate ;;
  }

  dimension: clinical_status {
    type: string
    sql: ${TABLE}.clinicalStatus ;;
  }

  dimension: verification_status {
    type: string
    sql: ${TABLE}.verificationStatus ;;
  }


  #########  JSON  dimensions  #########

  #### abatement fields  ####

  dimension: abatement {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.abatement ;;
  }

#   dimension_group: abatement {
#     hidden: yes
#     type: time
#     timeframes: [
#       date,
#       week,
#       month,
#       year,
#       day_of_week,
#       time,
#       time_of_day,
#       hour_of_day
#     ]
#     sql: PARSE_DATETIME('%Y-%m-%dT%H:%M:%S+00:00', ${abatement}.dateTime) ;;
#   }

  #### code fields  ####

  dimension: code {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.code ;;
  }

  #array thats unnested below
  dimension: code__coding {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${code}.coding ;;
  }

  #### code fields  ####

  dimension: context {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.context ;;
  }

  dimension: context__encounterId {
    label: "Encounter ID"
    sql: ${context}.encounterId ;;
  }

  #### meta fields  ####

  dimension: meta {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.meta ;;
  }

  #array thats unnested below
  dimension: meta__profile {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${meta}.profile ;;
  }


  #### onset fields  ####

  dimension: onset {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.onset ;;
  }

  dimension_group: onset {
    type: time
    timeframes: [
      date,
      week,
      month,
      year,
      day_of_week,
      time,
      time_of_day,
      hour_of_day
    ]
    sql: ${onset}.dateTime  ;;
  }

  #### subject fields  ####

  dimension: subject {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.subject ;;
  }

  dimension: subject__patient_id{
    label: "Patient ID"
    sql: ${subject}.patientId ;;
  }

  #########  array  dimensions  #########

  dimension: category {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.category ;;
  }

  #########  other  dimensions  #########

  #########  Measures  #########

  measure: count {
    label: "Number of Conditions"
    type: count
    drill_fields: [id,condition__code__coding.display]
  }

}


### Patient Fact table ####

# If necessary, uncomment the line below to include explore_source.
# include: "healthcare.model.lkml"

view: patient_facts {
 derived_table: {
    explore_source: condition_extended {
      column: patient_id { field: encounter.patient_id }
      column: count_unique_conditions { field: condition__code__coding.count_unique_conditions }
      column: list_unique_conditons { field: condition__code__coding.list_unique_conditons }
    }
  }

  dimension: patient_id {
    label: "Encounter  Patient ID"
    hidden: yes
  }

  dimension: count_unique_conditions {
    label: "Condition Count Unique Conditions"
    type: number
    hidden: yes
  }

  dimension: list_unique_conditons_by_patient {
    view_label: "Patient"
    label: "List Unique Conditons"
    type: string
    sql: REPLACE(${TABLE}.list_unique_conditons, '|RECORD|', ', ') ;;
  }

  dimension: is_diabetic {
    view_label: "Patient"
    type: yesno
    sql: STRPOS(${list_unique_conditons_by_patient}, 'Diabetes') > 0 ;;
  }

  dimension: number_of_comorbidities {
    view_label: "Patient"
    type: number
    sql: ${count_unique_conditions} - 1 ;;
  }

}

#########  Unnested Arrays  #########

### arrays with nested JSON ###
view: condition__code__coding {
  label: "Condition"
  dimension: code {
    label: "Condition Code"
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
      url: "/dashboards/xSz6jOn1TbIAdYc8qny3tP?Condition%20Code={{ value }}"
    }
    action: {
      label: "Email Department Head"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
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

  dimension: display {
    label: "Condition Name"
    type: string
    sql: ${TABLE}.display ;;
    link: {
      label: "{{ value }} Condition Lookup Dashboard"
      icon_url: "https://avatars0.githubusercontent.com/u/1437874?s=400&v=4"
      url: "{% if _view._name == 'prior_condition__code__coding' %}/dashboards/xSz6jOn1TbIAdYc8qny3tP?Condition%20Code={{ prior_condition__code__coding.code._value }}
      {% else %}/dashboards/xSz6jOn1TbIAdYc8qny3tP?Condition%20Code={{ condition__code__coding.code._value }} {% endif %}"
    }
    # drill_fields: [encounter.]
}


  dimension: system {
    hidden: yes
    type: string
    sql:
    -- spectacles: ignore
    ${TABLE}.system ;;
  }

  measure: count_unique_conditions {
    type: count_distinct
    sql: ${display} ;;
  }

  measure: list_unique_conditons {
    type: list
    list_field: display
  }
}

view: condition__category {
  label: "Condition"
  dimension: coding {
    hidden: yes
    sql:
    -- spectacles: ignore
    ${TABLE}.coding ;;
  }
}

#nested array inside condition.category
view: condition__category__coding {
  label: "Condition"
  dimension: code {
    label: "Category Code"
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: display {
    label: "Category"
    type: string
    sql: ${TABLE}.display ;;
  }

  dimension: system {
    hidden: yes
    #group_label: "Category"
    type: string
    sql:
    -- spectacles: ignore
    ${TABLE}.system ;;
  }

}

### arrays without nested fields ###
view: condition__meta__profile {
  label: "Condition"

  dimension: profile {
    hidden: yes
    sql: ${TABLE} ;;
  }
}
