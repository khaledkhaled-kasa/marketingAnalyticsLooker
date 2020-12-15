connection: "bigquery_new"

# include all the views
include: "/views/**/*.view"

explore: ecom_orders_struct  {}


datagroup: marketing_analytics_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: marketing_analytics_default_datagroup
