view: ecom_orders_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ECOM_orders_struct`
    ;;
  label: "Orders"
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
      day_of_week,
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
    label: "Number of Guests"
  }

  dimension: number_pet {
    type: number
    sql: ${TABLE}.number_pet ;;
    label: "Number of Pets"
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
    value_format_name: usd
    sql: ${TABLE}.order_gross_value ;;
  }

  dimension: order_handler {
    type: string
    sql: ${TABLE}.order_handler ;;
    label: "Order Handler"
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    primary_key: yes
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
    hidden: yes
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
    label: "Pet Type"
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
    label: "Travel Reason"
  }

  dimension: valid_order_ranking {
    type: string
    sql: ${TABLE}.user_valid_order_ranking;;
    label: "Customer Order Number"
  }

  dimension: new_or_returning_order {
    type: string
    sql:
      case
      when ${valid_order_ranking}=1 then 'new order'
      when ${valid_order_ranking}>1 then 'returning order'
      else NULL
      end;;
    label: "New or Returning Order"
  }

  measure: total_order_volume {
    type: count_distinct
    sql: ${order_id};;
    drill_fields: [order_id]
    description: "Number of unique orders"
    filters: {
      field: calendar_dates.period_filtered_measures
      value: "this"
    }
  }

  measure: previous_total_order_volume {
    type: count_distinct
    sql: ${order_id};;
    drill_fields: [order_id]
    description: "Number of unique orders"
    filters: {
      field: calendar_dates.period_filtered_measures
      value: "last"
    }
  }

  measure: total_customer_volume {
    type: count_distinct
    sql: ${customer_id};;
    drill_fields: [customer_id]
    description: "Number of unique customers"
  }

  measure: average_order_gross_value {
    type: average
    sql: ${order_gross_value};;
    drill_fields: [order_id, order_gross_value]
    value_format_name: usd
    description: "Average order gross value"
    label: "Average booking value"
    filters: {
      field: calendar_dates.period_filtered_measures
      value: "this"
    }
  }

  measure: total_sales_gross_value {
    type: sum
    sql: ${order_gross_value} ;;
    value_format_name: usd
    description: "Sum of sales gross value"
    label: "Total Booking Value"
    filters: {
      field: calendar_dates.period_filtered_measures
      value: "this"
    }
  }

  measure: repeat_customer_rate {
    type: number
    sql: countif(${valid_order_ranking}> 1)/count(distinct ${order_id})  ;;
    value_format_name: percent_1
    label: "Repeat Customer Rate"
  }

  measure: new_customer_volume {
    type: number
    sql: count(distinct if(${valid_order_ranking} = 1, ${customer_id}, Null));;
    label: "Acquired Customers"
  }
  measure: share_of_direct_orders {
    type: number
    sql: count(distinct if(${order_handler} = 'direct', ${order_id}, Null))/${total_order_volume} ;;
    value_format_name: percent_1
    label: "Share of Direct Orders"
    description: "Percentage of Orders from direct channel"
  }

  measure: share_of_direct_booking_value {
    type: number
    sql: sum( if(${order_handler} = 'direct', ${order_gross_value}, Null))/${total_sales_gross_value} ;;
    value_format_name: usd
    label: "Share of Direct Booking Value"
    description: "Percentage of Booking Value from direct channel "
  }

  measure: share_of_direct_customer_volume {
    type: number
    sql: count(distinct if(${order_handler} = 'direct', ${customer_id}, NULL))/${total_customer_volume} ;;
    value_format_name: percent_1
    label: "Share of Direct Customers"
    description: "Percentage of Customers from direct channel"
  }

  measure: share_of_direct_acquired_customers {
    type:  number
    sql: count(distinct if(${order_handler} = 1  and ${valid_order_ranking} = 1, ${customer_id}, Null} / new ${new_customer_volume}  ;;
    value_format_name: percent_1
    label: "Share of Direct Acquisitions"
    description: "Percentage of Acquired Customers from direct channel"
  }

  measure: average_guest_count {
    type: average
    sql: ${guest_count};;
    value_format_name: decimal_1
    label: "Average Guest Count"
    description: "Average Number of Guest per Booking"
  }

  parameter: primary_orders_metric_selector {
    type: string
    label: "Select Primary Metric"
    allowed_value: {
      label: "Total Booking Value"
      value: "total_sales_gross_value"
    }
    allowed_value: {
      label: "Number of Unique Orders"
      value: "total_order_volume"
    }
    allowed_value: {
      label: "Number of Unique Customers"
      value: "total_customer_volume"
    }

    allowed_value: {
      label: "Number of Acquired Customers"
      value: "new_customer_volume"
    }
  }

  measure: primary_orders_selected_metric {
    label_from_parameter: primary_orders_metric_selector
    type: number
    value_format: "0.0,\"K\""
    sql:
      Case
        WHEN {% parameter primary_orders_metric_selector %} = 'total_customer_volume' then ${total_customer_volume}
        WHEN {% parameter primary_orders_metric_selector %} = 'total_sales_gross_value' then ${total_sales_gross_value}
        WHEN {% parameter primary_orders_metric_selector %} = 'total_order_volume' then ${total_order_volume}
        WHEN {% parameter primary_orders_metric_selector %} = 'new_customer_volume' then ${new_customer_volume}
        ELSE NULL
        END;;
      html:
      {% if primary_orders_metric_selector._parameter_value ==  "'total_sales_gross_value'" %}
      ${{rendered_value}}
      {% else %}
      {{rendered_value}}
      {% endif %};;
    label: "Primary Selected Metric"
  }

  parameter: secondary_orders_metric_selector {
    type:  string
    label: "Select Secondary Metric"
    allowed_value: {
      label: "Average Booking Value"
      value: "average_order_gross_value"
    }
    allowed_value: {
      label: "Average Booking Value per Night"
      value: "average_item_order_value_per_night"
    }
    allowed_value: {
      label: "Average Nights per Booking"
      value: "average_quantity"
    }
    allowed_value: {
      label: "Average Guest Count"
      value: "average_guest_count"
    }
    allowed_value: {
      label: "Repeat Customer Rate"
      value: "repeat_customer_rate"
    }

    allowed_value: {
      label: "Share of Direct Orders"
      value: "share_of_direct_orders"
    }
    allowed_value: {
      label: "Share of Direct Booking Value"
      value: "share_of_direct_booking_value"
    }
    allowed_value: {
      label: "Share of Direct Customers"
      value: "share_of_direct_customer_volume"
    }
    allowed_value: {
      label: "Share of Direct Acquisitions"
      value: "share_of_direct_acquired_customers"
    }
  }

  measure: secondary_orders_selected_metric {
    label_from_parameter: secondary_orders_metric_selector
    type: number
    value_format: "0.##"
    sql:
    {% if secondary_orders_metric_selector._parameter_value == "'average_order_gross_value'" %} ${average_order_gross_value}
    {% elsif secondary_orders_metric_selector._parameter_value == "'average_item_order_value_per_night'" %} ${ecom_orders_struct__order_items.average_item_order_value_per_night}
    {% elsif secondary_orders_metric_selector._parameter_value == "'average_quantity'" %} ${ecom_orders_struct__order_items.average_quantity}
    {% elsif secondary_orders_metric_selector._parameter_value == "'repeat_customer_rate'" %} ${repeat_customer_rate}
    {% elsif secondary_orders_metric_selector._parameter_value == "'share_of_direct_orders'" %} ${share_of_direct_orders}
    {% elsif secondary_orders_metric_selector._parameter_value == "'share_of_direct_booking_value'" %} ${share_of_direct_booking_value}
    {% elsif secondary_orders_metric_selector._parameter_value == "'share_of_direct_customer_volume'" %} ${share_of_direct_customer_volume}
    {% elsif secondary_orders_metric_selector._parameter_value == "'share_of_direct_acquired_customers'" %} ${share_of_direct_acquired_customers}
    {% elsif secondary_orders_metric_selector._parameter_value == "'average_guest_count'" %} ${average_guest_count}
    {% else %} NULL
    {% endif %}
    ;;
    html:
    {% if secondary_orders_metric_selector._parameter_value ==  "'average_order_gross_value'" %}
    ${{rendered_value}}
    {% else %}
    {{rendered_value}}
    {% endif %};;
  label: "Secondary Selected Metric"
  }

  parameter: orders_pivot_dimensions_selector {
    type: string
    label: "Select Dimensions to Pivot"
    allowed_value: {
      label: "Travel Reason"
      value: "travel_reason"
    }
    allowed_value: {
      label: "Order Handler"
      value: "order_handler"
    }
    allowed_value: {
      label: "First or Returning Booking"
      value: "new_or_returning_order"
    }
    allowed_value: {
      label: "Pet Type"
      value: "pet_type"
    }
    allowed_value: {
      label: "Building State"
      value: "product_state"
    }
    allowed_value: {
      label: "Building Name"
      value: "product_name"
    }

    allowed_value: {
      label: "Guest Count"
      value: "guest_count"
    }
    allowed_value: {
      label: "Nights Booked"
      value: "product_variant_quantity"
    }
  }

  dimension: orders_pivot_selected_dimension {
    label_from_parameter: orders_pivot_dimensions_selector
    type: string
    sql:
     {% if orders_pivot_dimensions_selector._parameter_value == "'travel_reason'" %} ${travel_reason}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'order_handler'" %} ${order_handler}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'pet_type'" %} ${pet_type}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'new_or_returning_order'" %} ${new_or_returning_order}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'product_state'" %} ${ecom_products_struct.product_state}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'product_category'" %} ${ecom_products_struct.product_category}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'product_name'" %} ${ecom_products_struct.product_name}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'guest_count'" %} ${guest_count}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'product_variant_quantity'" %} ${ecom_orders_struct__order_items.product_variant_quantity}
     {% else %} NULL
     {% endif %}
    ;;
    label: "Selected Dimension"
  }
}


view: ecom_orders_struct__order_items {
  label: "Order Items"
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
    primary_key: yes
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
    label: "Number of nights booked"
  }

  dimension: product_variant_unit_currency {
    type: string
    sql: ${TABLE}.product_variant_unit_currency ;;
  }

  measure: total_order_items_volume {
    type: count_distinct
    sql: ${order_item_id};;
    drill_fields: [order_item_id]
    description: "Number of unique order items"
  }

  measure: total_item_sales_gross_value {
    type: sum
    sql: ${order_item_gross_value} ;;
    value_format_name: usd
    description: "Sum of items sales gross value"
  }

  measure: average_item_order_value_per_night {
    type: number
    sql: ${total_item_sales_gross_value}/sum(${product_variant_quantity})    ;;
    value_format_name: usd
    description: "Average booking value per night"
    label: "Average Booking Value per Night"
  }

  measure: average_quantity {
    type:  average
    value_format_name: decimal_1
    sql:  ${product_variant_quantity} ;;
    description: "Average nights per order"
    label: "Average nights per booking"
  }
}
