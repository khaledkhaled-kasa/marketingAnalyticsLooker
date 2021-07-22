view: anal_user_costs {
  view_label: "User Costs"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_user_costs`
    ;;

  dimension: avg_cost {
    type: number
    sql: ${TABLE}.avg_cost ;;
    label: "Customer Acquisitition Cost"
    description: "Average Cost for Acquired Customer"
  }

  dimension: me_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.me_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }
}