view: me_ad_stats {
  sql_table_name: `data-warehouse-333815.marketing.kasaWebsiteAdSpend` ;;

  dimension: ad_campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_campaign ;;
  }
  dimension: ad_channel {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_channel ;;
  }
  dimension: ad_clicks {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_clicks ;;
  }
  dimension: ad_date_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.ad_date_key ;;
  }
  dimension: ad_id {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_id ;;
  }
  dimension: ad_impressions {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_impressions ;;
  }
  dimension: ad_name {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_name ;;
  }
  dimension: ad_set {
    hidden: yes
    type: string
    sql: ${TABLE}.ad_set ;;
  }
  dimension: ad_spend {
    hidden: yes
    type: number
    sql: ${TABLE}.ad_spend ;;
  }
  dimension_group: date {
    hidden: no
    label: "Ad Spend"
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }
  dimension: is_with_correct_tracking {
    hidden: yes
    type: yesno
    sql: ${TABLE}.is_with_correct_tracking ;;
  }
  dimension: platform_reported_orders {
    hidden: yes
    type: number
    sql: ${TABLE}.platform_reported_orders ;;
  }
  dimension: platform_reported_revenue {
    hidden: yes
    type: number
    sql: ${TABLE}.platform_reported_revenue ;;
  }
  dimension: prop_code {
    hidden: yes
    type: string
    sql: ${TABLE}.propCode ;;
  }
  dimension: region {
    hidden: yes
    type: string
    sql: ${TABLE}.region ;;
  }
  dimension: tracking_method {
    hidden: yes
    type: string
    sql: ${TABLE}.tracking_method ;;
  }
  dimension: type {
    hidden: yes
    type: string
    sql: ${TABLE}.type ;;
  }
  dimension: utm_campaign {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_campaign ;;
  }
  dimension: utm_content {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_content ;;
  }
  dimension: utm_key {
    hidden: yes
    type: number
    sql: ${TABLE}.utm_key ;;
  }
  dimension: utm_medium {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_medium ;;
  }
  dimension: utm_source {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_source ;;
  }
  dimension: utm_term {
    hidden: yes
    type: string
    sql: ${TABLE}.utm_term ;;
  }
  measure: count {
    hidden: yes
    type: count
    drill_fields: [ad_name]
  }
  measure: ad_spend_amount {
    type: sum_distinct
    sql: ${ad_spend} ;;
    value_format_name: usd
  }
}
