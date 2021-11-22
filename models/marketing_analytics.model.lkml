connection: "bigquery"

# include all the views
include: "/views/**/*.view"
include: "/**/*.dashboard"

datagroup: default_refresh_settings {
  sql_trigger: SELECT max(date(order_timestamp)) FROM `bigquery-analytics-272822.ME_BI_prod.ECOM_orders_struct`   ;;
  max_cache_age: "24 hours"
}
datagroup: default_refresh_websiteCalenderDates {
  sql_trigger: SELECT max(date(session_timestamp)) FROM `bigquery-analytics-272822.ME_BI_prod.GA_sessions_struct`   ;;
  max_cache_age: "24 hours"
}


persist_with: default_refresh_settings

# Created by Khaled for Tomek / Ihsan's Revenue Prediction Model

explore: revenue_predictor {
  hidden: yes
  join: revenue_predictor_occupancy {
    sql_on: ${revenue_predictor.events_city_state} = ${revenue_predictor_occupancy.city_state} ;;
    relationship: one_to_one
  }

  join: revenue_predictor_occupancy_pace_1 {
    sql_on: ${revenue_predictor.events_city_state} = ${revenue_predictor_occupancy_pace_1.city_state} ;;
    relationship: one_to_one
  }

  join: revenue_predictor_occupancy_pace_2 {
    sql_on: ${revenue_predictor.events_city_state} = ${revenue_predictor_occupancy_pace_2.city_state} ;;
    relationship: one_to_one
  }
}


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
  join: anal_website_funnel {
    sql_on: ${ga_sessions_struct.session_id} = ${anal_website_funnel.session_id} ;;
    relationship: one_to_many
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
    sql_on: ${ecom_orders_struct.order_id} = ${anal_order_cohorts.order_id} and ${anal_user_cohorts.cohort_definition} = ${anal_order_cohorts.cohort_definition} ;;
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

explore: product_analysis {
  view_name: ecom_products_struct
  fields: [ALL_FIELDS*, -ga_sessions_struct__product_events.product_view_ratio, -ga_sessions_struct__product_events.product_view_sessions, -ecom_orders_struct.secondary_orders_selected_metric, -ecom_orders_struct.orders_pivot_selected_dimension, -ecom_orders_struct.orders_second_selected_dimension, -ga_sessions_struct__product_events.product_checkouts]
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN UNNEST(${ecom_products_struct.product_variants}) as ecom_products_struct__product_variants  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__product_events  {
    sql: LEFT JOIN (ME_BI_prod.GA_sessions_struct as sessions INNER JOIN UNNEST(product_events) as ga_sessions_struct__product_events) ON ${ecom_products_struct.product_id} = ga_sessions_struct__product_events.product_event_sku  ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct {
    sql: LEFT JOIN (ME_BI_prod.ECOM_orders_struct as ecom_orders_struct INNER JOIN UNNEST(order_items) as order_items) ON ${ecom_products_struct__product_variants.product_variant_id} = order_items.product_variant_id ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__checkout_events  {
    # sql: INNER JOIN (ME_BI_prod.GA_sessions_struct INNER JOIN UNNEST(checkout_events) as ga_sessions_struct__checkout_events) ON ${ecom_products_struct__product_variants.guesty_id} = ga_sessions_struct__checkout_events.checkout_event_sku  ;;
    sql:  LEFT JOIN (ME_BI_prod.GA_sessions_struct LEFT JOIN UNNEST(checkout_events) as ga_sessions_struct__checkout_events) ON
    if(${ecom_orders_struct.order_timestamp_date}<'2021-03-30',${ecom_products_struct__product_variants.guesty_id},${ecom_products_struct__product_variants.product_variant_category_id})
    =
    if(${ecom_orders_struct.order_timestamp_date}<'2021-03-30',${ga_sessions_struct__checkout_events.checkout_event_sku},${ga_sessions_struct__checkout_events.checkout_event_product_variant}) ;;
    relationship: one_to_many
  }
 sql_always_where:
  ${ga_sessions_struct__product_events.product_event_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__product_events.product_event_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__checkout_events.checkout_event_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ga_sessions_struct__checkout_events.checkout_event_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} as DATE) and
  ${ecom_orders_struct.order_timestamp_date} >= CAST({% date_start ga_sessions_struct__product_events.product_analysis_date %} AS DATE) and
  ${ecom_orders_struct.order_timestamp_date} <= CAST({% date_end ga_sessions_struct__product_events.product_analysis_date %} AS DATE)
  ;;
}


explore: new_attribution {
  view_name: anal_utm_dates_crossjoin
  fields: [ALL_FIELDS*, -ga_sessions_struct.is_on_kasa_com_website, -ga_sessions_struct__product_events.product_analysis_date]
  join: ga_utm_dictionary {
    sql_on: ${anal_utm_dates_crossjoin.utm_key_id} = ${ga_utm_dictionary.utm_key_id} ;;
    relationship: many_to_one
  }
  join: anal_ads_costs {
    sql_on: ${anal_utm_dates_crossjoin.utm_key_id} = ${anal_ads_costs.utm_key_id} and ${anal_utm_dates_crossjoin.date_date} = ${anal_ads_costs.date_date} ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct {
    sql_on: ${anal_utm_dates_crossjoin.utm_key_id} = ${ga_sessions_struct.utm_key_id} and ${anal_utm_dates_crossjoin.date_date} = ${ga_sessions_struct.session_timestamp_date} ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__website_events {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.website_events}) as ga_sessions_struct__website_events  ;;
    relationship: one_to_many
  }
  join: ga_sessions_struct__page_views {
    sql: LEFT JOIN UNNEST(${ga_sessions_struct.page_views}) as ga_sessions_struct__page_views  ;;
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
  join: anal_simple_attribution {
    sql_on: ${anal_utm_dates_crossjoin.utm_key_id} = ${anal_simple_attribution.attributed_utm_key_id} and ${anal_utm_dates_crossjoin.date_date} = ${anal_simple_attribution.attributed_date_date}  ;;
    relationship: one_to_many
  }

  # join: anal_simple_attribution {
  #   sql: LEFT JOIN(ME_BI_prod.anal_simple_attribution as anal_simple_attribution LEFT JOIN UNNEST(lw) as anal_simple_attribution__lw LEFT JOIN UNNEST(attribution_models) as anal_simple_attribution__lw__attribution_models) ON anal_simple_attribution__lw__attribution_models.attributed_utm_key_id = ${anal_utm_dates_crossjoin.utm_key_id} and DATE(anal_simple_attribution__lw__attribution_models.attributed_timestamp,'America/Los_Angeles')=  ${anal_utm_dates_crossjoin.date_date}  ;;
  #   relationship:one_to_many
  # }

  # join: anal_simple_attribution__lw {
  #   view_label: "Anal Simple Attribution: Lw"
  #   sql: left join (select 1) on 1=1  ;;
  #   relationship: one_to_many
  # }

  # join: anal_simple_attribution__lw__attribution_models {
  #   view_label: "Anal Simple Attribution: Lw Attribution Models"
  #   sql: left join (select 1) on 1=1  ;;
  #   relationship: one_to_many
  #}

  # join: ecom_orders_struct {
  #   sql_on: ${ecom_orders_struct.order_id} = ${anal_simple_attribution.attributed_order_id}  ;;
  #   relationship: one_to_many
  # }

  sql_always_where:
  {% if anal_utm_dates_crossjoin.current_date_range._is_filtered %}
  {% condition anal_utm_dates_crossjoin.current_date_range %} ${event_raw} {% endcondition %}

  {% if anal_utm_dates_crossjoin.previous_date_range._is_filtered or anal_utm_dates_crossjoin.compare_to._in_query %}
  {% if anal_utm_dates_crossjoin.comparison_periods._parameter_value == "2" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}

  {% elsif anal_utm_dates_crossjoin.comparison_periods._parameter_value == "3" %}
  or
  ${event_raw} between ${period_2_start} and ${period_2_end}
  or
  ${event_raw} between ${period_3_start} and ${period_3_end}


  {% elsif anal_utm_dates_crossjoin.comparison_periods._parameter_value == "4" %}
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

explore: external_hotels_attribution {
  view_name: anal_external_hotels_attribution
  join: ga_utm_dictionary {
    sql_on: anal_external_hotels_attribution.attributed_utm_key_id = ga_utm_dictionary.utm_key_id ;;
    relationship: many_to_one
  }
}

explore: conversion_paths_analysis {
  view_name: anal_conversion_paths
  fields: [ALL_FIELDS*, -ecom_orders_struct.secondary_orders_selected_metric, -ecom_orders_struct.orders_pivot_selected_dimension, -ecom_orders_struct.orders_second_selected_dimension]
  join: ecom_orders_struct {
    sql_on: ${anal_conversion_paths.transaction_order_id} = ${ecom_orders_struct.ga_matching_id} ;;
    relationship: many_to_one
    }
  }




explore: website_calendar_dates {
  description: "This Exploer contain Data that have been collected form kasa.com through Segment(Front Side data)"
  group_label: "Product & Tech"
  label: "Website"
  join:  website_sessions {
    type: full_outer
    sql_on: ${website_calendar_dates.calendar_date_date}=${website_sessions.session_timestamp_date};;
    relationship: one_to_many
  }

  join:website_orders {
    sql_on: ${website_sessions.id}= ${website_orders.id} ;;

    relationship: one_to_one
  }
  join: website_users {
    sql_on: ${website_sessions.anonymous_id} =${website_users.anonymous_id}   ;;
    relationship: many_to_one
  }

  join: website_property_viewed {
    sql_on: ${website_orders.property_id}= ${website_property_viewed.property_id}  ;;
    relationship: one_to_one
  }
  join: website_location_viewed {
    sql_on:${website_sessions.id}= ${website_location_viewed.id}  ;;
    relationship: one_to_one
  }
  join: website_searches {
    sql_on: ${website_sessions.id} =${website_searches.id}   ;;
    relationship: one_to_one
  }
  join: website_productadded {
    view_label: " Website Add To Cart"
    sql_on: ${website_sessions.id} =${website_productadded.id}   ;;
    relationship: one_to_one
  }
  join: website_checkedavailability {
    view_label: "Website Checked Availability"
    sql_on: ${website_sessions.id} =${website_checkedavailability.id}   ;;
    relationship: one_to_one
  }
  join: website_checkout_finished_book_button {
    view_label: "Website Click Book Button"
    sql_on: ${website_sessions.id} =${website_checkout_finished_book_button.id}   ;;
    relationship: one_to_one
  }
  sql_always_where:
      {% if website_calendar_dates.current_date_range._is_filtered %}
      {% condition website_calendar_dates.current_date_range %} ${website_calendar_dates.event_raw} {% endcondition %}

      {% if website_calendar_dates.previous_date_range._is_filtered or website_calendar_dates.compare_to._in_query %}
      {% if website_calendar_dates.comparison_periods._parameter_value == "2" %}
      or
      ${website_calendar_dates.event_raw} between ${period_2_start} and ${period_2_end}

      {% elsif website_calendar_dates.comparison_periods._parameter_value == "3" %}
      or
     ${website_calendar_dates.event_raw} between ${period_2_start} and ${period_2_end}
      or
      ${website_calendar_dates.event_raw} between ${period_3_start} and ${period_3_end}


      {% elsif website_calendar_dates.comparison_periods._parameter_value == "4" %}
      or
     ${website_calendar_dates.event_raw} between ${period_2_start} and ${period_2_end}
      or
      ${website_calendar_dates.event_raw} between ${period_3_start} and ${period_3_end}
      or
     ${website_calendar_dates.event_raw} between ${period_4_start} and ${period_4_end}

      {% else %} 1 = 1
      {% endif %}
      {% endif %}
      {% else %} 1 = 1
      {% endif %};;


  }
