- dashboard: model_performance
  title: Model Performance
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: ROC Curve
    name: ROC Curve
    model: healthcare
    explore: healthcare_bqml_roc
    type: looker_line
    fields: [healthcare_bqml_roc.false_positives, healthcare_bqml_roc.false_negatives,
      healthcare_bqml_roc.true_negatives, healthcare_bqml_roc.total_tp]
    sorts: [randomtpr desc]
    limit: 500
    column_limit: 50
    dynamic_fields: [{table_calculation: calculation_4, label: Calculation 4, expression: 'max(${healthcare_bqml_roc.total_tp})*(row()/max(row()))',
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number, is_disabled: true}, {_kind_hint: measure, table_calculation: tpr,
        _type_hint: number, category: table_calculation, expression: "${healthcare_bqml_roc.total_tp}\
          \ / (${healthcare_bqml_roc.total_tp} + ${healthcare_bqml_roc.false_negatives})",
        label: TPR, value_format: !!null '', value_format_name: !!null ''}, {table_calculation: randomtpr,
        label: randomTPR, expression: "${fpr}+(0*${healthcare_bqml_roc.total_tp})",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}, {table_calculation: fpr, label: FPR, expression: "${healthcare_bqml_roc.false_positives}/\
          \ (${healthcare_bqml_roc.false_positives} + ${healthcare_bqml_roc.true_negatives})",
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
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
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    series_types: {}
    hidden_fields: [healthcare_bqml_roc.false_positives, healthcare_bqml_roc.false_negatives,
      healthcare_bqml_roc.true_negatives, healthcare_bqml_roc.total_tp]
    listen: {}
    row: 4
    col: 14
    width: 10
    height: 10
  - title: False Negative
    name: False Negative
    model: healthcare
    explore: healthcare_bqml_matrix_unseen
    type: single_value
    fields: [healthcare_bqml_matrix_unseen.expected_label, healthcare_bqml_matrix_unseen.false,
      healthcare_bqml_matrix_unseen.true]
    sorts: [healthcare_bqml_matrix_unseen.expected_label desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'if(row() = 1, ${healthcare_bqml_matrix_unseen.false},null)',
        label: row total, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: row_total, _type_hint: number}, {category: table_calculation,
        expression: 'if(row() = 2, ${healthcare_bqml_matrix_unseen.false}, null)',
        label: helper, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: helper, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_bqml_matrix_unseen.false} + ${healthcare_bqml_matrix_unseen.true}",
        label: True Total, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: true_total, _type_hint: number},
      {category: table_calculation, expression: "${row_total}/${true_total}", label: 'false',
        value_format: !!null '', value_format_name: percent_2, _kind_hint: dimension,
        table_calculation: 'false', _type_hint: number}, {table_calculation: 'true',
        label: 'true', expression: "${healthcare_bqml_matrix_unseen.true} / ${row_total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: dimension,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.07, background_color: "#EA4335",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    hidden_fields: [healthcare_bqml_matrix_unseen.false, healthcare_bqml_matrix_unseen.true,
      row_total, healthcare_bqml_matrix_unseen.expected_label, 'true', helper, true_total]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 4
    col: 9
    width: 5
    height: 5
  - title: False Positive
    name: False Positive
    model: healthcare
    explore: healthcare_bqml_matrix_unseen
    type: single_value
    fields: [healthcare_bqml_matrix_unseen.expected_label, healthcare_bqml_matrix_unseen.true,
      healthcare_bqml_matrix_unseen.false]
    sorts: [healthcare_bqml_matrix_unseen.expected_label desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'if(row()=2, ${healthcare_bqml_matrix_unseen.true},null)',
        label: row total, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: row_total, _type_hint: number}, {table_calculation: 'false',
        label: 'false', expression: "${healthcare_bqml_matrix_unseen.false}/${row_total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: dimension,
        _type_hint: number}, {table_calculation: 'true', label: 'true', expression: "${healthcare_bqml_matrix_unseen.true}\
          \ / ${row_total}", value_format: !!null '', value_format_name: percent_2,
        _kind_hint: dimension, _type_hint: number}, {category: table_calculation,
        expression: 'if(row() = 1, ${healthcare_bqml_matrix_unseen.false},null)',
        label: helper, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: helper, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_bqml_matrix_unseen.false} + ${healthcare_bqml_matrix_unseen.true}",
        label: tot, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: tot, _type_hint: number}, {category: table_calculation,
        expression: 'offset(${row_total} / ${tot},1)', label: FP, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: dimension, table_calculation: fp,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.5, background_color: "#FBBC04",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    hidden_fields: [healthcare_bqml_matrix_unseen.false, healthcare_bqml_matrix_unseen.true,
      row_total, healthcare_bqml_matrix_unseen.expected_label, 'true', helper, tot,
      'false']
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 9
    col: 4
    width: 5
    height: 5
  - title: True Negative
    name: True Negative
    model: healthcare
    explore: healthcare_bqml_matrix_unseen
    type: single_value
    fields: [healthcare_bqml_matrix_unseen.expected_label, healthcare_bqml_matrix_unseen.true,
      healthcare_bqml_matrix_unseen.false]
    sorts: [healthcare_bqml_matrix_unseen.expected_label desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'if(row()=2,${healthcare_bqml_matrix_unseen.false},null)',
        label: row total, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: row_total, _type_hint: number}, {category: table_calculation,
        expression: 'if(row()=1,${healthcare_bqml_matrix_unseen.true},null)', label: helper,
        value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: helper, _type_hint: number}, {table_calculation: 'false',
        label: 'false', expression: "${healthcare_bqml_matrix_unseen.false}/${row_total}",
        value_format: !!null '', value_format_name: percent_2, _kind_hint: dimension,
        _type_hint: number}, {table_calculation: 'true', label: 'true', expression: "${healthcare_bqml_matrix_unseen.true}\
          \ / ${row_total}", value_format: !!null '', value_format_name: percent_2,
        _kind_hint: dimension, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_bqml_matrix_unseen.false} + ${healthcare_bqml_matrix_unseen.true}",
        label: tot, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: tot, _type_hint: number}, {category: table_calculation,
        expression: 'offset(${row_total}/${tot},1)', label: TN, value_format: !!null '',
        value_format_name: percent_2, _kind_hint: dimension, table_calculation: tn,
        _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: less than, value: 0.6, background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    hidden_fields: [healthcare_bqml_matrix_unseen.false, healthcare_bqml_matrix_unseen.true,
      row_total, healthcare_bqml_matrix_unseen.expected_label, 'false', 'true', tot,
      helper]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 9
    col: 9
    width: 5
    height: 5
  - title: True Positive
    name: True Positive
    model: healthcare
    explore: healthcare_bqml_matrix_unseen
    type: single_value
    fields: [healthcare_bqml_matrix_unseen.expected_label, healthcare_bqml_matrix_unseen.true,
      healthcare_bqml_matrix_unseen.false]
    sorts: [healthcare_bqml_matrix_unseen.expected_label desc]
    limit: 500
    dynamic_fields: [{category: table_calculation, expression: 'if(row()=1,${healthcare_bqml_matrix_unseen.true},
          null)', label: top, value_format: !!null '', value_format_name: !!null '',
        _kind_hint: dimension, table_calculation: top, _type_hint: number}, {category: table_calculation,
        expression: 'if(row()=2,${healthcare_bqml_matrix_unseen.true},null)', label: true
          bot, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: true_bot, _type_hint: number}, {category: table_calculation,
        expression: "${healthcare_bqml_matrix_unseen.false} + ${healthcare_bqml_matrix_unseen.true}",
        label: total, value_format: !!null '', value_format_name: !!null '', _kind_hint: dimension,
        table_calculation: total, _type_hint: number}, {category: table_calculation,
        expression: "${top}/${total}", label: TP, value_format: !!null '', value_format_name: percent_2,
        _kind_hint: dimension, table_calculation: tp, _type_hint: number}]
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    conditional_formatting: [{type: greater than, value: 0.9, background_color: "#34A853",
        font_color: !!null '', color_application: {collection_id: google, palette_id: google-diverging-0,
          options: {steps: 5}}, bold: false, italic: false, strikethrough: false,
        fields: !!null ''}]
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
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    hidden_fields: [healthcare_bqml_matrix_unseen.false, healthcare_bqml_matrix_unseen.true,
      row_total, healthcare_bqml_matrix_unseen.expected_label, top, true_bot, total]
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 4
    col: 4
    width: 5
    height: 5
  - name: ''
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #FBBC04; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M17.431,2.156h-3.715c-0.228,0-0.413,0.186-0.413,0.413v6.973h-2.89V6.687c0-0.229-0.186-0.413-0.413-0.413H6.285c-0.228,0-0.413,0.184-0.413,0.413v6.388H2.569c-0.227,0-0.413,0.187-0.413,0.413v3.942c0,0.228,0.186,0.413,0.413,0.413h14.862c0.228,0,0.413-0.186,0.413-0.413V2.569C17.844,2.342,17.658,2.156,17.431,2.156\
      \ M5.872,17.019h-2.89v-3.117h2.89V17.019zM9.587,17.019h-2.89V7.1h2.89V17.019z\
      \ M13.303,17.019h-2.89v-6.651h2.89V17.019z M17.019,17.019h-2.891V2.982h2.891V17.019z\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h1>Model Performance</h1>\n<p> AutoML BQML\
      \ Model performance on unseen data (admissions after 2020) </p>\n    </div>\n\
      </div>\n\n"
    row: 4
    col: 0
    width: 4
    height: 10
  - name: " (2)"
    type: text
    title_text: ''
    subtitle_text: ''
    body_text: |-
      <div style="border-bottom: solid 1px #4285F4;">

      <nav style="font-size: 18px; padding: 5px 10px 0 10px; height: 60px">

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::new_survey">New Survey</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::patient_readmission_lookup">Patient Readmission Lookup</a>

        <a style="padding: 5px 15px; border-bottom: solid 1px #4285F4; float: left; line-height: 40px;" href="https://googledemo.looker.com/dashboards-next/healthcare::readmission_overview">Readmission Overview</a>

        <a style="padding: 5px 15px; border-top: solid 1px #4285F4; border-left: solid 1px #4285F4; border-right: solid 1px #4285F4; border-radius: 5px 5px 0 0; float: left; line-height: 40px; font-weight: bold; background-color: #eaf1fe;" href="https://googledemo.looker.com/dashboards-next/healthcare::model_performance">

      Model Performance</a>

      </nav>

      </div>
    row: 0
    col: 0
    width: 24
    height: 4
  - title: Accuracy
    name: Accuracy
    model: healthcare
    explore: healthcare_bqml_eval1
    type: single_value
    fields: [healthcare_bqml_eval1.accuracy]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 16
    col: 4
    width: 6
    height: 2
  - title: Log Loss
    name: Log Loss
    model: healthcare
    explore: healthcare_bqml_eval1
    type: single_value
    fields: [healthcare_bqml_eval1.log_loss]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 20
    col: 17
    width: 7
    height: 2
  - title: Precision
    name: Precision
    model: healthcare
    explore: healthcare_bqml_eval1
    type: single_value
    fields: [healthcare_bqml_eval1.precision]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 16
    col: 10
    width: 7
    height: 2
  - title: Recall
    name: Recall
    model: healthcare
    explore: healthcare_bqml_eval1
    type: single_value
    fields: [healthcare_bqml_eval1.recall]
    sorts: [healthcare_bqml_eval1.recall]
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
    show_view_names: false
    defaults_version: 1
    series_types: {}
    listen: {}
    row: 20
    col: 10
    width: 7
    height: 2
  - name: " (3)"
    type: text
    title_text: ''
    body_text: "## Log Loss"
    row: 18
    col: 17
    width: 7
    height: 2
  - name: " (4)"
    type: text
    title_text: ''
    body_text: "## Recall"
    row: 18
    col: 10
    width: 7
    height: 2
  - name: " (5)"
    type: text
    title_text: ''
    body_text: "## Precision"
    row: 14
    col: 10
    width: 7
    height: 2
  - name: " (6)"
    type: text
    title_text: ''
    body_text: "## Accuracy"
    row: 14
    col: 4
    width: 6
    height: 2
  - name: " (7)"
    type: text
    title_text: ''
    body_text: "## F1 Score"
    row: 18
    col: 4
    width: 6
    height: 2
  - title: F1 Score
    name: F1 Score
    model: healthcare
    explore: healthcare_bqml_eval1
    type: single_value
    fields: [healthcare_bqml_eval1.f1_score]
    sorts: [healthcare_bqml_eval1.f1_score]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 20
    col: 4
    width: 6
    height: 2
  - title: Training Duration
    name: Training Duration
    model: healthcare
    explore: healthcare_training_info1
    type: single_value
    fields: [healthcare_training_info1.duration_minutes]
    sorts: [healthcare_training_info1.duration_minutes]
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
    series_types: {}
    defaults_version: 1
    listen: {}
    row: 16
    col: 17
    width: 7
    height: 2
  - name: " (8)"
    type: text
    title_text: ''
    body_text: "## Training Duration"
    row: 14
    col: 17
    width: 7
    height: 2
  - name: " (9)"
    type: text
    title_text: ''
    body_text: "<div class=\"row justtify-content-left icon1\">\n    <div class=\"\
      col-md-4 icon1\">\n<svg style='fill: #000080; height: 64px;'  class=\"svg-icon\"\
      \ viewBox=\"0 0 20 20\">\n\n\t\t\t\t\t\t\t<path d=\"M10,6.978c-1.666,0-3.022,1.356-3.022,3.022S8.334,13.022,10,13.022s3.022-1.356,3.022-3.022S11.666,6.978,10,6.978M10,12.267c-1.25,0-2.267-1.017-2.267-2.267c0-1.25,1.016-2.267,2.267-2.267c1.251,0,2.267,1.016,2.267,2.267C12.267,11.25,11.251,12.267,10,12.267\
      \ M18.391,9.733l-1.624-1.639C14.966,6.279,12.563,5.278,10,5.278S5.034,6.279,3.234,8.094L1.609,9.733c-0.146,0.147-0.146,0.386,0,0.533l1.625,1.639c1.8,1.815,4.203,2.816,6.766,2.816s4.966-1.001,6.767-2.816l1.624-1.639C18.536,10.119,18.536,9.881,18.391,9.733\
      \ M16.229,11.373c-1.656,1.672-3.868,2.594-6.229,2.594s-4.573-0.922-6.23-2.594L2.41,10l1.36-1.374C5.427,6.955,7.639,6.033,10,6.033s4.573,0.922,6.229,2.593L17.59,10L16.229,11.373z\"\
      ></path>\n\n\t\t\t\t\t\t</svg>\n<h1>Training Evaluation Info</h1>\n<p> Metadata\
      \ from BQML's native model evaluation functions </p>\n    </div>\n</div>\n\n"
    row: 14
    col: 0
    width: 4
    height: 8
