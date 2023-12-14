- dashboard: ga360_overview
  title: GA360 Overview
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Sessions
    name: Sessions
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.session_count, ga_sessions.partition_date]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 0
    width: 4
    height: 3
  - title: Avg Duration
    name: Avg Duration
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, totals.timeonsite_average_per_session]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${totals.timeonsite_average_per_session}\
          \ - offset(${totals.timeonsite_average_per_session},1)) / offset(${totals.timeonsite_average_per_session},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 12
    width: 4
    height: 3
  - title: Users
    name: Users
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, ga_sessions.unique_visitors]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.unique_visitors}\
          \ - offset(${ga_sessions.unique_visitors},1)) / offset(${ga_sessions.unique_visitors},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 4
    width: 4
    height: 3
  - title: Returning Users
    name: Returning Users
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, ga_sessions.returning_visitors]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.returning_visitors}\
          \ - offset(${ga_sessions.returning_visitors},1)) / offset(${ga_sessions.returning_visitors},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 8
    width: 4
    height: 3
  - title: Bounce Rate
    name: Bounce Rate
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, totals.bounce_rate]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${totals.bounce_rate}\
          \ - offset(${totals.bounce_rate},1)) / offset(${totals.bounce_rate},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 20
    width: 4
    height: 3
  - title: Page Views
    name: Page Views
    model: ga360
    explore: ga_sessions
    type: single_value
    fields: [ga_sessions.partition_date, totals.page_views_session]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${totals.page_views_session}\
          \ - offset(${totals.page_views_session},1)) / offset(${totals.page_views_session},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: false,
        _kind_hint: measure, _type_hint: number}]
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    comparison_label: ''
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
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 0
    col: 16
    width: 4
    height: 3
  - title: Time Series
    name: Time Series
    model: ga360
    explore: ga_sessions
    type: looker_line
    fields: [ga_sessions.session_count, ga_sessions.partition_date, totals.page_views_session,
      totals.timeonsite_average_per_session]
    fill_fields: [ga_sessions.partition_date]
    filters: {}
    sorts: [ga_sessions.partition_date]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types:
      ga_sessions.session_count: column
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 12
    col: 0
    width: 12
    height: 10
  - title: How Often are Users Returning?
    name: How Often are Users Returning?
    model: ga360
    explore: ga_sessions
    type: looker_column
    fields: [ga_sessions.session_count, ga_sessions.visitnumber]
    filters:
      ga_sessions.visitnumber: "<8"
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types: {}
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 12
    col: 12
    width: 12
    height: 10
  - title: When are users engaging?
    name: When are users engaging?
    model: ga360
    explore: ga_sessions
    type: looker_grid
    fields: [ga_sessions.session_count, ga_sessions.partition_day_of_week, ga_sessions.hour_of_day]
    pivots: [ga_sessions.partition_day_of_week]
    fill_fields: [ga_sessions.partition_day_of_week]
    filters:
      ga_sessions.visitnumbertier: "-Below 1"
    sorts: [ga_sessions.partition_day_of_week 0, ga_sessions.hour_of_day]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    series_cell_visualizations:
      ga_sessions.session_count:
        is_active: false
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ga_sessions.session_count]}]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types: {}
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 22
    col: 0
    width: 12
    height: 10
  - title: Engagement by Property
    name: Engagement by Property
    model: ga360
    explore: ga_sessions
    type: looker_column
    fields: [ga_sessions.session_count, ga_sessions.property, totals.timeonsite_average_per_session]
    filters:
      ga_sessions.visitnumbertier: "-Below 1"
    sorts: [ga_sessions.session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types:
      totals.timeonsite_average_per_session: scatter
    show_dropoff: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ga_sessions.session_count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ga_sessions.session_count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 3
    col: 0
    width: 8
    height: 9
  - title: Engagement by Medium
    name: Engagement by Medium
    model: ga360
    explore: ga_sessions
    type: looker_column
    fields: [ga_sessions.session_count, totals.timeonsite_average_per_session, trafficSource.medium]
    filters:
      ga_sessions.visitnumbertier: "-Below 1"
    sorts: [ga_sessions.session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types:
      totals.timeonsite_average_per_session: scatter
    show_dropoff: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ga_sessions.session_count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ga_sessions.session_count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 3
    col: 8
    width: 8
    height: 9
  - title: Engagement by Location
    name: Engagement by Location
    model: ga360
    explore: ga_sessions
    type: looker_map
    fields: [ga_sessions.session_count, totals.timeonsite_average_per_session, geoNetwork.region]
    filters:
      ga_sessions.visitnumbertier: "-Below 1"
      geoNetwork.country: United States
    sorts: [ga_sessions.session_count desc]
    limit: 10
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
    show_view_names: false
    show_legend: true
    quantize_map_value_colors: false
    reverse_map_value_colors: false
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
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types: {}
    show_dropoff: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    show_row_numbers: true
    transpose: false
    truncate_text: true
    size_to_fit: true
    series_cell_visualizations:
      ga_sessions.session_count:
        is_active: false
    table_theme: white
    enable_conditional_formatting: true
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ga_sessions.session_count]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hide_totals: false
    hide_row_totals: false
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 3
    col: 16
    width: 8
    height: 9
  - title: Top Pages
    name: Top Pages
    model: ga360
    explore: ga_sessions
    type: looker_grid
    fields: [ga_sessions.session_count, hits_page.pageTitle, totals.page_views_session,
      totals.bounce_rate, totals.timeonsite_average_per_session]
    filters: {}
    sorts: [ga_sessions.session_count desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: vs_last_week, label: vs. last week, expression: "(${ga_sessions.session_count}\
          \ - offset(${ga_sessions.session_count},1)) / offset(${ga_sessions.session_count},1)",
        value_format: !!null '', value_format_name: percent_1, is_disabled: true,
        _kind_hint: measure, _type_hint: number}]
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
      totals.timeonsite_average_per_session: Time on Site
    series_cell_visualizations:
      ga_sessions.session_count:
        is_active: false
      totals.timeonsite_average_per_session:
        is_active: true
      totals.bounce_rate:
        is_active: true
        palette:
          palette_id: d1bfbb22-126c-88a2-4f82-af183fa452c4
          collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7
          custom_colors:
          - "#4276BE"
          - "#3EB0D5"
          - "#ffffff"
          - "#FBB555"
          - "#E57947"
      totals.page_views_session:
        is_active: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#3EB0D5",
        font_color: !!null '', color_application: {collection_id: b43731d5-dc87-4a8e-b807-635bef3948e7,
          palette_id: 1e4d66b9-f066-4c33-b0b7-cc10b4810688, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: [ga_sessions.session_count]}]
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
    point_style: circle
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: ga_sessions.session_count,
            id: ga_sessions.session_count, name: Session Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: left, series: [{axisId: totals.page_views_session,
            id: totals.page_views_session, name: PageViews Per Session}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: totals.timeonsite_average_per_session,
            id: totals.timeonsite_average_per_session, name: Time On Site Average
              Per Session}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    hidden_series: [vs_last_week]
    series_types: {}
    show_dropoff: true
    show_null_points: true
    interpolation: linear
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: true
    comparison_type: change
    comparison_reverse_colors: false
    show_comparison_label: false
    comparison_label: ''
    defaults_version: 1
    listen:
      Period: ga_sessions.partition_date
      Property: ga_sessions.property
      First Time Visitor: ga_sessions.first_time_visitor
      State: geoNetwork.region
      Medium: trafficSource.medium
    row: 22
    col: 12
    width: 12
    height: 10
  filters:
  - name: Period
    title: Period
    type: field_filter
    default_value: 7 days
    allow_multiple_values: true
    required: false
    model: ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.partition_date
  - name: Property
    title: Property
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.property
  - name: First Time Visitor
    title: First Time Visitor
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ga360
    explore: ga_sessions
    listens_to_filters: []
    field: ga_sessions.first_time_visitor
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ga360
    explore: ga_sessions
    listens_to_filters: []
    field: geoNetwork.region
  - name: Medium
    title: Medium
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    model: ga360
    explore: ga_sessions
    listens_to_filters: []
    field: trafficSource.medium
