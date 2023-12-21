- dashboard: 2_healthcare_operations__ortho_facilities
  title: "(2) Healthcare Operations - Ortho Facilities"
  layout: newspaper
  preferred_viewer: dashboards
  elements:
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <p><center>
      <b>
      <font size="6">
      <font color="black">
      <span class='fa fa-building'></span> Facility Deep Dive
      <p>
      <a href="https://demoexpo.looker.com/dashboards/615" type="button" class="btn btn-primary btn-lg btn-block"><font size="2"><font color="white">Navigate to Back to Overview</font>
    row: 0
    col: 2
    width: 20
    height: 3
  - title: Provider MGMA Ranking Distribution
    name: Provider MGMA Ranking Distribution
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_npi_facts.count, ortho_npi_facts.npi_rank_tier]
    fill_fields: [ortho_npi_facts.npi_rank_tier]
    filters: {}
    sorts: [ortho_npi_facts.npi_rank_tier]
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
    stacking: normal
    limit_displayed_rows: false
    legend_position: right
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Provider Count, orientation: left, series: [{axisId: ortho_npi_facts.count,
            id: ortho_npi_facts.count, name: Ortho Provider Facts}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: MGMA Provider Ranking
    trellis_rows: 5
    series_colors:
      ortho_npi_facts.count: "#4285F4"
    series_labels:
      ortho_npi.count: Count of Providers
    reference_lines: []
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 9
    col: 12
    width: 10
    height: 8
  - title: Facility Name
    name: Facility Name
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_npi_facts.facility_name]
    filters: {}
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#5F6368"
    conditional_formatting: [{type: not equal to, value: 0, background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
      Hospital Facility: ortho_npi_facts.facility_name
    row: 3
    col: 2
    width: 20
    height: 2
  - title: Provider Count
    name: Provider Count
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_npi_facts.count]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_npi_rank, based_on: ortho_npi_facts.npi_rank,
        expression: '', label: Average of Npi Rank, type: average, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Number of Providers
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 10
    width: 4
    height: 2
  - title: Case Count
    name: Case Count
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_npi_rank, based_on: ortho_npi_facts.npi_rank,
        expression: '', label: Average of Npi Rank, type: average, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Number of Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 2
    width: 4
    height: 2
  - title: Provider MGMA Ranking Detail
    name: Provider MGMA Ranking Detail
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_scatter
    fields: [ortho_npi_facts.npi, ortho_npi_facts.npi_rank, ortho_procedures.total_procedural_charges,
      ortho_encounters.count]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_average_of_w_rvu, based_on: ortho_npi_facts.average_of_w_rvu,
        expression: '', label: Average of Average of W Rvu, type: average, _kind_hint: measure,
        _type_hint: number}]
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
    show_null_points: true
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
    y_axes: [{label: Total Cases, orientation: left, series: [{axisId: ortho_encounters.count,
            id: ortho_encounters.count, name: Ortho Encounters}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_label: MGMA Provider Rank
    size_by_field: ortho_procedures.total_procedural_charges
    series_types:
      average_of_average_of_w_rvu: area
    series_colors:
      average_of_average_of_w_rvu: "#185ABC"
      ortho_procedures.total_procedural_charges: "#EA4335"
      ortho_encounters.count: "#FBBC04"
    series_labels:
      average_of_average_of_w_rvu: w RVUs
    swap_axes: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [ortho_npi_facts.npi]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 17
    col: 12
    width: 10
    height: 8
  - title: Provider Ranking Metrics (MGMA)
    name: Provider Ranking Metrics (MGMA)
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_npi_facts.npi_rank, average_of_average_of_w_rvu,
      ortho_procedures.total_procedural_charges]
    sorts: [ortho_npi_facts.npi desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_average_of_w_rvu, based_on: ortho_npi_facts.average_of_w_rvu,
        expression: '', label: Average of Average of W Rvu, type: average, _kind_hint: measure,
        _type_hint: number}]
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '16'
    rows_font_size: '14'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      ortho_npi_facts.npi: Provider ID
      ortho_npi_facts.npi_rank: Provider Rank
      average_of_average_of_w_rvu: Work RVUs
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_column_widths: {}
    series_cell_visualizations:
      ortho_encounters.count:
        is_active: true
      ortho_procedures.total_procedural_charges:
        is_active: true
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: between, value: [0, 49], background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]},
      {type: between, value: [49, 60], background_color: "#FBBC04", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]},
      {type: between, value: [60, 150], background_color: "#34A853", font_color: !!null '',
        color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: true, italic: false, strikethrough: false, fields: [ortho_npi_facts.npi_rank]}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 17
    col: 2
    width: 10
    height: 8
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
    filters: {}
    limit: 500
    column_limit: 50
    dynamic_fields: [{measure: average_of_npi_rank, based_on: ortho_npi_facts.npi_rank,
        expression: '', label: Average of Npi Rank, type: average, _kind_hint: measure,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Total Procedure Charges
    value_format: "$0.0,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    series_types: {}
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Provider Performance Tiers: ortho_npi_facts.provider_rank_status
    row: 5
    col: 6
    width: 4
    height: 2
  - title: Wait Reasons Monthly Trend
    name: Wait Reasons Monthly Trend
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.count_cases,
      ortho_procedures.actual_start_month]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_payer.payer_type: ''
      ortho_procedures.actual_start_month: after 2019/09/01
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.is_no_show: 'No'
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Recovery Room\
        \ Available,-Surgeons and Anesthesiologists Arriving Late"
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.actual_start_month]
    limit: 10
    column_limit: 50
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    font_size: ''
    series_types: {}
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    x_axis_datetime_label: "%b '%y"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen: {}
    row: 9
    col: 2
    width: 10
    height: 8
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.count_of_incomplete_paperwork desc]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    custom_color: "#EA4335"
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 5
    col: 14
    width: 4
    height: 2
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    single_value_title: Upcoming
    conditional_formatting: [{type: not null, value: !!null '', background_color: '',
        font_color: '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 5
    col: 18
    width: 4
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Facility and Provider Performance
      <p>
    row: 7
    col: 2
    width: 20
    height: 2
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: Chattanooga Facility
    allow_multiple_values: true
    required: false
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Provider Performance Tiers
    title: Provider Performance Tiers
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.provider_rank_status
