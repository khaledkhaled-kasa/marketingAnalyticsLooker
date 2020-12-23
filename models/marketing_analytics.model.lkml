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
}


datagroup: marketing_analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup
