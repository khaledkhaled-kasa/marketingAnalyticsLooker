connection: "bigquery"

# include all the views
include: "/views/**/*.view"

explore: calendar_dates  {
  join: ecom_orders_struct {
    sql_on: ${calendar_dates.calendar_date_date} = ${ecom_orders_struct.order_timestamp_date} ;;
    relationship: one_to_many
  }
  join: ecom_orders_struct__order_items {
    sql: LEFT JOIN UNNEST(${ecom_orders_struct.order_items}) as ecom_orders_struct__order_items  ;;
    relationship: one_to_many
  }
  join: ecom_products_struct {
    sql: LEFT JOIN (ME_BI.ECOM_products_struct as ecom_products_struct LEFT JOIN UNNEST(product_variants) as pv) ON ${ecom_orders_struct__order_items.product_variant_id} = pv.product_variant_id  ;;
    relationship: one_to_many
  }
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN (ME_BI.ECOM_products_struct as ps LEFT JOIN UNNEST(product_variants) as ecom_products_struct__product_variants) ON ${ecom_orders_struct__order_items.product_variant_id} = ${ecom_products_struct__product_variants.product_variant_id}  ;;
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
    sql: LEFT JOIN (ME_BI.ECOM_products_struct as ecom_products_struct LEFT JOIN UNNEST(product_variants) as pv) ON ${ecom_orders_struct__order_items.product_variant_id} = pv.product_variant_id  ;;
    relationship: one_to_many
  }
  join: ecom_products_struct__product_variants {
    sql: LEFT JOIN (ME_BI.ECOM_products_struct as ps LEFT JOIN UNNEST(product_variants) as ecom_products_struct__product_variants) ON ${ecom_orders_struct__order_items.product_variant_id} = ${ecom_products_struct__product_variants.product_variant_id}  ;;
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


datagroup: marketing_analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup
