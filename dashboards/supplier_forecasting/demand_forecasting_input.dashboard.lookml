- dashboard: 2_demand_forecasting_inputs
  title: "(2) Demand Forecasting - Inputs"
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Today vs 90 Days Prior
    name: Today vs 90 Days Prior
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, subtract_30_back_365_days.sum_ordered_per_week,
      supply_forecasting_raw.sum_ordered_per_week]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [subtract_30_back_365_days.sum_ordered_per_week desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 2
    col: 0
    width: 8
    height: 8
  - name: Recency
    type: text
    title_text: Recency
    subtitle_text: How predictive are recent transactions?
    row: 0
    col: 0
    width: 8
    height: 2
  - name: Seasonality
    type: text
    title_text: Seasonality
    subtitle_text: How predictive are transactions same time last year?
    row: 0
    col: 8
    width: 8
    height: 2
  - name: Growth
    type: text
    title_text: Growth
    subtitle_text: How predictive is growth rate of transactions?
    row: 0
    col: 16
    width: 8
    height: 2
  - title: Today vs 365 Days Prior
    name: Today vs 365 Days Prior
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, supply_forecasting_raw.sum_ordered_per_week,
      subtract_30_back_365_days.sum_ordered_per_week]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.sum_ordered_per_week desc]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 10
    col: 0
    width: 8
    height: 8
  - title: Today vs Same Month Last Year
    name: Today vs Same Month Last Year
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, supply_forecasting_raw.sum_ordered_per_week,
      same_month_last_year.sum_ordered_per_week]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 2
    col: 8
    width: 8
    height: 8
  - title: Today vs Same Quarter Last Year
    name: Today vs Same Quarter Last Year
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, supply_forecasting_raw.sum_ordered_per_week,
      same_quarter_last_year.sum_ordered_per_week]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 10
    col: 8
    width: 8
    height: 8
  - title: Today vs Growth in Last 2 Months
    name: Today vs Growth in Last 2 Months
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, supply_forecasting_raw.sum_ordered_per_week,
      cross_join.growth_last_month_vs_two_months_ago]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 2
    col: 16
    width: 8
    height: 8
  - title: Today vs Growth in Last Year
    name: Today vs Growth in Last Year
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.week_start_week, supply_forecasting_raw.sum_ordered_per_week,
      cross_join.growth_last_month_vs_last_year]
    fill_fields: [supply_forecasting_raw.week_start_week]
    sorts: [supply_forecasting_raw.week_start_week]
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
    y_axes: [{label: '', orientation: left, series: [{axisId: subtract_30_back_90_days.sum_ordered_per_week,
            id: subtract_30_back_90_days.sum_ordered_per_week, name: Subtract 30 Back
              90 Days}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      SKU Bucket: sku_buckets.sku_category
    row: 10
    col: 16
    width: 8
    height: 8
  - title: Search Traffic for SKU - 2 Weeks Prior
    name: Search Traffic for SKU - 2 Weeks Prior
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.sum_search_traffic_sku_14,
      supply_forecasting_raw.week_start_week]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 20
    col: 8
    width: 8
    height: 8
  - title: Search Traffic for SKU - 4 Weeks Prior
    name: Search Traffic for SKU - 4 Weeks Prior
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.week_start_week,
      supply_forecasting_raw.sum_search_traffic_sku_28]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 20
    col: 0
    width: 8
    height: 8
  - name: Search Traffic
    type: text
    title_text: Search Traffic
    subtitle_text: How predictive are search terms for that SKU (or competitor SKU)?
    row: 18
    col: 0
    width: 24
    height: 2
  - title: Search Traffic for Competitor SKU - 2 Weeks Prior
    name: Search Traffic for Competitor SKU - 2 Weeks Prior
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.week_start_week,
      supply_forecasting_raw.sum_search_traffic_sku_14_competitor]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 20
    col: 16
    width: 8
    height: 8
  - name: Additional Datasets
    type: text
    title_text: Additional Datasets
    row: 28
    col: 0
    width: 24
    height: 2
  - title: Medicare - Eye Care Spend
    name: Medicare - Eye Care Spend
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.week_start_week,
      supply_forecasting_raw.sum_eye_spend]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 30
    col: 0
    width: 8
    height: 8
  - title: Medicare - Eye Care Visits
    name: Medicare - Eye Care Visits
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.week_start_week,
      supply_forecasting_raw.sum_eye_visits]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 30
    col: 8
    width: 8
    height: 8
  - title: "% Population over 30"
    name: "% Population over 30"
    model: supplier_forecasting
    explore: supply_forecasting_raw
    type: looker_scatter
    fields: [supply_forecasting_raw.sum_ordered_per_week, supply_forecasting_raw.week_start_week,
      supply_forecasting_raw.percent_population_over_30]
    fill_fields: [supply_forecasting_raw.week_start_week]
    filters: {}
    sorts: [supply_forecasting_raw.week_start_week desc]
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
    series_types: {}
    trend_lines: [{color: "#000000", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, label_type: r2}]
    interpolation: linear
    defaults_version: 1
    hidden_fields: [supply_forecasting_raw.week_start_week]
    listen:
      Location: supply_forecasting_raw.map_level
      SKU Bucket: sku_buckets.sku_category
    row: 30
    col: 16
    width: 8
    height: 8
  filters:
  - name: Location
    title: Location
    type: field_filter
    default_value: national
    allow_multiple_values: true
    required: false
    model: supplier_forecasting
    explore: supply_forecasting_raw
    listens_to_filters: []
    field: supply_forecasting_raw.map_level
  - name: SKU Bucket
    title: SKU Bucket
    type: field_filter
    default_value: "-Undefined"
    allow_multiple_values: true
    required: false
    model: supplier_forecasting
    explore: supply_forecasting_raw
    listens_to_filters: []
    field: sku_buckets.sku_category
