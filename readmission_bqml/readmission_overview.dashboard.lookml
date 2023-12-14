- dashboard: readmission_overview
  title: Readmission Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: 'Encounter Type #1'
    name: 'Encounter Type #1'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%"
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'if(row()
          = 1, yes, no)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 43
    col: 0
    width: 8
    height: 2
  - title: 'Encounter Type #2'
    name: 'Encounter Type #2'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%"
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_1, label: Calculation 1, expression: 'if(row()
          = 1, yes, no)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.9, background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 43
    col: 8
    width: 4
    height: 2
  - title: 'Encounter Type #2'
    name: 'Encounter Type #2 (2)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%"
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 2, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.9, background_color: "#6599f5",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 45
    col: 8
    width: 4
    height: 2
  - title: 'Encounter Type #2'
    name: 'Encounter Type #2 (3)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%"
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 2, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 45
    col: 0
    width: 8
    height: 2
  - title: 'Encounter Type #3'
    name: 'Encounter Type #3'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%,-%follow-up%,-%follow%,-%check-up%"
      healthcare_predictions.label: 'Yes'
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 3, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 47
    col: 0
    width: 8
    height: 2
  - title: 'Encounter Type #3'
    name: 'Encounter Type #3 (2)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
      healthcare_predictions.encounter_type_coding_display: "-%Follow-up%,-%follow\
        \ up%,-%follow%,-%check-up%"
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 3, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.9, background_color: "#84acf5",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 47
    col: 8
    width: 4
    height: 2
  - title: 'Low Risk Counter #1'
    name: 'Low Risk Counter #1'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'No'
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 1, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 43
    col: 12
    width: 9
    height: 2
  - title: 'Low Risk Counter #1'
    name: 'Low Risk Counter #1 (2)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
    sorts: [healthcare_predictions.avg_prob]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 1, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.02, background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 43
    col: 21
    width: 3
    height: 2
  - title: 'Low Risk Counter #2'
    name: 'Low Risk Counter #2'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'No'
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 2, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 45
    col: 12
    width: 9
    height: 2
  - title: 'Low Risk Counter #2'
    name: 'Low Risk Counter #2 (2)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
    sorts: [healthcare_predictions.avg_prob]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 2, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.02, background_color: "#53a867",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 45
    col: 21
    width: 3
    height: 2
  - title: 'Low Risk Counter #3'
    name: 'Low Risk Counter #3'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'No'
    sorts: [healthcare_predictions.avg_prob desc]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 3, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.avg_prob]
    y_axes: []
    listen: {}
    row: 47
    col: 12
    width: 9
    height: 2
  - title: 'Low Risk Counter #3'
    name: 'Low Risk Counter #3 (2)'
    model: healthcare
    explore: healthcare_predictions
    type: single_value
    fields: [healthcare_predictions.avg_prob, healthcare_predictions.encounter_type_coding_display]
    filters:
      healthcare_predictions.label: 'Yes'
    sorts: [healthcare_predictions.avg_prob]
    limit: 3
    column_limit: 50
    dynamic_fields: [{_kind_hint: dimension, table_calculation: calculation_1, _type_hint: yesno,
        category: table_calculation, expression: 'if(row() = 3, yes, no)', label: Calculation
          1, value_format: !!null '', value_format_name: !!null ''}]
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.02, background_color: "#62a86c",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    show_value_labels: false
    font_size: 13
    series_labels:
      true - healthcare_predictions.avg_prob: Will Readmit within 7 days
      false - healthcare_predictions.avg_prob: Won't Readmit within 7 days
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      test.avg_prob:
        is_active: true
    table_theme: white
    limit_displayed_rows: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    series_value_format:
      test.avg_prob:
        name: percent_1
        decimals: '1'
        format_string: "#,##0.0%"
        label: Percent (1)
        label_prefix: Percent
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
    hide_totals: false
    hide_row_totals: false
    hidden_points_if_no: [calculation_1]
    hidden_fields: [healthcare_predictions.encounter_type_coding_display]
    y_axes: []
    listen: {}
    row: 47
    col: 21
    width: 3
    height: 2
  - name: Most At Risk Encounter Types
    type: text
    title_text: Most At Risk Encounter Types
    body_text: ''
    row: 41
    col: 0
    width: 12
    height: 2
  - name: Non-Risk Encounter Types
    type: text
    title_text: Non-Risk Encounter Types
    body_text: ''
    row: 41
    col: 13
    width: 11
    height: 2
  - title: Encounters Over Time
    name: Encounters Over Time
    model: healthcare
    explore: encounter_extended
    type: looker_scatter
    fields: [encounter.count, encounter.period__start_month, encounter.average_los]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.period__start_date: 24 months ago for 24 months
    sorts: [encounter.period__start_month desc]
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
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    y_axes: [{label: '', orientation: left, series: [{axisId: encounter.count, id: encounter.count,
            name: Number of Encounters}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    size_by_field: encounter.average_los
    series_types: {}
    reference_lines: []
    trend_lines: [{color: "#000000", label_position: right, order: 3, period: 7, regression_type: average,
        series_index: 1, show_label: true}]
    interpolation: linear
    defaults_version: 1
    listen: {}
    row: 14
    col: 0
    width: 24
    height: 5
  - name: ''
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::new_survey">New Survey</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::patient_readmission_lookup">Patient Readmission Lookup</a>

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="https://googledemo.looker.com/dashboards-next/healthcare::readmission_overview">

      Readmission Overview</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::model_performance">Model Performance</a>



      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Conditions by Count of Patients
    name: Conditions by Count of Patients
    model: healthcare
    explore: encounter_extended
    type: looker_bar
    fields: [encounter.count, condition__code__coding.display]
    filters:
      encounter.period__start_date: after 2018/01/01
      condition__code__coding.display: "-NULL"
      encounter__type__coding.display: "-%check-up%,-%follow%,-%Follow-up%"
    sorts: [encounter.count desc]
    limit: 10
    dynamic_fields: [{table_calculation: top_condition, label: top condition, expression: 'if(row()
          = 1, yes, no)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno, is_disabled: true}]
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
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen: {}
    row: 29
    col: 0
    width: 8
    height: 6
  - title: Encounter Type By Number of Patients
    name: Encounter Type By Number of Patients
    model: healthcare
    explore: encounter_extended
    type: looker_bar
    fields: [encounter.count, encounter__type__coding.display]
    filters:
      encounter.period__start_date: after 2018/01/01
      encounter__type__coding.display: "-%Follow-up%,-%follow%,-%check-up%,-%check\
        \ up%"
    sorts: [encounter.count desc]
    limit: 10
    dynamic_fields: [{table_calculation: top_condition, label: top condition, expression: 'if(row()
          = 1, yes, no)', value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        _type_hint: yesno, is_disabled: true}]
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
    custom_color_enabled: true
    show_single_value_title: false
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    series_types: {}
    hidden_fields: []
    listen: {}
    row: 35
    col: 0
    width: 8
    height: 6
  - title: Readmission by Condition
    name: Readmission by Condition
    model: healthcare
    explore: encounter_extended
    type: looker_grid
    fields: [healthcare_days_since_readmission.readmission_within_7, healthcare_days_since_readmission.count,
      condition__code__coding.display]
    pivots: [healthcare_days_since_readmission.readmission_within_7]
    fill_fields: [healthcare_days_since_readmission.readmission_within_7]
    filters:
      condition__code__coding.display: "-NULL"
      encounter.period__start_date: after 2018/01/01
      bqml_predict.encounter__type__coding_display: "-%check-up%,-%follow%,-%Follow-up%"
    sorts: [of_readmission desc 0]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${healthcare_days_since_readmission.count},1)
          + pivot_index(${healthcare_days_since_readmission.count},2)', label: total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: 'pivot_index(${healthcare_days_since_readmission.count},2) / ${total}',
        label: "% of Readmission", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: supermeasure, table_calculation: of_readmission, _type_hint: number}]
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
    defaults_version: 1
    series_types: {}
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
    hidden_fields: [total]
    listen: {}
    row: 29
    col: 8
    width: 10
    height: 6
  - title: Readmission by Encounter Type
    name: Readmission by Encounter Type
    model: healthcare
    explore: encounter_extended
    type: looker_grid
    fields: [healthcare_days_since_readmission.readmission_within_7, healthcare_days_since_readmission.count,
      encounter__type__coding.display]
    pivots: [healthcare_days_since_readmission.readmission_within_7]
    fill_fields: [healthcare_days_since_readmission.readmission_within_7]
    filters:
      condition__code__coding.display: "-NULL"
      encounter.period__start_date: after 2018/01/01
      encounter__type__coding.display: "-%Follow-up%,-%follow%,-%check-up%"
    sorts: [healthcare_days_since_readmission.readmission_within_7, of_readmission
        desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'pivot_index(${healthcare_days_since_readmission.count},1)
          + pivot_index(${healthcare_days_since_readmission.count}, 2)', label: total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: 'pivot_index(${healthcare_days_since_readmission.count},2)/ ${total}',
        label: "% of Readmission", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: supermeasure, table_calculation: of_readmission, _type_hint: number}]
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
    defaults_version: 1
    series_types: {}
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
    hidden_fields: [total]
    listen: {}
    row: 35
    col: 8
    width: 10
    height: 6
  - title: Overall Hospital Readmission Rate
    name: Overall Hospital Readmission Rate
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [healthcare_days_since_readmission.readmission_within_7, healthcare_days_since_readmission.count]
    fill_fields: [healthcare_days_since_readmission.readmission_within_7]
    filters:
      encounter.period__start_date: after 2018/01/01
    sorts: [healthcare_days_since_readmission.readmission_within_7 desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/${total}", label: Readmission
          Rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: readmission_rate, _type_hint: number}]
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
    hidden_fields: [healthcare_days_since_readmission.count, total]
    hidden_points_if_no: [healthcare_days_since_readmission.readmission_within_7]
    series_types: {}
    listen: {}
    row: 6
    col: 6
    width: 6
    height: 4
  - title: Readmission By Gender
    name: Readmission By Gender
    model: healthcare
    explore: encounter_extended
    type: looker_pie
    fields: [healthcare_days_since_readmission.count, patient.gender]
    filters:
      encounter.period__start_date: after 2018/01/01
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
    sorts: [healthcare_days_since_readmission.count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/${total}", label: Readmission
          Rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: readmission_rate, _type_hint: number}]
    value_labels: legend
    label_type: labPer
    series_colors:
      female: "#EA4335"
      male: "#4285F4"
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
    hidden_fields: [healthcare_days_since_readmission.count, total]
    hidden_points_if_no: []
    series_types: {}
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 23
    col: 16
    width: 8
    height: 6
  - title: Number of Readmissions Past 2 Months
    name: Number of Readmissions Past 2 Months
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.period__start_month, healthcare_days_since_readmission.count]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.period__start_month: 2 months ago for 2 months
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
    sorts: [encounter.period__start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total_1, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/ ${total_1}", label: New
          Calculation, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: new_calculation, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: "${healthcare_days_since_readmission.count}\
          \ - offset(${healthcare_days_since_readmission.count},1)", label: vs Last
          Month, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: vs_last_month, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
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
    hidden_fields: [encounter.period__start_month]
    hidden_points_if_no: []
    series_types: {}
    listen: {}
    row: 10
    col: 6
    width: 6
    height: 4
  - title: Hospital Encounters
    name: Hospital Encounters
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.period__start_month, encounter.count]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.period__start_month: 2 months ago for 2 months
    sorts: [encounter.period__start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${encounter.count}\
          \ - offset(${encounter.count},1)", label: vs Last Month, value_format: !!null '',
        value_format_name: !!null '', _kind_hint: measure, table_calculation: vs_last_month,
        _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
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
    row: 6
    col: 0
    width: 6
    height: 4
  - title: Readmission by Age Tier
    name: Readmission by Age Tier
    model: healthcare
    explore: encounter_extended
    type: looker_column
    fields: [healthcare_days_since_readmission.count, patient.age_tier]
    filters:
      encounter.period__start_date: after 2018/01/01
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
      healthcare_days_since_readmission.count: NOT NULL
    sorts: [patient.age_tier]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/${total}", label: Readmission
          Rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: readmission_rate, _type_hint: number}, {category: table_calculation,
        expression: 'if(${healthcare_days_since_readmission.count} = max(${healthcare_days_since_readmission.count}),
          ${healthcare_days_since_readmission.count}, null)', label: New Calculation,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: new_calculation, _type_hint: number}, {category: table_calculation,
        expression: 'if(${healthcare_days_since_readmission.count} != max(${healthcare_days_since_readmission.count}),
          ${healthcare_days_since_readmission.count}, null)', label: New Calculation,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: new_calculation_1, _type_hint: number}]
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
    hide_legend: true
    series_types: {}
    series_colors:
      new_calculation: "#EA4335"
      new_calculation_1: "#4285F4"
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_fields: [healthcare_days_since_readmission.count, total, readmission_rate]
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 23
    col: 0
    width: 8
    height: 6
  - title: Readmission by Length of Stay
    name: Readmission by Length of Stay
    model: healthcare
    explore: encounter_extended
    type: looker_column
    fields: [healthcare_days_since_readmission.count, encounter.length_of_stay_tier]
    filters:
      encounter.period__start_date: after 2018/01/01
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
      healthcare_days_since_readmission.count: NOT NULL
    sorts: [encounter.length_of_stay_tier]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/${total}", label: Readmission
          Rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: readmission_rate, _type_hint: number}, {category: table_calculation,
        expression: 'if(${readmission_rate} = max(${readmission_rate}), ${readmission_rate},
          null)', label: New Calculation, value_format: !!null '', value_format_name: percent_0,
        _kind_hint: measure, table_calculation: new_calculation, _type_hint: number},
      {category: table_calculation, expression: 'if(${readmission_rate} != max(${readmission_rate}),
          ${readmission_rate}, null)', label: New Calculation, value_format: !!null '',
        value_format_name: percent_0, _kind_hint: measure, table_calculation: new_calculation_1,
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
    hide_legend: true
    series_types: {}
    series_colors:
      new_calculation: "#EA4335"
      new_calculation_1: "#4285F4"
    value_labels: legend
    label_type: labPer
    defaults_version: 1
    hidden_fields: [healthcare_days_since_readmission.count, total, readmission_rate]
    hidden_points_if_no: []
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 23
    col: 8
    width: 8
    height: 6
  - name: " (2)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #FBBC04; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M15.573,11.624c0.568-0.478,0.947-1.219,0.947-2.019c0-1.37-1.108-2.569-2.371-2.569s-2.371,1.2-2.371,2.569c0,0.8,0.379,1.542,0.946,2.019c-0.253,0.089-0.496,0.2-0.728,0.332c-0.743-0.898-1.745-1.573-2.891-1.911c0.877-0.61,1.486-1.666,1.486-2.812c0-1.79-1.479-3.359-3.162-3.359S4.269,5.443,4.269,7.233c0,1.146,0.608,2.202,1.486,2.812c-2.454,0.725-4.252,2.998-4.252,5.685c0,0.218,0.178,0.396,0.395,0.396h16.203c0.218,0,0.396-0.178,0.396-0.396C18.497,13.831,17.273,12.216,15.573,11.624\
      \ M12.568,9.605c0-0.822,0.689-1.779,1.581-1.779s1.58,0.957,1.58,1.779s-0.688,1.779-1.58,1.779S12.568,10.427,12.568,9.605\
      \ M5.06,7.233c0-1.213,1.014-2.569,2.371-2.569c1.358,0,2.371,1.355,2.371,2.569S8.789,9.802,7.431,9.802C6.073,9.802,5.06,8.447,5.06,7.233\
      \ M2.309,15.335c0.202-2.649,2.423-4.742,5.122-4.742s4.921,2.093,5.122,4.742H2.309z\
      \ M13.346,15.335c-0.067-0.997-0.382-1.928-0.882-2.732c0.502-0.271,1.075-0.429,1.686-0.429c1.828,0,3.338,1.385,3.535,3.161H13.346z\"\
      ></path>\n\t\t\t\t\t\t</svg>\n<h1>Demographics</h1>\n<p> Hospitalization demographics\
      \ in relation to readmission within 7 days</p>\n    </div>\n</div>\n\n"
    row: 19
    col: 0
    width: 24
    height: 4
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #FBBC04; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M18.121,9.88l-7.832-7.836c-0.155-0.158-0.428-0.155-0.584,0L1.842,9.913c-0.262,0.263-0.073,0.705,0.292,0.705h2.069v7.042c0,0.227,0.187,0.414,0.414,0.414h3.725c0.228,0,0.414-0.188,0.414-0.414v-3.313h2.483v3.313c0,0.227,0.187,0.414,0.413,0.414h3.726c0.229,0,0.414-0.188,0.414-0.414v-7.042h2.068h0.004C18.331,10.617,18.389,10.146,18.121,9.88\
      \ M14.963,17.245h-2.896v-3.313c0-0.229-0.186-0.415-0.414-0.415H8.342c-0.228,0-0.414,0.187-0.414,0.415v3.313H5.032v-6.628h9.931V17.245z\
      \ M3.133,9.79l6.864-6.868l6.867,6.868H3.133z\"></path>\n\n\t\t\t\t\t\t</svg>\n\
      <h1>Readmission Overview</h1>\n<p> Metrics on hospital readmission rates within\
      \ 7 days</p>\n    </div>\n</div>\n\n"
    row: 2
    col: 0
    width: 24
    height: 4
  - title: Number of Patients Admitted
    name: Number of Patients Admitted
    model: healthcare
    explore: encounter_extended
    type: single_value
    fields: [encounter.period__start_month, patient.count]
    fill_fields: [encounter.period__start_month]
    filters:
      encounter.period__start_date: 2 months ago for 2 months
      healthcare_days_since_readmission.readmission_within_7: 'Yes'
    sorts: [encounter.period__start_month desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: "${healthcare_days_since_readmission.count}\
          \ - offset(${healthcare_days_since_readmission.count},1)", label: diff,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: diff, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${healthcare_days_since_readmission.count}/${total}", label: Readmission
          Rate, value_format: !!null '', value_format_name: percent_1, _kind_hint: measure,
        table_calculation: readmission_rate, _type_hint: number, is_disabled: true},
      {category: table_calculation, expression: 'sum(${healthcare_days_since_readmission.count})',
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        table_calculation: total, _type_hint: number, is_disabled: true}, {category: table_calculation,
        expression: "${patient.count} - offset(${patient.count},1)", label: vs Last
          Month, value_format: !!null '', value_format_name: decimal_0, _kind_hint: measure,
        table_calculation: vs_last_month, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
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
    hidden_fields:
    hidden_points_if_no: []
    series_types: {}
    listen: {}
    row: 10
    col: 0
    width: 6
    height: 4
  - title: Encounter Types
    name: Encounter Types
    model: healthcare
    explore: healthcare_predictions
    type: looker_bar
    fields: [healthcare_predictions.encounter_type_coding_display, healthcare_predictions.count]
    filters:
      healthcare_predictions.encounter_type_coding_display: "-%check up%,-%follow%,-%Follow-up%"
    sorts: [healthcare_predictions.count desc]
    limit: 10
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
    y_axes: [{label: Number of Encounters, orientation: bottom, series: [{axisId: healthcare_predictions.count,
            id: healthcare_predictions.count, name: Healthcare Predictions}], showLabels: true,
        showValues: true, valueFormat: '', unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_label: ''
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 6
    col: 12
    width: 12
    height: 8
  - title: Most At Risk Patients
    name: Most At Risk Patients
    model: healthcare
    explore: encounter_extended
    type: looker_grid
    fields: [patient.id, healthcare_days_since_readmission.count, healthcare_days_since_readmission.readmission_within_7,
      patient.name]
    pivots: [healthcare_days_since_readmission.readmission_within_7]
    filters:
      condition__code__coding.display: "-NULL"
      encounter.period__start_date: after 2018/01/01
      healthcare_days_since_readmission.count: NOT NULL
    sorts: [healthcare_days_since_readmission.readmission_within_7, patient.id desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{category: table_calculation, expression: 'coalesce(pivot_index(${healthcare_days_since_readmission.count},1),0)
          + pivot_index(${healthcare_days_since_readmission.count},2)', label: total,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: 'pivot_index(${healthcare_days_since_readmission.count},2) / ${total}',
        label: "% of Readmission", value_format: !!null '', value_format_name: percent_1,
        _kind_hint: supermeasure, table_calculation: of_readmission, _type_hint: number},
      {category: table_calculation, expression: 'if(is_null(${of_readmission}),no,yes)',
        label: filter, value_format: !!null '', value_format_name: !!null '', _kind_hint: supermeasure,
        table_calculation: filter, _type_hint: yesno}]
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
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#4285F4",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 20, stepped: true, reverse: true}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    defaults_version: 1
    series_types: {}
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
    hidden_fields: [total, healthcare_days_since_readmission.count, patient.id]
    hidden_points_if_no: [filter]
    listen: {}
    row: 29
    col: 18
    width: 6
    height: 12
