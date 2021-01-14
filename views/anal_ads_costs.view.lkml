view: anal_ads_costs {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_ads_costs`
    ;;

  dimension: ad_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: aq_clicks {
    type: number
    sql: ${TABLE}.aq_clicks ;;
  }

  dimension: aq_sessions {
    type: number
    sql: ${TABLE}.aq_sessions ;;
  }

  dimension: aq_spend {
    type: number
    sql: ${TABLE}.aq_spend ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: ret_clicks {
    type: number
    sql: ${TABLE}.ret_clicks ;;
  }

  dimension: ret_sessions {
    type: number
    sql: ${TABLE}.ret_sessions ;;
  }

  dimension: ret_spend {
    type: number
    sql: ${TABLE}.ret_spend ;;
  }

  dimension: total_clicks {
    type: number
    sql: ${TABLE}.total_clicks ;;
  }

  dimension: total_impressions {
    type: number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: total_spend {
    type: number
    sql: ${TABLE}.total_spend ;;
  }

  dimension: utm_key_id {
    type: number
    sql: ${TABLE}.utm_key_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
