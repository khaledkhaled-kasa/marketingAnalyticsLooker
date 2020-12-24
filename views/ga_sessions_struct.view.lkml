view: ga_sessions_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_sessions_struct`
    ;;
  label: "Sessions"

  dimension: browser {
    type: string
    sql: ${TABLE}.browser ;;
  }

  dimension: checkout_events {
    hidden: yes
    sql: ${TABLE}.checkout_events ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: page_views {
    hidden: yes
    sql: ${TABLE}.page_views ;;
  }

  dimension: product_events {
    hidden: yes
    sql: ${TABLE}.product_events ;;
  }

  dimension: session_bounce {
    type: number
    sql: ${TABLE}.session_bounce ;;
  }

  dimension: session_city {
    type: string
    sql: ${TABLE}.session_city ;;
  }

  dimension: session_country {
    type: string
    sql: ${TABLE}.session_country ;;
  }

  dimension: session_duration {
    type: number
    sql: ${TABLE}.session_duration ;;
  }

  dimension: session_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: session_latitude {
    type: number
    sql: ${TABLE}.session_latitude ;;
  }

  dimension: session_longitude {
    type: number
    sql: ${TABLE}.session_longitude ;;
  }

  dimension: session_lp_url {
    type: string
    sql: ${TABLE}.session_lp_url ;;
  }

  dimension_group: session_timestamp {
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
    sql: ${TABLE}.session_timestamp ;;
  }

  dimension: shopping_stages {
    type: string
    sql: ${TABLE}.shopping_stages ;;
  }

  dimension: transaction_events {
    hidden: yes
    sql: ${TABLE}.transaction_events ;;
  }

  dimension: utm_key_id {
    type: number
    sql: ${TABLE}.utm_key_id ;;
  }

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
  }

  dimension: website_events {
    hidden: yes
    sql: ${TABLE}.website_events ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: sessions_volume {
    type: count_distinct
    sql: ${session_id};;
    drill_fields: [session_id]
    description: "Number of unique sessions"
  }

  measure: users_volume {
    type: count_distinct
    sql:  ${client_id} ;;
    drill_fields: [client_id]
    description: "Number of unique users"
  }

  measure: bounce_rate {
    type: number
    value_format_name: percent_1
    sql: count(distinct if(${session_bounce} = 1,${session_id}, NULL))/${sessions_volume} ;;
    label: "Bounce Rate"
  }

  measure: average_session_duration {
    type: average
    sql: ${session_duration} ;;
    value_format_name: decimal_1
    label: "Average Session Duration"
    description: "Average duration of sessions in seconds"
  }

  measure: average_page_views_per_session {
    type: number
    sql: if(${sessions_volume} = 0, null, ${ga_sessions_struct__page_views.page_views_volume}/${sessions_volume});;
    value_format_name: decimal_1
    description: "Average number of page views per one session"
  }

  measure: checkout_sessions_volume {
    type: count_distinct
    hidden: yes
    sql: if(${ga_sessions_struct__website_events.website_event_category} = "Ecommerce" and ${ga_sessions_struct__website_events.website_event_action} = "checkout", ${session_id}, Null);;
    description: "Ratio of sessions with Checkout Event to all session"
}

  measure: checkout_rate {
    type: number
    sql: if(${sessions_volume} = 0, Null, ${checkout_sessions_volume}/${sessions_volume});;
    value_format_name:  percent_1
    description: "Ratio of sessions with Checkout Event to all session"

  }

  measure: transaction_conversion_rate {
    value_format_name: percent_1
    type: number
    description: "Percentage of website transactions divided by sessions"
    sql: if(${sessions_volume} = 0, null, ${ga_sessions_struct__transaction_events.transaction_volume}/${sessions_volume}) ;;
  }
}

view: ga_sessions_struct__website_events {
  label: "Website Events"
  dimension: website_event_action {
    type: string
    sql: ${TABLE}.website_event_action ;;
  }

  dimension: website_event_category {
    type: string
    sql: ${TABLE}.website_event_category ;;
  }

  dimension: website_event_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.website_event_id ;;
  }

  dimension: website_event_label {
    type: string
    sql: ${TABLE}.website_event_label ;;
  }

  dimension_group: website_event_timestamp {
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
    sql: ${TABLE}.website_event_timestamp ;;
  }

  dimension: website_event_url {
    type: string
    sql: ${TABLE}.website_event_url ;;
  }
}

view: ga_sessions_struct__product_events {
  dimension: product_event_action_type {
    type: string
    sql: ${TABLE}.product_event_action_type ;;
  }

  dimension: product_event_id {
    type: number
    sql: ${TABLE}.product_event_id ;;
  }

  dimension: product_event_product_name {
    type: string
    sql: ${TABLE}.product_event_product_name ;;
  }

  dimension: product_event_sku {
    type: string
    sql: ${TABLE}.product_event_sku ;;
  }

  dimension_group: product_event_timestamp {
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
    sql: ${TABLE}.product_event_timestamp ;;
  }
}

view: ga_sessions_struct__transaction_events {
  label: "Transaction Website Events"
  dimension: transaction_event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.transaction_event_id ;;
  }

  dimension: transaction_event_value {
    type: number
    sql: ${TABLE}.transaction_event_value ;;
  }

  measure: transaction_volume {
    type: count_distinct
    sql: ${transaction_event_id};;
  }
}

view: ga_sessions_struct__page_views {
  label: "Page Views"
  dimension: page_view_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.page_view_id ;;
  }

  dimension: page_view_load_time {
    type: number
    sql: ${TABLE}.page_view_load_time ;;
  }

  dimension: page_view_time_on_page {
    type: number
    sql: ${TABLE}.page_view_time_on_page ;;
  }

  dimension_group: page_view_timestamp {
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
    sql: ${TABLE}.page_view_timestamp ;;
  }

  dimension: page_view_url {
    type: string
    sql: ${TABLE}.page_view_url ;;
  }

  measure: page_views_volume {
    type: count_distinct
    sql: ${TABLE}.page_view_id ;;
  }
}

view: ga_sessions_struct__checkout_events {
  dimension: checkout_event_cart_id {
    type: string
    sql: ${TABLE}.checkout_event_cart_id ;;
  }

  dimension: checkout_event_id {
    type: number
    sql: ${TABLE}.checkout_event_id ;;
  }

  dimension: checkout_event_product_name {
    type: string
    sql: ${TABLE}.checkout_event_product_name ;;
  }

  dimension: checkout_event_quantity {
    type: number
    sql: ${TABLE}.checkout_event_quantity ;;
  }

  dimension: checkout_event_sku {
    type: string
    sql: ${TABLE}.checkout_event_sku ;;
  }

  dimension_group: checkout_event_timestamp {
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
    sql: ${TABLE}.checkout_event_timestamp ;;
  }
}
