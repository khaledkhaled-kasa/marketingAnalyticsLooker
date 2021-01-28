view: ga_views_dictionary {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.GA_views_dictionary`
    ;;

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
    hidden: yes
  }

  dimension: view_name {
    type: string
    sql: ${TABLE}.view_name ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [view_name]
    hidden: yes
  }
}