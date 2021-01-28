view: ga_page_categories {
  sql_table_name: `bigquery-analytics-272822.ME_BI_prod.GA_page_categories`
    ;;
  label: "Page Categories"
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
    primary_key: yes
    sql: ${TABLE}.url ;;
  }

  dimension: view_id {
    type: number
    sql: ${TABLE}.view_id ;;
    hidden: yes
  }

  measure: count {
    type: count
    drill_fields: [hostname]
    hidden: yes
  }

  dimension: is_on_kasa_com_website  {
    type: yesno
    sql: ${hostname} in ('kasa.com','www.kasa.com','bookings.kasa.com') ;;
  }
}