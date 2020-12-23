view: ga_identity_resolution {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_identity_resolution`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
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
