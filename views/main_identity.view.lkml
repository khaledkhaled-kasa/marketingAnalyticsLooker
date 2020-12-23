view: main_identity {
  sql_table_name: `bigquery-analytics-272822.ME_BI.main_identity`
    ;;

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
