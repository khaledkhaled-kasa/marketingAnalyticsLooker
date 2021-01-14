view: anal_attribution {
  sql_table_name: `bigquery-analytics-272822.ME_BI.ANAL_attribution`
    ;;

  dimension: acquisition {
    type: yesno
    sql: ${TABLE}.acquisition ;;
  }

  dimension_group: attribution {
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
    sql: ${TABLE}.attribution_date ;;
  }

  dimension: attribution_lookback_window {
    type: string
    sql: ${TABLE}.attribution_lookback_window ;;
  }

  dimension: attribution_model {
    type: string
    sql: ${TABLE}.attribution_model ;;
  }

  dimension: attribution_utm_key_id {
    type: number
    sql: ${TABLE}.attribution_utm_key_id ;;
  }

  dimension: days_since_emmission {
    type: number
    sql: ${TABLE}.days_since_emmission ;;
  }

  dimension: me_id {
    type: number
    sql: ${TABLE}.me_id ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: session_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.session_id ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
