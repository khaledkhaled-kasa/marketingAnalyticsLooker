view: ga_user_cookie_matching {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_user_cookie_matching`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: user_id {
    type: string
    sql: ${TABLE}.user_id ;;
  }

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
