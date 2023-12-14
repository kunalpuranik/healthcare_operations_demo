- dashboard: 1_diagnosis_population_analysis
  title: "(1) Diagnosis Population Analysis"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Count by Gender
    name: Count by Gender
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_donut_multiples
    fields: [genomics_mapping.sex, genomics_mapping.count_population]
    pivots: [genomics_mapping.sex]
    sorts: [genomics_mapping.count_poulation desc 0, genomics_mapping.sex]
    limit: 500
    query_timezone: America/Los_Angeles
    show_value_labels: true
    font_size: 12
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
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
    series_types: {}
    point_style: none
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 2
    col: 18
    width: 6
    height: 5
  - title: Count by Ethnicity
    name: Count by Ethnicity
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_bar
    fields: [genomics_mapping.ethnicity, genomics_mapping.count_population]
    pivots: [genomics_mapping.ethnicity]
    sorts: [genomics_mapping.count_poulation desc 0, genomics_mapping.ethnicity]
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
    stacking: normal
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
    font_size: '12'
    series_types: {}
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Diagnosis: genomics_mapping.diagnosis
    row: 7
    col: 0
    width: 24
    height: 6
  - title: Count by Age
    name: Count by Age
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_bar
    fields: [genomics_mapping.age_tier, genomics_mapping.count_population]
    pivots: [genomics_mapping.age_tier]
    filters:
      genomics_mapping.age_tier: "-Undefined"
    sorts: [genomics_mapping.count_poulation desc 0, genomics_mapping.age_tier]
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
    stacking: normal
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
    font_size: '12'
    series_types: {}
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sex: genomics_mapping.sex
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 2
    col: 8
    width: 10
    height: 5
  - title: Population
    name: Population
    model: genomics_mapping
    explore: genomics_mapping
    type: single_value
    fields: [genomics_mapping.count_population]
    sorts: [genomics_mapping.count_poulation desc 0]
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
    show_value_labels: true
    font_size: '12'
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
    series_types: {}
    point_style: none
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 2
    col: 0
    width: 4
    height: 5
  - title: Average Age
    name: Average Age
    model: genomics_mapping
    explore: genomics_mapping
    type: single_value
    fields: [genomics_mapping.average_age]
    sorts: [genomics_mapping.count_poulation desc 0]
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
    show_value_labels: true
    font_size: '12'
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
    series_types: {}
    point_style: none
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 2
    col: 4
    width: 4
    height: 5
  - title: Diagnosis Details
    name: Diagnosis Details
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_grid
    fields: [genomics_mapping.diagnosis, genomics_mapping.count_population, genomics_mapping.average_stddev_age]
    filters:
      genomics_mapping.diagnosis: "-No cancer"
    sorts: [genomics_mapping.count_population desc]
    limit: 500
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
      genomics_mapping.count_population: Count
    series_cell_visualizations:
      genomics_mapping.count_population:
        is_active: true
      genomics_mapping.average_stddev_age:
        is_active: true
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    show_value_labels: true
    font_size: '12'
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
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
    row: 15
    col: 0
    width: 10
    height: 8
  - title: Diagnosis / Age Breakdown
    name: Diagnosis / Age Breakdown
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_column
    fields: [genomics_mapping.diagnosis, genomics_mapping.count_population, genomics_mapping.age_tier]
    pivots: [genomics_mapping.diagnosis]
    fill_fields: [genomics_mapping.age_tier]
    filters:
      genomics_mapping.diagnosis: "-No cancer"
    sorts: [genomics_mapping.diagnosis]
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
    stacking: normal
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
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    font_size: '12'
    series_types: {}
    series_colors:
      Male - genomics_mapping.count_poulation: "#3EB0D5"
      Female - genomics_mapping.count_poulation: "#B1399E"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
    row: 15
    col: 10
    width: 14
    height: 8
  - name: Population Details
    type: text
    title_text: Population Details
    row: 0
    col: 0
    width: 24
    height: 2
  - name: Diagnosis Summary
    type: text
    title_text: Diagnosis Summary
    row: 13
    col: 0
    width: 24
    height: 2
  filters:
  - name: Sex
    title: Sex
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: button_group
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.sex
  - name: Age
    title: Age
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.age_tier
  - name: Ethnicity
    title: Ethnicity
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.ethnicity
  - name: Diagnosis
    title: Diagnosis
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: checkboxes
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.diagnosis
