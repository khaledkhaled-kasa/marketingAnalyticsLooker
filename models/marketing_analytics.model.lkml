connection: "bigquery"

# include all the views
include: "/views/**/*.view"

datagroup: default_refresh_settings {
  sql_trigger: SELECT max(date(order_timestamp)) FROM `bigquery-analytics-272822.ME_BI_prod.ECOM_orders_struct`   ;;
  max_cache_age: "24 hours"
}

persist_with: default_refresh_settings

explore: calendar_dates  {
  fields: [ALL_FIELDS*, -ga_sessions_struct__product_events.product_analysis_date]
  join: ecom_orders_struct {
    sql_on: ${calendar_dates.calendar_date_date} = ${ecom_orders_struct.order_timestamp_date} ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct__order_items {
    sql: LEFT JOIN UNNEST(${ecom_orders_struct.order_items}) as ecom_orders_struct__order_items  ;;
    relationship: one_to_many
  }
  join: ecom_products_struct {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ecom_products_struct LEFT JOIN UNNEST(product_variants) as pv) ON ${ecom_products_struct__product_variants.product_variant_id} = pv.product_variant_id  ;;
    relationship: many_to_one
  }
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ps LEFT JOIN UNNEST(product_variants) as ecom_products_struct__product_variants) ON ${ecom_orders_struct__order_items.product_variant_id} = ${ecom_products_struct__product_variants.product_variant_id}  ;;
    relationship: many_to_one
  }
  join: ga_sessions_struct {
    sql_on:  ${calendar_dates.calendar_date_date} = ${ga_sessions_struct.session_timestamp_date} ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__page_views {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.page_views}) as ga_sessions_struct__page_views  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__website_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.website_events}) as ga_sessions_struct__website_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__transaction_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.transaction_events}) as ga_sessions_struct__transaction_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__product_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.product_events}) as ga_sessions_struct__product_events  ;;
    relationship: one_to_many
  }
  join: ga_utm_dictionary {
    sql_on: ${ga_sessions_struct.utm_key_id} = ${ga_utm_dictionary.utm_key_id} ;;
    relationship: many_to_one
  }
  join: ga_page_categories {
    sql_on: ${ga_sessions_struct__page_views.page_view_url} = ${ga_page_categories.url} ;;
    relationship: many_to_one
  }
  sql_always_where:
  {% if calendar_dates.current_date_range._is_filtered %}
  {% condition calendar_dates.current_date_range %} ${event_raw} {% endcondition %}

  {% if calendar_dates.previous_date_range._is_filtered or calendar_dates.compare_to._in_query %}
  {% if calendar_dates.comparison_periods._parameter_value == "2" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}

  {% elsif calendar_dates.comparison_periods._parameter_value == "3" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}
  or
  ${event_raw} between ${period_3_start} and ${period_3_end}


  {% elsif calendar_dates.comparison_periods._parameter_value == "4" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}
  or
  ${event_raw} between ${period_3_start} and ${period_3_end}
  or
  ${event_raw} between ${period_4_start} and ${period_4_end}

  {% else %} 1 = 1
  {% endif %}
  {% endif %}
  {% else %} 1 = 1
  {% endif %};;
}

explore: users_analysis  {
  view_name: main_identity
  fields: [ALL_FIELDS*, -ga_sessions_struct.is_on_kasa_com_website]
  join: anal_user_segments_recent {
    sql_on: ${main_identity.me_id} = ${anal_user_segments_recent.me_id} ;;
    relationship: one_to_many
  }
  join: anal_user_segments_recent2 {
    sql_on: ${main_identity.me_id} = ${anal_user_segments_recent2.me_id} ;;
    relationship: one_to_many
  }
  join: anal_user_segments {
    sql_on: ${main_identity.me_id} = ${anal_user_segments.me_id} ;;
    relationship: one_to_many
  }
  join: anal_user_cohorts {
    sql_on: ${main_identity.me_id} = ${anal_user_cohorts.me_id} ;;
    relationship: one_to_many
  }
  join: ecom_identity_resolution {
    sql_on: ${main_identity.me_id} = ${ecom_identity_resolution.me_id} ;;
    relationship: one_to_many
  }
  join: ecom_users {
    sql_on: ${ecom_identity_resolution.customer_id} = ${ecom_users.customer_id} ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct {
    sql_on: ${ecom_users.customer_id} = ${ecom_orders_struct.customer_id} ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct__order_items {
    sql: LEFT JOIN UNNEST(${ecom_orders_struct.order_items}) as ecom_orders_struct__order_items  ;;
    relationship: one_to_many
  }
  join: anal_order_cohorts {
    sql_on: ${ecom_orders_struct.order_id} = ${anal_order_cohorts.order_id} ;;
    relationship: one_to_one
  }
  join: ecom_products_struct {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ecom_products_struct LEFT JOIN UNNEST(product_variants) as pv) ON ${ecom_products_struct__product_variants.product_variant_id} = pv.product_variant_id  ;;
    relationship: many_to_one
  }
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ps LEFT JOIN UNNEST(product_variants) as ecom_products_struct__product_variants) ON ${ecom_orders_struct__order_items.product_variant_id} = ${ecom_products_struct__product_variants.product_variant_id}  ;;
    relationship: many_to_one
  }
  join: ga_identity_resolution {
    sql_on: ${main_identity.me_id} = ${ga_identity_resolution.me_id} ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct {
    sql_on: ${ga_identity_resolution.client_id} = ${ga_sessions_struct.client_id} ;;
    relationship: one_to_many
  }
  join: anal_session_cohorts {
    sql_on: ${ga_sessions_struct.session_id} = ${anal_session_cohorts.session_id} ;;
    relationship: one_to_one
  }
  join: ga_sessions_struct__page_views {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.page_views}) as ga_sessions_struct__page_views  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__website_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.website_events}) as ga_sessions_struct__website_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__transaction_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.transaction_events}) as ga_sessions_struct__transaction_events  ;;
    relationship: one_to_many
  }
}

explore: attribution {
  view_name: anal_attribution
  fields: [ALL_FIELDS*, -ga_sessions_struct.is_on_kasa_com_website, -ga_sessions_struct__product_events.product_analysis_date]
  join: ga_utm_dictionary {
    sql_on: ${anal_attribution.attribution_utm_key_id} = ${ga_utm_dictionary.utm_key_id}  ;;
    relationship: many_to_one
  }
  join: anal_ads_costs {
    sql_on: ${anal_attribution.attribution_utm_key_id} = ${anal_ads_costs.utm_key_id} and ${anal_attribution.attribution_date} = ${anal_ads_costs.date_date};;
    relationship: many_to_many
  }
  join: ga_sessions_struct {
    sql_on: ${anal_attribution.session_id} = ${ga_sessions_struct.session_id} ;;
    relationship: one_to_one
  }
  join: ga_sessions_struct__page_views {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.page_views}) as ga_sessions_struct__page_views  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__website_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.website_events}) as ga_sessions_struct__website_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__transaction_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.transaction_events}) as ga_sessions_struct__transaction_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__product_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.product_events}) as ga_sessions_struct__product_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__checkout_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.checkout_events}) as ga_sessions_struct__checkout_events  ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct {
    sql_on: ${anal_attribution.order_id} = ${ecom_orders_struct.order_id} ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct__order_items {
    sql: LEFT JOIN UNNEST(${ecom_orders_struct.order_items}) as ecom_orders_struct__order_items  ;;
    relationship: one_to_many
  }
  join: ecom_products_struct {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ecom_products_struct LEFT JOIN UNNEST(product_variants) as pv) ON ${ecom_products_struct__product_variants.product_variant_id} = pv.product_variant_id  ;;
    relationship: many_to_one
  }
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN (ME_BI_prod.ECOM_products_struct as ps LEFT JOIN UNNEST(product_variants) as ecom_products_struct__product_variants) ON ${ecom_orders_struct__order_items.product_variant_id} = ${ecom_products_struct__product_variants.product_variant_id}  ;;
    relationship: many_to_one
  }
  sql_always_where:
  {% if anal_attribution.current_date_range._is_filtered %}
  {% condition anal_attribution.current_date_range %} ${event_raw} {% endcondition %}

  {% if anal_attribution.previous_date_range._is_filtered or anal_attribution.compare_to._in_query %}
  {% if anal_attribution.comparison_periods._parameter_value == "2" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}

  {% elsif anal_attribution.comparison_periods._parameter_value == "3" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}
  or
  ${event_raw} between ${period_3_start} and ${period_3_end}


  {% elsif anal_attribution.comparison_periods._parameter_value == "4" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}
  or
  ${event_raw} between ${period_3_start} and ${period_3_end}
  or
  ${event_raw} between ${period_4_start} and ${period_4_end}

  {% else %} 1 = 1
  {% endif %}
  {% endif %}
  {% else %} 1 = 1
  {% endif %};;
}


explore: product_analysis {
  view_name: ecom_products_struct
  fields: [ALL_FIELDS*, -ga_sessions_struct__product_events.product_view_ratio, -ga_sessions_struct__product_events.product_view_sessions, -ecom_orders_struct.secondary_orders_selected_metric, -ecom_orders_struct.orders_pivot_selected_dimension, -ecom_orders_struct.orders_second_selected_dimension, -ga_sessions_struct__product_events.product_checkouts]
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN UNNEST(${ecom_products_struct.product_variants}) as ecom_products_struct__product_variants  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__product_events  {
    sql: LEFT JOIN (ME_BI_prod.GA_sessions_struct as sessions LEFT JOIN UNNEST(product_events) as ga_sessions_struct__product_events) ON ${ecom_products_struct.product_id} = ga_sessions_struct__product_events.product_event_sku  ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct {
    sql: LEFT JOIN (ME_BI_prod.ECOM_orders_struct as ecom_orders_struct LEFT JOIN UNNEST(order_items) as order_items) ON ${ecom_products_struct__product_variants.product_variant_id} = order_items.product_variant_id ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__checkout_events  {
    sql: LEFT JOIN (ME_BI_prod.GA_sessions_struct LEFT JOIN UNNEST(checkout_events) as ga_sessions_struct__checkout_events) ON ${ecom_products_struct__product_variants.guesty_id} = ga_sessions_struct__checkout_events.checkout_event_sku  ;;
    relationship: one_to_many
  }
 sql_always_where:
  ${ga_sessions_struct__product_events.product_event_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__product_events.product_event_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__checkout_events.checkout_event_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__checkout_events.checkout_event_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ecom_orders_struct.order_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} AS DATE) and
  ${ecom_orders_struct.order_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} AS DATE)  ;;
}
