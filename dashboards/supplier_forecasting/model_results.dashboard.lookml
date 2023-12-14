- dashboard: 3_model_results
  title: "(3) Model Results"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - name: Model Results
    type: text
    title_text: Model Results
    row: 0
    col: 0
    width: 24
    height: 2
  - title: Training Detail
    name: Training Detail
    model: supplier_forecasting
    explore: machine_learning_raw
    type: looker_grid
    fields: [machine_learning_raw.iteration, machine_learning_raw.learning_rate, machine_learning_raw.loss]
    sorts: [machine_learning_raw.iteration]
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
    row: 2
    col: 4
    width: 9
    height: 6
  - title: Training Loss over Time
    name: Training Loss over Time
    model: supplier_forecasting
    explore: machine_learning_raw
    type: looker_area
    fields: [machine_learning_raw.iteration, machine_learning_raw.total_loss]
    sorts: [machine_learning_raw.iteration]
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
    interpolation: linear
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: machine_learning_raw.total_loss,
            id: machine_learning_raw.total_loss, name: Total Loss}], showLabels: true,
        showValues: true, unpinAxis: true, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_colors:
      machine_learning_raw.total_loss: "#4276BE"
    ordering: none
    show_null_labels: false
    defaults_version: 1
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 2
    col: 13
    width: 11
    height: 6
  - title: Model Details
    name: Model Details
    model: supplier_forecasting
    explore: predictive_power_raw
    type: looker_single_record
    fields: [predictive_power_raw.mean_absolute_error, predictive_power_raw.mean_squared_error,
      predictive_power_raw.median_absolute_error, predictive_power_raw.median_squared_error,
      predictive_power_raw.r_squared]
    sorts: [predictive_power_raw.mean_absolute_error]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
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
    defaults_version: 1
    listen: {}
    row: 2
    col: 0
    width: 4
    height: 6
  - name: Predictions
    type: text
    title_text: Predictions
    row: 8
    col: 0
    width: 24
    height: 2
  - title: Predictions over Time
    name: Predictions over Time
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_line
    fields: [supply_forecasting_raw.week_start_week, applied_model_results.average_actual,
      applied_model_results.average_predicted, applied_model_results.average_error]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: applied_model_results.average_actual,
            id: applied_model_results.average_actual, name: Average Actual}, {axisId: applied_model_results.average_predicted,
            id: applied_model_results.average_predicted, name: Average Predicted},
          {axisId: applied_model_results.average_error, id: applied_model_results.average_error,
            name: Average Error}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [applied_model_results.average_error]
    series_types: {}
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 10
    col: 0
    width: 12
    height: 11
  - title: Residuals
    name: Residuals
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_line
    fields: [supply_forecasting_raw.week_start_week, applied_model_results.average_actual,
      applied_model_results.average_predicted, applied_model_results.average_error]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: applied_model_results.average_actual,
            id: applied_model_results.average_actual, name: Average Actual}, {axisId: applied_model_results.average_predicted,
            id: applied_model_results.average_predicted, name: Average Predicted},
          {axisId: applied_model_results.average_error, id: applied_model_results.average_error,
            name: Average Error}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [applied_model_results.average_error]
    series_types: {}
    series_colors:
      applied_model_results.average_error: "#592EC2"
    reference_lines: [{reference_type: line, range_start: max, range_end: min, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: "#000000",
        line_value: '0', label: Actual}, {reference_type: range, line_value: mean,
        margin_top: deviation, margin_value: mean, margin_bottom: deviation, label_position: right,
        color: red, range_start: '4000', range_end: '2000', label: Far Off}, {reference_type: range,
        line_value: mean, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: red, range_start: "-4000", range_end: "-2000",
        label: Far Off}, {reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: orange,
        range_start: '2000', range_end: '500', label: Close}, {reference_type: range,
        line_value: mean, margin_top: deviation, margin_value: mean, margin_bottom: deviation,
        label_position: right, color: orange, range_start: "-2000", range_end: "-500",
        label: Close}, {reference_type: range, line_value: mean, margin_top: deviation,
        margin_value: mean, margin_bottom: deviation, label_position: right, color: green,
        range_start: '500', range_end: "-500", label: Very Close}]
    defaults_version: 1
    hidden_fields: [applied_model_results.average_predicted, applied_model_results.average_actual]
    listen: {}
    row: 10
    col: 12
    width: 12
    height: 11
  - title: Predictions by SKU
    name: Predictions by SKU
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_grid
    fields: [applied_model_results.average_actual, applied_model_results.average_predicted,
      applied_model_results.average_error, supply_forecasting_raw.sku]
    sorts: [applied_model_results.average_error desc]
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
    series_cell_visualizations:
      applied_model_results.average_actual:
        is_active: false
      applied_model_results.average_error:
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
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: applied_model_results.average_actual,
            id: applied_model_results.average_actual, name: Average Actual}, {axisId: applied_model_results.average_predicted,
            id: applied_model_results.average_predicted, name: Average Predicted},
          {axisId: applied_model_results.average_error, id: applied_model_results.average_error,
            name: Average Error}], showLabels: true, showValues: true, unpinAxis: true,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [applied_model_results.average_error]
    series_types: {}
    defaults_version: 1
    hidden_fields:
    listen: {}
    row: 21
    col: 0
    width: 24
    height: 8
