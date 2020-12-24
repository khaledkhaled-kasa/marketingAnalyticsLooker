view: anal_session_cohorts {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_session_cohorts`
    ;;

  dimension: cohort_definition {
    type: string
    sql: ${TABLE}.cohort_definition ;;
  }

  dimension: days_since_cohort_event {
    type: number
    sql: ${TABLE}.days_since_cohort_event ;;
  }

  dimension: hours_since_cohort_event {
    type: number
    sql: ${TABLE}.hours_since_cohort_event ;;
  }

  dimension: months_since_cohort_event {
    type: number
    sql: ${TABLE}.months_since_cohort_event ;;
  }

  dimension: session_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.session_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
