view: ecom_orders_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.ECOM_orders_struct`
    ;;
  label: "Orders"
  dimension: cart_id {
    type: string
    sql: ${TABLE}.cart_id ;;
    hidden: yes
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
    sql:TIMESTAMP(DATETIME(${TABLE}.checkin_timestamp,"America/Los_Angeles")) ;;
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
  sql:TIMESTAMP(DATETIME(${TABLE}.checkout_timestamp,"America/Los_Angeles")) ;;
  }

  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmation_code ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
    hidden: yes
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
    hidden: yes
  }

  dimension: order_discount {
    type: number
    sql: ${TABLE}.order_discount ;;
  }

  dimension: order_gross_value {
    type: number
    value_format_name: usd_0
    sql: ${TABLE}.order_gross_value ;;
  }

  dimension: order_handler {
    type: string
    sql: ${TABLE}.order_handler ;;
    label: "Booking Source"
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
    primary_key: yes
    hidden: no
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
    sql:TIMESTAMP(DATETIME(${TABLE}.order_timestamp,"America/Los_Angeles")) ;;
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
    sql:TIMESTAMP(DATETIME(${TABLE}.payment_timestamp,"America/Los_Angeles")) ;;
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
    type: number
    sql:

      (with ranking_table as
      (SELECT
        order_id,
        RANK() OVER (PARTITION BY me_id ORDER BY order_timestamp ASC) AS user_paid_order_ranking,
        LEAD(order_timestamp) OVER (PARTITION BY me_id ORDER BY order_timestamp ASC) AS next_paid_order_timestamp,
      FROM
        `bigquery-analytics-272822.ME_BI_prod.ECOM_orders_struct` as ecom
      LEFT JOIN
      `bigquery-analytics-272822.ME_BI_prod.ECOM_identity_resolution`
      USING
        (customer_id)
      WHERE
        order_status in ('valid') and if({% parameter exclude_extension_orders %},ecom.is_from_extension=false,ecom.is_from_extension=true or ecom.is_from_extension=false))
    SELECT
    user_paid_order_ranking from ranking_table
    WHERE ranking_table.order_id=${TABLE}.order_id
        );;
    label: "Customer Booking Number"
  }

  dimension: valid_order_ranking_tiers {
    type: string
    sql:
      case
      when ${valid_order_ranking}<5 then CAST(${valid_order_ranking} AS STRING)
      when ${valid_order_ranking}>=5 then '5+'
      end ;;
    label: "Customer Bookings Number (tiers)"
  }

  dimension: new_or_returning_order {
    type: string
    sql:
      case
      when ${valid_order_ranking}=1 then 'new order'
      when ${valid_order_ranking}>1 then 'returning order'
      else NULL
      end;;
    label: "New or Returning Bookings"
  }

  parameter: exclude_extension_orders {
    type: yesno
    label: "Exclude Extensions Bookings"
  }

  dimension: is_from_extension {
    type: yesno
    sql: ${TABLE}.is_from_extension;;
    label: "Is Booking an Extension"
    hidden: yes
  }

  dimension: dynamic_extension_filter {
    type: yesno
    sql: if({% parameter exclude_extension_orders %},${is_from_extension}=false,${is_from_extension}=true or ${is_from_extension}=false);;
  }

  measure: total_order_volume {
    type: count_distinct
    sql: ${order_id};;
    drill_fields: [order_id]
    description: "Number of all bookings"
  }

  measure: valid_order_volume {
    type: number
    sql: COUNT(DISTINCT if(${order_status}="valid" and ${payment_status}="paid",${order_id},NULL)) ;;
    drill_fields: [order_id]
    description: "Number of valid bookings"
  }


  measure: total_customer_volume {
    type: count_distinct
    sql: ${customer_id};;
    drill_fields: [customer_id]
    description: "Number of unique customers"
  }

  measure: valid_orders_per_customer {
    type: number
    value_format_name: decimal_2
    sql: ${valid_order_volume}/${total_customer_volume} ;;
    label: "Bookings per Customer "
  }

  measure: average_order_gross_value {
    type: average
    sql: ${order_gross_value};;
    drill_fields: [order_id, order_gross_value]
    value_format_name: usd_0
    description: "Average order gross value"
    label: "Average Booking Value"
  }

  measure: total_sales_gross_value {
    type: sum
    sql: ${order_gross_value} ;;
    value_format_name: usd_0
    description: "Sum of sales gross value"
    label: "Total Booking Value"
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
    sql: count(distinct if(${order_handler} = 'direct' or ${order_handler}= 'website', ${order_id}, Null))/${total_order_volume} ;;
    value_format_name: percent_1
    label: "Share of Direct Bookings"
    description: "Percentage of Bookgings from direct channel"
  }

  measure: website_orders_volume {
    type: number
    sql: count(distinct if(${order_handler}= 'website', ${order_id}, Null)) ;;
    value_format_name: decimal_0
    label: "Number of Website Bookings"
    description: "Number of Bookings from website"
  }

  measure: website_orders_value {
    type: number
    sql: sum(distinct if(${order_handler}= 'website', ${order_gross_value}, Null)) ;;
    value_format_name: usd_0
    label: "Website Bookings Value"
    description: "Value of Bookings from website"
  }

  measure: share_of_direct_booking_value {
    type: number
    sql: sum( if(${order_handler} = 'direct' or ${order_handler}= 'website', ${order_gross_value}, Null))/${total_sales_gross_value} ;;
    value_format_name: percent_1
    label: "Share of Direct Booking Value"
    description: "Percentage of Booking Value from direct channel "
  }

  measure: share_of_direct_customer_volume {
    type: number
    sql: count(distinct if(${order_handler} = 'direct' or ${order_handler} = 'website' , ${customer_id}, NULL))/${total_customer_volume} ;;
    value_format_name: percent_1
    label: "Share of Direct Customers"
    description: "Percentage of Customers from direct channel"
  }

  measure: share_of_direct_acquired_customers {
    type:  number
    sql: count(distinct if((${order_handler} = 'direct' or ${order_handler}= 'website')  and ${valid_order_ranking} = 1, ${customer_id}, Null)) / ${new_customer_volume}  ;;
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
      label: "Number of Unique Bookings"
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
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
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
    drill_fields: [ecom_products_struct.product_name, primary_orders_selected_metric]
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
      label: "Average Length of Stay"
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
      label: "Average Days Before Check-in"
      value: "average_days_before_checkin"
    }

    allowed_value: {
      label: "Share of Direct Bookings"
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
    {% case secondary_orders_metric_selector._parameter_value %}
    {% when "'average_order_gross_value'"%}
      ${average_order_gross_value}
    {% when "'average_item_order_value_per_night'"%}
      ${ecom_orders_struct__order_items.average_item_order_value_per_night}
    {% when "'average_quantity'"%}
      ${ecom_orders_struct__order_items.average_quantity}
    {% when "'repeat_customer_rate'"%}
      ${repeat_customer_rate}
    {% when "'share_of_direct_orders'"%}
      ${share_of_direct_orders}
    {% when "'average_days_before_checkin'"%}
      ${average_days_before_checking}
    {% when "'share_of_direct_booking_value'"%}
      ${share_of_direct_booking_value}
    {% when "'share_of_direct_customer_volume'"%}
      ${share_of_direct_customer_volume}
    {% when "'share_of_direct_acquired_customers'"%}
      ${share_of_direct_acquired_customers}
    {% when "'average_guest_count'"%}
      ${average_guest_count}
    {% else %} NULL
    {% endcase %}
    ;;
    html:
    {% case secondary_orders_metric_selector._parameter_value %}
    {% when "'average_order_gross_value'" or "'average_item_order_value_per_night'" %}
    ${{rendered_value}}
    {% when "'repeat_customer_rate'" or "'share_of_direct_orders'" or "'share_of_direct_booking_value'" or "'share_of_direct_customer_volume'" or "'share_of_direct_acquired_customers'" %}
    {{value |times: 100 | round: 2 | append: "%"}}
    {% else %}
    {{rendered_value}}
    {% endcase %};;
  label: "Secondary Selected Metric"
  drill_fields: [ecom_products_struct.product_name, secondary_orders_selected_metric]
  }

  parameter: orders_pivot_dimensions_selector {
    type: string
    label: "Select Dimensions to Pivot"
    allowed_value: {
      label: "Travel Reason"
      value: "travel_reason"
    }
    allowed_value: {
      label: "Booking Source"
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
      label: "Length of Stay"
      value: "product_variant_quantity_buckets"
    }
    allowed_value: {
      label: "Price per Night"
      value: "item_order_value_per_night_buckets"
    }
    allowed_value: {
      label: "Is Booking an Extension"
      value: "is_from_extension"
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
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'product_variant_quantity_buckets'" %} ${ecom_orders_struct__order_items.product_variant_quantity_buckets}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'item_order_value_per_night_buckets'" %} ${ecom_orders_struct__order_items.item_order_value_per_night_buckets}
     {% elsif orders_pivot_dimensions_selector._parameter_value == "'is_from_extension'" %} ${is_from_extension}
     {% else %} NULL
     {% endif %}
    ;;
    label: "Selected Dimension"
  }

  parameter: orders_second_dimensions_selector {
    type: string
    label: "Select Second Dimension"
    allowed_value: {
      label: "Travel Reason"
      value: "travel_reason"
    }
    allowed_value: {
      label: "Booking Source"
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
      label: "Lenght of Stay"
      value: "product_variant_quantity_buckets"
    }
    allowed_value: {
      label: "Price per Night"
      value: "item_order_value_per_night_buckets"
    }
    allowed_value: {
      label: "Is Booking an Extension"
      value: "is_from_extension"
    }
  }

  dimension: orders_second_selected_dimension {
    label_from_parameter: orders_pivot_dimensions_selector
    type: string
    sql:
     {% if orders_second_dimensions_selector._parameter_value == "'travel_reason'" %} ${travel_reason}
     {% elsif orders_second_dimensions_selector._parameter_value == "'order_handler'" %} ${order_handler}
     {% elsif orders_second_dimensions_selector._parameter_value == "'pet_type'" %} ${pet_type}
     {% elsif orders_second_dimensions_selector._parameter_value == "'new_or_returning_order'" %} ${new_or_returning_order}
     {% elsif orders_second_dimensions_selector._parameter_value == "'product_state'" %} ${ecom_products_struct.product_state}
     {% elsif orders_second_dimensions_selector._parameter_value == "'product_category'" %} ${ecom_products_struct.product_category}
     {% elsif orders_second_dimensions_selector._parameter_value == "'product_name'" %} ${ecom_products_struct.product_name}
     {% elsif orders_second_dimensions_selector._parameter_value == "'guest_count'" %} ${guest_count}
     {% elsif orders_second_dimensions_selector._parameter_value == "'product_variant_quantity_buckets'" %} ${ecom_orders_struct__order_items.product_variant_quantity_buckets}
     {% elsif orders_second_dimensions_selector._parameter_value == "'item_order_value_per_night_buckets'" %} ${ecom_orders_struct__order_items.item_order_value_per_night_buckets}
     {% elsif orders_second_dimensions_selector._parameter_value == "'is_from_extension'" %} ${is_from_extension}
     {% else %} NULL
     {% endif %}
    ;;
    label: "Selected Second Dimension"
  }

  dimension: days_before_checkin {
    type: number
    sql: DATE_DIFF(${checkin_timestamp_date},${order_timestamp_date},DAY) ;;
    label: "Days Before Check-in"
    description: "Number of days between order and checkin date"
  }

  measure: average_days_before_checking {
    type: average
    value_format_name: decimal_1
    sql: ${days_before_checkin} ;;
    label: "Average Days Before Check-in"
    description: "Average number of days between order and checkin date"
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
    label: "Lenght of Stay"
  }

  dimension: product_variant_quantity_buckets {
    type: tier
    tiers: [0,1,2,3,4,5,6,7,8,15,30]
    sql: ${product_variant_quantity} ;;
    style: integer
    label: "Length of Stay - tiers"
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
    value_format_name: usd_0
    description: "Sum of items sales gross value"
  }

  measure: average_item_order_value_per_night {
    type: number
    sql: ${total_item_sales_gross_value}/sum(${product_variant_quantity})    ;;
    value_format_name: usd_0
    description: "Average booking value per night"
    label: "Average Booking Value per Night"
  }

  dimension: item_order_value_per_night {
    type: number
    sql: if(${product_variant_quantity}=0,NULL,${order_item_gross_value}/${product_variant_quantity}) ;;
    value_format_name: usd_0
    description: "Price per Night"
    label: "Price per Night"
  }

  dimension: item_order_value_per_night_buckets{
    type: tier
    tiers: [0,50,100,150,200,250,300]
    sql: ${item_order_value_per_night} ;;
    style: integer
    value_format_name: usd_0
    label: "Price per Night Tiers"
  }

  measure: average_quantity {
    type:  average
    value_format_name: decimal_1
    sql:  ${product_variant_quantity} ;;
    description: "Average Length fo Stay"
    label: "Average Length of Stay"
  }
}