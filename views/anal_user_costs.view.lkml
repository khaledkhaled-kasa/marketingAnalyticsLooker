view: anal_user_costs {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_user_costs`
    ;;

  dimension: avg_cost {
    type: number
    sql: ${TABLE}.avg_cost ;;
  }

  dimension: me_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.me_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
