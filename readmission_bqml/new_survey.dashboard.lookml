- dashboard: new_survey
  title: New Survey
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: New Tile
    name: New Tile
    model: healthcare
    explore: healthcare_bqml_new_patients
    type: single_value
    fields: [healthcare_bqml_new_patients.patient_id, healthcare_bqml_new_patients.patient_name]
    filters:
      healthcare_bqml_new_patients.patient_name: New Patient
    sorts: [healthcare_bqml_new_patients.patient_id]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#FBBC04"
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: [healthcare_bqml_new_patients.patient_id]
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 14
    col: 0
    width: 4
    height: 6
  - title: New Encounter Records
    name: New Encounter Records
    model: healthcare
    explore: healthcare_bqml_new_patients
    type: looker_grid
    fields: [healthcare_bqml_new_patients.patient_name, healthcare_bqml_new_patients.patient_us_core_race,
      healthcare_bqml_new_patients.patient_gender, healthcare_bqml_new_patients.patient_is_wellness_screened_in_the_past_year,
      healthcare_bqml_new_patients.encounter_length_of_stay, healthcare_bqml_new_patients.practitioner_investigator,
      healthcare_bqml_new_patients.patient_age_tier, healthcare_bqml_new_patients.patient_birth_place__city,
      healthcare_bqml_new_patients.patient_birth_place__state, healthcare_bqml_new_patients.admission_date,
      healthcare_bqml_new_patients.discharge_date]
    filters:
      healthcare_bqml_new_patients.patient_age_tier: "-NULL"
    sorts: [healthcare_bqml_new_patients.admission_date desc]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 14
    col: 4
    width: 20
    height: 6
  - title: Number of Rows
    name: Number of Rows
    model: healthcare
    explore: healthcare_bqml_new_patients
    type: single_value
    fields: [healthcare_bqml_new_patients.count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row: 30
    col: 0
    width: 8
    height: 3
  - title: Table Name
    name: Table Name
    model: healthcare
    explore: new_patient_info_schema
    type: single_value
    fields: [new_patient_info_schema.table_name]
    sorts: [new_patient_info_schema.table_name]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    listen: {}
    row: 24
    col: 15
    width: 9
    height: 3
  - title: BQ Project
    name: BQ Project
    model: healthcare
    explore: new_patient_info_schema
    type: single_value
    fields: [new_patient_info_schema.table_catalog]
    sorts: [new_patient_info_schema.table_catalog]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 24
    col: 0
    width: 8
    height: 3
  - title: Dataset
    name: Dataset
    model: healthcare
    explore: new_patient_info_schema
    type: single_value
    fields: [new_patient_info_schema.table_schema]
    sorts: [new_patient_info_schema.table_schema]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 24
    col: 8
    width: 7
    height: 3
  - title: BQML Input Type
    name: BQML Input Type
    model: healthcare
    explore: new_patient_info_schema
    type: looker_grid
    fields: [new_patient_info_schema.column_name, new_patient_info_schema.data_type]
    sorts: [new_patient_info_schema.column_name]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 27
    col: 8
    width: 16
    height: 4
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="https://googledemo.looker.com/dashboards-next/healthcare::new_survey">

      New Survey</a>

       <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::patient_readmission_lookup">Patient Readmission Lookup</a>


        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::readmission_overview">Readmission Overview</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::model_performance">Model Performance</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Table Type
    name: Table Type
    model: healthcare
    explore: new_patient_predictions_info_schema
    type: single_value
    fields: [new_patient_predictions_info_schema.table_type]
    sorts: [new_patient_predictions_info_schema.table_type]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 31
    col: 15
    width: 9
    height: 2
  - title: Is Insertable Into
    name: Is Insertable Into
    model: healthcare
    explore: new_patient_predictions_info_schema
    type: single_value
    fields: [new_patient_predictions_info_schema.is_insertable_into]
    sorts: [new_patient_predictions_info_schema.is_insertable_into]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 31
    col: 8
    width: 7
    height: 2
  - title: Table Creation Date
    name: Table Creation Date
    model: healthcare
    explore: new_patient_predictions_info_schema
    type: single_value
    fields: [new_patient_predictions_info_schema.creation_time_time]
    sorts: [new_patient_predictions_info_schema.creation_time_time desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 27
    col: 0
    width: 8
    height: 3
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #EA4335; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M18.092,5.137l-3.977-1.466h-0.006c0.084,0.042-0.123-0.08-0.283,0H13.82L10,5.079L6.178,3.671H6.172c0.076,0.038-0.114-0.076-0.285,0H5.884L1.908,5.137c-0.151,0.062-0.25,0.207-0.25,0.369v10.451c0,0.691,0.879,0.244,0.545,0.369l3.829-1.406l3.821,1.406c0.186,0.062,0.385-0.029,0.294,0l3.822-1.406l3.83,1.406c0.26,0.1,0.543-0.08,0.543-0.369V5.506C18.342,5.344,18.242,5.199,18.092,5.137\
      \ M5.633,14.221l-3.181,1.15V5.776l3.181-1.15V14.221z M9.602,15.371l-3.173-1.15V4.626l3.173,1.15V15.371z\
      \ M13.57,14.221l-3.173,1.15V5.776l3.173-1.15V14.221z M17.547,15.371l-3.182-1.15V4.626l3.182,1.15V15.371z\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h2>Table Metadata</h2>\n<p>These are outputs\
      \ from BigQuery's information schema containing table details </p>\n    </div>\n\
      </div>"
    row: 20
    col: 0
    width: 24
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #FBBC04; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M10,1.375c-3.17,0-5.75,2.548-5.75,5.682c0,6.685,5.259,11.276,5.483,11.469c0.152,0.132,0.382,0.132,0.534,0c0.224-0.193,5.481-4.784,5.483-11.469C15.75,3.923,13.171,1.375,10,1.375\
      \ M10,17.653c-1.064-1.024-4.929-5.127-4.929-10.596c0-2.68,2.212-4.861,4.929-4.861s4.929,2.181,4.929,4.861C14.927,12.518,11.063,16.627,10,17.653\
      \ M10,3.839c-1.815,0-3.286,1.47-3.286,3.286s1.47,3.286,3.286,3.286s3.286-1.47,3.286-3.286S11.815,3.839,10,3.839\
      \ M10,9.589c-1.359,0-2.464-1.105-2.464-2.464S8.641,4.661,10,4.661s2.464,1.105,2.464,2.464S11.359,9.589,10,9.589\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h2>LOOKER ACTION</h2>\n<p>This Looker action\
      \ takes the information for a patient's visit and writes it back to a table\
      \ in BigQuery which then gets passed into our BQML AutoML model for predictions</p>\n\
      \    </div>\n</div>"
    row: 4
    col: 0
    width: 24
    height: 4
  - title: New Survey
    name: New Survey
    model: healthcare
    explore: patient_survey
    type: single_value
    fields: [patient_survey.ease_of_scheduling_appointment]
    filters:
      patient_survey.ease_of_scheduling_appointment: New Survey
    sorts: [patient_survey.ease_of_scheduling_appointment]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#34A853"
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 8
    col: 0
    width: 4
    height: 6
  - title: New Survey Records
    name: New Survey Records
    model: healthcare
    explore: patient_survey
    type: looker_grid
    fields: [patient_survey.ease_of_scheduling_appointment, patient_survey.likelihood_of_recommendation,
      patient_survey.wait_time_for_appointment, patient_survey.cleanliness_and_appearance_of_facility,
      patient_survey.overall_care_rating]
    filters:
      patient_survey.ease_of_scheduling_appointment: "-New Survey"
    sorts: [patient_survey.ease_of_scheduling_appointment]
    limit: 500
    column_limit: 50
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    defaults_version: 1
    row: 8
    col: 4
    width: 20
    height: 6
