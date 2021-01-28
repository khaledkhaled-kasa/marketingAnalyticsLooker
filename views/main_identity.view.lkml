view: main_identity {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.main_identity`
    ;;

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  #measure: test_customer_volume {
  #  type: number
  #  sql: COUNT(DISTINCT if(${ecom_users.customer_id} IS NOT NULL,${me_id},NULL))  ;;
  #}
}