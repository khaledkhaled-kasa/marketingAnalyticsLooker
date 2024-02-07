view: ga_sessions_struct {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.GA_sessions_struct`
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
    hidden: yes
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
    drill_fields: [browser]
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
    hidden: yes
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
    sql:${TABLE}.session_timestamp ;;
    # convert_tz: yes
    # allow_fill: yes
    # sql:TIMESTAMP(DATETIME(${TABLE}.session_timestamp,"America/Los_Angeles")) ;;
  }

  dimension: pivot_axis {
    hidden: no
    label_from_parameter: pivot_parm
    label: "Date Group"
    type: string
    # label:
    sql:
    {% if pivot_parm._parameter_value == "'session_timestamp_date'" %}
      ${session_timestamp_date}
    {% elsif pivot_parm._parameter_value == "'session_timestamp_week'" %}
      ${session_timestamp_week}
    {% else %}
       ${session_timestamp_date}
    {% endif %};;
  }

  parameter: pivot_parm {
    label: "Group by"
    hidden: no
    type: string
    allowed_value: {
      label: "Daily"
      value: "session_timestamp_date"
    }
    allowed_value: {
      label: "Weekly"
      value: "session_timestamp_week"
    }
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
    type: string
    sql: ${TABLE}.utm_key_id ;;
    hidden: yes
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
    hidden: yes
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
    sql: if(${sessions_volume}=0,NULL,count(distinct if(${session_bounce} = 1,${session_id}, NULL))/${sessions_volume}) ;;
    label: "Bounce Rate"
  }

  measure: did_not_bounce_ratio {
    type: number
    value_format_name: percent_1
    sql: 1-${bounce_rate} ;;
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
    type: number
    hidden: no
    sql: ${ga_sessions_struct__website_events.checkout_complete_sessions} + ${ga_sessions_struct__website_events.checkout_start_sessions} ;;
    #sql: if(${ga_sessions_struct__website_events.website_event_category} = "Ecommerce" and ${ga_sessions_struct__website_events.website_event_action} = "checkout", ${session_id}, Null);;
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

  measure: unbounced_session_volume {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${session_bounce} =  0,${session_id},NULL)) ;;
    label: "Unbounced Sessions"
    description: "Number of sessions that did not bounce"
  }

  parameter: primary_sessions_metric_selector {
    type: string
    label: "Select Primary Metric"
    allowed_value: {
      label: "Number of Sessions"
      value: "sessions_volume"
    }
    allowed_value: {
      label: "Number of Unique Users"
      value: "users_volume"
    }
    allowed_value: {
      label: "Number of Direct Bookings"
      value: "transaction_volume"
    }

    allowed_value: {
      label: "Website Booking Value"
      value: "total_transaction_event_value"
    }
  }

  measure: primary_sessions_selected_metric {
    label_from_parameter: primary_sessions_metric_selector
    type: number
    value_format: "[>=1000000]0.0,,\"M\";[>=1000]0.0,\"K\";0"
    sql:
    {% case primary_sessions_metric_selector._parameter_value %}
    {% when "'sessions_volume'"%}
      ${sessions_volume}
    {% when "'users_volume'"%}
      ${users_volume}
    {% when "'transaction_volume'"%}
      ${ga_sessions_struct__transaction_events.transaction_volume}
    {% when "'total_transaction_event_value'"%}
      ${ga_sessions_struct__transaction_events.total_transaction_event_value}
    {% else %} NULL
    {% endcase %};;
    html:
      {% case primary_sessions_metric_selector._parameter_value %}
      {% when "'total_transaction_event_value'" %}
        ${{rendered_value}}
      {% else %}
        {{rendered_value}}
      {% endcase %};;
    label: "Primary Selected Metric"
    drill_fields: [ga_utm_dictionary.ga_source_medium, primary_sessions_selected_metric]
  }

  parameter: secondary_sessions_metric_selector {
    type:  string
    label: "Select Secondary Metric"
    allowed_value: {
      label: "Transaction Conversion Rate"
      value: "transaction_conversion_rate"
    }
    allowed_value: {
      label: "Bounce Rate"
      value: "bounce_rate"
    }
    allowed_value: {
      label: "Average Page Views per Session"
      value: "average_page_views_per_session"
    }
    allowed_value: {
      label: "Average Session Duration"
      value: "average_session_duration"
    }
    allowed_value: {
        label: "Cart Abandonment Rate"
        value: "cart_abandonment_rate"
    }
  }

  measure: secondary_sessions_selected_metric {
    label_from_parameter: secondary_sessions_metric_selector
    type: number
    value_format: "0.00%"
    sql:
    {% case secondary_sessions_metric_selector._parameter_value %}
    {% when "'transaction_conversion_rate'"%}
      ${transaction_conversion_rate}
    {% when "'bounce_rate'"%}
      ${bounce_rate}
    {% when "'average_page_views_per_session'"%}
      ${average_page_views_per_session}
    {% when "'average_session_duration'"%}
      ${average_session_duration}
    {% when "'cart_abandonment_rate'"%}
      ${ga_sessions_struct__website_events.cart_abandonment_rate}
    {% else %} NULL
    {% endcase %}
    ;;
    html:
    {% case secondary_sessions_metric_selector._parameter_value %}
    {% when "'average_page_views_per_session'" %}
      {{value | round: 2 }}
    {% when "'average_session_duration'" %}
      {{value | round: 0 }}
    {% else %}
      {{rendered_value}}
    {% endcase %};;
    label: "Secondary Selected Metric"
    drill_fields: [ga_utm_dictionary.ga_source_medium, secondary_sessions_selected_metric]

  }

  dimension: is_on_kasa_com_website   {
    type: yesno
    sql:   (
      SELECT
        LOGICAL_OR(${ga_page_categories.is_on_kasa_com_website})
      FROM
        ${ga_sessions_struct.SQL_TABLE_NAME} AS sessions
      LEFT JOIN
        UNNEST(sessions.page_views) AS ga_sessions_struct__page_views
      LEFT JOIN
        ${ga_page_categories.SQL_TABLE_NAME} AS ga_page_categories
      ON
        ga_sessions_struct__page_views.page_view_url = ga_page_categories.url
      where
        sessions.session_id = ${session_id}
        ) ;;
    label: "Filter to Kasa.com Hostname"
  }

  parameter: max_rank {
    type: number
    label: "Show Top N Results in Table"
  }

  dimension: rank_limit {
    type: number
    sql: {% parameter max_rank %} ;;
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

  dimension: website_event_location_label {
    type: string
    sql: RIGHT(IF(INSTR(${website_event_url},'?')=0,${website_event_url},LEFT(${website_event_url},INSTR(${website_event_url},'?')-1)),
    IF(LENGTH(IF(INSTR(${website_event_url},'?')=0,${website_event_url},LEFT(${website_event_url},INSTR(${website_event_url},'?')-1)))-INSTR(${website_event_url},'locations/')-10<0,0,
    LENGTH(IF(INSTR(${website_event_url},'?')=0,${website_event_url},LEFT(${website_event_url},INSTR(${website_event_url},'?')-1)))-INSTR(${website_event_url},'locations/')-9))
    ;;
    label: "Location - Search List"
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
    sql:(${TABLE}.website_event_timestamp ;;
    # sql:TIMESTAMP(DATETIME(${TABLE}.website_event_timestamp,"America/Los_Angeles")) ;;
    }

  dimension: website_event_url {
    type: string
    sql: ${TABLE}.website_event_url ;;
  }

  measure: add_to_carts {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if( ${website_event_action}='Product Added',${website_event_id},NULL));;
    label: "Click Book Button Events"
    description: "Number of add to cart/Product Added events registerd by Google Analytics"
  }

  measure: add_to_carts_sessions {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if( ${website_event_action}='Product Added',${ga_sessions_struct.session_id},NULL));;
    label: "Sessions with Click Book Button"
    description: "Number of sessions with click book button/Product Added events registerd by Google Analytics"
  }

  measure: cart_abandonment_sessions {
    type: number
    value_format_name: decimal_0
    sql: ${add_to_carts_sessions}-${checkout_complete_sessions} ;;
    label: "Sessions with Cart Abandonment"
    description: "Number of sessions with cart abandonment registerd by Google Analytics"
  }

  measure: add_to_carts_ratio {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${add_to_carts_sessions}/${ga_sessions_struct.sessions_volume}) ;;
    label: "Click Book Button Ratio"
    description: "Ratio of sessions with Click Book Button to all sessions"
  }

  measure: cart_abandonment_rate {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, 1-${checkout_complete_sessions}/${add_to_carts_sessions}) ;;
    label: "Cart Abandonment Rate"
    description: "Ratio of Sessions with Completed Checkout to All sessions with Add To Cart"
  }

  measure: categoryView {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if((${website_event_category}='Ecommerce' or ${website_event_category}='All') and (${website_event_action}='categoryView' or ${website_event_action}='Location Viewed'),${website_event_id},NULL));;
    label: "Location Views"
    description: "Number of location view events registerd by Google Analytics"
  }

  measure: categoryView_sessions {
    type: number
    value_format_name: decimal_0
    sql:  count(distinct if(${website_event_action}='Location Viewed',${ga_sessions_struct.session_id},NULL));;
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='categoryView',${ga_sessions_struct.session_id},NULL));;
    #sql: count(distinct if((${website_event_category}='Ecommerce' or ${website_event_category}='All') and (${website_event_action}='categoryView' or ${website_event_action}='Location Viewed') ,${ga_sessions_struct.session_id},NULL));;
    label: "Sessions with Location Views"
    description: "Number of sessions with location view events registerd by Google Analytics"
  }

  measure: category_view_ratio {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${categoryView_sessions}/${ga_sessions_struct.sessions_volume}) ;;
    label: "Location View Ratio"
    description: "Ratio of sessions with Location View to all sessions"
  }

  measure: checkout_start {
    type: number
    value_format_name: decimal_0
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='checkout' and ${website_event_label}='1',${website_event_id},NULL));;
    sql: count(distinct if(${website_event_category}='EnhancedEcommerce' and ${website_event_action}='Checkout Started'  ,${website_event_id},NULL));;
    label:"Checkout Start Events"
    description: "Number of checkout start events captured by Google Analytics"
  }

  measure: checkout_start_sessions {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${website_event_category}='EnhancedEcommerce' and ${website_event_action}='Checkout Started'or ${website_event_action}='checkout',${ga_sessions_struct.session_id},NULL));;
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='checkout' and ${website_event_label}='1',${ga_sessions_struct.session_id},NULL));;
    label:"Sessions with Checkout Start Events"
    description: "Number of sessions with checkout start events captured by Google Analytics"
  }

  measure: checkout_start_ratio {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${checkout_start_sessions}/${ga_sessions_struct.sessions_volume}) ;;
    label: "Checkout Start Ratio"
    description: "Ratio of sessions with Checkout Start to all sessions"
  }


  measure: help_contact {type: number
    value_format_name: decimal_0
    sql: count(distinct if(${website_event_category}='help' and ${website_event_action}='help',${website_event_id},NULL));;
    label: "Help Contact Events"
    description: "Number of help contact events registerd by Google Analytics"
  }

    measure: partnership_contact {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${website_event_category}='partnership' and ${website_event_action}='partnership',${website_event_id},NULL));;
    label: "Partnership Contact Events"
    description: "Number of partnership contact events registerd by Google Analytics"
  }

  measure: checkout_complete {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if( ${website_event_action}='Checkout Finished' ,${website_event_id},NULL));;
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='checkout' and ${website_event_label}='2',${website_event_id},NULL));;
    label:"Checkout Click Book Button Events"
    description: "Number of checkout click book button events captured by Google Analytics"
  }

  measure: checkout_complete_sessions {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if( ${website_event_action}='Checkout Finished' or ${website_event_action}='checkout',${ga_sessions_struct.session_id},NULL));;
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='checkout' and ${website_event_label}='2',${ga_sessions_struct.session_id},NULL));;
    label:"Sessions with Checkout Click Book Button"
    description: "Number of sessions with checkout click book button events captured by Google Analytics"
  }
  measure: prod_sessions {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if( ${website_event_action}='Product Viewed',${ga_sessions_struct.session_id},NULL));;
    #sql: count(distinct if(${website_event_category}='Ecommerce' and ${website_event_action}='checkout' and ${website_event_label}='1',${ga_sessions_struct.session_id},NULL));;
    label:"Sessions with Property Viewed"
    description: "Number of sessions with Product Viewed events captured by Google Analytics"
  }

  measure: checkout_complete_ratio {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${checkout_complete_sessions}/${ga_sessions_struct.sessions_volume}) ;;
    label: "Checkout  Click Book Button Ratio"
    description: "Ratio of sessions with Checkout Click Book Button to all sessions"
  }
}

view: ga_sessions_struct__product_events {
  label: "Product Website Events"
  dimension: product_event_action_type {
    type: string
    sql: ${TABLE}.product_event_action_type ;;
  }

  dimension: product_event_id {
    type: number
    sql: ${TABLE}.product_event_id ;;
    hidden: yes
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
    sql:${TABLE}.product_event_timestamp ;;
    # sql:TIMESTAMP(DATETIME(${TABLE}.product_event_timestamp,"America/Los_Angeles")) ;;
  }

  dimension: product_event_product_variant {
    type: string
    sql: ${TABLE}.product_variant ;;
    label: "Roomtype ID"
    description: "Roomtype ID available for product events: add to card and checkout"
  }

  filter: product_analysis_date {
    type: date
    label: "Date Range"
    description: "Select Date Range for Product Analysis"
  }

  measure: product_view {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${product_event_action_type}="DetailViews",${product_event_id},NULL)) ;;
    label: "Property Views"
    description: "Number of property views registered in Google Analytics"
  }

  measure: product_add_to_cart {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${product_event_action_type}="AddsToCart",${product_event_id},NULL)) ;;
    label: "Property Adds to Cart"
    description: "Number of property adds to cart registered in Google Analytics"
  }

  measure: product_checkouts {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${product_event_action_type}="Checkouts",${product_event_id},NULL)) ;;
    label: "Property Checkouts"
    description: "Number of property checkouts registered in Google Analytics"
  }

  measure: product_view_sessions {
    type: number
    value_format_name: decimal_0
    sql: count(distinct if(${product_event_action_type}="DetailViews",${ga_sessions_struct.session_id},NULL)) ;;
    label: "Sessions with Property Views"
    description: "Number of sessions with property views registered in Google Analytics"
  }

  measure: product_view_ratio {
    type: number
    value_format_name: percent_1
    sql: if(${ga_sessions_struct.sessions_volume}=0,NULL, ${product_view_sessions}/${ga_sessions_struct.sessions_volume}) ;;
    label: "Property View Ratio"
    description: "Ratio of sessions with Property View to all sessions"
  }
}

view: ga_sessions_struct__transaction_events {
  label: "Transaction Website Events"

  dimension: transaction_event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.transaction_event_id ;;
    hidden: yes
  }

  dimension: transaction_event_value {
    type: number
    sql: ${TABLE}.transaction_event_value ;;
    hidden: yes
  }

  measure: transaction_volume {
    type: count_distinct
    sql: ${transaction_event_id};;
    label: "Website Booking Volume"
    description: "Volume of bookings registered on site by Google Analytics"
  }

  measure: sessions_with_transaction {
    type: count_distinct
    sql: ${transaction_event_id};;
    label: "Sessions with Transaction"
    description: "Number of sessions with transaction"
  }

  measure: total_transaction_event_value {
    type: sum
    value_format_name: usd_0
    sql: ${transaction_event_value} ;;
    label: "Website Booking Value"
    description: "Value of bookings registered on site by Google Analytics"
  }
}

view: ga_sessions_struct__transaction_events_2 {
  derived_table: {
      sql:
        select
        t.session_id
        ,t.utm_key_id
        ,t.transaction_event_id
        ,t.transaction_event_value
        ,r.reservationId
        ,r.confirmationCd
        from (
          select
          session_id
          ,utm_key_id
          ,t.transaction_event_id
          ,t.transaction_event_value
          from `bigquery-analytics-272822`.ME_BI_prod.GA_sessions_struct
          ,unnest(transaction_events) as t
        ) t
        join `data-warehouse-333815`.reservations.fctReservations r
        ON t.transaction_event_id = case when length(t.transaction_event_id) = 24 then r.reservationId else r.confirmationCd end
      ;;
    }
  label: "Transaction Website Events"

  dimension: transaction_event_id {
    type: string
    primary_key: yes
    sql: ${TABLE}.transaction_event_id ;;
    hidden: yes
  }

  dimension: reservation_id {
    type: string
    sql: ${TABLE}.reservationId ;;
    hidden: yes
  }

  dimension: confirmation_code {
    type: string
    sql: ${TABLE}.confirmationCd ;;
    hidden: yes
  }

  dimension: utm_key_id {
    type: string
    sql: ${TABLE}.utm_key_id ;;
    hidden: yes
  }

  dimension: transaction_event_value {
    type: number
    sql: ${TABLE}.transaction_event_value ;;
    hidden: yes
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
    # sql: TIMESTAMP(DATETIME(${TABLE}.page_view_timestamp,"America/Los_Angeles")) ;;
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
  label: "Checkout Events"
  dimension: checkout_event_cart_id {
    type: string
    sql: ${TABLE}.checkout_event_cart_id ;;
  }

  dimension: checkout_event_id {
    type: number
    primary_key: yes
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
    sql:${TABLE}.checkout_event_timestamp ;;
    # sql:TIMESTAMP(DATETIME(${TABLE}.checkout_event_timestamp,"America/Los_Angeles")) ;;
  }

  dimension: checkout_event_product_variant {
    type: string
    sql: ${TABLE}.checkout_event_product_variant ;;
    label: "Roometype ID"
    description: "Roomtype ID from checkout"
  }

  dimension: checkout_event_label {
    type: string
    sql: ${TABLE}.checkout_event_label ;;
    label: "Checkout Step"
    description: "The number represents a step in the checkout process"
  }

  measure: product_checkouts_by_sku {
  type: count_distinct
  sql: ${checkout_event_id} ;;
  value_format_name: decimal_0
  label: "Property Checkouts by SKU"
  description: "Number of time a specific SKU has been added to checkout"
  }

  measure: product_1st_step_checkouts_by_sku {
    type: count_distinct
    sql: if(${checkout_event_label}='1',${checkout_event_id},NULL) ;;
    value_format_name: decimal_0
    label: "Property 1st step Checkouts by SKU"
    description: "Number of time a specific SKU has been added to 1st step of checkout"
  }

  measure: product_2nd_step_checkouts_by_sku {
    type: count_distinct
    sql: if(${checkout_event_label}='2',${checkout_event_id},NULL) ;;
    value_format_name: decimal_0
    label: "Property 2nd step Checkouts by SKU"
    description: "Number of time a specific SKU has been added to 2nd step of checkout"
  }
}
