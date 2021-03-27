view: anal_conversion_paths {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_conversion_paths`
    ;;

  dimension: default_channel_grouping_first_touchpoint {
    type: string
    sql: ${TABLE}.default_channel_grouping_first_touchpoint ;;
  }

  dimension: default_channel_grouping_last_touchpoint {
    type: string
    sql: ${TABLE}.default_channel_grouping_last_touchpoint ;;
  }

  dimension: default_channel_grouping_path {
    type: string
    sql: ${TABLE}.default_channel_grouping_path ;;
  }

  dimension: lookback_window {
    type: number
    sql: ${TABLE}.lookback_window ;;
  }

  dimension_group: order_timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.order_timestamp ;;
    hidden: yes
  }

  dimension: path_duration {
    type: number
    sql: ${TABLE}.path_duration ;;
  }

  dimension: path_length {
    type: number
    sql: ${TABLE}.path_length ;;
  }

  dimension: transaction_order_id {
    type: string
    sql: ${TABLE}.transaction_order_id ;;
    primary_key: yes
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: []
    hidden: yes
  }

  measure: average_path_length {
    type: average
    sql: ${path_length} ;;
    value_format_name: decimal_1
  }

  measure: average_path_duration {
    type: average
    sql: ${path_duration} ;;
    description: "Average Path Duration in Days"
    value_format_name: decimal_1
  }
}