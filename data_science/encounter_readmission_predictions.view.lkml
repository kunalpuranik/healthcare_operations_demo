view: encounter_readmission_predictions {
  sql_table_name: `looker-private-demo.healthcare_demo_live.encounter_readmission_predictions`
    ;;

  dimension: encounter_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: readmission_risk_score {
    description: "Predicted from machine learning model, 1-5 with 1 indicating that the patient is very likely to be readmitted within 30 days"
    type: number
    sql: ${TABLE}.readmission_risk_score ;;
  }

}
