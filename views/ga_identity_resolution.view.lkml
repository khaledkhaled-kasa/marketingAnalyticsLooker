view: ga_identity_resolution {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.GA_identity_resolution`
    ;;

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
    hidden: yes
  }

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
    hidden: yes
  }

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}
