- dashboard: 1_data_overview
  title: "(1) Data Overview"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Summary over Time
    name: Summary over Time
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_line
    fields: [supply_forecasting_raw.sum_ordered, supply_forecasting_raw.sum_shipped,
      supply_forecasting_raw.sum_gap, supply_forecasting_raw.week_start_month]
    fill_fields: [supply_forecasting_raw.week_start_month]
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
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: supply_forecasting_raw.sum_ordered,
            id: supply_forecasting_raw.sum_ordered, name: Ordered}, {axisId: supply_forecasting_raw.sum_shipped,
            id: supply_forecasting_raw.sum_shipped, name: Shipped}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: supply_forecasting_raw.sum_gap,
            id: supply_forecasting_raw.sum_gap, name: Gap}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [supply_forecasting_raw.sum_gap]
    series_types: {}
    series_colors:
      supply_forecasting_raw.sum_gap: "#592EC2"
    series_labels:
      supply_forecasting_raw.sum_ordered: Ordered
      supply_forecasting_raw.sum_shipped: Shipped
      supply_forecasting_raw.sum_gap: Gap
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 4
    col: 0
    width: 10
    height: 14
  - title: "# Weeks"
    name: "# Weeks"
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: single_value
    fields: [supply_forecasting_raw.number_weeks]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: supply_forecasting_raw.sum_ordered,
            id: supply_forecasting_raw.sum_ordered, name: Ordered}, {axisId: supply_forecasting_raw.sum_shipped,
            id: supply_forecasting_raw.sum_shipped, name: Shipped}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: supply_forecasting_raw.sum_gap,
            id: supply_forecasting_raw.sum_gap, name: Gap}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    hidden_series: [supply_forecasting_raw.sum_gap]
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      supply_forecasting_raw.sum_gap: "#592EC2"
    series_labels:
      supply_forecasting_raw.sum_ordered: Ordered
      supply_forecasting_raw.sum_shipped: Shipped
      supply_forecasting_raw.sum_gap: Gap
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 0
    width: 5
    height: 4
  - title: "# SKUs"
    name: "# SKUs"
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: single_value
    fields: [supply_forecasting_raw.number_skus]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: supply_forecasting_raw.sum_ordered,
            id: supply_forecasting_raw.sum_ordered, name: Ordered}, {axisId: supply_forecasting_raw.sum_shipped,
            id: supply_forecasting_raw.sum_shipped, name: Shipped}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: supply_forecasting_raw.sum_gap,
            id: supply_forecasting_raw.sum_gap, name: Gap}], showLabels: true, showValues: true,
        unpinAxis: true, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    hidden_series: [supply_forecasting_raw.sum_gap]
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      supply_forecasting_raw.sum_gap: "#592EC2"
    series_labels:
      supply_forecasting_raw.sum_ordered: Ordered
      supply_forecasting_raw.sum_shipped: Shipped
      supply_forecasting_raw.sum_gap: Gap
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 5
    width: 5
    height: 4
  - title: SKU Overview
    name: SKU Overview
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_grid
    fields: [supply_forecasting_raw.sku, supply_forecasting_raw.sum_ordered_per_week,
      supply_forecasting_raw.variance_from_sum_ordered_per_week, supply_forecasting_raw.percent_weeks_with_data]
    sorts: [supply_forecasting_raw.sum_ordered_per_week desc]
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
      supply_forecasting_raw.sum_ordered: Ordered
      supply_forecasting_raw.sum_shipped: Shipped
      supply_forecasting_raw.sum_gap: Gap
      supply_forecasting_raw.variance_from_sum_ordered_per_week: Std Dev from Mean
      supply_forecasting_raw.sum_ordered_per_week: Avg Weekly Order
      supply_forecasting_raw.percent_weeks_with_data: "% Weeks w/ Data"
    series_cell_visualizations:
      supply_forecasting_raw.variance_from_sum_ordered_per_week:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      supply_forecasting_raw.sum_ordered_per_week:
        is_active: true
      supply_forecasting_raw.number_weeks_with_sales:
        is_active: false
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          custom: {id: de544734-96a0-9aa9-246b-56d91d5a935f, label: Custom, type: continuous,
            stops: [{color: "#ffceaf", offset: 0}, {color: "#c8de91", offset: 50},
              {color: "#81dea5", offset: 100}]}, options: {steps: 3, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [supply_forecasting_raw.percent_weeks_with_data]}]
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: supply_forecasting_raw.sum_ordered,
            id: supply_forecasting_raw.sum_ordered, name: Ordered}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: left, series: [{axisId: supply_forecasting_raw.variance_from_sum_ordered_per_week,
            id: supply_forecasting_raw.variance_from_sum_ordered_per_week, name: Variance
              as a % of Total Weekly Sales}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: left,
        series: [{axisId: supply_forecasting_raw.number_weeks_with_sales, id: supply_forecasting_raw.number_weeks_with_sales,
            name: Number Weeks with Sales}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: supply_forecasting_raw.sum_ordered_per_week
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    hidden_series: [supply_forecasting_raw.sum_gap]
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      supply_forecasting_raw.sum_gap: "#592EC2"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 0
    col: 10
    width: 14
    height: 13
  - title: SKU Buckets
    name: SKU Buckets
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_grid
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.variance_from_sum_ordered_per_week,
      supply_forecasting_raw.percent_weeks_with_data, sku_buckets.sku_category]
    fill_fields: [sku_buckets.sku_category]
    sorts: [supply_forecasting_raw.sum_ordered_per_week desc]
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
      supply_forecasting_raw.sum_ordered: Ordered
      supply_forecasting_raw.sum_shipped: Shipped
      supply_forecasting_raw.sum_gap: Gap
      supply_forecasting_raw.variance_from_sum_ordered_per_week: Avg Std Dev from
        Mean
      supply_forecasting_raw.sum_ordered_per_week: Avg Weekly Order
      supply_forecasting_raw.percent_weeks_with_data: "% Weeks w/ Data"
    series_cell_visualizations:
      supply_forecasting_raw.variance_from_sum_ordered_per_week:
        is_active: true
        palette:
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
      supply_forecasting_raw.sum_ordered_per_week:
        is_active: true
      supply_forecasting_raw.number_weeks_with_sales:
        is_active: false
        palette:
          palette_id: afd46b40-e939-4ace-bffd-69d1bb16ee05
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
    conditional_formatting: []
    x_axis_gridlines: false
    y_axis_gridlines: true
    y_axes: [{label: '', orientation: left, series: [{axisId: supply_forecasting_raw.sum_ordered,
            id: supply_forecasting_raw.sum_ordered, name: Ordered}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: '', orientation: left, series: [{axisId: supply_forecasting_raw.variance_from_sum_ordered_per_week,
            id: supply_forecasting_raw.variance_from_sum_ordered_per_week, name: Variance
              as a % of Total Weekly Sales}], showLabels: true, showValues: true,
        unpinAxis: false, tickDensity: default, type: linear}, {label: '', orientation: left,
        series: [{axisId: supply_forecasting_raw.number_weeks_with_sales, id: supply_forecasting_raw.number_weeks_with_sales,
            name: Number Weeks with Sales}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    size_by_field: supply_forecasting_raw.sum_ordered_per_week
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    hidden_series: [supply_forecasting_raw.sum_gap]
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      supply_forecasting_raw.sum_gap: "#592EC2"
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 13
    col: 10
    width: 14
    height: 5
