view: healthcare_feature_info {
  derived_table: {
    sql: SELECT * FROM ML.FEATURE_INFO(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`) ;;
  }

  dimension: input {
    type: string
    sql: ${TABLE}.input ;;
  }

  dimension: category_count {
    type: number
    sql: ${TABLE}.category_count ;;
  }
}

view: healthcare_training_info {
  derived_table: {
    sql:  SELECT * FROM ML.TRAINING_INFO(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`);;
  }

  dimension: training_run {
    type: number
    sql: ${TABLE}.training_run ;;
  }

  dimension: iteration {
    type: number
    sql: ${TABLE}.iteration ;;
  }

  dimension: loss {
    type: number
    sql: ${TABLE}.loss ;;
  }

  dimension: eval_loss {
    type: number
    sql: ${TABLE}.eval_loss ;;
  }

  dimension: learning_rate {
    type: number
    sql: ${TABLE}.learning_rate ;;
  }

  dimension: duration_ms {
    type: number
    sql: ${TABLE}.duration_ms ;;
  }
}


view: healthcare_bqml_eval {
  derived_table: {
    sql: SELECT * FROM ML.EVALUATE(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`,
            (
            with CTE as (
            SELECT *,
            (CASE WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) <= 7 THEN TRUE
                 WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) > 7 THEN FALSE
                 ELSE NULL
                 END) as readmission_within_7
             FROM `looker-private-demo.healthcare_demo_live.bqml_input`
             WHERE EXTRACT(YEAR FROM discharge_date) > 2028)
             SELECT * FROM CTE
             WHERE readmission_within_7 IS NOT NULL
            )) ;;
  }

  dimension: precision {
    type: number
    sql: ${TABLE}.precision ;;
  }

  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
  }

  dimension: accuracy {
    type: number
    sql: ${TABLE}.accuracy ;;
  }

  dimension: f1_score {
    type: number
    sql: ${TABLE}.f1_score ;;
  }

  dimension: log_loss {
    type: number
    sql: ${TABLE}.log_loss ;;
  }

  dimension: roc_auc {
    type: number
    sql: ${TABLE}.roc_auc ;;
  }

  set: detail {
    fields: [
      precision,
      recall,
      accuracy,
      f1_score,
      log_loss,
      roc_auc
    ]
  }
}

view: healthcare_bqml_matrix_seen{
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT *, "seen" as data_type FROM ML.CONFUSION_MATRIX(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`);;
  }
  dimension: expected_label {}
  dimension: false { type: number }
  dimension: true { type: number }
  dimension: data_type {}
}

view: healthcare_bqml_matrix_unseen {
  derived_table: {
    persist_for: "24 hours"
    sql: SELECT *, "unseen" as data_type FROM ML.CONFUSION_MATRIX(MODEL `looker-private-demo.healthcare_demo_live.automl_classifier`,
            (
            with CTE as (
            SELECT *,
            (CASE WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) <= 7 THEN TRUE
                 WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) > 7 THEN FALSE
                 ELSE NULL
                 END) as readmission_within_7
             FROM `looker-private-demo.healthcare_demo_live.bqml_input`
             WHERE EXTRACT(YEAR FROM discharge_date) > 2020)
             SELECT * FROM CTE
             WHERE readmission_within_7 IS NOT NULL
            ));;
  }
  dimension: expected_label {}
  dimension: false { type: number }
  dimension: true { type: number }
  dimension: data_type {}
}


view: healthcare_bqml_roc {
  derived_table: {
    persist_for: "48 hours"
    sql: SELECT * FROM ML.ROC_CURVE(model `looker-private-demo.healthcare_demo_live.automl_classifier`,
            (
            with CTE as (
            SELECT *,
            (CASE WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) <= 7 THEN TRUE
                 WHEN DATE_DIFF(discharge_date, last_discharge_date, DAY) > 7 THEN FALSE
                 ELSE NULL
                 END) as readmission_within_7
             FROM `looker-private-demo.healthcare_demo_live.bqml_input`
             WHERE EXTRACT(YEAR FROM discharge_date) > 2020)
             SELECT * FROM CTE
             WHERE readmission_within_7 IS NOT NULL
            )) ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: threshold {
    type: number
    sql: ${TABLE}.threshold ;;
  }

  dimension: recall {
    type: number
    sql: ${TABLE}.recall ;;
  }
  dimension: precision {
    type:  number
    value_format_name: percent_2
    sql:  ${true_positives} / NULLIF((${true_positives} + ${false_positives}),0);;
    description: "Equal to true positives over all positives. Indicative of how false positives are penalized. Set high to get no false positives"
  }

  dimension: false_positive_rate {
    type: number
    sql: ${TABLE}.false_positive_rate ;;
  }

  dimension: true_positives {
    type: number
    sql: ${TABLE}.true_positives ;;
  }

  dimension: false_positives {
    type: number
    sql: ${TABLE}.false_positives ;;
  }

  dimension: true_negatives {
    type: number
    sql: ${TABLE}.true_negatives ;;
  }

  dimension: false_negatives {
    type: number
    sql: ${TABLE}.false_negatives ;;
  }

  measure: total_tp {
    type: sum
    sql: ${true_positives} ;;
  }

  set: detail {
    fields: [
      threshold,
      recall,
      false_positive_rate,
      true_positives,
      false_positives,
      true_negatives,
      false_negatives
    ]
  }

}
