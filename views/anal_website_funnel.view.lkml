view: anal_website_funnel {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_website_funnel`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  dimension: step_1 {
    type: string
    sql: ${TABLE}.step_1 ;;
  }

  dimension: step_2 {
    type: string
    sql: ${TABLE}.step_2 ;;
  }

  dimension: step_3 {
    type: string
    sql: ${TABLE}.step_3 ;;
  }

  dimension: step_4 {
    type: string
    sql: ${TABLE}.step_4 ;;
  }

  dimension: step_5 {
    type: string
    sql: ${TABLE}.step_5 ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}