view: anal_external_hotels_attribution {
  view_label: "External Hotels Attribution"
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ANAL_external_hotels_attribution`
    ;;

  dimension_group: attributed {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.attributed_date ;;
  }

  dimension_group: order {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.order_date ;;
    label: "Booking"
  }

  dimension_group: checkin {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkin_date ;;
  }

  dimension_group: checkout {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.checkout_date ;;
  }

  dimension: attributed_order_id {
    type: string
    sql: ${TABLE}.attributed_order_id ;;
    primary_key: yes
    label: "Booking Id"
  }

  dimension: attributed_total_gross_value {
    type: number
    sql: ${TABLE}.attributed_total_gross_value ;;
    hidden: yes
  }

  dimension: attributed_utm_key_id {
    type: number
    sql: ${TABLE}.attributed_utm_key_id ;;
  }

  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }

  dimension: lookback_window {
    type: number
    sql: ${TABLE}.lookback_window ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
    label: "Booking Status"
  }

  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmation_code ;;
    label: "Confirmation Code"
  }

  dimension: guest_email {
    type: string
    sql: ${TABLE}.guest_email ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: total_attributed_gross_value {
    type: sum
    sql: ${attributed_total_gross_value} ;;
    value_format_name: usd
    label: "Attributed Booking Value"
    description: "Value of Attributed Bookings"
  }
}