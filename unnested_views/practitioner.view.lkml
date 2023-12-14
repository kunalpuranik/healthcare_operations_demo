view: practitioner {
  sql_table_name: `looker-private-demo.healthcare_demo_live.practitioner` ;;
  drill_fields: [id]

  #########  Standard dimensions  #########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
    action: {
      label: "Contact Practitioner"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: ""
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        ""
      }
    }
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  #########  Array  dimensions  #########

  dimension: address {
    hidden: yes
    sql: ${TABLE}.address ;;
  }

  dimension: identifier {
    hidden: yes
    sql: ${TABLE}.identifier ;;
  }

  dimension: first_name {
    hidden: yes
    sql: regexp_replace(${TABLE}.name[Offset(0)].given[Offset(0)],'[0-9]','') ;;
  }

  dimension: last_name {
    hidden: yes
    sql: regexp_replace(${TABLE}.name[Offset(0)].family,'[0-9]','') ;;
  }

#updated
  dimension: name {
    label: "Tester"
    sql: CONCAT(${first_name},' ',${last_name}) ;;
    # link: {
    #   label: "Batch Deep Dive"
    #   url: "/dashboards/6nywFlcbAXnS2AnD4DiFgB?Nurse={{ value | url_encode }}"
    #   icon_url: "http://www.looker.com/favicon.ico"
    # }
    link: {
      label: "WebMd"
      url: "https://doctor.webmd.com/results?so=&ln={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain_url=http://www.webmd.com"
    }
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    link: {
      label: "NPPES Lookup"
      url: "https://npiregistry.cms.hhs.gov/registry/provider-view/1548431174"
      icon_url: "https://www.google.com/s2/favicons?domain_url=http://www.cms.gov"
    }
    drill_fields: [observation_vitals.type]
    action: {
      label: "Send Email"
#      label: "Nudge Nurse to Focus on Data Entry"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Want to check on data entry"
      }
      form_param: {
        name: "To Mailing List"
        required: yes
        default: "{{ value }}@client.com"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        # default:
        # "Hi {{ value }} -

        # We've noticed some errors recently in your data entry of vitals for patients. Please focus on this in the future.

        # Best,
        # "
        default:
        "Hi {{ value }} -

         We've noticed some errors in this sample {{ observation_vitals.encounter_id }}. Can you review?

         Best,
         "
      }
    }
  }

  dimension: investigator {
    description: "For demo example only"
    sql: CONCAT(${name}) ;;
    label: "Tester"
    # drill_fields: [patient.name]
    # link: {
    #   label: "Batch View"
    #   url: "/explore/healthcare/observation_vitals_simple?fields=patient.name,patient.age,patient.gender,patient.us_core_ethnicity,observation_vitals.count&f[observation_vitals.issued_date]=2020%2F05%2F15+to+2020%2F06%2F23&f[practitioner.investigator]={{ value }}&sorts=observation_vitals.count+desc&limit=500&column_limit=50&vis=%7B%22show_view_names%22%3Afalse%2C%22show_row_numbers%22%3Atrue%2C%22transpose%22%3Afalse%2C%22truncate_text%22%3Atrue%2C%22hide_totals%22%3Afalse%2C%22hide_row_totals%22%3Afalse%2C%22size_to_fit%22%3Atrue%2C%22table_theme%22%3A%22white%22%2C%22limit_displayed_rows%22%3Afalse%2C%22enable_conditional_formatting%22%3Afalse%2C%22header_text_alignment%22%3A%22left%22%2C%22header_font_size%22%3A%2212%22%2C%22rows_font_size%22%3A%2212%22%2C%22conditional_formatting_include_totals%22%3Afalse%2C%22conditional_formatting_include_nulls%22%3Afalse%2C%22show_sql_query_menu_options%22%3Afalse%2C%22show_totals%22%3Atrue%2C%22show_row_totals%22%3Atrue%2C%22series_cell_visualizations%22%3A%7B%22observation_vitals.count%22%3A%7B%22is_active%22%3Atrue%2C%22palette%22%3A%7B%22palette_id%22%3A%22ed215e20-167d-fbfe-0488-cbffd1cf0186%22%2C%22collection_id%22%3A%22google%22%2C%22custom_colors%22%3A%5B%22%23B31412%22%2C%22%23EA4335%22%2C%22%234285F4%22%2C%22%23185ABC%22%5D%7D%7D%7D%2C%22type%22%3A%22looker_grid%22%2C%22x_axis_gridlines%22%3Afalse%2C%22y_axis_gridlines%22%3Atrue%2C%22show_y_axis_labels%22%3Atrue%2C%22show_y_axis_ticks%22%3Atrue%2C%22y_axis_tick_density%22%3A%22default%22%2C%22y_axis_tick_density_custom%22%3A5%2C%22show_x_axis_label%22%3Atrue%2C%22show_x_axis_ticks%22%3Atrue%2C%22y_axis_scale_mode%22%3A%22linear%22%2C%22x_axis_reversed%22%3Afalse%2C%22y_axis_reversed%22%3Afalse%2C%22plot_size_by_field%22%3Afalse%2C%22trellis%22%3A%22%22%2C%22stacking%22%3A%22%22%2C%22legend_position%22%3A%22center%22%2C%22point_style%22%3A%22none%22%2C%22show_value_labels%22%3Afalse%2C%22label_density%22%3A25%2C%22x_axis_scale%22%3A%22auto%22%2C%22y_axis_combined%22%3Atrue%2C%22ordering%22%3A%22none%22%2C%22show_null_labels%22%3Afalse%2C%22show_totals_labels%22%3Afalse%2C%22show_silhouette%22%3Afalse%2C%22totals_color%22%3A%22%23808080%22%2C%22defaults_version%22%3A1%2C%22series_types%22%3A%7B%7D%7D&filter_config=%7B%22observation_vitals.issued_date%22%3A%5B%7B%22type%22%3A%22between%22%2C%22values%22%3A%5B%7B%22date%22%3A%222020-05-15T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%2C%7B%22date%22%3A%222020-06-23T00%3A00%3A00.000Z%22%2C%22tz%22%3Atrue%7D%5D%2C%22id%22%3A4%2C%22error%22%3Afalse%7D%5D%2C%22practitioner.investigator%22%3A%5B%7B%22type%22%3A%22%3D%22%2C%22values%22%3A%5B%7B%22constant%22%3A%22{{ value }}%22%7D%2C%7B%7D%5D%2C%22id%22%3A5%2C%22error%22%3Afalse%7D%5D%7D&origin=share-expanded"
    #   icon_url: "http://www.looker.com/favicon.ico"
    # }
    # link: {
    #   label: "Batch Deep Dive"
    #   url: "/dashboards/6nywFlcbAXnS2AnD4DiFgB?Nurse={{ value | url_encode }}"
    #   icon_url: "http://www.looker.com/favicon.ico"
    # }
    link: {
      label: "WebMd"
      url: "https://doctor.webmd.com/results?so=&ln={{ value }}"
      icon_url: "http://www.google.com/s2/favicons?domain_url=http://www.webmd.com"
    }
    link: {
      label: "Google"
      url: "http://www.google.com/search?q={{ value }}"
      icon_url: "http://google.com/favicon.ico"
    }
    action: {
      label: "Email Tester"
      url: "https://desolate-refuge-53336.herokuapp.com/posts"
      icon_url: "https://sendgrid.com/favicon.ico"
      param: {
        name: "some_auth_code"
        value: "abc123456"
      }
      form_param: {
        name: "Subject"
        required: yes
        default: "Want to check on data entry"
      }
      form_param: {
        name: "To Mailing List"
        required: yes
        default: "{{ value }}@client.com"
      }
      form_param: {
        name: "Body"
        type: textarea
        required: yes
        default:
        "Hi {{ value }} -

        We've noticed some errors in data entry for Batch ##. Please review.

        Best,
        "
      }
    }
  }

  measure: count {
#    label: "Number of Practitioners"
    type: count
    drill_fields: [id, name]
  }

####### fields to bring in the encounters explore #######

  set: practitioner_encounter_fields {
    fields: [active, gender, id, name]
  }

}

#########  Unnested Arrays  #########

### arrays with nested JSON ###

view: practitioner__identifier {
  label: "Practitioner"
  dimension: system {
    group_label: "Identifier"
    type: string
    sql: ${TABLE}.system ;;
  }

  dimension: value {
    group_label: "Identifier"
    type: string
    sql: ${TABLE}.value ;;
  }
}

view: practitioner__address {
  label: "Organization"
  dimension: city {
    group_label: "Address"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    group_label: "Address"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: line {
    hidden: yes
    type: string
    sql: ${TABLE}.line ;;
  }

  dimension: postal_code {
    group_label: "Address"
    type: zipcode
    sql: ${TABLE}.postalCode ;;
  }

  dimension: state {
    group_label: "Address"
    map_layer_name: us_states
    type: string
    sql: ${TABLE}.state ;;
  }

}
