- dashboard: patient_readmission_lookup
  title: Patient Readmission Lookup
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Age Tier
    name: Age Tier
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.age_tier]
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
    listen:
      PatientID: patient.id
    row: 8
    col: 0
    width: 8
    height: 2
  - title: Gender
    name: Gender
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.gender]
    sorts: [patient.gender]
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
    listen:
      PatientID: patient.id
    row: 8
    col: 8
    width: 5
    height: 2
  - title: Race
    name: Race
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.us_core_race]
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
    series_types: {}
    defaults_version: 1
    listen:
      PatientID: patient.id
    row: 12
    col: 0
    width: 8
    height: 2
  - title: Wellness Screened in the Past Year
    name: Wellness Screened in the Past Year
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.is_wellness_screened_in_the_past_year]
    sorts: [patient.is_wellness_screened_in_the_past_year]
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
    listen:
      PatientID: patient.id
    row: 10
    col: 8
    width: 5
    height: 2
  - title: Hospital
    name: Hospital
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [organization__address.city, organization__address.state, organization__address.postal_code]
    sorts: [organization__address.city]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'concat(${organization__address.city},",
          ",${organization__address.state}, ", ", ${organization__address.postal_code})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string}]
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    hidden_fields: [organization__address.city, organization__address.state, organization__address.postal_code]
    listen:
      PatientID: patient.id
    row: 10
    col: 0
    width: 8
    height: 2
  - title: Blood Pressure
    name: Blood Pressure
    model: healthcare
    explore: observation_vitals
    type: looker_line
    fields: [observation_vitals.issued_date, observation_vitals.average_quantity]
    filters:
      observation_vitals.type: Diastolic Blood Pressure
      observation_vitals.average_quantity: ">0"
    sorts: [observation_vitals.issued_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    interpolation: monotone
    color_application:
      collection_id: healthcare
      palette_id: healthcare-sequential-0
      options:
        steps: 5
    series_types: {}
    series_colors:
      observation_vitals.average_quantity: "#dc602e"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      PatientID: patient.id
    row: 6
    col: 13
    width: 11
    height: 5
  - title: BMI
    name: BMI
    model: healthcare
    explore: observation_vitals
    type: looker_line
    fields: [observation_vitals.issued_date, observation_vitals.average_quantity]
    filters:
      observation_vitals.issued_date: after 2018/01/01
      observation_vitals.type: Body Mass Index
      observation_vitals.average_quantity: ">0"
      patient.id: '00046958-d091-4d62-98af-67da7917d236'
    sorts: [observation_vitals.issued_date desc]
    limit: 500
    query_timezone: America/Los_Angeles
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
    interpolation: monotone
    color_application:
      collection_id: healthcare
      palette_id: healthcare-sequential-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.average_quantity,
            id: observation_vitals.average_quantity, name: Average Quantity}], showLabels: true,
        showValues: true, maxValue: 40, minValue: 20, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 11
    col: 13
    width: 11
    height: 5
  - title: Average Length Of Stay
    name: Average Length Of Stay
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [encounter.average_los]
    filters:
      encounter.period__start_date: after 2018/01/01
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
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
    single_value_title: MInutes
    x_axis_gridlines: true
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: Encounters, orientation: left, series: [{axisId: encounter.count,
            id: LOWELL GENERAL HOSPITAL - encounter.count, name: LOWELL GENERAL HOSPITAL}],
        showLabels: true, showValues: false, unpinAxis: true, tickDensity: default,
        tickDensityCustom: 0, type: linear}]
    size_by_field: encounter.average_los
    limit_displayed_rows_values:
      show_hide: hide
      first_last: first
      num_rows: 0
    hide_legend: false
    series_types: {}
    series_colors: {}
    series_point_styles:
      NEW ENGLAND BAPTIST HOSPITAL - encounter.count: square
      LOWELL GENERAL HOSPITAL - encounter.count: diamond
      encounter.count: diamond
    swap_axes: false
    ordering: none
    show_null_labels: false
    column_group_spacing_ratio: 0
    show_dropoff: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    interpolation: linear
    defaults_version: 1
    hidden_fields: []
    listen:
      PatientID: patient.id
    row: 14
    col: 3
    width: 5
    height: 2
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::new_survey">New Survey</a>

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="https://googledemo.looker.com/dashboards-next/healthcare::patient_readmission_lookup">

      Patient Readmission Lookup</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::readmission_overview">Readmission Overview</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::model_performance">Model Performance</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Diagnosis Report History
    name: Diagnosis Report History
    model: healthcare
    explore: patient_encounter
    type: looker_grid
    fields: [diagnostic_report.dateTime_date, diagnostic_report__code__coding.code,
      diagnostic_report__code__coding.display]
    sorts: [diagnostic_report.dateTime_date desc]
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
    listen:
      PatientID: patient.id
    row: 29
    col: 0
    width: 24
    height: 4
  - title: Patient Encounter History
    name: Patient Encounter History
    model: healthcare
    explore: encounter_extended
    type: looker_scatter
    fields: [healthcare_days_since_readmission.readmission_within_7, encounter.count,
      encounter.average_los, encounter.period__start_date]
    pivots: [healthcare_days_since_readmission.readmission_within_7]
    filters:
      encounter.period__start_date: after 2018/01/01
    sorts: [healthcare_days_since_readmission.readmission_within_7, encounter.period__start_date
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(pivot_index(${encounter.count},1)
          > 0, yes, no)', label: New Calculation, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: supermeasure, table_calculation: new_calculation, _type_hint: yesno,
        is_disabled: true}]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.count, id: No
              - encounter.count, name: 'No'}, {axisId: encounter.count, id: Yes -
              encounter.count, name: 'Yes'}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: encounter.average_los
    series_types: {}
    series_point_styles:
      Yes - encounter.count: diamond
    interpolation: linear
    defaults_version: 1
    hidden_points_if_no: []
    hidden_fields: []
    listen:
      PatientID: patient.id
    row: 16
    col: 0
    width: 24
    height: 4
  - title: Readmission Report
    name: Readmission Report
    model: healthcare
    explore: encounter_extended
    type: looker_grid
    fields: [patient.name, encounter.period__start_date, encounter.period__end_date,
      encounter__type__coding.display, condition__code__coding.display, encounter.length_of_stay_tier]
    filters:
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
      condition.context__encounterId: "-NULL"
    sorts: [encounter.period__start_date desc]
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
    point_style: circle_outline
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: false
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.count, id: No
              - encounter.count, name: 'No'}, {axisId: encounter.count, id: Yes -
              encounter.count, name: 'Yes'}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: encounter.average_los
    series_types: {}
    series_point_styles:
      Yes - encounter.count: diamond
    interpolation: linear
    defaults_version: 1
    hidden_points_if_no: []
    hidden_fields: []
    listen:
      PatientID: patient.id
    row: 24
    col: 0
    width: 24
    height: 5
  - title: Primary Language
    name: Primary Language
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient__communication.language__text]
    sorts: [patient__communication.language__text]
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
    listen:
      PatientID: patient.id
    row: 12
    col: 8
    width: 5
    height: 2
  - title: Patient Name
    name: Patient Name
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [patient.name]
    sorts: [patient.name]
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
    listen:
      PatientID: patient.id
    row: 6
    col: 0
    width: 8
    height: 2
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "## Average Length of Stay"
    row: 14
    col: 0
    width: 3
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #FBBC04; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M15.573,11.624c0.568-0.478,0.947-1.219,0.947-2.019c0-1.37-1.108-2.569-2.371-2.569s-2.371,1.2-2.371,2.569c0,0.8,0.379,1.542,0.946,2.019c-0.253,0.089-0.496,0.2-0.728,0.332c-0.743-0.898-1.745-1.573-2.891-1.911c0.877-0.61,1.486-1.666,1.486-2.812c0-1.79-1.479-3.359-3.162-3.359S4.269,5.443,4.269,7.233c0,1.146,0.608,2.202,1.486,2.812c-2.454,0.725-4.252,2.998-4.252,5.685c0,0.218,0.178,0.396,0.395,0.396h16.203c0.218,0,0.396-0.178,0.396-0.396C18.497,13.831,17.273,12.216,15.573,11.624\
      \ M12.568,9.605c0-0.822,0.689-1.779,1.581-1.779s1.58,0.957,1.58,1.779s-0.688,1.779-1.58,1.779S12.568,10.427,12.568,9.605\
      \ M5.06,7.233c0-1.213,1.014-2.569,2.371-2.569c1.358,0,2.371,1.355,2.371,2.569S8.789,9.802,7.431,9.802C6.073,9.802,5.06,8.447,5.06,7.233\
      \ M2.309,15.335c0.202-2.649,2.423-4.742,5.122-4.742s4.921,2.093,5.122,4.742H2.309z\
      \ M13.346,15.335c-0.067-0.997-0.382-1.928-0.882-2.732c0.502-0.271,1.075-0.429,1.686-0.429c1.828,0,3.338,1.385,3.535,3.161H13.346z\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h1>PATIENT DEMOGRAPHICS</h1>\n    </div>\n\
      </div>\n\n"
    row: 2
    col: 0
    width: 24
    height: 4
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #228B22; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M8.627,7.885C8.499,8.388,7.873,8.101,8.13,8.177L4.12,7.143c-0.218-0.057-0.351-0.28-0.293-0.498c0.057-0.218,0.279-0.351,0.497-0.294l4.011,1.037C8.552,7.444,8.685,7.667,8.627,7.885\
      \ M8.334,10.123L4.323,9.086C4.105,9.031,3.883,9.162,3.826,9.38C3.769,9.598,3.901,9.82,4.12,9.877l4.01,1.037c-0.262-0.062,0.373,0.192,0.497-0.294C8.685,10.401,8.552,10.18,8.334,10.123\
      \ M7.131,12.507L4.323,11.78c-0.218-0.057-0.44,0.076-0.497,0.295c-0.057,0.218,0.075,0.439,0.293,0.495l2.809,0.726c-0.265-0.062,0.37,0.193,0.495-0.293C7.48,12.784,7.35,12.562,7.131,12.507M18.159,3.677v10.701c0,0.186-0.126,0.348-0.306,0.393l-7.755,1.948c-0.07,0.016-0.134,0.016-0.204,0l-7.748-1.948c-0.179-0.045-0.306-0.207-0.306-0.393V3.677c0-0.267,0.249-0.461,0.509-0.396l7.646,1.921l7.654-1.921C17.91,3.216,18.159,3.41,18.159,3.677\
      \ M9.589,5.939L2.656,4.203v9.857l6.933,1.737V5.939z M17.344,4.203l-6.939,1.736v9.859l6.939-1.737V4.203z\
      \ M16.168,6.645c-0.058-0.218-0.279-0.351-0.498-0.294l-4.011,1.037c-0.218,0.057-0.351,0.28-0.293,0.498c0.128,0.503,0.755,0.216,0.498,0.292l4.009-1.034C16.092,7.085,16.225,6.863,16.168,6.645\
      \ M16.168,9.38c-0.058-0.218-0.279-0.349-0.498-0.294l-4.011,1.036c-0.218,0.057-0.351,0.279-0.293,0.498c0.124,0.486,0.759,0.232,0.498,0.294l4.009-1.037C16.092,9.82,16.225,9.598,16.168,9.38\
      \ M14.963,12.385c-0.055-0.219-0.276-0.35-0.495-0.294l-2.809,0.726c-0.218,0.056-0.351,0.279-0.293,0.496c0.127,0.506,0.755,0.218,0.498,0.293l2.807-0.723C14.89,12.825,15.021,12.603,14.963,12.385\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h1>Diagnosis Report</h1>\n    </div>\n</div>\n\
      \n"
    row: 20
    col: 0
    width: 24
    height: 4
  - title: Avg Readmission Rate Score
    name: Avg Readmission Rate Score
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [bqml_predict.encounter_id, bqml_predict.encounter__reason__coding_display,
      bqml_predict.label, bqml_predict.prob, bqml_predict.observation__category__coding_display]
    filters:
      bqml_predict.patient_id: 0fd0ae11-7a98-4b18-8246-b41fd3cbd38a
    sorts: [readmission_yes desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(${bqml_predict.label}
          = "true", ${bqml_predict.prob}, null)', label: Readmission Yes, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: readmission_yes,
        _type_hint: number}, {category: table_calculation, expression: 'sum(${readmission_yes})
          / max(row())', label: Avg Readmission, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: dimension, table_calculation: avg_readmission, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.5, background_color: "#f5f4bf",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    hidden_fields: [bqml_predict.encounter_id, bqml_predict.encounter__reason__coding_display,
      bqml_predict.label, bqml_predict.prob, bqml_predict.observation__category__coding_display,
      readmission_yes]
    listen:
      PatientID: patient.id
    row: 14
    col: 8
    width: 5
    height: 2
  - title: Number of Visits
    name: Number of Visits
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'if(${bqml_predict.label}
          = "true", ${bqml_predict.prob}, null)', label: Readmission Yes, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: dimension, table_calculation: readmission_yes,
        _type_hint: number, is_disabled: true}, {category: table_calculation, expression: 'sum(${readmission_yes})
          / max(row())', label: Avg Readmission, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: dimension, table_calculation: avg_readmission, _type_hint: number,
        is_disabled: true}]
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
    hidden_fields: []
    listen:
      PatientID: patient.id
    row: 6
    col: 8
    width: 5
    height: 2
  filters:
  - name: PatientID
    title: PatientID
    type: string_filter
    default_value: 0fd0ae11-7a98-4b18-8246-b41fd3cbd38a
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
