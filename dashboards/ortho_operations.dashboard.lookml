- dashboard: 1_healthcare_operations__ortho
  title: "(1) Healthcare Operations - Ortho"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: <p><center> <b> <font size="5"> <font color="black"> <span class='fa fa-medkit'></span>
      Healthcare Operations & Analytics  <br>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> <span class='fa
      fa-medkit'></span> Healthcare Operations & Analytics  <br>
    subtitle_text: <font size="3">Orthopedic Surgery Centers Overview <p>
    body_text: ''
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Reasons for Late Start
    name: Reasons for Late Start
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_area
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month,
      ortho_procedures.count_cases, ortho_procedures.average_wait_time_minutes]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    fill_fields: [ortho_procedures.actual_start_month]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description, ortho_procedures.actual_start_month
        desc]
    limit: 500
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    color_application:
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    series_types: {}
    series_colors:
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Wait - ortho_procedures.count: "#34A853"
      No Wait - ortho_procedures.count_cases: "#34A853"
      Patients Arriving Late - ortho_procedures.count_cases: "#FBBC04"
      Staff Too Busy - ortho_procedures.count_cases: "#EA4335"
      No Recovery Room Available - ortho_procedures.count_cases: "#5F6368"
      Missing or Incomplete Informed Consents - ortho_procedures.count_cases: "#185ABC"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count_cases: "#4285F4"
    x_axis_datetime_label: "%b '%y"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#18191a",
        label: Average, value_format: '', line_value: mean}]
    ordering: none
    show_null_labels: false
    defaults_version: 1
    hidden_fields: [ortho_procedures.count_cases]
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 47
    col: 16
    width: 8
    height: 10
  - title: Upcoming Appointments
    name: Upcoming Appointments
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'No'
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
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 12
    width: 3
    height: 4
  - title: Pending Informed Consents
    name: Pending Informed Consents
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_incomplete_paperwork]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: Pending Informed Consents
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 15
    width: 3
    height: 4
  - title: Payer Mix Trends
    name: Payer Mix Trends
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_payer.payer, ortho_procedures.total_procedural_charges, ortho_procedures.actual_start_month]
    pivots: [ortho_payer.payer]
    filters:
      ortho_procedures.actual_start_month: 2019/10/01 to 2020/08/31
      ortho_procedures.complete: 'Yes'
      ortho_procedures.total_procedural_charges: ">=0"
    sorts: [ortho_payer.payer 0, ortho_procedures.actual_start_month]
    limit: 500
    column_limit: 50
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
    font_size: '12'
    label_value_format: "$0.0,\\K"
    series_types: {}
    series_colors:
      BCBS - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - ortho_procedures.total_procedural_charges: "#274880"
      Cigna - ortho_procedures.total_procedural_charges: "#3c77d9"
      Humana - ortho_procedures.total_procedural_charges: "#478dff"
      Medicaid - ortho_procedures.total_procedural_charges: "#EA4335"
      Medicare - ortho_procedures.total_procedural_charges: "#a63125"
      Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Self-Pay - Self-Pay - ortho_procedures.total_procedural_charges: "#FBBC04"
      Medicare - Government - ortho_procedures.total_procedural_charges: "#a63125"
      Medicaid - Government - ortho_procedures.total_procedural_charges: "#EA4335"
      Humana - Commercial - ortho_procedures.total_procedural_charges: "#478dff"
      Cigna - Commercial - ortho_procedures.total_procedural_charges: "#3c77d9"
      BCBS - Commercial - ortho_procedures.total_procedural_charges: "#3562b2"
      Aetna - Commercial - ortho_procedures.total_procedural_charges: "#274880"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 10
    col: 8
    width: 16
    height: 7
  - title: Payer Mix
    name: Payer Mix
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_procedures.total_procedural_charges, ortho_payer.payer_type]
    filters:
      ortho_procedures.complete: 'Yes'
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    inner_radius: 50
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
    font_size: 12
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 10
    col: 0
    width: 8
    height: 7
  - name: ''
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      Today's Appointments
      <p>
    row: 2
    col: 12
    width: 9
    height: 2
  - name: " (2)"
    type: text
    body_text: |-
      <p><center>
      <b>
      <font size="5">
      <font color="black">
      YTD Key Performance Indicators
      <p>
    row: 2
    col: 3
    width: 9
    height: 2
  - title: No Show Rate
    name: No Show Rate
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.no_show_rate]
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
    single_value_title: No Show Rate
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 6
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Facility Trends <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Facility Trends
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Facility
      to navigate to Facility Performance Dashboard <p>
    body_text: ''
    row: 36
    col: 0
    width: 24
    height: 2
  - title: Number of Cases
    name: Number of Cases
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_cases]
    filters:
      ortho_procedures.complete: 'Yes'
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
    single_value_title: Total Cases
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 3
    width: 3
    height: 2
  - name: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Revenue Cycle
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Payer to
      Filter, Select Chart to Drill-down <p>
    body_text: ''
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Total Charges
    name: Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_procedural_charges]
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
    single_value_title: Total Procedure Charges
    value_format: "$0.00,,\\M\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 6
    col: 3
    width: 3
    height: 2
  - title: Count of No Shows
    name: Count of No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
      ortho_procedures.complete: 'No'
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#E8EAED",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 18
    width: 3
    height: 4
  - title: Facility Late Start Comparisons
    name: Facility Late Start Comparisons
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_column
    fields: [ortho_reasons_wait_time.reason_wait_time_description, ortho_facilities.facility,
      ortho_procedures.count_cases]
    pivots: [ortho_reasons_wait_time.reason_wait_time_description]
    filters:
      ortho_reasons_wait_time.reason_wait_time_description: "-EMPTY,-No Wait"
      ortho_procedures.is_no_show: 'No'
    sorts: [ortho_reasons_wait_time.reason_wait_time_description desc 0, ortho_procedures.count_cases
        desc 2]
    limit: 10
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
        reverse: false
    font_size: ''
    series_types: {}
    series_colors:
      Missing or Incomplete Informed Consents - ortho_procedures.count: "#4285F4"
      Surgeons and Anesthesiologists Arriving Late - ortho_procedures.count: "#185ABC"
      Staff Too Busy - ortho_procedures.count: "#5F6368"
      Patients Arriving Late - ortho_procedures.count: "#FBBC04"
      No Recovery Room Available - ortho_procedures.count: "#EA4335"
    column_group_spacing_ratio: 0
    show_null_points: true
    interpolation: monotone
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Payer: ortho_payer.payer_type
    row: 47
    col: 8
    width: 8
    height: 10
  - title: Facilities by Total Charges
    name: Facilities by Total Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.total_procedural_charges]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
    map_plot_mode: points
    heatmap_gridlines: true
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.8
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: circle
    map_marker_icon_name: default
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: value
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: true
    reverse_map_value_colors: true
    map_latitude: 35.8356283888737
    map_longitude: -86.00097656250001
    map_zoom: 7
    map_marker_radius_min: 1
    map_marker_radius_max: 50000
    map_value_scale_clamp_min: 50000
    map_value_scale_clamp_max: 500000
    series_types: {}
    defaults_version: 1
    hidden_fields: []
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 8
    width: 8
    height: 9
  - title: Facility Mapping
    name: Facility Mapping
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_map
    fields: [ortho_npi_facts.facility_name, ortho_facilities.facility_location, ortho_procedures.count_cases]
    sorts: [ortho_npi_facts.facility_name]
    limit: 500
    query_timezone: America/Los_Angeles
    map_plot_mode: points
    heatmap_gridlines: false
    heatmap_gridlines_empty: false
    heatmap_opacity: 0.5
    show_region_field: true
    draw_map_labels_above_data: true
    map_tile_provider: light
    map_position: custom
    map_scale_indicator: 'off'
    map_pannable: true
    map_zoomable: true
    map_marker_type: icon
    map_marker_icon_name: building
    map_marker_radius_mode: proportional_value
    map_marker_units: meters
    map_marker_proportional_scale_type: linear
    map_marker_color_mode: fixed
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
    map_latitude: 35.81781315869664
    map_longitude: -85.93505859375001
    map_zoom: 7
    series_types: {}
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 0
    width: 8
    height: 9
  - title: Top 10 Facility Volume and Charges
    name: Top 10 Facility Volume and Charges
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_npi_facts.facility_name, ortho_procedures.total_procedural_charges,
      ortho_procedures.count_cases]
    sorts: [ortho_procedures.total_procedural_charges desc]
    limit: 500
    column_limit: 50
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: right
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: !!null '', orientation: top, series: [{axisId: ortho_procedures.total_procedural_charges,
            id: ortho_procedures.total_procedural_charges, name: Total Procedural
              Charges}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: '', orientation: bottom, series: [
          {axisId: ortho_encounters.count, id: ortho_encounters.count, name: Ortho
              Encounters}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    series_types:
      ortho_procedures.total_procedural_charges: scatter
    series_colors:
      ortho_encounters.count: "#BDC1C6"
      ortho_procedures.total_procedural_charges: "#34A853"
      ortho_procedures.count_cases: "#E8EAED"
    series_labels:
      ortho_encounters.count: Total Cases
      ortho_procedures.total_procedural_charges: Total Procedure Charges
    series_point_styles:
      ortho_procedures.total_procedural_charges: diamond
    defaults_version: 1
    listen:
      Payer: ortho_payer.payer_type
    row: 38
    col: 16
    width: 8
    height: 9
  - title: Payer Coverage Comparison by Top 10 Procedures
    name: Payer Coverage Comparison by Top 10 Procedures
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_cpt_codes.cpt_code, ortho_cpt_codes.cpt_description, ortho_procedures.average_procedural_charges,
      ortho_procedures.average_aetna_covered_amt, ortho_procedures.average_bcbs_covered_amt,
      ortho_procedures.average_cigna_covered_amt, ortho_procedures.average_humana_covered_amt,
      ortho_procedures.average_government_payer_covered_amt]
    filters:
      ortho_payer.payer_type: ''
    sorts: [ortho_procedures.average_procedural_charges desc]
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
    point_style: circle
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
      collection_id: google
      palette_id: google-categorical-0
      options:
        steps: 5
        reverse: false
    y_axes: [{label: '', orientation: top, series: [{axisId: ortho_procedures.average_procedural_charges,
            id: ortho_procedures.average_procedural_charges, name: Average Procedural
              Charges}, {axisId: ortho_procedures.average_aetna_covered_amt, id: ortho_procedures.average_aetna_covered_amt,
            name: Average Aetna Covered Amt}, {axisId: ortho_procedures.average_bcbs_covered_amt,
            id: ortho_procedures.average_bcbs_covered_amt, name: Average BCBS Covered
              Amt}, {axisId: ortho_procedures.average_cigna_covered_amt, id: ortho_procedures.average_cigna_covered_amt,
            name: Average Cigna Covered Amt}, {axisId: ortho_procedures.average_government_payer_covered_amt,
            id: ortho_procedures.average_government_payer_covered_amt, name: Average
              Government Payer Covered Amt}, {axisId: ortho_procedures.average_humana_covered_amt,
            id: ortho_procedures.average_humana_covered_amt, name: Average Humana
              Covered Amt}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: "$0.0,\\K"
    trellis_rows: 1
    series_types:
      ortho_procedures.average_payer_covered_amt: scatter
      ortho_procedures.average_self_pay_covered_amt: scatter
      ortho_procedures.average_government_payer_covered_amt: scatter
      ortho_procedures.average_commercial_payer_covered_amt: scatter
      ortho_procedures.average_cigna_covered_amt: scatter
      ortho_procedures.average_bcbs_covered_amt: scatter
      ortho_procedures.average_aetna_covered_amt: scatter
      ortho_procedures.average_humana_covered_amt: scatter
    series_colors:
      ortho_procedures.average_commercial_payer_covered_amt: "#185ABC"
      ortho_procedures.average_procedural_charges: "#BDC1C6"
      ortho_procedures.average_self_pay_covered_amt: "#FBBC04"
      ortho_procedures.average_cigna_covered_amt: "#3c77d9"
      ortho_procedures.average_aetna_covered_amt: "#274880"
      ortho_procedures.average_bcbs_covered_amt: "#3562b2"
      ortho_procedures.average_humana_covered_amt: "#478dff"
      ortho_procedures.average_government_payer_covered_amt: "#EA4335"
    series_labels:
      ortho_procedures.average_bcbs_covered_amt: Average BCBS Covered Amt
    series_point_styles:
      ortho_procedures.average_payer_covered_amt: square
      ortho_procedures.average_cigna_covered_amt: diamond
      ortho_procedures.average_bcbs_covered_amt: triangle
      ortho_procedures.average_humana_covered_amt: square
    reference_lines: []
    show_null_points: true
    interpolation: monotone
    x: ortho_encounters_actual_start_month
    y: ortho_procedures_average_procedural_charges
    column: ortho_procedures_average_submitted_chrg_amt
    x2: ortho_procedures_average_submitted_chrg_amt
    defaults_version: 1
    hidden_fields:
    hidden_points_if_no: []
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 17
    col: 0
    width: 24
    height: 8
  - title: Orthopedic Medical Suppliers
    name: Orthopedic Medical Suppliers
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_pie
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    value_labels: labels
    label_type: labPer
    inner_radius: 50
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
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 8
    width: 8
    height: 9
  - name: <p><center> <b> <font size="5"> <font color="black"> Supply Chain <p>
    type: text
    title_text: <p><center> <b> <font size="5"> <font color="black"> Supply Chain
      <p>
    subtitle_text: <p><center> <font size="3"> <font color="grey"> Select Supplier
      to Filter <p>
    row: 25
    col: 0
    width: 24
    height: 2
  - title: Implant Type by Medical Supplier
    name: Implant Type by Medical Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_bar
    fields: [ortho_supplier_preferences.supplier_name, ortho_procedures.total_supply_costs,
      ortho_procedures.supply_category]
    pivots: [ortho_procedures.supply_category]
    fill_fields: [ortho_procedures.supply_category]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
    sorts: [ortho_procedures.total_supply_costs desc 0, ortho_procedures.supply_category]
    limit: 500
    column_limit: 50
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
    series_types: {}
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 0
    width: 8
    height: 9
  - title: Providers by Preferred Supplier
    name: Providers by Preferred Supplier
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_grid
    fields: [ortho_npi_facts.npi, ortho_supplier_preferences.supplier_name, ortho_npi_facts.facility_name,
      ortho_procedures.total_supply_costs]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.total_supply_costs: ">0"
    sorts: [ortho_supplier_preferences.supplier_name desc]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_labels:
      ortho_npi_facts.npi: Provider
    series_column_widths:
      ortho_npi_facts.npi: 104
      ortho_supplier_preferences.supplier_name: 159
      ortho_npi_facts.facility_name: 166
      ortho_procedures.total_supply_costs: 156
    series_cell_visualizations:
      ortho_procedures.total_supply_costs:
        is_active: false
    series_text_format:
      ortho_procedures.total_supply_costs:
        bold: true
        align: center
      ortho_npi_facts.facility_name:
        fg_color: "#5F6368"
        align: left
      ortho_supplier_preferences.supplier_name:
        fg_color: "#5F6368"
      ortho_npi_facts.npi:
        fg_color: "#5F6368"
    header_font_color: "#5F6368"
    header_background_color: "#E8EAED"
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0,
          options: {steps: 10, constraints: {min: {type: number, value: 1000}, mid: {
                type: number, value: 0}, max: {type: maximum}}, mirror: false, reverse: false,
            stepped: true}}, bold: false, italic: false, strikethrough: false, fields: !!null ''}]
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
    stacking: normal
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      Knee Implant - 0 - ortho_procedures.total_supply_costs: "#5F6368"
      Hip Implant - 1 - ortho_procedures.total_supply_costs: "#BDC1C6"
      Other - 2 - ortho_procedures.total_supply_costs: "#185ABC"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    value_labels: legend
    label_type: labPer
    inner_radius: 50
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Supplier: ortho_supplier_preferences.supplier_name
    row: 27
    col: 16
    width: 8
    height: 9
  - title: New Tile
    name: New Tile
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.total_supply_costs]
    filters:
      ortho_npi_facts.facility_name: ''
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
    single_value_title: Total Supply Costs
    value_format: "$00,\\K\\"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    row: 6
    col: 9
    width: 3
    height: 2
  - title: Total No Shows
    name: Total No Shows
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.count_of_no_shows]
    filters:
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
    single_value_title: No Shows
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
      Payer: ortho_payer.payer_type
    row: 4
    col: 6
    width: 3
    height: 2
  - title: Avg Cost per Case
    name: Avg Cost per Case
    model: healthcare_operations
    explore: ortho_procedures
    type: single_value
    fields: [ortho_procedures.average_cost_per_case]
    filters:
      ortho_payer.payer_type: ''
      ortho_cpt_codes.cpt_code: ''
      ortho_procedures.supply_category: "-Other"
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
    single_value_title: Avg Cost per Case
    value_format: "$0,\\K"
    conditional_formatting: [{type: not null, value: !!null '', background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    listen:
      Hospital Facility: ortho_npi_facts.facility_name
    row: 4
    col: 9
    width: 3
    height: 2
  - title: No Show Rate Monthly Trend by Facility
    name: No Show Rate Monthly Trend by Facility
    model: healthcare_operations
    explore: ortho_procedures
    type: looker_line
    fields: [ortho_procedures.no_show_rate, ortho_npi_facts.facility_name, ortho_procedures.actual_start_month]
    pivots: [ortho_npi_facts.facility_name]
    fill_fields: [ortho_procedures.actual_start_month]
    sorts: [ortho_npi_facts.facility_name 0, ortho_procedures.actual_start_month desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: monotone
    color_application:
      collection_id: 611da387-0e33-4239-aef0-a187c149cf88
      palette_id: f31efe28-e698-428c-8420-fcb37f2010aa
      options:
        steps: 5
    series_types: {}
    series_colors: {}
    x_axis_datetime_label: "%b '%y"
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 10
  filters:
  - name: Hospital Facility
    title: Hospital Facility
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_npi_facts.facility_name
  - name: Payer
    title: Payer
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_payer.payer_type
  - name: Supplier
    title: Supplier
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: healthcare_operations
    explore: ortho_procedures
    listens_to_filters: []
    field: ortho_supplier_preferences.supplier_name
