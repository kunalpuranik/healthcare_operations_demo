- dashboard: healthcare_operations_overview
  title: Healthcare Operations Overview
  layout: newspaper
  elements:
  - title: ED Wait Time
    name: ED Wait Time
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.average_los]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.average_los desc]
    limit: 500
    dynamic_fields: [{table_calculation: average_los_hours, label: Average LOS (Hours),
        expression: "${encounter.average_los}/60", value_format: !!null '', value_format_name: decimal_2,
        _kind_hint: measure, _type_hint: number}]
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
    single_value_title: Avg Length of Stay (Hrs)
    series_types: {}
    hidden_fields: [encounter.average_los]
    y_axes: []
    defaults_version: 1
    note_state: collapsed
    note_display: hover
    note_text: Length of Stay is defined as the difference in time since the patient
      was admitted into the hospital, until they were formally discharged by a nurse
    listen:
      Provider Organization Name (Hospital): organization.name
      Date: encounter.period__start_date
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Patients (This Year)
    name: Patients (This Year)
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count_patients]
    filters:
      encounter.period__end_date: 1 years
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
    single_value_title: ''
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Provider Organization Name (Hospital): organization.name
      Date: encounter.period__start_date
    row: 3
    col: 0
    width: 4
    height: 4
  - title: Number of Encounters
    name: Number of Encounters
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_month]
    filters:
      encounter.is_inpatient: 'Yes'
    sorts: [encounter.period__start_month desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_year, label: Prior Year, expression: 'offset(${encounter.count},12)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Inpatient Visits (This Year)
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Provider Organization Name (Hospital): organization.name
    row: 3
    col: 4
    width: 5
    height: 4
  - name: "<span class='fa fa-gears'> Operations Overview</span>"
    type: text
    title_text: "<span class='fa fa-gears'> Operations Overview</span>"
    subtitle_text: ''
    body_text: "**Recommended Action** Drill into high level metrics to determine\
      \ where we can improve our KPIs and follow up with key stakeholders to plan\
      \ appropriately"
    row: 0
    col: 3
    width: 21
    height: 3
  - title: Top Primary Diagnosis (and cost)
    name: Top Primary Diagnosis (and cost)
    model: healthcare
    explore: condition_extended
    type: looker_bar
    fields: [condition__code__coding.code, condition__code__coding.display, encounter.count,
      encounter.average_los]
    sorts: [encounter.count desc]
    limit: 5
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: encounter.count,
            id: encounter.count, name: Number of Encounters}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: bottom,
        series: [{axisId: encounter.average_los, id: encounter.average_los, name: Average
              Length of Stay}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    series_types: {}
    series_labels:
      encounter.average_los: "(Place Holder for Cost) Average Length of Stay"
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      encounter.count:
        is_active: true
        palette:
          palette_id: 695e2dda-14bd-04b2-d088-035a014b4f8a
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
      encounter.repeat_patients:
        is_active: true
        palette:
          palette_id: ef667eaa-c38a-1877-2455-3411c6229e43
          collection_id: 9a6873a1-36c0-4c6d-bc31-af7d5793ad86
          custom_colors:
          - "#1D98D3"
          - "#1D98D3"
      encounter.average_los:
        is_active: true
    defaults_version: 1
    hidden_fields: [condition__code__coding.code]
    listen:
      Provider Organization Name (Hospital): organization.name
      Date: encounter.period__start_date
    row: 15
    col: 0
    width: 12
    height: 8
  - title: Number of OP Visits
    name: Number of OP Visits
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.count, encounter.period__start_year]
    fill_fields: [encounter.period__start_year]
    filters:
      encounter.is_inpatient: 'No'
    sorts: [encounter.period__start_year desc]
    limit: 500
    dynamic_fields: [{table_calculation: prior_year, label: Prior Year, expression: 'offset(${encounter.count},1)',
        value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: progress_percentage
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Outpatient Visits (This Year)
    series_types: {}
    hidden_fields: []
    y_axes: []
    defaults_version: 1
    listen:
      Provider Organization Name (Hospital): organization.name
    row: 3
    col: 9
    width: 5
    height: 4
  - title: 30-Day Readmission Rate
    name: 30-Day Readmission Rate
    model: healthcare
    explore: readmission
    type: single_value
    fields: [readmission.perc_30_day_readmission]
    sorts: [readmission.perc_30_day_readmission desc]
    limit: 500
    dynamic_fields: [{table_calculation: readmission_national_average, label: Readmission
          - National Average, expression: '0.139', value_format: !!null '', value_format_name: percent_1,
        _kind_hint: dimension, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 30-Day Readmission Rate
    conditional_formatting: [{type: greater than, value: 0.139, background_color: '',
        font_color: "#7a131e", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    hidden_fields: []
    defaults_version: 1
    y_axes: []
    listen: {}
    row: 3
    col: 14
    width: 5
    height: 4
  - title: Readmission Causes
    name: Readmission Causes
    model: healthcare
    explore: readmission
    type: sankey
    fields: [prior_condition__code__coding.display, condition__code__coding.display,
      readmission.count_readmissions]
    filters:
      condition__code__coding.display: "-NULL"
      prior_condition__code__coding.display: "-NULL"
    sorts: [readmission.count_readmissions desc]
    limit: 15
    column_limit: 50
    hidden_fields: []
    hidden_points_if_no: []
    series_labels: {}
    show_view_names: true
    color_range: ["#92c2cf", "#0d154f", "#0b3cd4", "#36c1b3", "#4a5ded"]
    label_type: name
    show_null_points: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: 30-Day Readmission Rate
    conditional_formatting: [{type: greater than, value: 0.139, background_color: '',
        font_color: "#7a131e", color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 0
    series_types: {}
    y_axes: []
    listen: {}
    row: 15
    col: 12
    width: 12
    height: 8
  - title: Overdue for Wellness Screening
    name: Overdue for Wellness Screening
    model: healthcare
    explore: patient_encounter
    type: looker_column
    fields: [patient.count, patient__address.city]
    filters:
      patient.is_wellness_screened_in_the_past_year: 'No'
    sorts: [patient.count desc]
    limit: 15
    column_limit: 50
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
    stacking: normal
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
    y_axes: [{label: '', orientation: left, series: [{axisId: patient.count, id: patient.count,
            name: Number of Patients}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      patient.count: "#C2DD67"
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
    listen:
      Provider Organization Name (Hospital): organization.name
      Date: encounter.period__start_date
    row: 7
    col: 0
    width: 8
    height: 8
  - title: BMI 30 or Greater
    name: BMI 30 or Greater
    model: healthcare
    explore: observation_vitals
    type: looker_column
    fields: [patient.count, patient.age_tier]
    filters:
      observation_vitals.is_at_risk_for_diabetes: 'Yes'
      patient.age_tier: "-Below 0"
    sorts: [patient.age_tier]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: patient.count, id: patient.count,
            name: Number of Patients}], showLabels: true, showValues: false, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: fit_data
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    listen:
      Provider Organization Name (Hospital): organization.name
    row: 7
    col: 8
    width: 8
    height: 8
  - name: ''
    type: text
    body_text: <img src="https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60"
      width="100%" height="100%" >
    row: 0
    col: 0
    width: 3
    height: 3
  - title: Diabetics with Comorbidities
    name: Diabetics with Comorbidities
    model: healthcare
    explore: condition_extended
    type: looker_bar
    fields: [patient.count, condition__code__coding.display]
    filters:
      patient_facts.is_diabetic: 'Yes'
      condition__code__coding.display: Hypertension,Stroke,Coronary Heart Disease
    sorts: [patient.count desc]
    limit: 500
    column_limit: 50
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      patient.count: "#9174F0"
    series_labels: {}
    show_dropoff: false
    value_labels: none
    label_type: labPer
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
    show_null_points: true
    interpolation: linear
    hidden_fields: []
    hidden_points_if_no: []
    listen: {}
    row: 7
    col: 16
    width: 8
    height: 8
  filters:
  - name: Provider Organization Name (Hospital)
    title: Provider Organization Name (Hospital)
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: condition_extended
    listens_to_filters: []
    field: organization.name
  - name: Date
    title: Date
    type: field_filter
    default_value: 1 years
    allow_multiple_values: true
    required: false
    model: healthcare
    explore: encounter_extended
    listens_to_filters: []
    field: encounter.period__start_date
