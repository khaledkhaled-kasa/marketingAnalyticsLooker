view: ga_views_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_views_dictionary`
    ;;

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
  }

  measure: count {
    type: count
    drill_fields: [view_name]
  }
}
