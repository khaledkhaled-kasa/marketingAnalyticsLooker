view: ecom_identity_resolution {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ECOM_identity_resolution`
    ;;

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
