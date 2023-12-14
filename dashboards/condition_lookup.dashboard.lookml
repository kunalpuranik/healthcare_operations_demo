- dashboard: condition_lookup
  title: Condition Lookup
  layout: newspaper
  elements:
  - title: Condition Name
    name: Condition Name
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [condition__code__coding.display]
    filters: {}
    sorts: [condition__code__coding.display]
    limit: 20
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
    header_font_size: '12'
    rows_font_size: '12'
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
    series_types: {}
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 0
    width: 9
    height: 4
  - title: Number of Cases Over Time
    name: Number of Cases Over Time
    model: healthcare
    explore: condition_extended
    type: looker_line
    fields: [condition.onset_date, encounter.count]
    fill_fields: [condition.onset_date]
    filters:
      condition.onset_date: 1 years ago for 1 years
    sorts: [condition.onset_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: condition.count, id: condition.count,
            name: Number of Conditions}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      condition.count: "#2CA0FA"
      encounter.count: "#2CA0FA"
    trend_lines: [{color: "#000000", label_position: left, period: 7, regression_type: average,
        series_index: 1, show_label: true, label_type: string}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 7
    col: 9
    width: 15
    height: 6
  - title: Avg LOS Over Time
    name: Avg LOS Over Time
    model: healthcare
    explore: condition_extended
    type: looker_line
    fields: [condition.onset_date, encounter.average_los]
    fill_fields: [condition.onset_date]
    filters:
      condition.onset_date: 1 years ago for 1 years
    sorts: [condition.onset_date desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    show_null_points: false
    interpolation: monotone
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: condition.count, id: condition.count,
            name: Number of Conditions}], showLabels: false, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types: {}
    series_colors:
      condition.count: "#2CA0FA"
      encounter.average_los: "#2CA0FA"
    trend_lines: [{color: "#000000", label_position: left, period: 7, regression_type: average,
        series_index: 1, show_label: true, label_type: string}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 13
    col: 9
    width: 15
    height: 5
  - title: Commonly Prescribed Medications
    name: Commonly Prescribed Medications
    model: healthcare
    explore: condition_extended
    type: looker_column
    fields: [medication_request__medication__codeable_concept__coding.display, medication_request.count]
    filters:
      medication_request__medication__codeable_concept__coding.display: "-NULL"
    sorts: [medication_request.count desc]
    limit: 15
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
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
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: medication_request.count,
            id: medication_request.count, name: Number of Medication Requests}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      medication_request.count: "#2CA0FA"
      encounter.repeat_patients: "#8214A0"
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
    defaults_version: 1
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen:
      Condition Code: condition__code__coding.code
    row: 7
    col: 0
    width: 9
    height: 5
  - title: Patient Demographics
    name: Patient Demographics
    model: healthcare
    explore: condition_extended
    type: looker_donut_multiples
    fields: [patient.age_tier, patient.count, patient.gender]
    pivots: [patient.age_tier]
    filters:
      patient.age_tier: "-Below 0"
    sorts: [patient.age_tier, patient.gender]
    limit: 500
    column_limit: 50
    show_value_labels: false
    font_size: 12
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
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: d754397b-2c05-4470-bbbb-05eb4c2b15cd
      palette_id: b0768e0d-03b8-4c12-9e30-9ada6affc357
      options:
        steps: 5
    y_axes: [{label: '', orientation: left, series: [{axisId: patient.count, id: female
              - patient.count, name: female}, {axisId: patient.count, id: male - patient.count,
            name: male}], showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    defaults_version: 1
    series_types: {}
    value_labels: legend
    label_type: labPer
    listen:
      Condition Code: condition__code__coding.code
    row: 12
    col: 0
    width: 9
    height: 6
  - title: Top Physicians
    name: Top Physicians
    model: healthcare
    explore: condition_extended
    type: looker_grid
    fields: [practitioner.id, encounter.count, encounter.min_los, encounter.med_los,
      encounter.max_los]
    filters: {}
    sorts: [encounter.count desc]
    limit: 25
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      encounter.count: "# Cases"
      practitioner.id: Practitioner
      encounter.average_los: Avg LOS
    series_cell_visualizations:
      encounter.count:
        is_active: true
      encounter.average_los:
        is_active: true
    defaults_version: 1
    title_hidden: true
    listen:
      Condition Code: condition__code__coding.code
    row: 20
    col: 0
    width: 24
    height: 8
  - name: "<span class='fa fa-stethoscope'> Condition Lookup</span>"
    type: text
    title_text: "<span class='fa fa-stethoscope'> Condition Lookup</span>"
    body_text: "**Recommended Action** Use this dashboard to track OKRs for specific\
      \ departments and conditions, create an alert on readmission rate and length\
      \ of stay to monitor progress"
    row: 0
    col: 0
    width: 24
    height: 3
  - title: 30 Day Readmission Rate
    name: 30 Day Readmission Rate
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
    hidden_fields:
    defaults_version: 1
    listen:
      Condition Code: prior_condition__code__coding.code
    row: 3
    col: 14
    width: 5
    height: 4
  - name: "<span class='fa fa-stethoscope'> Physician Performance</span>"
    type: text
    title_text: "<span class='fa fa-stethoscope'> Physician Performance</span>"
    body_text: ''
    row: 18
    col: 0
    width: 24
    height: 2
  - title: Total Patients Treated - Past Complete Year
    name: Total Patients Treated - Past Complete Year
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [encounter.count_patients]
    filters:
      encounter.period__start_date: 1 years ago for 1 years
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
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 19
    width: 5
    height: 4
  - title: Average LOS (min)
    name: Average LOS (min)
    model: healthcare
    explore: condition_extended
    type: single_value
    fields: [encounter.period__start_year, encounter.average_los]
    fill_fields: [encounter.period__start_year]
    sorts: [encounter.period__start_year desc]
    limit: 500
    dynamic_fields: [{table_calculation: avg_los_prior_year, label: Avg LOS Prior
          Year, expression: 'offset(${encounter.average_los},1)', value_format: !!null '',
        value_format_name: decimal_2, _kind_hint: measure, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: equal to, value: !!null '', background_color: "#5f8017",
        font_color: !!null '', color_application: {collection_id: brightview, palette_id: brightview-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Condition Code: condition__code__coding.code
    row: 3
    col: 9
    width: 5
    height: 4
  filters:
  - name: Condition Code
    title: Condition Code
    type: field_filter
    default_value: '72892002'
    allow_multiple_values: false
    required: true
    model: healthcare
    explore: condition_extended
    listens_to_filters: []
    field: condition__code__coding.code
