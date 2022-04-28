# Un-hide and use this explore, or copy the joins into another explore, to get all the fully nested relationships from this view
# explore: anal_simple_attribution {
#   hidden: yes

#   join: anal_simple_attribution__lw {
#     view_label: "Anal Simple Attribution: Lw"
#     sql: LEFT JOIN UNNEST(${anal_simple_attribution.lw}) as anal_simple_attribution__lw ;;
#     relationship: one_to_many
#   }

#   join: anal_simple_attribution__lw__attribution_models {
#     view_label: "Anal Simple Attribution: Lw Attribution Models"
#     sql: LEFT JOIN UNNEST(${anal_simple_attribution__lw.attribution_models}) as anal_simple_attribution__lw__attribution_models ;;
#     relationship: one_to_many
#   }
# }

view: anal_simple_attribution {
  view_label: "Attribution"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_simple_attribution`
    ;;

  # dimension: attributed_order_id {
  #   type: string
  #   sql: ${TABLE}.attributed_order_id ;;
  #   primary_key: yes
  # }

  dimension: primary_key {
    primary_key: yes
    hidden: yes
    sql: CONCAT(${attributed_utm_key_id}, ${attributed_date_date},${lookback_window},${attribution_model} ) ;;
  }

  dimension: attributed_total_gross_value {
    type: number
    sql: ${TABLE}.attributed_total_gross_value ;;
  }

  dimension: attributed_orders_volume {
    type: number
    sql: ${TABLE}.attributed_orders_volume ;;
  }

  dimension: attributed_acquisitions {
    type: number
    sql: ${TABLE}.attributed_acquisitions ;;
  }

  dimension: attributed_quantity {
    type: number
    sql: ${TABLE}.attributed_quantity ;;
    label: "attributed nights sold"
  }

  dimension: attributed_cancellations {
    type: number
    sql: ${TABLE}.attributed_cancellations ;;
  }

#   dimension: is_acquisition {
#     type: yesno
#     sql: ${TABLE}.is_acquisition ;;
#   }

#   dimension: lw {
#     hidden: yes
#     sql: ${TABLE}.lw ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: []
#   }
# }

# view: anal_simple_attribution__lw {
#   dimension: attribution_models {
#     hidden: yes
#     sql: ${TABLE}.attribution_models ;;
#   }

  # dimension: lookback_window {
  #   type: number
  #   sql: ${TABLE}.lookback_window ;;
  # }

  dimension: lookback_window {
    type: number
    sql: ${TABLE}.lookback_window ;;
  }

    dimension: attributed_utm_key_id {
    type: string
    sql: ${TABLE}.attributed_utm_key_id ;;
    hidden: yes
  }

  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }

  dimension: attributed_date {
    type: date
    sql: ${TABLE}.attributed_date ;;
    hidden: yes
  }

  dimension_group: attributed_date {
    type: time
    hidden: yes

    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week_of_year,
      month_name,
      month_num
    ]
    convert_tz: no
    datatype: date
    sql: timestamp(${TABLE}.attributed_date);;
  }

  measure: attributed_total_order_gross_value {
    type: sum
    sql: ${attributed_total_gross_value} ;;
    value_format_name: usd_0
    label: "Attributed Booking Value"
  }

  measure: attributed_total_order_volume {
    type: sum
    sql: ${attributed_orders_volume} ;;
    value_format_name: decimal_0
    label: "Attributed Booking Volume"
  }

  measure: attributed_acquisitions_volume {
    type: sum
    sql: ${attributed_acquisitions} ;;
    value_format_name: decimal_0
    label: "Attributed New Acquisitions"
  }

  measure: attributed_total_nights_sold {
    type: sum
    sql: ${attributed_quantity} ;;
    value_format_name: decimal_0
    label: "Attributed Nights Sold"
  }

  measure: attributed_cancellations_volume {
    type: sum
    sql: ${attributed_cancellations} ;;
    value_format_name: decimal_0
    label: "Attributed Cancellations"
  }

  measure: average_attributed_nights_per_order {
    type: number
    sql: if(${attributed_total_nights_sold}=0,0,
      ${attributed_total_nights_sold}/${attributed_total_order_volume}) ;;
    value_format_name: decimal_0
    label: "Average Nights per Order"
    description: "Average Nights per Order"
  }

}


# view: anal_simple_attribution__lw__attribution_models {
#   dimension_group: attributed_timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.attributed_timestamp ;;
#     hidden: yes
#   }

#   dimension: attributed_utm_key_id {
#     type: string
#     sql: ${TABLE}.attributed_utm_key_id ;;
#     hidden: yes
#   }

#   dimension: attribution_model {
#     type: string
#     sql: ${TABLE}.attribution_model ;;
#   }
# }
