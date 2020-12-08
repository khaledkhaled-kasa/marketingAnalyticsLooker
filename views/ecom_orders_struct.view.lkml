view: ecom_orders_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ECOM_orders_struct`
    ;;

  dimension: cart_id {
    type: string
    sql: ${TABLE}.cart_id ;;
  }

  dimension_group: checkin_timestamp {
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
    sql: ${TABLE}.checkin_timestamp ;;
  }

  dimension: checkindate {
    type: string
    sql: ${TABLE}.checkindate ;;
  }

  dimension_group: checkout_timestamp {
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
    sql: ${TABLE}.checkout_timestamp ;;
  }

  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmation_code ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: guest_count {
    type: number
    sql: ${TABLE}.guest_count ;;
  }

  dimension: number_pet {
    type: number
    sql: ${TABLE}.number_pet ;;
  }

  dimension: order_currency {
    type: string
    sql: ${TABLE}.order_currency ;;
  }

  dimension: order_discount {
    type: number
    sql: ${TABLE}.order_discount ;;
  }

  dimension: order_gross_value {
    type: number
    sql: ${TABLE}.order_gross_value ;;
  }

  dimension: order_handler {
    type: string
    sql: ${TABLE}.order_handler ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: order_items {
    hidden: yes
    sql: ${TABLE}.order_items ;;
  }

  dimension: order_status {
    type: string
    sql: ${TABLE}.order_status ;;
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
  }

  dimension_group: order_updated {
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
    sql: ${TABLE}.order_updated_at ;;
  }

  dimension: payment_status {
    type: string
    sql: ${TABLE}.payment_status ;;
  }

  dimension_group: payment_timestamp {
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
    sql: ${TABLE}.payment_timestamp ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: pet_type {
    type: string
    sql: ${TABLE}.pet_type ;;
  }

  dimension: refund_gross_value {
    type: number
    sql: ${TABLE}.refund_gross_value ;;
  }

  dimension: total_order_gross_value {
    type: number
    sql: ${TABLE}.total_order_gross_value ;;
  }

  dimension: travel_reason {
    type: string
    sql: ${TABLE}.travel_reason ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: ecom_orders_struct__order_items {
  dimension: order_item_discount_gross_value {
    type: number
    sql: ${TABLE}.order_item_discount_gross_value ;;
  }

  dimension: order_item_gross_value {
    type: number
    sql: ${TABLE}.order_item_gross_value ;;
  }

  dimension: order_item_id {
    type: string
    sql: ${TABLE}.order_item_id ;;
  }

  dimension: order_item_refunded {
    type: yesno
    sql: ${TABLE}.order_item_refunded ;;
  }

  dimension: order_item_refunded_quantity {
    type: number
    sql: ${TABLE}.order_item_refunded_quantity ;;
  }

  dimension_group: order_item_updated {
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
    sql: ${TABLE}.order_item_updated_at ;;
  }

  dimension: order_item_weekdays_count {
    type: number
    sql: ${TABLE}.order_item_weekdays_count ;;
  }

  dimension: order_item_weekend_days_count {
    type: number
    sql: ${TABLE}.order_item_weekend_days_count ;;
  }

  dimension: product_variant_id {
    type: string
    sql: ${TABLE}.product_variant_id ;;
  }

  dimension: product_variant_quantity {
    type: number
    sql: ${TABLE}.product_variant_quantity ;;
  }

  dimension: product_variant_unit_currency {
    type: string
    sql: ${TABLE}.product_variant_unit_currency ;;
  }
}
