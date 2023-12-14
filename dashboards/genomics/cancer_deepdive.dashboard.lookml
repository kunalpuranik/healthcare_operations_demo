- dashboard: 2_cancer_deep_dive
  title: "(2) Cancer Deep Dive"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Population Count
    name: Population Count
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
    row: 0
    col: 0
    width: 6
    height: 5
  - title: Age Breakdown
    name: Age Breakdown
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
    row: 0
    col: 6
    width: 18
    height: 5
  - title: Population by Gene & Classification
    name: Population by Gene & Classification
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_column
    fields: [genomics_mapping.count_population, genomics_mapping.classification, genomics_mapping.gene]
    pivots: [genomics_mapping.classification]
    sorts: [genomics_mapping.count_population desc 0, genomics_mapping.classification]
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
    listen:
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 5
    col: 12
    width: 12
    height: 8
  - title: Gene Breakdown
    name: Gene Breakdown
    model: genomics_mapping
    explore: genomics_mapping
    type: looker_grid
    fields: [genomics_mapping.count_population, genomics_mapping.gene, genomics_mapping.distinct_variants]
    sorts: [genomics_mapping.count_population desc]
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
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      genomics_mapping.count_population:
        is_active: true
      genomics_mapping.distinct_variants:
        is_active: true
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
      Sex: genomics_mapping.sex
      Age: genomics_mapping.age_tier
      Ethnicity: genomics_mapping.ethnicity
      Diagnosis: genomics_mapping.diagnosis
    row: 5
    col: 0
    width: 12
    height: 8
  filters:
  - name: Sex
    title: Sex
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
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
      type: advanced
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
      type: advanced
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.ethnicity
  - name: Diagnosis
    title: Diagnosis
    type: field_filter
    default_value: Breast
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: genomics_mapping
    explore: genomics_mapping
    listens_to_filters: []
    field: genomics_mapping.diagnosis
