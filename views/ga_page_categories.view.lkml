view: ga_page_categories {
  sql_table_name: `bigquery-analytics-272822.ME_BI.GA_page_categories`
    ;;

  dimension: content_group {
    type: string
    sql: ${TABLE}.contentGroup ;;
  }

  dimension: hostname {
    type: string
    sql: ${TABLE}.hostname ;;
  }

  dimension: page_path {
    type: string
    sql: ${TABLE}.pagePath ;;
  }

  dimension: page_title {
    type: string
    sql: ${TABLE}.pageTitle ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
  }

  measure: count {
    type: count
    drill_fields: [hostname]
  }
}
