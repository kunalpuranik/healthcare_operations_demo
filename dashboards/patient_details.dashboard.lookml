- dashboard: patient_details
  title: Patient Details
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Patient Details
    name: Patient Details
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [patient.name, patient.age, patient.gender, encounter__type__coding.display]
    sorts: [patient.name]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 4
    col: 1
    width: 5
    height: 2
  - title: New Tile
    name: New Tile
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [organization.name]
    sorts: [organization.name]
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
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
      Issued Year: observation.issued_year
    row: 0
    col: 4
    width: 8
    height: 2
  - title: New Tile
    name: New Tile (2)
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
      Patient ID: patient.id
      Patient Name: patient.name
      Issued Year: observation.issued_year
    row: 0
    col: 12
    width: 6
    height: 2
  - title: BMI
    name: BMI
    model: healthcare
    explore: observation_vitals
    type: looker_line
    fields: [observation_vitals.issued_date, observation_vitals.average_quantity]
    filters:
      observation_vitals.type: Body Mass Index
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
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 11
    col: 12
    width: 6
    height: 6
  - title: Blood Pressure
    name: Blood Pressure
    model: healthcare
    explore: observation_vitals
    type: looker_line
    fields: [observation_vitals.issued_date, observation_vitals.average_quantity]
    filters:
      observation_vitals.type: Diastolic Blood Pressure
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
      Patient ID: patient.id
      Patient Name: patient.name
    row: 11
    col: 18
    width: 5
    height: 6
  - title: Temperature
    name: Temperature
    model: healthcare
    explore: observation_vitals
    type: looker_line
    fields: [observation_vitals.issued_date, observation_vitals.average_quantity]
    filters:
      observation_vitals.type: Body Height
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
      palette_id: healthcare-categorical-0
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: observation_vitals.average_quantity,
            id: observation_vitals.average_quantity, name: Average Quantity}], showLabels: true,
        showValues: true, maxValue: 180, minValue: 75, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 11
    col: 6
    width: 6
    height: 6
  - name: <img src="https://imagesunsplashcom/photo-1505751172876-fa1923c5c528?ixlib=rb-121&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
      width="100%" height="100%" >
    type: text
    title_text: <img src="https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
      width="100%" height="100%" >
    row: 0
    col: 1
    width: 3
    height: 2
  - title: New Tile (copy)
    name: New Tile (copy)
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [organization.telecom]
    limit: 500
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'concat(${organization__address.city},",
          ",${organization__address.state}, ", ", ${organization__address.postal_code})',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: string, is_disabled: true}]
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
    hidden_fields: []
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
      Issued Year: observation.issued_year
    row: 0
    col: 18
    width: 5
    height: 2
  - title: Age
    name: Age
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [patient.age, encounter__type__coding.display]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 4
    col: 6
    width: 4
    height: 2
  - title: Patient Details (copy 2)
    name: Patient Details (copy 2)
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [patient.gender, encounter__type__coding.display]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 4
    col: 10
    width: 4
    height: 2
  - title: Primary Complaint
    name: Primary Complaint
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [encounter__reason__coding.display]
    filters:
      encounter__reason__coding.display: "-NULL"
    sorts: [encounter__reason__coding.display desc]
    limit: 500
    column_limit: 50
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 4
    col: 14
    width: 4
    height: 2
  - title: Patient Details (copy 4)
    name: Patient Details (copy 4)
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [patient.us_core_ethnicity]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '1'
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    hide_totals: false
    hide_row_totals: false
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 4
    col: 18
    width: 5
    height: 2
  - name: "<span class='fa fa-users'> Patient Overview</span>"
    type: text
    title_text: "<span class='fa fa-users'> Patient Overview</span>"
    row: 2
    col: 1
    width: 22
    height: 2
  - name: "<span class='fa fa-medkit'> Notifications</span>"
    type: text
    title_text: "<span class='fa fa-medkit'> Notifications</span>"
    subtitle_text: ''
    row: 6
    col: 1
    width: 5
    height: 3
  - title: New Tile
    name: New Tile (3)
    model: healthcare
    explore: patient_encounter
    type: single_value
    fields: [patient.is_wellness_screened_in_the_past_year, patient.id]
    sorts: [patient.is_wellness_screened_in_the_past_year]
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
    single_value_title: Wellness Screening This Year
    series_types: {}
    defaults_version: 1
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
    row: 9
    col: 1
    width: 5
    height: 4
  - title: Risk of Readmission
    name: Risk of Readmission
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter_readmission_predictions.readmission_risk_score]
    sorts: [encounter_readmission_predictions.readmission_risk_score]
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
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    defaults_version: 1
    series_types: {}
    listen:
      Patient ID: patient.id
      Patient Name: patient.name
      Issued Year: observation.issued_year
    row: 13
    col: 1
    width: 5
    height: 4
  - title: Diagnosis With Dates
    name: Diagnosis With Dates
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
      Patient ID: patient.id
      Patient Name: patient.name
    row: 17
    col: 1
    width: 22
    height: 5
  - title: Encounter Timeline
    name: Encounter Timeline
    model: healthcare
    explore: patient_encounter
    type: looker_scatter
    fields: [encounter.period__start_date, encounter.count, encounter.average_los]
    filters:
      encounter.period__start_date: 5 years
    sorts: [encounter.period__start_date desc]
    limit: 500
    column_limit: 50
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
    color_application:
      collection_id: 7c79334a-9912-4ca1-be6a-35756782ae09
      palette_id: de0bdb92-9455-489c-afa7-f0e0fdc76078
      options:
        steps: 5
        reverse: false
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
      Patient ID: patient.id
      Patient Name: patient.name
    row: 6
    col: 6
    width: 17
    height: 5
  filters:
  - name: Patient ID
    title: Patient ID
    type: field_filter
    default_value: 4b162ef3-fb81-4c22-8ca6-e5c34d0edef7
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
    model: healthcare
    explore: encounter_extended
    listens_to_filters: []
    field: patient.id
  - name: Patient Name
    title: Patient Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: inline
    model: healthcare
    explore: encounter_extended
    listens_to_filters: []
    field: patient.name
  - name: Issued Year
    title: Issued Year
    type: field_filter
    default_value: 2016/01/01 to 2020/10/23
    allow_multiple_values: true
    required: false
    ui_config:
      type: day_range_picker
      display: inline
      options: []
    model: healthcare
    explore: encounter_extended
    listens_to_filters: []
    field: observation.issued_year
